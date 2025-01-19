insert into ordermode
( ModeID, ModeDesc ) with temp as (
select 1,'WALKIN' from dual union all
select 2,'PHONE' from dual ) 
select * from temp;

insert into servicemode
( ModeID, ModeDesc ) with temp as (
select 1,'DINEIN' from dual union all
select 2,'PICKUP' from dual ) 
select * from temp;

insert into customer
( CustomerID , FirstName , LastName , Phone , Address, Email) with temp as (
select 1,'Francis ','Baker','078 1166 4100','80 Main Rd, FOGO, TD11 2ZG','FrancisTBaker@armyspy.com' from dual union all
select 2,'Terina ','Travis','077 8218 9397','34 Lairg Road, NEWBIGGING, DD5 8YQ','TerinaJTravis@teleworm.us' from dual union all
select 3,'Mario','Grow','070 6389 4992','22 Clasper Way, HETT, DH6 6LN','MarioYGrow@armyspy.com' from dual union all
select 4,'Rosann','Yoder','078 4934 9955','11 Annfield Rd, BECKERMET, CA21 3RN','RosannMYoder@dayrep.com' from dual union all
select 5,'Bobbie','Poynter','070 3375 1897','97 Front St, HEMINGFORD ABBOTS, PE18 7GQ','BobbieNPoynter@dayrep.com' from dual union all
select 6,'Roy','McDonald','077 2737 2321','65 City Walls Rd, CLUTTON, BS18 1UY','RoyFMcDonald@jourrapide.com' from dual union all
select 7,'Margarita','Chalker','078 0620 9935','90 Long Street, MILLHOUSE, PA21 6HU','MargaritaRChalker@rhyta.com' from dual union all
select 8,'Brian','Guzman','078 2039 5926','71 Kent Street, CROSS INN, SY23 7DN','BrianJGuzman@dayrep.com' from dual ) 
select * from temp;

insert into employee
( EmployeeID , FirstName , LastName , Phone , Email , Designation ) with temp as (
select 1,'William','Jones','078 4188 6767','WilliamTJones@burger.shop','General Manager' from dual union all
select 2,'Melissa','Norris','079 7042 6311','MelissaJNorris@burger.shop','Cashier' from dual union all
select 3,'Edna','Morris','077 5651 1457','EdnaRMorris@burger.shop','Cashier' from dual union all
select 4,'Christopher','Perea','070 6526 7795','ChristopherSPerea@burger.shop','Line Cook' from dual union all
select 5,'Patricia','Jackson','078 8810 6354','PatriciaSJackson@burger.shop','Line Cook' from dual union all
select 6,'Anthony','Lamantia','070 7615 2837','AnthonyJLamantia@burger.shop','Waiter' from dual union all
select 7,'Sara','Nugent','070 3457 1635','SaraJNugent@burger.shop','Waiter' from dual union all
select 8,'Jerry','Reid','077 3765 1305','JerryMReid@burger.shop','Cleaner' from dual ) 
select * from temp;

insert into category
( CategoryID , CategoryName ) with temp as (
select 1,'Classic Burger' from dual union all
select 2,'Premium Burgers' from dual union all
select 3,'Chef Special' from dual ) 
select * from temp;

insert into menuitem
( ItemID , CategoryID, ItemName , Description , Price ) with temp as (
select 1,2,'Classic Cheeseburger','Lettuce, tomato, raw or sauteed onions, mayo, pickles ' || chr(38) || ' American cheese on a fresh baked deli bun',7.75 from dual union all
select 2,1,'Bullseye BBQ Burger','Crispy onion straws, bacon, Bullseye BBQ Sauce, cheddar cheese, lettuce, tomato ' || chr(38) || ' mayo on a toasted Miami onion bun',8.25 from dual union all
select 3,3,'Bacon Cheeseburger','Bacon, American cheese, lettuce, tomato ' || chr(38) || ' mayo on a fresh baked deli bun',8.25 from dual union all
select 4,1,'Mushroom Swiss Burger','Sautéed mushrooms ' || chr(38) || ' melted swiss on a fresh baked deli bun brushed with a hint of garlic parmesan butter',8.75 from dual union all
select 5,2,'Bleu Burger','Bleu cheese crumbles, A-1 Steak Sauce, crispy onion straws, lettuce, tomato ' || chr(38) || ' chipolte mayo on a fresh baked Miami onion bun',8.5 from dual union all
select 6,3,'El Paso Burger','Roasted poblano peppers, sautéed onions, bacon, pepper jack cheese, guacamole, lettuce ' || chr(38) || ' chipotle mayo on a toasted Miami onion bun',9 from dual union all
select 7,1,'Ben Burger','An Angus cheeseburger topped with friend mac ' || chr(38) || ' cheese bites on our fresh baked deli bun',9.5 from dual union all
select 8,2,'Spicy Chili Burger','Homemade spicy chili, crispy onions, cheddar cheese ' || chr(38) || ' sour cream on a toasted Miami onion bun',9 from dual ) 
select * from temp;


