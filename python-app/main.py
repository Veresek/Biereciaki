from fastapi import FastAPI, Request
from fastapi.responses import JSONResponse
from db import db

app = FastAPI(debug=True)

@app.get('/events')
def get_events():
    my_db = db()
    return my_db.get_events()

@app.get('/event/{id}')
def get_event(id):
    my_db = db()
    return my_db.get_event(id)

@app.get("/participants")
def get_participants():
    my_db = db()
    return my_db.get_participants()

@app.post("/participant")
async def add_participant(request: Request):
    participant_data = await request.json()
    my_db = db()
    result = my_db.add_participant(participant_data)
    return JSONResponse(status_code=201, content=result)

@app.post('/event')
async def add_event(request: Request):
    event_data = await request.json()
    my_db = db()
    result = my_db.add_event(event_data)
    return JSONResponse(status_code=201, content=result)

@app.put('/event/{id}')
async def update_event(id,request: Request):
    event_data = await request.json()
    my_db = db()
    result = my_db.update_event(id, event_data)
    return JSONResponse(content=result)

@app.delete('/event/{id}')
async def delete_event(id):
    my_db = db()
    result = my_db.delete_event(id)
    return JSONResponse(content=result)