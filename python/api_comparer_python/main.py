from fastapi import FastAPI
from sqlalchemy import text

from api_comparer_python.db import create_connection

app = FastAPI()


@app.get("/ping")
async def ping():
    return {"message": "PONG"}


@app.get("/deep-ping")
async def deep_ping():
    with create_connection() as conn:
        conn.execute(text("SELECT version();"))
    return {"message": "DEEP-PONG"}
