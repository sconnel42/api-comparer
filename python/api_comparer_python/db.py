from sqlalchemy import create_engine, Connection

CONNECTION_STR = "postgresql://postgres:samplepassword@localhost:5432"


def create_connection() -> Connection:
    engine = create_engine(CONNECTION_STR)
    return engine.connect()