insert into saleorder
( OrderID , EmployeeID , CustomerID , OrderDate , OrderModeID , ServiceModeID, OrderTotal ) with temp as (
select 1,2,3,'2020-01-01',2 om,1 sm,0 from dual union all
select 2,2,6,'2020-01-08',1,2,0 from dual union all
select 3,1,3,'2020-01-20',2,1,0 from dual union all
select 4,4,1,'2020-02-02',1,2,0 from dual union all
select 5,2,2,'2020-02-28',2,1,0 from dual union all
select 6,2,1,'2020-03-02',2,1,0 from dual union all
select 7,1,1,'2020-03-03',2,1,0 from dual union all
select 8,3,2,'2020-03-10',2,1,0 from dual union all
select 9,4,7,'2020-03-20',2,1,0 from dual union all
select 10,1,2,'2020-03-20',2,1,0 from dual union all
select 11,2,6,'2020-03-23',2,1,0 from dual union all
select 12,4,6,'2020-03-27',2,1,0 from dual union all
select 13,1,7,'2020-03-28',1,1,0 from dual union all
select 14,2,5,'2020-04-05',2,1,0 from dual union all
select 15,1,1,'2020-05-27',1,2,0 from dual union all
select 16,2,1,'2020-06-02',1,1,0 from dual union all
select 17,3,7,'2020-06-05',1,1,0 from dual union all
select 18,1,8,'2020-06-08',1,2,0 from dual union all
select 19,3,4,'2020-07-11',2,1,0 from dual union all
select 20,3,4,'2020-08-01',2,1,0 from dual union all
select 21,1,6,'2020-08-19',2,1,0 from dual union all
select 22,3,1,'2020-09-14',1,1,0 from dual union all
select 23,3,3,'2020-09-23',2,1,0 from dual union all
select 24,4,5,'2020-10-08',2,1,0 from dual union all
select 25,1,1,'2020-10-20',1,2,0 from dual union all
select 26,1,3,'2020-10-24',2,1,0 from dual union all
select 27,1,2,'2020-10-27',1,2,0 from dual union all
select 28,4,7,'2020-11-24',1,2,0 from dual union all
select 29,4,7,'2020-12-06',1,1,0 from dual union all
select 30,4,2,'2021-01-03',1,2,0 from dual union all
select 31,4,8,'2021-01-19',2,1,0 from dual union all
select 32,4,1,'2021-02-20',1,2,0 from dual union all
select 33,3,7,'2021-02-25',2,1,0 from dual union all
select 34,2,2,'2021-02-28',2,1,0 from dual union all
select 35,3,6,'2021-03-01',1,2,0 from dual union all
select 36,1,7,'2021-04-19',2,1,0 from dual union all
select 37,1,6,'2021-04-25',2,1,0 from dual union all
select 38,2,6,'2021-04-26',1,2,0 from dual union all
select 39,4,8,'2021-05-09',2,1,0 from dual union all
select 40,4,5,'2021-05-10',2,1,0 from dual union all
select 41,3,4,'2021-06-03',2,1,0 from dual union all
select 42,4,6,'2021-06-24',2,1,0 from dual union all
select 43,2,5,'2021-07-16',1,2,0 from dual union all
select 44,4,8,'2021-07-19',1,2,0 from dual union all
select 45,3,5,'2021-07-20',1,2,0 from dual union all
select 46,1,2,'2021-07-20',2,1,0 from dual union all
select 47,2,7,'2021-07-21',1,1,0 from dual union all
select 48,4,8,'2021-09-14',2,1,0 from dual union all
select 49,2,5,'2021-10-23',2,1,0 from dual union all
select 50,2,5,'2021-12-20',1,2,0 from dual ) 
select * from temp;

