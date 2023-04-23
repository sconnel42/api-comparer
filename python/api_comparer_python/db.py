from os import getenv

from sqlalchemy import create_engine, Connection

DATABASE_URL = getenv("DATABASE_URL")


def create_connection() -> Connection:
    engine = create_engine(DATABASE_URL)
    return engine.connect()
