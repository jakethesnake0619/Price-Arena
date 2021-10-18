DROP TABLE IF EXISTS Items;

CREATE TABLE items(
  PRIMARY KEY itemID CHAR(10),
  name CHAR(20),
  price DECIMAL(7,2),
  image CHAR(255),
  timesBought INT(5)
);

DROP TABLE IF EXISTS Users;

CREATE TABLE users(
  PRIMARY KEY userID CHAR(10),
  name CHAR(30),
  mostBought CHAR(10),
  amountBought INT(5),
  moneySpent DECIMAL(7,2)
);

DROP TABLE IF EXISTS Cart;

CREATE TABLE cart(
  CONSTRAINT cartID PRIMARY KEY(itemID, userID),
  quantity INT(5)
);
