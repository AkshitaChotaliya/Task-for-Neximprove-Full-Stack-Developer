import time
from sqlalchemy.exc import OperationalError
from database import Base, engine

# Retry DB connection
for i in range(10):
    try:
        print("Trying to initialize database...")
        Base.metadata.create_all(bind=engine)
        print("✅ Database initialized.")
        break
    except OperationalError as e:
        print(f"❌ DB not ready, retrying in 3s... ({i+1}/10)")
        time.sleep(3)
else:
    print("❌ Failed to connect to the database after 10 retries.")
