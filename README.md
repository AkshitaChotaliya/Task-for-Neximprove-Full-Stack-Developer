
# 🚀 Customs Customers & Branches Management API

A RESTful API built with **FastAPI** and **PostgreSQL** to manage customs brokers, their customers, and associated branches.

---

## 📄 Project Overview

### Background
b
Customs brokers often operate across multiple ports with various offices. Each office (branch) files separate customs entries but reports to a central company. This API simulates the backend infrastructure needed to onboard customers and manage the branches where brokers operate.

### Key Features

- CRUD operations for customers and branches  
- Relational database modeling (one-to-many between customers and branches)  
- PostgreSQL integration  
- RESTful API design principles

---

## 🧱 Tech Stack

- **Backend Framework**: FastAPI  
- **Database**: PostgreSQL  
- **ORM**: SQLAlchemy  
- **Server**: Uvicorn  
- **Testing**: Postman  
- **Documentation**: Swagger UI  

---

## 📂 Project Structure

```
project/
├── app/
│   ├── __init__.py
│   ├── main.py          # Initializes FastAPI app and routes
│   ├── models.py        # SQLAlchemy models
│   ├── schemas.py       # Pydantic schemas
│   ├── database.py      # DB connection and session
│   └── crud.py          # CRUD operations
├── requirements.txt     # Python dependencies
├── README.md            # Project documentation
└── .env                 # Environment variables
```

---

## ⚙️ Setup Instructions

### Local Development (without Docker)

1. **Clone the Repository**

   ```bash
   git clone https://github.com/AkshitaChotaliya/Build-a-REST-API-for-Managing-Customs-Customers-Branches.git
   cd Build-a-REST-API-for-Managing-Customs-Customers-Branches
   ```

2. **Create and Activate a Virtual Environment**

   ```bash
   python3 -m venv venv
   source venv/bin/activate
   ```

3. **Install Dependencies**

   ```bash
   pip install -r requirements.txt
   ```

4. **Configure Environment Variables**

   Create a `.env` file in the root directory:

   ```
   DATABASE_URL=postgresql://postgres:123456789@localhost:5432/api_managing_custome
   ```

5. **Initialize the Database**

   Ensure PostgreSQL is running and the database exists. Then:

   ```python
   from app.database import Base, engine
   Base.metadata.create_all(bind=engine)
   ```

6. **Run the Application**

   ```bash
   uvicorn app.main:app --reload
   ```

   The API will be accessible at: [http://127.0.0.1:8000](http://127.0.0.1:8000)

---

### 🐳 Docker Setup

1. Ensure Docker Desktop is running.

2. In the project root, run:

   ```bash
   docker-compose down --volumes --remove-orphans
   docker-compose up --build
   ```

3. Visit the API docs at:  
   - [http://localhost:8000/docs](http://localhost:8000/docs)  
   - [http://localhost:8000/redoc](http://localhost:8000/redoc)

---

## 🔌 API Endpoints

### 📁 Customers

- **Create**: `POST /customers/`

  ```json
  {
    "name": "ABC Logistics",
    "email": "contact@abclogistics.com",
    "gstin": "29ABCDE1234F2Z5"
  }
  ```

- **Get All**: `GET /customers/`  
- **Get by ID**: `GET /customers/{customer_id}`  
- **Update**: `PUT /customers/{customer_id}`

  ```json
  {
    "name": "ABC Logistics Pvt Ltd",
    "email": "info@abclogistics.com",
    "gstin": "29ABCDE1234F2Z5"
  }
  ```

- **Delete**: `DELETE /customers/{customer_id}`

---

### 🏢 Branches

- **Create**: `POST /branches/`

  ```json
  {
    "branch_code": "BR001",
    "location": "Mumbai",
    "customer_id": 1
  }
  ```

- **Get All**: `GET /branches/`  
- **Get by ID**: `GET /branches/{branch_id}`  
- **Update**: `PUT /branches/{branch_id}`

  ```json
  {
    "branch_code": "BR002",
    "location": "Delhi",
    "customer_id": 1
  }
  ```

- **Delete**: `DELETE /branches/{branch_id}`

---

## 🧪 Testing the API

- Use **Postman** to test the API.
- Ensure the server is running.

---

## 🗺️ ERD Diagram

The database design includes a one-to-many relationship between customers and branches:

```
Customer
---------
id (PK)
name
email
gstin

|
| One-to-Many
v

Branch
---------
id (PK)
branch_code
location
customer_id (FK)
```

A visual ERD can be created using [dbdiagram.io](https://dbdiagram.io).

---

## 📄 API Documentation

FastAPI provides auto-generated interactive documentation:

- **Swagger UI**: [http://127.0.0.1:8000/docs](http://127.0.0.1:8000/docs)  
- **ReDoc**: [http://127.0.0.1:8000/redoc](http://127.0.0.1:8000/redoc)
