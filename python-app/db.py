from dbconnection import get_connection
class db:
    def __init__(self):
        self.connection = get_connection()

    def get_participants(self):
        conn = get_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT * FROM participants")
        participants = cursor.fetchall()
        cursor.close()
        conn.close()
        return participants
    
    def get_events(self):
        conn = get_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT * FROM events")
        events = cursor.fetchall()
        cursor.close()
        conn.close()
        return events
    
    def get_event(self, id):
        conn = get_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT * FROM events WHERE id = %s", [id])
        event = cursor.fetchall()
        cursor.close()
        conn.close()
        return event

    def add_participant(self, participant_data):
        conn = get_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("INSERT INTO participants (name, surname, date_of_birth, email, phone_number) VALUES (%s, %s, %s, %s, %s)", (participant_data['name'], participant_data['surname'], participant_data['date_of_birth'], participant_data['email'], participant_data['phone_number']))
        conn.commit()
        cursor.close()
        conn.close()
        return { "status":"ok","added_id": cursor.lastrowid } 
    
    def add_event(self, event_data):
        conn = get_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("INSERT INTO events (name,date, price, id_admin, id_adress) VALUES (%s, %s,%s,%s,%s)", (event_data['name'],event_data['date'], event_data['price'], event_data['id_admin'], event_data['id_adress']))
        conn.commit()
        cursor.close()
        conn.close()
        return {"status":"ok","added_id": cursor.lastrowid}
    
    def add_address(self, address_data):
        conn = get_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("INSERT INTO addresses (x,y) VALUES (%s,%s)", (address_data['x'], address_data['y']))
        conn.commit()
        cursor.close()
        conn.close()
        return {"status":"ok","added_id": cursor.lastrowid}
    
    def update_event(self,id, event_data):
        conn = get_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("UPDATE events SET name = %s, date = %s, price = %s, id_admin = %s, id_adress = %s WHERE id = %s",(event_data['name'], event_data['date'], event_data['price'], event_data['id_admin'], event_data['id_adress'], id))
        conn.commit()
        cursor.close()
        conn.close()
        return {"status":"ok"}
    
    def update_address(self, id, address_data):
        conn = get_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("UPDATE addresses SET x = %s, y = %s WHERE id = %s", (address_data['x'], address_data['y'], id))
        conn.commit()
        cursor.close()
        conn.close()
        return {"status":"ok"}
    
    def delete_event(self,id):
        conn = get_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("UPDATE events SET deleted = 1 WHERE id = %s", [id])
        conn.commit()
        cursor.close()
        conn.close()
        return {"status":"ok"}
    
    def delete_address(self,id):
        conn = get_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("UPDATE addresses SET deleted = 1 WHERE id = %s", [id])
        conn.commit()
        cursor.close()
        conn.close()
        return {"status":"ok"}