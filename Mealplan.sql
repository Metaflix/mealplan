#create database mealplan; 
use mealplan; 

create table useraccounts(
    u.id int auto_increment not null,
    u.name varchar(50) not null, 
    u.password varchar (10) not null, 
    primary key (userid)
); 


create table profiles( 
    u.id int not null,
    u.name varchar (50) not null, 
    pid int auto_increment not null,
    p.gender enum ("male", "female"),   
    p.age int not null, 
    p.eatertype enum ("meat-eater","vegetarian", "vegan"),
    p.primaryfoodchoice enum ("fruits", "vegetables", "dairy", "meats", "grains"),  
    p.secondaryfoodchoice enum ("fruits", "vegetables", "dairy", "meats", "grains"), 
    p.weight varchar (20) not null,
    p.height varchar (20) not null,
    primary key (pid), 
    foreign key (userid) references useraccounts (userid) on delete cascade on update cascade,
    );  
    
create table recipes( 
    recipenum int auto_increment not null, 
    recipename varchar(200) not null,  
    primary key (recipenum)
);   

create table instructions( 
    insid int auto_increment not null , 
    insno int auto_increment not null , 
    instructions varchar (100) not null
    
    primary key(insid), 
);  

create table meal(
mealid int auto_increment not null 
mealtype enum("Dinner", "Lunch", "Breakfast") 
mealname varchar (50) not null, 
primary key(mealid)
); 


create table images(
    imageid int auto_increment not null,
    imagename varchar (30) not null,  
    imagetype enum ("JPEG", "PNG"), 
    primary key(imageid)
    ); 

create table ingredientsList(
    kitchenid int not null, 
    list.name varchar (50) not null, 
    listid int auto_increment not null, 
    primary key (listid),  
    foreign key(kitchenid) references Kitchen (kitchenid) on delete cascade on update cascade, 
);

create table SupermarketList(
s.listname varchar () not null, 
s.listid int auto_increment not null, 
primary key(s.listid)
);   

/*List of table relationships*/ 

create table usermeal (
u.id int auto_increment not null,  
mealname varchar (50) not null,  
mealtype enum("Dinner", "Lunch", "Breakfast") 
primary key (u.id)
); 

create table useraccountsprofile (
u.id int auto_increment not null, 
u.name varchar(50) not null,  
p.gender enum ("male", "female"),   
p.age int not null, 
p.eatertype enum ("meat-eater","vegetarian", "vegan") 
primary key (u.id)
); 

create table userrecipes (
u.id int not null, 
recipenum int not null, 
recipename varchar(200) not null,  
primary key (u.id, recipenum)   
); 

create table kitcheningredientslist(
kitchenid int not null, 
list.name varchar (50) not null, 
itemtype enum ("preservative", "sweetners", "colour-additive", "spices-flavour", "flavour-enhancers", "nutrients", "emulsfier", "thickeners")
itemquantity int not null,  
itemname varchar (50) not null, 
primary key (kitchenid, listname)
); 

create table userimages (
u.id int not null, 
imagename varchar (30) not null,  
imagetype enum ("JPEG", "PNG"), 
primary key(u.id, imagename)
);

create table recipeinstructions(
recipenum int not null, 
recipename varchar(200) not null, 

);
    



/*Stored Proceedures*/
DELIMITER //
CREATE PROCEDURE GetAllRecipes()
BEGIN
SELECT recipenum, recipename, recipetype FROM recipes;
END //
DELIMITER ;


CALL GetAllRecipes();



DELIMITER //
CREATE PROCEDURE GetInstructions(IN thisrecipenum int)
BEGIN
SELECT recipename, instructionnum, instructions FROM instructions where recipenum=thisrecipenum;
END //
DELIMITER ;


CALL GetInstructions(1);


/*Search for Recipe*/
DELIMITER //
CREATE PROCEDURE GetRecipe(IN search varchar(200))
BEGIN
SELECT * FROM recipes WHERE recipename LIKE '%' + search + '%';
END //
DELIMITER ;


CALL GetRecipe('soup');


/*Search for User*/
DELIMITER //
CREATE PROCEDURE GetUser(IN user_name varchar(50))
BEGIN
SELECT useraccnum, username, gender, firstname, lastname FROM useraccounts WHERE username = user_name;
END //
DELIMITER ;


CALL GetUser('TestUsername');


/*Other Queries*/
/*Select Users under 20*/
SELECT useraccnum, firstname, lastname FROM useraccounts WHERE age < 20;


/*Select all vegetarian profiles*/
SELECT useraccnum, username FROM profiles WHERE eatertype = 'vegetarian';

/*Select all details for non-vegetarian profiles*/
SELECT * FROM profiles WHERE useraccnum not in (SELECT useraccnum, username FROM profiles WHERE eatertype = 'vegetarian' as r1);



