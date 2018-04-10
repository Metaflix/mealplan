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
