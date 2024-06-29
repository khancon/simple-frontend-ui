# Simple Frontend UI

This is the frontend for the Simple Microservices Application. It displays data from the User, Product, and Order microservices.

## Prerequisites

- Node.js and npm
- Python 3.8 or higher (for running the microservices)
- MySQL (for running the microservices)

## Clone the Repository

```bash
git clone https://github.com/your-username/simple-frontend-ui.git
cd simple-frontend-ui
```

## Set Up and Run the Frontend

1. **Install http-server** (if not already installed):
    ```bash
    npm install -g http-server
    ```

2. **Start the HTTP server**:
    ```bash
    http-server -p 8000
    ```

3. **Open your browser** and go to ```bashhttp://127.0.0.1:8000``` to view the application.

## Run the Microservices

The frontend relies on three microservices: User Service, Product Service, and Order Service. Follow the instructions below to set up and run each microservice.

### [User Service](https://github.com/khancon/simple-user-service)

1. **Clone the User Service repository**:
    ```bash
    git clone https://github.com/your-username/simple-user-service.git
    cd simple-user-service
    ```

2. **Set up the virtual environment**:
    ```bash
    python3 -m venv venv
    source venv/bin/activate
    ```

3. **Install dependencies**:
    ```bash
    pip install -r requirements.txt
    ```

4. **Create and configure the `.env` file**:
    ```bash
    touch .env
    echo "DB_USER=your_db_user" >> .env
    echo "DB_PASSWORD=your_db_password" >> .env
    echo "DB_HOST=localhost" >> .env
    echo "DB_NAME=microservices_db" >> .env
    ```

5. **Set up the MySQL database**:
    ```bash
    mysql -u root -p
    CREATE DATABASE microservices_db;
    CREATE USER 'your_db_user'@'%' IDENTIFIED BY 'your_db_password';
    GRANT ALL PRIVILEGES ON microservices_db.* TO 'your_db_user'@'%';
    FLUSH PRIVILEGES;
    USE microservices_db;
    CREATE TABLE user (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(100) NOT NULL
    );
    INSERT INTO user (name) VALUES ('John Doe');
    EXIT;
    ```

6. **Run the MySQL Server and User Service**:
    ```bash
    brew services start mysql
    python app.py
    ```

The User Service will be available at ```http://127.0.0.1:5001```.

### [Product Service](https://github.com/khancon/simple-product-service)

1. **Clone the Product Service repository**:
    ```bash
    git clone https://github.com/your-username/simple-product-service.git
    cd simple-product-service
    ```

2. **Set up the virtual environment**:
    ```bash
    python3 -m venv venv
    source venv/bin/activate
    ```

3. **Install dependencies**:
    ```bash
    pip install -r requirements.txt
    ```

4. **Create and configure the `.env` file**:
    ```bash
    touch .env
    echo "DB_USER=your_db_user" >> .env
    echo "DB_PASSWORD=your_db_password" >> .env
    echo "DB_HOST=localhost" >> .env
    echo "DB_NAME=microservices_db" >> .env
    ```

5. **Set up the MySQL database** (if not already created):
    ```bash
    mysql -u root -p
    USE microservices_db;
    CREATE TABLE product (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(100) NOT NULL
    );
    INSERT INTO product (name) VALUES ('Product A');
    EXIT;
    ```

6. **Run the MySQL Server and Product Service**:
    ```bash
    brew services start mysql # if not already running
    python app.py
    ```

The Product Service will be available at ```http://127.0.0.1:5002```.

### [Order Service](https://github.com/khancon/simple-order-service)

1. **Clone the Order Service repository**:
    ```bash
    git clone https://github.com/your-username/simple-order-service.git
    cd simple-order-service
    ```

2. **Set up the virtual environment**:
    ```bash
    python3 -m venv venv
    source venv/bin/activate
    ```

3. **Install dependencies**:
    ```bash
    pip install -r requirements.txt
    ```

4. **Create and configure the `.env` file**:
    ```bash
    touch .env
    echo "DB_USER=your_db_user" >> .env
    echo "DB_PASSWORD=your_db_password" >> .env
    echo "DB_HOST=localhost" >> .env
    echo "DB_NAME=microservices_db" >> .env
    ```

5. **Set up the MySQL database** (if not already created):
    ```bash
    mysql -u root -p
    USE microservices_db;
    CREATE TABLE `order` (
        id INT AUTO_INCREMENT PRIMARY KEY,
        product_id INT,
        quantity INT NOT NULL,
        FOREIGN KEY (product_id) REFERENCES product(id)
    );
    INSERT INTO `order` (product_id, quantity) VALUES (1, 2);
    EXIT;
    ```

6. **Run the MySQL Server and Order Service**:
    ```bash
    brew services start mysql # if not already running
    python app.py
    ```

The Order Service will be available at ```http://127.0.0.1:5003```.
