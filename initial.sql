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

DELIMITER //
CREATE PROCEDURE login(IN name char(30))
BEGIN
  SELECT userName, pass from users where username = name;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE register(IN name char(30))
BEGIN
  SELECT userName from users where username = name;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE addAccount(IN name char(30), IN hash char(255))
BEGIN
  insert into users (userName, pass, mostBought, amountBought, moneySpent) values (name, hash, NULL, 0, 0.00);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE updateLeaderBoards(IN boughtCount int(5), IN id char(10), IN name char(30))
BEGIN
  UPDATE items SET timesBought = timesBought + boughtCount WHERE itemID = id;
  UPDATE users SET amountBought = amountBought + boughtCount WHERE userName = name;
  UPDATE users SET moneySpent = moneySpent + boughtCount * (select price from items where itemID = id) WHERE userName = name;
END //
DELIMITER ;

INSERT INTO items(
    `itemID`,
    `name`,
    price,
    `image`,
    timesBought
)
VALUES(
    0,
    'All-new Kindle Paperwhite (8 GB) – Now with a 6.8\" display and adjustable warm light – Ad-Supported',
    139.99,
    'https://m.media-amazon.com/images/I/61Gih4cc2CL._AC_SY355_.jpg',
    0
),(
    1,
    '100Pcs Joe Biden I DID That! - Sticker Decal Humor - Joe Biden Funny Sticker That\'s All Me I Did That - Pointed to Your Left Funny Joe Biden Campaign Logo Parody Sticker 3 in',
    14.99,
    'https://m.media-amazon.com/images/I/71+YuFNXzsL._AC_SY450_.jpg',
    0
),(
    2,
    'Philips Avent Anti-Colic Baby Bottle with AirFree Vent, 9oz, 1pk, Clear, SCY703/91',
    8.99,
    'https://m.media-amazon.com/images/I/61I2C2vHorS._SY550_.jpg',
    0
),(
    3,
    'VELCRO Brand Extreme Outdoor Mounting Tape | 20Ft x 1 in, Holds 15 lbs | Strong Heavy Duty Stick on Adhesive | Mount on Brick, Concrete for Hanging, 30702',
    19.99,
    'https://m.media-amazon.com/images/I/81btJiqS79L._SX342_.jpg',
    0
),(
    4,
    '2022 Planner 8\"x10\" Size: 14 Months (Begins November 2021/2022 Calendar/ 2022 Weekly Calendar/Weekly Planner Organizer (Black)',
    18.95,
    'https://m.media-amazon.com/images/I/81P05RF7TgL._AC_SY355_.jpg',
    0
),(
    5,
    'Introducing Fire TV Stick 4K Max streaming device, Wi-Fi 6, Alexa Voice Remote (includes TV controls)',
    54.99,
    'https://m.media-amazon.com/images/I/612AvoovbdL._AC_SX425_.jpg',
    0
),(
    6,
    'Pokémon Brilliant Diamond - Nintendo Switch',
    59.88,
    'https://m.media-amazon.com/images/I/81ErLLyfr5L._SY445_.jpg',
    0
),(
    7,
    '100 Pcs Forever Postage Stamps Flags',
    40.00,
    'https://m.media-amazon.com/images/I/514nXcOyynL._AC_SY355_.jpg',
    0
),(
    8,
    '100Pcs I Did That Biden Stickers, That\'s All Me I Did That Biden Bumper Stickers, Funny Decal Sticker Humor (A, 100 PCS)',
    9.49,
    'https://images-na.ssl-images-amazon.com/images/I/6185lQRXUKL.__AC_SX300_SY300_QL70_FMwebp_.jpg',
    0
),(
    9,
    'Introducing Blink Video Doorbell | Two-way audio, HD video, motion and chime app alerts and Alexa enabled — wired or wire-free (Black)',
    49.99,
    'https://m.media-amazon.com/images/I/51tR+nCYhIL._SY355_.jpg',
    0
),(
    10,
    'Apple Watch Series 7 GPS, 41mm Midnight Aluminum Case with Midnight Sport Band - Regular',
    399.00,
    'https://m.media-amazon.com/images/I/71gg8mPlAuL._AC_SX466_.jpg',
    0
),(
    11,
    'Pokémon Brilliant Diamond & Pokemon Shining Pearl Double Pack - Nintendo Switch',
    119.88,
    'https://images-na.ssl-images-amazon.com/images/I/51DQi-YROQL._SY430_SX215_QL70_FMwebp_.jpg',
    0
),(
    12,
    'JJHAEVDY Women\'s Bootcut Yoga Pants Crossover High Waisted Workout Leggings Stretch Non-See Through Tummy Control Flare Pants',
    17.46,
    'https://m.media-amazon.com/images/I/51Qo1+3UlxL._AC_UX522_.jpg',
    0
),(
    13,
    '2022 Pocket Planner/Pocket Calendar: Includes 14 Months (November 2021 to December 2022) / 2022 Weekly Planner/Weekly Agenda/Monthly Calendar Organizer (Black/Brown - Pack of 1)',
    9.95,
    'https://m.media-amazon.com/images/I/61S2QD2A0vL._AC_SY355_.jpg',
    0
),(
    14,
    'Roku Streaming Stick 4K 2021 | Streaming Device 4K/HDR/Dolby Vision with Roku Voice Remote and TV Controls',
    39.99,
    'https://m.media-amazon.com/images/I/71wrIZujPIL._AC_SY355_.jpg',
    0
),(
    15,
    'Emerg?ncy_Keychain Car_Esc?pe Tool,2-in-1Seatbelt Cutter and Window Breaker',
    24.99,
    'https://m.media-amazon.com/images/I/81e1ZNdF7eL._AC_SX425_.jpg',
    0
),(
    16,
    'Gel Pens, Medium Point (0.7mm), Pearl White Body, Black Gel Ink Pens, 4 Count',
    3.69,
    'https://m.media-amazon.com/images/I/81KXQKOUuEL._AC_SX342_.jpg',
    0
),(
    17,
    'PediaSure Grow & Gain with 2’-FL HMO Prebiotic, Kids nutrition shake, Vitamins C, E, B1, & B2, Non-GMO, Chocolate, 8 Fl Oz Bottle, 24 Count',
    51.99,
    'https://m.media-amazon.com/images/I/71mEKacbxbL._AC_SX425_.jpg',
    0
),(
    18,
    'Oculus Quest 2 — Advanced All-In-One Virtual Reality Headset — 128 GB',
    299.00,
    'https://m.media-amazon.com/images/I/615YaAiA-ML._SX342_.jpg',
    0
),(
    19,
    'ECBANLI Bracelet Car Window Breaker, Wrist Strap with Tungsten Carbide Bead Car Emergency Self Rescue Tool, Vehicle Rapid Escape Wristbands Tempered Safety Glass Breaker',
    17.99,
    'https://m.media-amazon.com/images/I/51TtoF8NPrL._AC_SX425_.jpg',
    0
),(
    20,
    '100Pcs Biden I Did That Stickers, 3inch Joe Biden Funny Sticker, That\'s All Me I Did That Decal/Humor/Funny (A, Diamond Reflective Waterproof Sticker)',
    9.97,
    'https://m.media-amazon.com/images/I/61q6nun7tFL._AC_SY679_.jpg',
    0
),(
    21,
    'Amazon Basics Multipurpose Copy Printer Paper - White, 8.5 x 11 Inches, 1 Ream (500 Sheets)',
    8.99,
    'https://m.media-amazon.com/images/I/71mwf6-21xL._AC_SY355_.jpg',
    0
),(
    22,
    'Blink Mini – Compact indoor plug-in smart security camera, 1080 HD video, night vision, motion detection, two-way audio, Works with Alexa – 1 camera',
    34.99,
    'https://m.media-amazon.com/images/I/61LrV6Id5gL._SY355_.jpg',
    0
),(
    23,
    'Wyze Cam Spotlight, Wyze Cam v3 Security Camera with Spotlight Kit, 1080p HD Security Camera with Two-Way Audio and Siren, IP65 Weatherproof, Compatible with Alexa and Google Assistant',
    48.11,
    'https://m.media-amazon.com/images/I/61E8RWSXtoS._AC_SY450_.jpg',
    0
),(
    24,
    'Roblox Gift Card - 800 Robux [Includes Exclusive Virtual Item] [Online Game Code]',
    10.00,
    'https://m.media-amazon.com/images/I/71SfFWK2AUL._SY445_.jpg',
    0
),(
    25,
    '$10 Nintendo eShop Gift Card [Digital Code]',
    10.00,
    'https://m.media-amazon.com/images/I/71g8qy0R8zL._SY445_.jpg',
    0
),(
    26,
    'Microsoft Office Home & Student 2021 | One-time purchase for 1 PC or Mac| Download',
    124.99,
    'https://m.media-amazon.com/images/I/610LdTvXyFL._AC_SX385_.jpg',
    0
),(
    27,
    'Roblox Gift Card - 2000 Robux [Includes Exclusive Virtual Item] [Online Game Code]',
    25.00,
    'https://m.media-amazon.com/images/I/71QMkXmLVCL._SY445_.jpg',
    0
),(
    28,
    'WYZE Cam Outdoor Starter Bundle (Includes Base Station and 1 Camera), 1080p HD Indoor/Outdoor Wire-Free Smart Home Camera with Night Vision, 2-Way Audio, Works with Alexa & Google Assistant, white',
    58.87,
    'https://m.media-amazon.com/images/I/41SyuiCk7JL._AC_SY355_.jpg',
    0
),(
    29,
    'Hammermill Printer Paper, 20 Lb Copy Paper, 11 x 17 - 1 Ream (500 Sheets) - 92 Bright, Made in the USA',
    15.98,
    'https://m.media-amazon.com/images/I/815KcbzHbpS._AC_SY355_.jpg',
    0
),(
    30,
    'Ring Stick Up Cam Battery HD security camera with custom privacy controls, Simple setup, Works with Alexa - Black',
    99.99,
    'https://m.media-amazon.com/images/I/51JfGuZ80bL._SY355_.jpg',
    0
),(
    31,
    'Amazon Basics 3-Way Smart Switch, Works with Alexa, Neutral Wire Required - A Certified for Humans Device',
    18.99,
    'https://m.media-amazon.com/images/I/71SPb6cM1vL._AC_SX355_.jpg',
    0
),(
    32,
    'Amazon Basics 3-Way Smart Dimmer Switch, Works with Alexa, Neutral Wire Required - A Certified for Humans Device',
    20.99,
    'https://m.media-amazon.com/images/I/716njGi7InL._AC_SX355_.jpg',
    0
),(
    33,
    'Amazon Basics Single Pole Smart Dimmer Switch, Works with Alexa, Neutral Wire Required - A Certified for Humans Device',
    19.99,
    'https://m.media-amazon.com/images/I/71Qr-5Zr1JL._AC_SX355_.jpg',
    0
),(
    34,
    'Amazon Basics Sandwich Storage Bags, 300 Count (Previously Solimo)',
    7.68,
    'https://m.media-amazon.com/images/I/71zPvNJ906L._AC_SX425_PIbundle-300,TopRight,0,0_SH20_.jpg',
    0
),(
    35,
    'Amazon Basics Flextra Multipurpose Drawstring Trash Bags, 30 Gallon, 50 Count',
    13.49,
    'https://m.media-amazon.com/images/I/71JZoRnEQeL._AC_SX425_PIbundle-50,TopRight,0,0_SH20_.jpg',
    0
),(
    36,
    'Amazon Basics Flextra Tall Kitchen Drawstring Trash Bags, Clean Fresh Scent, 13 Gallon, 120 Count',
    14.57,
    'https://m.media-amazon.com/images/I/71FeJXwWPwL._AC_SX425_PIbundle-120,TopRight,0,0_SH20_.jpg',
    0
),(
    37,
    'Amazon Basics Flextra Tall Kitchen Drawstring Trash Bags, 13 Gallon, 90 Count',
    12.23,
    'https://m.media-amazon.com/images/I/71nZKgSHgzL._AC_SX425_PIbundle-90,TopRight,0,0_SH20_.jpg',
    0
),(
    38,
    'Amazon Basics Single Pole Smart Switch, Works with Alexa, Neutral Wire Required - A Certified for Humans Device',
    17.99,
    'https://m.media-amazon.com/images/I/618hX8ZtV-L._AC_SX355_.jpg',
    0
),(
    39,
    'Amazon Basics Multipurpose Drawstring Trash Bags, 30 Gallon, 50 Count (Previously Solimo)',
    11.99,
    'https://m.media-amazon.com/images/I/61IXx66RLOL._AC_SX425_PIbundle-50,TopRight,0,0_SH20_.jpg',
    0
),(
    40,
    'Amazon Basics Metal Bar Stools - 24-Inch, Set of 4, Dark Grey',
    99.00,
    'https://m.media-amazon.com/images/I/71QJ-9Y8QAS._AC_SY355_.jpg',
    0
),(
    41,
    'Amazon Basics Flextra Tall Kitchen Drawstring Trash Bags, Clean Fresh Scent, 13 Gallon, 90 Count',
    12.23,
    'https://m.media-amazon.com/images/I/711F2roOZ3L._AC_SX425_PIbundle-90,TopRight,0,0_SH20_.jpg',
    0
),(
    42,
    'Wyze Cam Pan v2 1080p Pan/Tilt/Zoom Wi-Fi Indoor Smart Home Camera with Color Night Vision, 2-Way Audio, Compatible with Alexa & The Google Assistant, White',
    49.98,
    'https://m.media-amazon.com/images/I/510IqtzZ51L._AC_SX355_.jpg',
    0
),(
    43,
    'Kate Spade New York Mini Small Square Huggies Earrings',
    22.80,
    'https://m.media-amazon.com/images/I/71v0QSafISL._AC_UX569_.jpg',
    0
),(
    44,
    '2 Packs Wrapping Paper Cutter,Portable Sliding Gift Wrapping Paper Roll Cutter Tool,Paper Cutter Makes Easy to Cut Halloween Thanksgiving Christmas Wall Sticker Decorations (Black &Green)',
    15.99,
    'https://m.media-amazon.com/images/I/51vfdZAPsVL._AC_SY355_.jpg',
    0
),(
    45,
    'Roku Streaming Stick 4K 2021 | Streaming Device 4K/HDR/Dolby Vision with Roku Voice Remote and TV Controls',
    29.00,
    'https://m.media-amazon.com/images/I/71wrIZujPIL._AC_SY355_.jpg',
    0
),(
    46,
    'Oculus Quest 2 — Advanced All-In-One Virtual Reality Headset — 128 GB',
    899.99,
    'https://m.media-amazon.com/images/I/615YaAiA-ML._SX342_.jpg',
    0
),(
    47,
    'Marvel Studios: The Infinity Saga Endgame Heroes Metal-Based and Enamel 11 Lapel Pin Set with Officially Licensed Window Box with Back Support (Amazon Exclusive)',
    59.99,
    'https://m.media-amazon.com/images/I/71SduANGFPL._AC_SX425_.jpg',
    0
),(
    48,
    'PlayStation 5 Console',
    799.99,
    'https://m.media-amazon.com/images/I/619BkvKW35L._SX342_.jpg',
    0
),(
    49,
    '2-Pack Scratchproof Vaccine Card Holder, CDC Vaccination Card Protector 4 × 3 Inches, Immunization Vaccinate Record Cards Plastic Holder for Badge Record ID Card Name Tag',
    6.99,
    'https://m.media-amazon.com/images/I/71AawRfeokL._AC_SY355_.jpg',
    0
),(
    50,
    'AUKEY Basix Pro Wireless Power Bank 20000mAh PB-WL03',
    70.98,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7S2106235lgdy.jpg',
    0
),(
    51,
    'TACKLIFE HHK3A - 57-Piece Tool Set - Household Repair Tool Kit with All Essential Tools for Home, Office, Apartment with Sturdy Tool Box Storage Case',
    33.97,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7D210817JSS6A.jpg',
    0
),(
    52,
    'TACKLIFE X1 Rechargeable Cordless Tire Inflator - Handheld Air Compressor, Portable Air Pump with Digital Display for Car Bike Tires and Other Inflatables X1',
    54.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7S210713Uu6ea.jpg',
    0
),(
    53,
    'AUKEY KM-P1 Mouse Pad, Gaming Mouse Mat with Smooth Surface, Non-Slip Rubber Base and Anti-Fraying Stitched Edges 13.7” x 9.8”',
    10.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7S210623AClgm.jpg',
    0
),(
    54,
    'TACKLIFE PPGJ05A-Buffer Polisher, 7-inch Car Buffer Polisher, 6 Variable Speeds from 1500~3500 RPM, 10A, D-Handle, Wool disc, Ideal for Car Polishing, Furniture/Wood Polishing, Paint/Rust Removal',
    74.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7D210814KAEEC.jpg',
    0
),(
    55,
    'NAIPO Massage Gun for Athletes, Naipo Handheld Massage Deep Tissue Body Muscle Massage Gun Professional Percussion for Pain Relief MGG-2103',
    49.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/B347D211007FQ86D.jpg',
    0
),(
    56,
    'TACKLIFE HIS1A-18pcs 1/2-inch Drive Deep Impact Socket Set, 6 Point,10-24mm,15pcs Metric Sockets with 3pcs Extension Bar Set',
    22.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7D210814KIV4A.jpg',
    0
),(
    57,
    'AUKEY CB-C89 10 in 1 USB C Hub with 4K HDMI & VGA Silver',
    53.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7S210824MauMN.jpg',
    0
),(
    58,
    'Naipo Electric Eye Massager with Heat, Vibration, Air Pressure for Relieve Eye Strain Dry Eye Headaches Bluetooth Music Improve Sleep, Shiatsu Massager Rechargeable Wireless and Foldable MGE-1822',
    '33.99',
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7S210705z2YfG.jpg',
    0
),(
    59,
    'TACKLIFE RG01-Upgrade Reacher Grabber Tool, 0°-180° Angled Arm, 90° Rotating Head',
    9.97,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7D210814KFIXG.jpg',
    0
),(
    60,
    'Naipo Neck & Back Massager with Adjustable Heat (Deep Gray) - Ocuddle-C1',
    53.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/B347S211007A4C81.jpg',
    0
),(
    61,
    'TACKLIFE A6 Plus AC/DC Tire Inflator, Portable Air Compressor',
    79.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7S2107131EgmK.jpg',
    0
),(
    62,
    'TACKLIFE HIS2A-17 Pieces Socket Set, 1/2-Inch Drive Deep Impact Socket Set with SAE Size 3/8\" - 5/4\" inch, CR-V Steel and 6 Point Design, Perfect for Home, Mechanic and Repair Project',
    59.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7D210814KJF8B.jpg',
    0
),(
    63,
    'TACKLIFE HHK6A-144 Home Repair Tool Set, General Household Too Kit with Sturdy Storage Case',
    55.98,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7D210814KEJH3.jpg',
    0
),(
    64,
    'AUKEY HD-C49 Car Phone Mount, Dashboard Magnetic Cell Phone Holder, Compatible with iPhone XS / XS Max, Samsung Galaxy S10+, Google Pixel 3 XL, and More - Gray',
    11.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7S210715VTftD.jpg',
    0
),(
    65,
    'AUKEY CC-Y17S Dual USB-A LED Car Charger - 36W',
    8.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7S210729wUjWY.jpg',
    0
),(
    66,
    'TACKLIFE CM06 - Clamp Meter, 6000 Counts Clamp Ammeter, with NVC Auto Range Tests, AC / DC Current and Voltage, Electrical Diode, Resistance',
    72.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7D210814K7WI5.jpg',
    0
),(
    67,
    'AUKEY CB-C75 USB C Hub Adapter, 6 in 1 Type C Hub with Ethernet Port 1000Mbps, 4K USB C to HDMI, 3 USB 3.0 Ports, 100W USB C PD Charging Thunderbolt 3 for MacBook Pro Air, Chromebook Pixel Laptop Phone',
    22.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7D2103236AROR.jpg',
    0
),(
    68,
    'AUKEY Focus Mix 30W Dual-Port PD Charger with Dynamic Detect, White PA-D1',
    15.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7S210625rjsDH.jpg',
    0
),(
    69,
    'AUKEY KM-P2 Mouse Pad, Gaming Mouse Mat with Smooth Surface, Non-Slip Rubber Base and Anti-Fraying Stitched Edges 31.5” x11.81”',
    15.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7S210623TlB11.jpg',
    0
),(
    70,
    'TACKLIFE SWS2A - Socket Set 47pcs 3/8\" Drive Sockets',
    26.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7D210817JSSRI.jpg',
    0
),(
    71,
    'TACKLIFE F4 Mini Fridge 4 Liter AC/DC Portable Personal Fridge, Energy Saving Cooler and Warmer Refrigerator for Office, Car, Bedroom, 100% Freon-Free Great for Skincare, Fruit, Food, Medicine.',
    66.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7S21082691UTG.jpg',
    0
),(
    72,
    'TACKLIFE S10 Pro - Robot Vacuum and Mop, LDS Lidar Mapping Robotic Vacuum Cleaner with Self-charging and Large Dustbin, APP & Alexa Voice Control, 2000Pa Strong Suction for Hardwood Floors and Carpets',
    269.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7D210814K9LE8.jpg',
    0
),(
    73,
    'AUKEY KM-G18 Mechanical Gaming Keyboard RGB Backlight with Linear Red Switches, 104-Key Anti-Ghosting Wired USB Keyboard for PC, Laptop',
    38.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7S210623YmoS3.jpg',
    0
),(
    74,
    'TACKLIFE RTD02DC - Cordless rotary tool 8V Motor 2.0 Ah Li-ion Battery with 43 Accessories, Long Endurance Power Rotary Tool',
    28.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7D210814KB1ZK.jpg',
    0
),(
    75,
    'AUKEY KM-P3 Gaming Mouse Pad Large XXL (35.4×15.75×0.15in) Thick Extended Mouse Mat Non-Slip Spill-Resistant Desk Pad with Special-Textured Surface Anti-Fray Stitched Edges for Keyboard PC',
    18.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7S210623hdf6U.jpg',
    0
),(
    76,
    'TACKLIFE SC-L01 PRO - Green Laser Level, Three Modules With 2 Laser Heads, Horizontal/Vertical/Cross Line, USB Rechargeable, Self Leveling, And Pulse Mode',
    35.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7D210814K7XZS.jpg',
    0
),(
    77,
    'TACKLIFE M2 12V DC Digital Auto Tire Inflator',
    24.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7S210714kCBYo.jpg',
    0
),(
    78,
    'AUKEY PC-LM1E 1080P Webcam w/ Dual Noise Reduction Stereo Microphones - Black',
    23.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7S210716LYo0H.jpg',
    0
),(
    79,
    'AUKEY PB-N83 Mini USB C Portable Charger 10000mAh -White',
    28.97,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7S210624gir6D.jpg',
    0
),(
    80,
    'AUKEY LT-T8 Bedside Table Lamp, Night Light with Rechargeable Battery for Bedrooms, Dimmable 3000K-6500K Warm White Light & Color-Changing RGB',
    25.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7D210324KHDVT.jpg',
    0
),(
    81,
    'TACKLIFE DMS03 4 in 1 Center Finding Electronic Wall Detector Finders - DMS03',
    19.97,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7S210720Ifuxy.jpg',
    0
),(
    82,
    'AUKEY HD-C49 Phone Holder for Car 360 Degree Rotation Dashboard Magnetic Car Phone Mount Compatible with iPhone 11 Pro Max/11/XS Max/XS/8/7, Samsung Galaxy S10+, Google Pixel 3 XL, and More-Black',
    10.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7D2103240JZVM.jpg',
    0
),(
    83,
    'TACKLIFE VT02 Lasers & Levels Non-Contact AC Voltage Tester/Voltage Tester Pen, VT02',
    13.59,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7S21091051F4A.jpg',
    0
),(
    84,
    'NAIPO Shiatsu Back and Neck Massager with Heat 3D Deep Kneading Massage for Back, Shoulders, Foot, and Legs (Gray) MGS-801',
    52.52,
    'https://c1.neweggimages.com/ProductImageCompressAll60/B347D210929YN2KQ.jpg',
    0
),(
    85,
    'AUKEY CB-C64 USB C Hub Ultra Slim with 4 USB 3.0 Data Ports Black',
    19.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7S2109067CDE1.jpg',
    0
),(
    86,
    'TACKLIFE T6 800A Peak 18000mAh Car Jump Starter (up to 7.0L Gas, 5.5L Diesel Engine) with Long Standby, Quick Charge, 12V Auto Battery Booster, Portable Power Pack for Cars, Trucks, SUV',
    47.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7S210702tJlSx.jpg',
    0
),(
    87,
    'TACKLIFE A6 Tire Inflator, 12V DC Air Compressor w/ 3 LED Light Modes',
    16.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7S2107020FioS.jpg',
    0
),(
    88,
    'AUKEY Mechanical Gaming Keyboard with Customizable RGB Backlight, Tactile & Clicky Blue Switches, 104-Key Anti-Ghosting Wired Keyboard with Surround Lighting, Steel Body for PC and Laptop KM-G12',
    28.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7D210324VWBJY.jpg',
    0
),(
    89,
    'TACKLIFE F4 Mini Fridge 4 Liter AC/DC Portable Personal Fridge, Energy Saving Cooler and Warmer Refrigerator for Office, Car, Bedroom, 100% Freon-Free Great for Skincare, Fruit, Food, Medicine.',
    66.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7S210826jCUc1.jpg',
    0
),(
    90,
    'TACKLIFE T8 Pro 1200A Peak 18000mAh Water-Resistant Car Jump Starter With LCD Screen Orange',
    54.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7S210622epfKH.jpg',
    0
),(
    91,
    'TACKLIFE T8 MAX Jump Starter-1000A Peak 20000mAh,12V Car Jumper',
    45.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7S210702vbseK.jpg',
    0
),(
    92,
    'AUKEY PB-N93A PD Power Bank, Ultra Slim 20000mAh PD 3.0 Portable Charger QC 3.0 18W USB C External Battery Pack Triple Fast Phone Charger for iPhone 12/12 Pro, iPad Air and Samsung Galaxy',
    25.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7S210623opVsn.jpg',
    0
),(
    93,
    'AUKEY Mechanical Keyboard 6 Color LED Backlit Gaming Keyboard Blue Switch Full N-Key Rollover Durable & Water-Resistant KM-G6',
    48.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7S210623EL27H.jpg',
    0
),(
    94,
    'AUKEY EP-T31 True Wireless Earbuds, Bluetooth 5 Headphones Wireless Charging Case, in-Ear Detection, 30H Playtime, IPX5 Water Resistance, Type-C Low Latency Stereo Earphones for iPhones Android Black',
    39.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7S2103193F9u3.jpg',
    0
),(
    95,
    'AUKEY KM-P7 RGB Gaming Mouse Pad, Water-Resistant with 11 LED Lighting Effects, Smooth Surface and Non-Slip Rubber Base 35.4” x 15.75” x 0.15”',
    15.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7S2106245iiYP.jpg',
    0
),(
    96,
    'AUKEY PB-WL02 Portable Charger 20W PD 3.0 USB C Power Bank 10000mAh 10W Qi Wireless Portable Battery Pack QC 3.0 with Foldable Stand for iPhone 12/12mini/12Pro/11/11Pro Samsung 22.5W for Huawei SCP',
    44.98,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7S210622FufW4.jpg',
    0
),(
    97,
    'AUKEY True Wireless Earbuds, Bluetooth 5 Headphones in Ear with Charging Case, Hands-Free Headset with Mic, Touch Control, 35 Hours Playback for iPhone and Android',
    39.98,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7S210319xGeUS.jpg',
    0
),(
    98,
    'AUKEY KM-G16 Mechanical Gaming Keyboard with Clicky Blue Switches & LED Backlight, 104-Key Anti-Ghosting Wired Mechanical Keyboard with Macro Recording & Ergonomic Design for PC and Laptop',
    39.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7D210324WEBJM.jpg',
    0
),(
    99,
    'AUKEY Dash Cam FHD 1080p Car Camera Supercapacitor 170 Degree 6-Lane Wide Angle Lens Dashboard Camera Recorder with G-Sensor, WDR and Motion Detection DRA1',
    69.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7S210813tdrBs.jpg',
    0
),(
    100,
    'TACKLIFE T8 800A Peak 18000mAh Car Jump Starter with LCD Display (up to 7.0L Gas, 5.5L Diesel Engine) 12V Auto Battery Booster w/ Smart Jumper Cable',
    89.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7S2106220QUHb.jpg',
    0
),(
    101,
    'TACKLIFE Lightweight Tripod 55-Inch, Aluminum Travel/Camera/Phone Tripod With Carry Bag - MLT01',
    26.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7S2106232rnzB.jpg',
    0
),(
    102,
    'ODEC OD-E1 Wireless Earbuds Bluetooth 5.0 LED Display Touch Control Stereo Earphones in-Ear Design, Waterproof Headphones with Built-in Mic Headset Portable USB-C Fast Charging Case for Work, Black',
    15.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7S210718XGnKL.jpg',
    0
),(
    103,
    'AUKEY PB-N83 Mini USB C Portable Charger Black 10000mAh',
    15.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7S210624vawpk.jpg',
    0
),(
    104,
    'Tacklife T8 Pro 1200A Peak 18000mAh Water-Resistant Car Jump Starter with LCD Screen (up to 7.5L Gas, 6L Diesel Engine) car Battery Charger with LCD Screen, USB Quick Charge, T8 Pro Green',
    91.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7S2109061743E.jpg',
    0
),(
    105,
    'TACKLIFE A6 Car Tire Inflator 12V DC Portable Air Compressor Orange, Blue, Red and Yellow',
    39.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7S2108258KlEr.jpg',
    0
),(
    106,
    'AUKEY KM-P6 RGB Gaming Mouse Pad Large (31.5×11.8×0.15in) Thick Extended LED Mousepad with Customizable 16.8 Million Colors, 10 Preset Lights, Spill-Resistant Smooth Surface',
    26.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7S210623QYbJ7.jpg',
    0
),(
    107,
    'TACKLIFE MLR01 Laser Range Finder BLACK and ORANGE, Can Measure 900 Yards Farther; 7 Times Magnification and Full Multilayer Coating, Durable And Waterproof Body Makes The Image Clearer and More',
    94.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7S210720r5Tro.jpg',
    0
),(
    108,
    'TACKLIFE Circular Saw With Metal Handle, 6 Blades (4-3/4\"& 4-1/2”), Laser Guide, 5.8A, Max Cutting Depth 1-11/16\'\' (90°), 1-3/8\'\' (45°), Ideal For Wood, Soft Metal, Tile And Plastic Cuts - TCS115A - O',
    88.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7S210730KVlnd.jpg',
    0
),(
    109,
    'TACKLIFE KP200 Jump Starter Black',
    96.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AWR7S210825UDYXT.jpg',
    0
),(
    110,
    'ASRock Radeon RX 6900 XT PHANTOM GAMING D Graphics Card 16GB GDDR6, AMD RDNA2 (RX6900XT PGD 16GO)',
    499.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/14-930-052-01.jpg',
    0
),(
    111,
    'ABS Master Gaming PC - Intel i5 11400F - GeForce RTX 3060 - 16GB DDR4 3000MHz - 512GB M.2 NVMe SSD',
    299.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/83-360-205-01.jpg',
    0
),(
    112,
    'MSI Gaming GeForce GTX 1050 Ti 4GB GDDR5 PCI Express 3.0 x16 ATX Video Card GTX 1050 Ti GAMING X 4G',
    264.98,
    'https://c1.neweggimages.com/ProductImageCompressAll60/14-137-054-07.jpg',
    0
),(
    113,
    'Microsoft Xbox Series S',
    299.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/68-105-274-V01.jpg',
    0
),(
    114,
    'SAMSUNG Odyssey G7 C27G75T 27\" Quad HD 2560 x 1440 2K 240Hz 1ms 2 x DisplayPort, HDMI G-Sync Compatible Flicker-Free Backlit LED Curved Gaming Monitor',
    499.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/24-022-815-S02.jpg',
    0
),(
    115,
    'ASUS TUF Gaming GeForce GTX 1650 OC Edition 4GB GDDR6 PCI Express 3.0 Video Card TUF-GTX1650-O4GD6-P-GAMING',
    323.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/14-126-445-01.jpg',
    0
),(
    116,
    'ABS Master Gaming PC - Intel i5 10400F - GeForce RTX 3060 12GB - 16GB DDR4 3000MHz - 512GB SSD',
    199.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/83-360-194-09.jpg',
    0
),(
    117,
    'XFX SPEEDSTER SWFT 210 Radeon RX 6600 8GB GDDR6 PCI Express 4.0 ATX Video Card RX-66XL8LFDQ',
    559.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/14-150-864-01.jpg',
    0
),(
    118,
    'SAMSUNG Odyssey G9 Series C49G97T 49\" Dual QHD 5120 x 1440 2K 1ms (GTG) 240Hz HDMI, 2x DisplayPort, 2x USB 3.0 AMD FreeSync and G-Sync Compatible Curved DisplayHDR 1000 QLED Gaming Monitor',
    048.97,
    'https://c1.neweggimages.com/ProductImageCompressAll60/24-022-902-01.jpg',
    0
),(
    119,
    'Oculus Quest 2 - Advanced All-In-One Virtual Reality Headset - 256 GB',
    399.00,
    'https://c1.neweggimages.com/ProductImageCompressAll60/26-910-032-V01.jpg',
    0
),(
    120,
    'AMD Ryzen 7 5800X - Ryzen 7 5000 Series Vermeer (Zen 3) 8-Core 3.8 GHz Socket AM4 105W Desktop Processor - 100-100000063WOF',
    410.91,
    'https://c1.neweggimages.com/ProductImageCompressAll60/19-113-665-V01.jpg',
    0
),(
    121,
    'SAPPHIRE PULSE AMD Radeon RX 6800 XT Gaming Graphics Card with 16GB GDDR6, AMD RDNA 2 (SKU#11304-03-20G)',
    269.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/14-202-405-S01.jpg',
    0
),(
    122,
    'ABS Gladiator Gaming PC - Ryzen 7 5800X - GeForce RTX 3080 - G.Skill TridentZ RGB 32GB DDR4 3200MHz - 1TB Gen4 M.2 SSD - Corsair 280MM RGB AIO - Windows 10 Pro 64-bit',
    699.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/83-360-202-01.jpg',
    0
),(
    123,
    'CyberpowerPC Gaming Desktop Gamer Master GM60900 Ryzen 7 5000 Series 5800X (3.80GHz) 16GB DDR4 1 TB PCIe SSD NVIDIA GeForce RTX 3060 Ti Windows 10 Home 64-bit',
    699.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/83-230-646-V01.jpg',
    0
),(
    124,
    'ASUS ROG STRIX Radeon RX 6600 XT 8GB GDDR6 PCI Express 4.0 CrossFireX Support ATX Video Card ROG-STRIX-RX6600XT-O8G-GAMING',
    549.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/14-126-527-V01.jpg',
    0
),(
    125,
    'ABS Master Gaming PC - Intel i7 11700F - GeForce RTX 3060 Ti - 16GB DDR4 3000MHz - 1TB M.2 NVMe SSD',
    599.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/83-360-190-01.jpg',
    0
),(
    126,
    'AMD Ryzen 9 5950X - Ryzen 9 5000 Series Vermeer (Zen 3) 16-Core 3.4 GHz Socket AM4 105W Desktop Processor - 100-100000059WOF',
    718.96,
    'https://c1.neweggimages.com/ProductImageCompressAll60/19-113-663-V01.jpg',
    0
),(
    127,
    'Intel Core i9-12900K - Core i9 12th Gen Alder Lake 16-Core (8P+8E) 3.2 GHz LGA 1700 125W Intel UHD Graphics 770 Desktop Processor - BX8071512900K',
    649.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/19-118-339-05.jpg',
    0
),(
    128,
    'EVGA GeForce RTX 3070 Ti FTW3 ULTRA GAMING Video Card, 08G-P5-3797-KL, 8GB GDDR6X, iCX3 Technology, ARGB LED, Metal Backplate',
    859.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/14-487-550-V30.jpg',
    0
),(
    129,
    'Intel Core i5-11600K - Core i5 11th Gen Rocket Lake 6-Core 3.9 GHz LGA 1200 125W Intel UHD Graphics 750 Desktop Processor - BX8070811600K',
    259.36,
    'https://c1.neweggimages.com/ProductImageCompressAll60/19-118-235-V01.jpg',
    0
),(
    130,
    'Intel Core i7-12700K - Core i7 12th Gen Alder Lake 12-Core (8P+4E) 3.6 GHz LGA 1700 125W Intel UHD Graphics 770 Desktop Processor - BX8071512700K',
    418.88,
    'https://c1.neweggimages.com/ProductImageCompressAll60/19-118-343-05.jpg',
    0
),(
    131,
    'EVGA GeForce RTX 3060 XC GAMING, 12G-P5-3657-KR, 12GB GDDR6, Dual-Fan, Metal Backplate',
    439.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/14-487-539-01.jpg',
    0
),(
    132,
    'ASUS ROG Strix NVIDIA GeForce RTX 3080 Ti OC Edition Gaming Graphics Card (PCIe 4.0, 12GB GDDR6X, HDMI 2.1, Axial-tech Fan Design, 2.9-Slot, Super Alloy Power II, ASUS Auto-Extreme Technology)',
    069.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/14-126-508-V19.jpg',
    0
),(
    133,
    'GIGABYTE B550 VISION D-P AM4 AMD B550 ATX Motherboard with Dual M.2, SATA 6Gb/s, USB 3.2 Type-C with Thunderbolt 3, WIFI 6, Dual 2.5GbE LAN, PCIe 4.0',
    299.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/13-145-297-01.jpg',
    0
),(
    134,
    'G.SKILL Ripjaws V Series 32GB (2 x 16GB) 288-Pin DDR4 SDRAM DDR4 3200 (PC4 25600) Desktop Memory Model F4-3200C16D-32GVK',
    99.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/20-232-091-04.jpg',
    0
),(
    135,
    'ABS Gladiator Gaming PC - Intel i5 11400F - GeForce RTX 3070 - 16GB DDR4 3000MHz - 1TB M.2 NVMe SSD',
    599.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/83-360-221-01.jpg',
    0
),(
    136,
    'MSI - 15.6\" 144 Hz IPS - Intel Core i7 11th Gen 11800H (2.30GHz) - NVIDIA GeForce RTX 3060 Laptop GPU - 16 GB DDR4 - 1 TB HDD 512 GB NVMe SSD - Windows 10 Home 64-bit - Gaming Laptop (Pulse GL66 11UEK-034 )',
    199.00,
    'https://c1.neweggimages.com/ProductImageCompressAll60/34-155-856-V30.jpg',
    0
),(
    137,
    'ASUS ROG Strix NVIDIA GeForce RTX 3060 Ti V2 OC Edition Gaming Graphics Card (PCIe 4.0, 8GB GDDR6, LHR, HDMI 2.1, DisplayPort 1.4a, Axial-tech Fan Design, 2.9-slot, Super Alloy Power II, GPU Tweak II) ROG-STRIX-RTX3060TI-O8G-V2-GAMING',
    669.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/14-126-529-V06.jpg',
    0
),(
    138,
    'Lenovo Laptop ThinkPad T14 Gen 2 20W0003JUS Intel Core i5 11th Gen 1135G7 (2.40GHz) 8 GB Memory 256 GB PCIe SSD Intel Iris Xe Graphics 14\" IPS 1920 x 1080 Windows 10 Pro 64-bit',
    050.72,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AHRCD210317P9K8U.jpg',
    0
),(
    139,
    'MSI SPATIUM Series M.2 2280 1TB PCI-Express 4.0 x4, NVMe 1.3 3D NAND Internal Solid State Drive (SSD) M470',
    94.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/20-140-013-V01.jpg',
    0
),(
    140,
    'ASRock OC Formula Radeon RX 6900 XT 16GB GDDR6 PCI Express 4.0 ATX Video Card RX6900XT OCF 16G',
    599.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/14-930-057-V01.jpg',
    0
),(
    141,
    'GIGABYTE Gaming OC PRO GeForce RTX 3060 Ti 8GB GDDR6 PCI Express 4.0 ATX Video Card GV-N306TGAMINGOC PRO-8GD (rev. 3.0) (LHR)',
    569.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/14-932-453-V11.jpg',
    0
),(
    142,
    'Windows 10 Home - 64-bit - OEM',
    99.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/32-416-892-11.jpg',
    0
),(
    143,
    'MSI GP Series - 15.6\" 240 Hz - Intel Core i7 11th Gen 11800H (2.30GHz) - NVIDIA GeForce RTX 3080 Laptop GPU - 16 GB DDR4 - 1 TB NVMe SSD - Windows 10 Home 64-bit - Gaming Laptop (GP66 Leopard 11UH-032 )',
    899.00,
    'https://c1.neweggimages.com/ProductImageCompressAll60/34-155-852-V24.jpg',
    0
),(
    144,
    'MSI GP Series - 17.3\" 144 Hz IPS - Intel Core i7 10th Gen 10870H (2.20 GHz) - NVIDIA GeForce RTX 2070 SUPER - 16 GB DDR4 - 512 GB NVMe SSD - Windows 10 Home 64-bit - Gaming Laptop (GP75 Leopard 10SFSK-481)',
    399.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AAPKS201230xh6Fa.jpg',
    0
),(
    145,
    'AMD Ryzen 9 5900X - Ryzen 9 5000 Series Vermeer (Zen 3) 12-Core 3.7 GHz Socket AM4 105W Desktop Processor - 100-100000061WOF',
    599.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/19-113-664-V01.jpg',
    0
),(
    146,
    'ABS Master Gaming PC - Intel i5 11400F - GeForce RTX 2060 - 16GB DDR4 3000MHz - 512GB Intel M.2 NVMe SSD',
    099.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/83-360-129-04.jpg',
    0
),(
    147,
    'ABS Gladiator Gaming PC - Intel i7 11700KF - GeForce RTX 3070 - G.Skill TridentZ RGB 16 GB DDR4 3200MHz - 1TB Intel M.2 NVMe SSD',
    199.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/83-360-211-01.jpg',
    0
),(
    148,
    'GIGABYTE Gaming GeForce RTX 3070 Ti 8GB GDDR6X PCI Express 4.0 ATX Video Card GV-N307TGAMING OC-8GD',
    899.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/14-932-443-01.jpg',
    0
),(
    149,
    'Oculus Quest 2 - Advanced All-In-One Virtual Reality Headset - 128 GB',
    299.00,
    'https://c1.neweggimages.com/ProductImageCompressAll60/26-910-033-V11.jpg',
    0
),(
    150,
    'ASUS ROG Strix GA15DK Gaming Desktop PC, AMD Ryzen 7 5800X, GeForce RTX 3070, 16GB DDR4 RAM, 1TB SSD, Wi-Fi 5, Windows 10 Home, GA15DK-DS776',
    749.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/83-221-675-V01.jpg',
    0
),(
    151,
    'ABS Gladiator Gaming PC - Intel i9 11900KF - EVGA GeForce RTX 3080 FTW3 Ultra Gaming - Corsair Vengeance RGB 32GB 3200MHz - 2TB Intel M.2 NVME SSD - Corsair H115i ELITE AIO 280mm',
    499.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/83-360-209-09.jpg',
    0
),(
    152,
    'ASUS KO GeForce RTX 3060 Ti V2 OC Edition 8GB GDDR6 PCI Express 4.0 x16 Video Card KO-RTX3060TI-O8G-V2-GAMING (LHR)',
    609.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/14-126-526-V03.jpg',
    0
),(
    153,
    'Dyson V10 Animal Cordless Vacuum Cleaner | Iron | New',
    399.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/A1CZD21110916ZASRC9.jpg',
    0
),(
    154,
    'Intel Core i7-11700K - Core i7 11th Gen Rocket Lake 8-Core 3.6 GHz LGA 1200 125W Intel UHD Graphics 750 Desktop Processor - BX8070811700K',
    339.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/19-118-233-V01.jpg',
    0
),(
    155,
    'ABS Master Gaming PC - Intel i5 10400F - GeForce RTX 2060 - 16GB DDR4 - 512GB SSD',
    199.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/83-102-994-01.jpg',
    0
),(
    156,
    'Klipsch Reference Theater Pack 5.1 Channel Surround Sound System',
    269.00,
    'https://c1.neweggimages.com/ProductImageCompressAll60/0W3-000R-004D1-V08.jpg',
    0
),(
    157,
    'ABS Legend Gaming PC - AMD R9 5950X – GeForce RTX 3080 Ti - G.Skill TridentZ RGB 32GB DDR4 3200MHz - 1TB AORUS GEN4 M.2 NVMe SSD - 240MM RGB AIO',
    199.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/83-360-177-01.jpg',
    0
),(
    158,
    'Lenovo ThinkPad T15 Gen 2 Laptop, 15.6\" FHD IPS 300 nits, i5-1135G7, Iris Xe Graphics, 8GB, 256GB SSD, Win 10 Pro',
    049.00,
    'https://c1.neweggimages.com/ProductImageCompressAll60/AHRCD210317YUNHT.jpg',
    0
),(
    159,
    'Antminer S17 PRO Mining Machine Power Second-Hand, 220V AC 2200W 53TH/s Power Output Mining Power Supply Bitcoin Miner Machine with Power Cord',
    699.75,
    'https://c1.neweggimages.com/ProductImageCompressAll60/B30TD210831J3S1H.jpg',
    0
),(
    160,
    'ASUS Dual GeForce RTX 3060 Ti V2 OC Edition 8GB GDDR6 PCI Express 4.0 Video Card DUAL-RTX3060TI-O8G-V2 (LHR)',
    579.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/14-126-521-V01.jpg',
    0
),(
    161,
    'AMD Ryzen 5 5600X - Ryzen 5 5000 Series Vermeer (Zen 3) 6-Core 3.7 GHz Socket AM4 65W Desktop Processor - 100-100000065BOX',
    314.70,
    'https://c1.neweggimages.com/ProductImageCompressAll60/19-113-666-V01.jpg',
    0
),(
    162,
    'MSI Gaming Radeon RX 6600 XT 8GB GDDR6 PCI Express 4.0 ATX Video Card RX 6600 XT GAMING X 8G',
    579.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/14-137-681-12.jpg',
    0
),(
    163,
    'ABS Legend Gaming PC - Intel i7 11700K - Gigabyte RTX 3090 Gaming OC - G.Skill TridentZ RGB 32GB DDR4 3200MHz - 1TB Intel 670P M.2 NVMe SSD - 240MM RGB AIO',
    699.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/83-360-183-07.jpg',
    0
),(
    164,
    'iBUYPOWER Gaming Desktop Trace5MR 181I Intel Core i9 11th Gen 11900KF (3.50GHz) 32GB DDR4 1 TB PCIe SSD AMD Radeon RX 6900 XT Windows 10 Home 64-bit',
    499.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/83-227-945-V01.jpg',
    0
),(
    165,
    'Sapphire Nitro+ AMD Radeon RX 6700 XT Gaming OC 12GB GDDR6 HDMI / Triple DP (11306-01-20G)',
    909.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/14-202-399-V01.jpg',
    0
),(
    166,
    'ABS Gladiator Gaming PC - Intel i7 10700KF - GeForce RTX 3080 - G.Skill TridentZ RGB 16GB DDR4 3200MHz - 1TB Intel 670P M.2 NVMe SSD - 240MM RGB AIO Liquid Cooling',
    599.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/83-360-185-07.jpg',
    0
),(
    167,
    'GIGABYTE G27Q 27\" 144Hz 1440P Gaming Monitor, 2560 x 1440 IPS Display, 1ms (MPRT) Response Time, 92% DCI-P3, VESA Display HDR400, FreeSync Premium, 1x DisplayPort 1.2, 2x HDMI 2.0, 2x USB 3.0, Height Adjustable',
    279.99,
    'https://c1.neweggimages.com/ProductImageCompressAll60/24-012-015-01.jpg',
    0
);