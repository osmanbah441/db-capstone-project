-- -----------------------------------------------------
-- Exercise: Create a virtual table to summarize data.
-- -----------------------------------------------------
use littlelemondb;

CREATE VIEW `OrdersView` AS
SELECT 
  `orderID`,
  `quantity`,
  `totalCost`
FROM 
  `orders`
WHERE 
  `quantity` > 2;

SELECT * FROM OrdersView;
 
SELECT customers.customerID, customers.fullName, orders.orderID, orders.totalCost, menus.menuName, menuItems.courseName
FROM customers
JOIN orders ON customers.customerID = orders.customerID
JOIN menus ON orders.menuID = menus.menuID
JOIN menuItems ON menus.menuItemID = menuItems.menuItemID
WHERE orders.totalCost > 150;

SELECT menuName
FROM menus
WHERE menuID = ANY (SELECT menuID  FROM orders WHERE quantity > 2);


-- -----------------------------------------------------
-- Exercise: Create optimized queries to manage and analyze data
-- -----------------------------------------------------

DELIMITER //
CREATE PROCEDURE GetMaxQuantity()
BEGIN
SELECT MAX(quantity) FROM orders;
END
//
DELIMITER ;


CALL GetMaxQuantity();


PREPARE GetOrderDetail 
FROM 'SELECT orderID, quantity, totalCost FROM orders WHERE customerID = ?';

SET @id = 1;
EXECUTE GetOrderDetail USING @id;


DELIMITER //
CREATE PROCEDURE CancelOrder(id INT)
BEGIN
	
    DELETE FROM orders
    WHERE orderID = id;

    SELECT CONCAT('Order ', id, ' is canceled.') AS 'Confirmation';
  END //
DELIMITER ;

call CancelOrder(10);
