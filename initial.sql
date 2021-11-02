DROP DATABASE IF EXISTS PriceArena;
CREATE DATABASE PriceArena;
USE PriceArena;
DROP TABLE IF EXISTS Items;

CREATE TABLE items(
  itemID CHAR(10) PRIMARY KEY,
  name CHAR(255),
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

INSERT INTO items (`itemID`, `name`, price, `image`, timesBought) VALUES (0, 'All-new Kindle Paperwhite (8 GB) – Now with a 6.8\" display and adjustable warm light – Ad-Supported', 139.99, 'https://m.media-amazon.com/images/I/61Gih4cc2CL._AC_SY355_.jpg', 0),
 (1, '100Pcs Joe Biden I DID That! - Sticker Decal Humor - Joe Biden Funny Sticker That\'s All Me I Did That - Pointed to Your Left Funny Joe Biden Campaign Logo Parody Sticker 3 in', 14.99, 'https://m.media-amazon.com/images/I/71+YuFNXzsL._AC_SY450_.jpg', 0),
 (2, 'Philips Avent Anti-Colic Baby Bottle with AirFree Vent, 9oz, 1pk, Clear, SCY703/91', 8.99, 'https://m.media-amazon.com/images/I/61I2C2vHorS._SY550_.jpg', 0),
 (3, 'VELCRO Brand Extreme Outdoor Mounting Tape | 20Ft x 1 in, Holds 15 lbs | Strong Heavy Duty Stick on Adhesive | Mount on Brick, Concrete for Hanging, 30702', 19.99, 'https://m.media-amazon.com/images/I/81btJiqS79L._SX342_.jpg', 0),
 (4, '2022 Planner 8\"x10\" Size: 14 Months (Begins November 2021/2022 Calendar/ 2022 Weekly Calendar/Weekly Planner Organizer (Black)', 18.95, 'https://m.media-amazon.com/images/I/81P05RF7TgL._AC_SY355_.jpg', 0),
 (5, 'Introducing Fire TV Stick 4K Max streaming device, Wi-Fi 6, Alexa Voice Remote (includes TV controls)', 54.99, 'https://m.media-amazon.com/images/I/612AvoovbdL._AC_SX425_.jpg', 0),
 (6, 'Pokémon Brilliant Diamond - Nintendo Switch', 59.88, 'https://m.media-amazon.com/images/I/81ErLLyfr5L._SY445_.jpg', 0),
 (7, '100 Pcs Forever Postage Stamps Flags', 40.00, 'https://m.media-amazon.com/images/I/514nXcOyynL._AC_SY355_.jpg', 0),
 (8, '100Pcs I Did That Biden Stickers, That\'s All Me I Did That Biden Bumper Stickers, Funny Decal Sticker Humor (A, 100 PCS)', 9.49, 'https://images-na.ssl-images-amazon.com/images/I/6185lQRXUKL.__AC_SX300_SY300_QL70_FMwebp_.jpg', 0),
 (9, 'Introducing Blink Video Doorbell | Two-way audio, HD video, motion and chime app alerts and Alexa enabled — wired or wire-free (Black)', 49.99, 'https://m.media-amazon.com/images/I/51tR+nCYhIL._SY355_.jpg', 0),
 (10, 'Apple Watch Series 7 GPS, 41mm Midnight Aluminum Case with Midnight Sport Band - Regular', 399.00, 'https://m.media-amazon.com/images/I/71gg8mPlAuL._AC_SX466_.jpg', 0),
 (11, 'Pokémon Brilliant Diamond & Pokemon Shining Pearl Double Pack - Nintendo Switch', 119.88, 'https://images-na.ssl-images-amazon.com/images/I/51DQi-YROQL._SY430_SX215_QL70_FMwebp_.jpg', 0),
 (12, 'JJHAEVDY Women\'s Bootcut Yoga Pants Crossover High Waisted Workout Leggings Stretch Non-See Through Tummy Control Flare Pants', 17.46, 'https://m.media-amazon.com/images/I/51Qo1+3UlxL._AC_UX522_.jpg', 0),
 (13, '2022 Pocket Planner/Pocket Calendar: Includes 14 Months (November 2021 to December 2022) / 2022 Weekly Planner/Weekly Agenda/Monthly Calendar Organizer (Black/Brown - Pack of 1)', 9.95, 'https://m.media-amazon.com/images/I/61S2QD2A0vL._AC_SY355_.jpg', 0),
 (14, 'Roku Streaming Stick 4K 2021 | Streaming Device 4K/HDR/Dolby Vision with Roku Voice Remote and TV Controls', 39.99, 'https://m.media-amazon.com/images/I/71wrIZujPIL._AC_SY355_.jpg', 0),
 (15, 'Emerg?ncy_Keychain Car_Esc?pe Tool,2-in-1Seatbelt Cutter and Window Breaker', 24.99, 'https://m.media-amazon.com/images/I/81e1ZNdF7eL._AC_SX425_.jpg', 0),
 (16, 'Gel Pens, Medium Point (0.7mm), Pearl White Body, Black Gel Ink Pens, 4 Count', 3.69, 'https://m.media-amazon.com/images/I/81KXQKOUuEL._AC_SX342_.jpg', 0),
 (17, 'PediaSure Grow & Gain with 2’-FL HMO Prebiotic, Kids nutrition shake, Vitamins C, E, B1, & B2, Non-GMO, Chocolate, 8 Fl Oz Bottle, 24 Count', 51.99, 'https://m.media-amazon.com/images/I/71mEKacbxbL._AC_SX425_.jpg', 0),
 (18, 'Oculus Quest 2 — Advanced All-In-One Virtual Reality Headset — 128 GB', 299.00, 'https://m.media-amazon.com/images/I/615YaAiA-ML._SX342_.jpg', 0),
 (19, 'ECBANLI Bracelet Car Window Breaker, Wrist Strap with Tungsten Carbide Bead Car Emergency Self Rescue Tool, Vehicle Rapid Escape Wristbands Tempered Safety Glass Breaker', 17.99, 'https://m.media-amazon.com/images/I/51TtoF8NPrL._AC_SX425_.jpg', 0),
 (20, '100Pcs Biden I Did That Stickers, 3inch Joe Biden Funny Sticker, That\'s All Me I Did That Decal/Humor/Funny (A, Diamond Reflective Waterproof Sticker)', 9.97, 'https://m.media-amazon.com/images/I/61q6nun7tFL._AC_SY679_.jpg', 0),
 (21, 'Amazon Basics Multipurpose Copy Printer Paper - White, 8.5 x 11 Inches, 1 Ream (500 Sheets)', 8.99, 'https://m.media-amazon.com/images/I/71mwf6-21xL._AC_SY355_.jpg', 0),
 (22, 'Blink Mini – Compact indoor plug-in smart security camera, 1080 HD video, night vision, motion detection, two-way audio, Works with Alexa – 1 camera', 34.99, 'https://m.media-amazon.com/images/I/61LrV6Id5gL._SY355_.jpg', 0),
 (23, 'Crocs Unisex-Adult Men\'s and Women\'s Classic Clog', 43.40, 'null', 0),
 (24, 'Wyze Cam Spotlight, Wyze Cam v3 Security Camera with Spotlight Kit, 1080p HD Security Camera with Two-Way Audio and Siren, IP65 Weatherproof, Compatible with Alexa and Google Assistant', 48.11, 'https://m.media-amazon.com/images/I/61E8RWSXtoS._AC_SY450_.jpg', 0),
 (25, '$10 Xbox Gift Card [Digital Code]', 10.00, 'null', 0),
 (26, 'Scotch Heavy Duty Packaging Tape, 1.88\" x 22.2 yd, Designed for Packing, Shipping and Mailing, Strong Seal on All Box Types, 1.5\" Core, Clear, 6 Rolls with Dispenser (142-6)', 13.99, 'null', 0),
 (27, 'Roblox Gift Card - 800 Robux [Includes Exclusive Virtual Item] [Online Game Code]', 10.00, 'https://m.media-amazon.com/images/I/71SfFWK2AUL._SY445_.jpg', 0),
 (28, '$10 Nintendo eShop Gift Card [Digital Code]', 10.00, 'https://m.media-amazon.com/images/I/71g8qy0R8zL._SY445_.jpg', 0),
 (29, 'EZlifego Double Sided Tape Heavy Duty (9.85FT), Multipurpose Removable Mounting Tape Adhesive Grip,Reusable Strong Sticky Wall Tape Strips Transparent Tape Poster Carpet Tape for Paste Items,Household', 11.99, 'null', 0),
 (30, 'Original HP 63XL Black High-yield Ink Cartridge | Works with HP DeskJet 1112, 2130, 3630 Series; HP ENVY 4510, 4520 Series; HP OfficeJet 3830, 4650, 5200 Series | Eligible for Instant Ink | F6U64AN', 39.89, 'null', 0),
 (31, '$10 PlayStation Store Gift Card [Digital Code]', 10.00, 'null', 0),
 (32, 'Microsoft Office Home & Student 2021 | One-time purchase for 1 PC or Mac| Download', 124.99, 'https://m.media-amazon.com/images/I/610LdTvXyFL._AC_SX385_.jpg', 0),
 (33, 'Roblox Gift Card - 2000 Robux [Includes Exclusive Virtual Item] [Online Game Code]', 25.00, 'https://m.media-amazon.com/images/I/71QMkXmLVCL._SY445_.jpg', 0),
 (34, 'WYZE Cam Outdoor Starter Bundle (Includes Base Station and 1 Camera), 1080p HD Indoor/Outdoor Wire-Free Smart Home Camera with Night Vision, 2-Way Audio, Works with Alexa & Google Assistant, white', 58.87, 'https://m.media-amazon.com/images/I/41SyuiCk7JL._AC_SY355_.jpg', 0),
 (35, 'Hammermill Printer Paper, 20 Lb Copy Paper, 11 x 17 - 1 Ream (500 Sheets) - 92 Bright, Made in the USA', 15.98, 'https://m.media-amazon.com/images/I/815KcbzHbpS._AC_SY355_.jpg', 0),
 (36, 'Ring Stick Up Cam Battery HD security camera with custom privacy controls, Simple setup, Works with Alexa - Black', 99.99, 'https://m.media-amazon.com/images/I/51JfGuZ80bL._SY355_.jpg', 0);