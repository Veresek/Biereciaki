from dbconnection import get_connection
class db:
    def __init__(self):
        self.connection = get_connection()

    def get_users(self):
        conn = get_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT * FROM users")
        users = cursor.fetchall()
        cursor.close()
        conn.close()
        return users
    
    def save_user(self, user_data):
        conn = get_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("INSERT INTO users (name, email) VALUES (%s, %s)", (user_data['name'], user_data['email']))
        conn.commit()
        cursor.close()
        conn.close()
        return { "status":"ok","added_id": cursor.lastrowid } 
