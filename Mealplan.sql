#create database mealplan; 
use mealplan; 

create table useraccounts(
    useraccnum int auto_increment not null,
    username varchar (50) not null, 
    firstname varchar (50) not null, 
    lastname varchar (50) not null, 
    dob date not null, 
    age int (10) not null, 
    email varchar (50) not null,  
    phone varchar (30) not null,
    gender varchar (10) not null,  
    city varchar (100) not null,
    country varchar (30) not null, 
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
    primary key (useraccnum), 
    #foreign key (useraccnum) references useraccounts (useraccnum) on delete cascade,
    #foreign key(username) references useraccounts (username) on delete cascade
    );  
    
create table recipes( 
    recipenum int auto_increment not null, 
    recipename varchar (200) not null,  
    recipecreatedate date not null,  
    recipetype enum
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
    primary key (recipenum, recipename, ingredientname) 
    foreign key()
);




