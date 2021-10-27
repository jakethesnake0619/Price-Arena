DROP DATABASE IF EXISTS PriceArena;
CREATE DATABASE PriceArena;
USE PriceArena;
DROP TABLE IF EXISTS Items;

CREATE TABLE items(
  itemID CHAR(10) PRIMARY KEY,
  name CHAR(20),
  price DECIMAL(7,2),
  image CHAR(255),
  timesBought INT(5)
);

DROP TABLE IF EXISTS Users;

CREATE TABLE users(
  userName CHAR(30),
  pass CHAR(255),
  mostBought CHAR(10),
  amountBought INT(5),
  moneySpent DECIMAL(7,2),
  PRIMARY KEY (userName)
);

DROP TABLE IF EXISTS Cart;

CREATE TABLE cart(
  itemID char(10),
  userName char(30),
  FOREIGN KEY (itemID) REFERENCES items(itemID),
  FOREIGN KEY (userName) REFERENCES users(userName),
  PRIMARY KEY (itemID, userName),
  quantity INT(5)
);
