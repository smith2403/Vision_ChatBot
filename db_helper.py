import mysql.connector
global cnx

connection_config = {
    'host': 'localhost',
    'user': 'root',
    'password': '',
    'database': 'chatbot',
}

cnx = mysql.connector.connect(**connection_config)

def insert_order_item(fooditem, quantity, order_id):
    try:
        cursor = cnx.cursor()
        cursor.callproc('insert_order_item', (fooditem, quantity, order_id))
        cnx.commit()
        cursor.close()
        print("Order item inserted successfully!")
        return 1

    except mysql.connector.Error as err:
        print(f"Error inserting order item: {err}")
        cnx.rollback()
        return -1

    except Exception as e:
        print(f"An error occurred: {e}")
        cnx.rollback()
        return -1

def is_product_available(product_name):
    try:
        cursor = cnx.cursor()
        query = "SELECT COUNT(*) FROM fooditems WHERE name = %s"
        cursor.execute(query, (product_name,))
        result = cursor.fetchone()[0]
        cursor.close()
        return result > 0

    except mysql.connector.Error as err:
        print(f"Error checking product availability: {err}")
        return False

    except Exception as e:
        print(f"An error occurred: {e}")
        return False

def insert_order_tracking(order_id, status, payment, total_price):
    cursor = cnx.cursor()
    insert_query = "INSERT INTO ordertracking (order_id, status, payment, total_price) VALUES (%s, %s, %s, %s)"
    cursor.execute(insert_query, (order_id, status, payment, total_price))
    cnx.commit()
    cursor.close()


def get_total_order_price(order_id):
    cursor = cnx.cursor()
    query = f"SELECT get_total_order_price({order_id})"
    cursor.execute(query)
    result = cursor.fetchone()[0]
    cursor.close()
    return result

def get_next_order_id():
    cursor = cnx.cursor()
    query = "SELECT MAX(order_id) FROM orders"
    cursor.execute(query)
    result = cursor.fetchone()[0]
    cursor.close()
    if result is None:
        return 1
    else:
        return result + 1

def get_order_status(order_id):
    cursor = cnx.cursor()
    query = f"SELECT status FROM ordertracking WHERE order_id = {order_id}"
    cursor.execute(query)
    result = cursor.fetchone()
    cursor.close()
    if result:
        return result[0]
    else:
        return None

if __name__ == "__main__":
    print(get_next_order_id())
