from fastapi import FastAPI, Request
from fastapi.responses import JSONResponse
from db import db

app = FastAPI(debug=True)

@app.get("/get-users")
def get_users():
    my_db = db()
    return my_db.get_users()

@app.post("/save-user")
async def save_user(request: Request):
    user_data = await request.json()
    #sample payload: {"name":"Test","email":"moj@email"}
    my_db = db()
    result = my_db.save_user(user_data)
    return JSONResponse(status_code=201, content=result)

