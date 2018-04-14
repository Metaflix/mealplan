#create database mealplan; 
use mealplan; 

create table useraccounts(
    useraccnum int auto_increment not null,
    username varchar(50) not null, 
    firstname varchar(50) not null, 
    lastname varchar(50) not null, 
    dob date not null, 
    age int(10) not null, 
    email varchar(50) not null,  
    phone varchar(30) not null,
    gender varchar(10) not null,  
    city varchar(100) not null,
    country varchar(30) not null, 
    primary key (useraccnum, username) 

); 

create table profiles( 
    useraccnum int not null,
    username varchar (50) not null, 
    bloodtype varchar (50) not null, 
    eatertype enum ("meat-eater","vegetarian", "other"),
    primaryfoodchoice enum ("fruits", "vegetables", "dairy", "meats", "grains"),  
    secondaryfoodchoice enum ("fruits", "vegetables", "dairy", "meats", "grains"), 
    tertiaryfoodchoice enum ("fruits", "vegetables", "dairy", "meats", "grains"), 
    primary key (useraccnum, username), 
    foreign key (useraccnum) references useraccounts (useraccnum) on delete cascade,
    foreign key(username) references useraccounts (username) on delete cascade,

    primary key (useraccnum), 
    foreign key (useraccnum) references useraccounts (useraccnum) on delete cascade,
    foreign key(username) references useraccounts (username) on delete cascade

    );  
    
create table recipes( 
    recipenum int auto_increment not null, 
    recipename varchar(200) not null,  
    recipecreatedate date not null,  
    #recipetype enum,
    primary key (recipenum)
);   

create table instructions( 
    recipenum int not null, 
    recipename varchar (200) not null, 
    instructionnum int not null, 
    instructions varchar (500) not null, 
    
); 
create table mealplan(); 
create table supermarketList();  
create table images(
    recipenum int not null,
    recipename varchar (200) not null,
    recipetype varchar enum ("side-dish", "meats", "soups", "desserts", "drinks", "snacks/appetizers"),  
    imagename varchar (30) not null, 
    ); 
create table breakfast(); 
create table lunch(); 
create table dinner(); 
create table calories();   

create table ingredients(
    recipenum int not null, 
    recipename varchar (200) not null, 
    ingredientname varchar (50) not null,  
    ingredienttype enum ("preservative", "sweetners", "colour-additive", "spices-flavour", "flavour-enhancers", "nutrients", "emulsfier", "thickeners")
    ingredientquantity varchar (50) not null,  

    recipenum int not null,
    recipename varchar (200) not null,

    primary key (recipenum, recipename, ingredientname), 

    foreign key()
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



