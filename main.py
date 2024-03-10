from fastapi import FastAPI, Request
from fastapi.responses import JSONResponse
import db_helper
import generic_helper

app = FastAPI()

inprogress_orders = {}

@app.post("/")
async def handle_request(request: Request):
    payload = await request.json()

    intent = payload['queryResult']['intent']['displayName']
    parameters = payload['queryResult']['parameters']
    output_contexts = payload['queryResult']['outputContexts']
    session_id = generic_helper.extract_session_id(output_contexts[0]["name"])

    if intent == 'new.order':
        inprogress_orders[session_id] = {}
    elif intent == 'order.cancel':
        inprogress_orders[session_id] = {}

    if session_id not in inprogress_orders:
        inprogress_orders[session_id] = {}

    intent_handler_dict = {
        'order.add - context: ongoing-order': add_to_order,
        'order.remove - context: ongoing-order': remove_from_order,
        'order.complete - context: ongoing-order': complete_order,
        'track.order - context: ongoing-tracking': track_order,
        'fooditem.availability': check_fooditem_availability
    }

    return intent_handler_dict[intent](parameters, session_id)

def save_to_db(order: dict):
    next_order_id = db_helper.get_next_order_id()

    for food_item, quantity in order.items():
        rcode = db_helper.insert_order_item(
            food_item,
            quantity,
            next_order_id
        )

        if rcode == -1:
            return -1

    # Calculate the total price for the order
    total_price = float(db_helper.get_total_order_price(next_order_id))

    # Insert the order tracking details with total price
    db_helper.insert_order_tracking(next_order_id, "in progress", "Cash on delivery", total_price)

    return next_order_id

def complete_order(parameters: dict, session_id: str):
    if session_id not in inprogress_orders or not inprogress_orders[session_id]:
        fulfillment_text = "It seems like your order is empty. Please add items to your order first."
    else:
        order = inprogress_orders[session_id]
        order_id = save_to_db(order)
        if order_id == -1:
            fulfillment_text = "Sorry, I couldn't process your order due to a backend error. " \
                               "Please place a new order again"
        else:
            order_total = float(db_helper.get_total_order_price(order_id))  # Convert to float
            
            # Check if the total price is above 2200
            if order_total >= 2200:
                discount_percentage = 0.25  # 25% discount
            elif order_total >= 1200:
                discount_percentage = 0.2  # 20% discount
            else:
                discount_percentage = 0  # No discount
            
            if discount_percentage > 0:
                discount_amount = discount_percentage * order_total
                discounted_total = order_total - discount_amount
                fulfillment_text = f"Congratulations! Your total price was ₹{order_total}. " \
                                   f"A {discount_percentage * 100}% off discount was applied to your order. " \
                                   f"Your discounted total is ₹{discounted_total}. " \
                                   f"We have placed your order. " \
                                   f"Here is your order id #{order_id}. " \
                                   f"You can pay the discounted amount at the time of delivery!"
            else:
                fulfillment_text = f"Awesome. We have placed your order. " \
                                   f"Here is your order id #{order_id}. " \
                                   f"Your order total is ₹{order_total}. " \
                                   f"You can pay at the time of delivery!"

        inprogress_orders[session_id] = {}

    return JSONResponse(content={
        "fulfillmentText": fulfillment_text
    })


def add_to_order(parameters: dict, session_id: str):
    food_items = parameters["food-item"]
    quantities = parameters["number"]

    if len(food_items) != len(quantities):
        fulfillment_text = "Sorry I didn't understand. Can you please specify food items and quantities clearly?"
    else:
        new_food_dict = dict(zip(food_items, quantities))

        if session_id in inprogress_orders:
            current_food_dict = inprogress_orders[session_id]
            current_food_dict.update(new_food_dict)
            inprogress_orders[session_id] = current_food_dict
        else:
            inprogress_orders[session_id] = new_food_dict

        order_str = generic_helper.get_str_from_food_dict(inprogress_orders[session_id])
        fulfillment_text = f"So far you have: {order_str}. Do you need anything else?"

    return JSONResponse(content={
        "fulfillmentText": fulfillment_text
    })

def remove_from_order(parameters: dict, session_id: str):
    if session_id not in inprogress_orders:
        return JSONResponse(content={
            "fulfillmentText": "I'm having a trouble finding your order. Sorry! Can you place a new order please?"
        })
    
    food_items = parameters["food-item"]
    current_order = inprogress_orders[session_id]

    removed_items = []
    no_such_items = []

    for item in food_items:
        if item not in current_order:
            no_such_items.append(item)
        else:
            removed_items.append(item)
            del current_order[item]

    if len(removed_items) > 0:
        fulfillment_text = f'Removed {",".join(removed_items)} from your order!'

    if len(no_such_items) > 0:
        fulfillment_text = f' Your current order does not have {",".join(no_such_items)}'

    if len(current_order.keys()) == 0:
        fulfillment_text += " Your order is empty!"
    else:
        order_str = generic_helper.get_str_from_food_dict(current_order)
        fulfillment_text += f" Here is what is left in your order: {order_str}"

    return JSONResponse(content={
        "fulfillmentText": fulfillment_text
    })

def track_order(parameters: dict, session_id: str):
    order_id = int(parameters['order_id'])
    order_status = db_helper.get_order_status(order_id)
    if order_status:
        fulfillment_text = f"The order status for order id: {order_id} is: {order_status}"
    else:
        fulfillment_text = f"No order found with order id: {order_id}"

    return JSONResponse(content={
        "fulfillmentText": fulfillment_text
    })

def check_fooditem_availability(parameters: dict, session_id: str):
    food_items = parameters.get("food-item", [])

    if not food_items:
        fulfillment_text = "Please provide the name of the food item you want to check."
    else:
        food_item = food_items[0].lower()

        is_available = db_helper.is_product_available(food_item)

        if is_available:
            fulfillment_text = f"The food item '{food_item}' is available. You can proceed with the order."
        else:
            fulfillment_text = f"Sorry, '{food_item}' is currently not available."

    return JSONResponse(content={
        "fulfillmentText": fulfillment_text
    })
