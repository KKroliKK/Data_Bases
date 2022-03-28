    CREATE TABLE customer(
        client_id INTEGER,
        balance INTEGER,
        creditLimit INTEGER,
        discount INTEGER,
        PRIMARY KEY (client_id)
    );

    CREATE TABLE ShippingAddress(
        address_id INTEGER,
        client_id INTEGER,
        house CHAR(30),
        street CHAR(30),
        district CHAR(30),
        city CHAR(30),
        PRIMARY KEY (address_id),
        FOREIGN KEY (client_id) REFERENCES customer(client_id)
    );

    create table customer_order_list(
        client_id INTEGER,
        orderId INTEGER,
        FOREIGN KEY (itemId) REFERENCES orderT(orderId),
        FOREIGN KEY (client_id) REFERENCES customer(client_id),
        PRIMARY KEY (itemId, client_id)
    );

    create table orderT(
        orderId INTEGER,
        date CHAR(30),
        house CHAR(30),
        street CHAR(30),
        district CHAR(30),
        city CHAR(30),
        PRIMARY KEY (orderId)
    );

    create table order_list(
        quantity INTEGER,
        itemId INTEGER,
        orderId INTEGER,
        FOREIGN KEY (itemId) REFERENCES orderT(orderId),
        FOREIGN KEY (orderId) REFERENCES item(itemId),
        PRIMARY KEY (itemId, orderId)
    );

    create table item(
        itemId INTEGER,
        description CHAR(30),
        PRIMARY KEY (itemId)
    );

    create table manufacturer(
        manufacturerId INTEGER,
        phone_number INTEGER,
        PRIMARY KEY (manufacturerId)
    );

    create table manufacturer_list(
        quantity INTEGER,
        itemId INTEGER not NULL,
        manufacturerId INTEGER , 
        FOREIGN KEY (itemId) REFERENCES orderT(orderId),
        FOREIGN KEY (manufacturerId) REFERENCES manufacturer(manufacturerId),
        PRIMARY KEY (itemId, manufacturerId)
    );