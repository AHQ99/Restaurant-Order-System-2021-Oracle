CREATE SEQUENCE category_seq START WITH 100 INCREMENT BY 1;
CREATE SEQUENCE menuitem_seq START WITH 100 INCREMENT BY 1;
CREATE SEQUENCE employee_seq START WITH 100 INCREMENT BY 1;
CREATE SEQUENCE customer_seq START WITH 100 INCREMENT BY 1;
CREATE SEQUENCE saleorder_seq START WITH 100 INCREMENT BY 1;

CREATE TABLE ordermode (
  ModeID    NUMBER(10) NOT NULL PRIMARY KEY,
  ModeDesc  VARCHAR(50) NOT NULL
);

CREATE TABLE servicemode (
  ModeID    NUMBER(10) NOT NULL PRIMARY KEY,
  ModeDesc  VARCHAR(50) NOT NULL
);

CREATE TABLE customer (
  CustomerID NUMBER(10) DEFAULT customer_seq.NEXTVAL,
  FirstName VARCHAR2(50) NOT NULL,
  LastName VARCHAR2(50) NOT NULL,
  Phone VARCHAR2(20) NOT NULL,
  Address VARCHAR2(250) NOT NULL,
  Email VARCHAR2(50) DEFAULT NULL,
  PRIMARY KEY (CustomerID)
);

CREATE TABLE employee (
  EmployeeID NUMBER(10) DEFAULT employee_seq.NEXTVAL,
  FirstName VARCHAR2(50) NOT NULL,
  LastName VARCHAR2(50) NOT NULL,
  Email VARCHAR2(50) NOT NULL,
  Phone VARCHAR2(20) NOT NULL,
  Designation VARCHAR2(50) NOT NULL,
  PRIMARY KEY (EmployeeID)
);

CREATE TABLE category (
  CategoryID NUMBER(10) DEFAULT category_seq.NEXTVAL,
  CategoryName VARCHAR2(50) NOT NULL,
  PRIMARY KEY (CategoryID)
);

CREATE TABLE menuitem (
  ItemID NUMBER(10) DEFAULT menuitem_seq.NEXTVAL,
  CategoryID NUMBER(10) NOT NULL,
  ItemName VARCHAR2(50) NOT NULL,
  Description VARCHAR2(250) NOT NULL,
  Price NUMBER(10,2) NOT NULL,
  PRIMARY KEY (ItemID),
  FOREIGN KEY (CategoryID) REFERENCES category (CategoryID)
);

CREATE TABLE saleorder (
  OrderID NUMBER(10) DEFAULT saleorder_seq.NEXTVAL,
  OrderDate DATE NOT NULL,
  OrderTotal NUMBER(10,2) NOT NULL,
  OrderModeID NUMBER(10) NOT NULL,
  ServiceModeID NUMBER(10) NOT NULL,
  EmployeeID NUMBER(10) NOT NULL,
  CustomerID NUMBER(10) NOT NULL,
  PRIMARY KEY (OrderID),
  FOREIGN KEY (EmployeeID) REFERENCES employee (EmployeeID),
  FOREIGN KEY (CustomerID) REFERENCES customer (CustomerID),
  FOREIGN KEY (OrderModeID)  REFERENCES ordermode (ModeID),
  FOREIGN KEY (ServiceModeID) REFERENCES servicemode (ModeID)
);

CREATE TABLE orderitem (
  Quantity NUMBER(10) NOT NULL,
  Remarks VARCHAR2(250),
  OrderID NUMBER(10) NOT NULL,
  ItemID NUMBER(10) NOT NULL,
  PRIMARY KEY (OrderID,ItemID),
  FOREIGN KEY (OrderID) REFERENCES saleorder (OrderID),
  FOREIGN KEY (ItemID) REFERENCES menuitem (ItemID)
);
CREATE OR REPLACE NONEDITIONABLE TRIGGER UPDATE_ORDER_TOTAL 
BEFORE DELETE OR INSERT OR UPDATE OF QUANTITY ON ORDERITEM  
FOR EACH ROW
DECLARE
    vprice NUMBER(10,2);
BEGIN
    
    IF INSERTING THEN
        SELECT price INTO vprice FROM menuitem WHERE itemid = :new.itemid;
        update saleorder set ordertotal = nvl(ordertotal,0) + :new.quantity * vprice
        where orderid = :new.orderid;
    END IF;

    IF UPDATING THEN
        SELECT price INTO vprice FROM menuitem WHERE itemid = :old.itemid;
        update saleorder set ordertotal = nvl(ordertotal,0) + :new.quantity * vprice - :old.quantity * vprice
        where orderid = :new.orderid;
    END IF;

    IF DELETING THEN
        SELECT price INTO vprice FROM menuitem WHERE itemid = :old.itemid;
        update saleorder set ordertotal = nvl(ordertotal,0) - :old.quantity * vprice
        where orderid = :old.orderid;
    END IF;

END;