insert into orderitem ( OrderID , ItemID , Quantity ) with temp as (
select 1 a,1 b,3 c from dual union all
select 1,5,9 from dual union all
select 1,7,8 from dual union all
select 2,3,1 from dual union all
select 2,4,7 from dual union all
select 2,5,4 from dual union all
select 3,6,5 from dual union all
select 3,8,4 from dual union all
select 4,2,8 from dual union all
select 4,6,9 from dual union all
select 4,8,1 from dual union all
select 5,3,4 from dual union all
select 5,6,1 from dual union all
select 5,7,7 from dual union all
select 6,2,1 from dual union all
select 6,3,2 from dual union all
select 6,8,10 from dual union all
select 7,5,1 from dual union all
select 7,8,2 from dual union all
select 8,3,1 from dual union all
select 8,4,9 from dual union all
select 8,5,1 from dual union all
select 8,8,5 from dual union all
select 9,3,3 from dual union all
select 9,4,4 from dual union all
select 9,8,10 from dual union all
select 10,1,7 from dual union all
select 10,2,1 from dual union all
select 11,2,7 from dual union all
select 11,7,8 from dual union all
select 12,1,3 from dual union all
select 12,5,2 from dual union all
select 12,7,10 from dual union all
select 12,8,2 from dual union all
select 13,1,10 from dual union all
select 13,7,3 from dual union all
select 14,2,6 from dual union all
select 14,3,2 from dual union all
select 14,4,10 from dual union all
select 14,6,7 from dual union all
select 14,8,8 from dual union all
select 15,1,9 from dual union all
select 15,2,10 from dual union all
select 15,6,2 from dual union all
select 16,1,5 from dual union all
select 16,2,6 from dual union all
select 16,5,1 from dual union all
select 17,5,5 from dual union all
select 17,6,4 from dual union all
select 17,8,9 from dual union all
select 18,7,8 from dual union all
select 19,3,1 from dual union all
select 19,6,4 from dual union all
select 20,5,3 from dual union all
select 20,8,3 from dual union all
select 21,1,8 from dual union all
select 21,3,3 from dual union all
select 21,4,1 from dual union all
select 21,5,5 from dual union all
select 22,4,8 from dual union all
select 22,8,9 from dual union all
select 23,1,9 from dual union all
select 23,4,10 from dual union all
select 23,8,4 from dual union all
select 24,4,6 from dual union all
select 24,5,3 from dual union all
select 24,6,8 from dual union all
select 24,7,2 from dual union all
select 24,8,3 from dual union all
select 25,4,6 from dual union all
select 25,5,9 from dual union all
select 25,6,6 from dual union all
select 25,7,9 from dual union all
select 26,3,4 from dual union all
select 26,7,7 from dual union all
select 27,1,4 from dual union all
select 27,3,7 from dual union all
select 27,7,1 from dual union all
select 27,8,3 from dual union all
select 28,2,3 from dual union all
select 28,3,4 from dual union all
select 28,5,1 from dual union all
select 29,4,5 from dual union all
select 29,5,10 from dual union all
select 29,6,6 from dual union all
select 29,7,8 from dual union all
select 30,1,9 from dual union all
select 30,7,2 from dual union all
select 30,8,6 from dual union all
select 31,6,9 from dual union all
select 32,1,4 from dual union all
select 32,3,6 from dual union all
select 32,6,5 from dual union all
select 32,7,2 from dual union all
select 33,1,2 from dual union all
select 33,2,9 from dual union all
select 33,4,5 from dual union all
select 33,8,4 from dual union all
select 34,1,6 from dual union all
select 34,2,6 from dual union all
select 34,3,1 from dual union all
select 34,4,6 from dual union all
select 34,6,1 from dual union all
select 35,1,10 from dual union all
select 35,6,4 from dual union all
select 35,7,8 from dual union all
select 35,8,8 from dual union all
select 36,2,5 from dual union all
select 36,5,8 from dual union all
select 36,8,1 from dual union all
select 37,4,10 from dual union all
select 37,5,7 from dual union all
select 38,3,6 from dual union all
select 38,5,4 from dual union all
select 38,6,4 from dual union all
select 38,7,1 from dual union all
select 38,8,6 from dual union all
select 39,4,6 from dual union all
select 40,5,9 from dual union all
select 40,7,3 from dual union all
select 41,1,7 from dual union all
select 41,2,5 from dual union all
select 41,3,10 from dual union all
select 41,5,5 from dual union all
select 42,3,10 from dual union all
select 42,5,7 from dual union all
select 42,6,4 from dual union all
select 42,8,1 from dual union all
select 43,1,10 from dual union all
select 43,7,1 from dual union all
select 44,1,10 from dual union all
select 44,3,6 from dual union all
select 44,4,7 from dual union all
select 44,5,10 from dual union all
select 44,8,3 from dual union all
select 45,7,9 from dual union all
select 46,1,1 from dual union all
select 46,2,3 from dual union all
select 46,5,7 from dual union all
select 46,6,10 from dual union all
select 46,7,7 from dual union all
select 47,3,5 from dual union all
select 48,2,5 from dual union all
select 48,5,5 from dual union all
select 48,6,1 from dual union all
select 49,2,7 from dual union all
select 49,3,4 from dual union all
select 49,4,1 from dual union all
select 49,5,3 from dual union all
select 49,6,8 from dual union all
select 49,8,10 from dual union all
select 50,3,3 from dual union all
select 50,8,3 from dual ) 
select * from temp;