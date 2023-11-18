-- -----------------------------------------------------
-- Table `LittleLemonDB`.`customers`
-- -----------------------------------------------------
INSERT INTO `LittleLemonDB`.`customers` (`customerID`, `fullName`, `email`, `phoneNumber`) VALUES
(1, 'John Doe', 'john.doe@example.com', '+15555555555'),
(2, 'Jane Doe', 'jane.doe@example.com', '+15555555556'),
(3, 'Peter Parker', 'peter.parker@example.com', '+15555555557'),
(4, 'Mary Jane Watson', 'mary.jane.watson@example.com', '+15555555558'),
(5, 'Bruce Wayne', 'bruce.wayne@example.com', '+15555555559');

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`staffs`
-- -----------------------------------------------------
INSERT INTO `LittleLemonDB`.`staffs` (`staffID`, `role`, `salary`, `fullName`, `phoneNumber`, `email`) VALUES
(1, 'Manager', 50000, 'Tony Stark', '+15555555560', 'tony.stark@example.com'),
(2, 'Server', 30000, 'Steve Rogers', '+15555555561', 'steve.rogers@example.com'),
(3, 'Bartender', 25000, 'Thor Odinson', '+15555555562', 'thor.odinson@example.com'),
(4, 'Chef', 40000, 'Bruce Banner', '+15555555563', 'bruce.banner@example.com');

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`bookings`
-- -----------------------------------------------------
INSERT INTO `LittleLemonDB`.`bookings` (`bookingID`, `date`, `tableNumber`, `customerID`) VALUES
(1, '2022-10-10', 5, 1),
(2, '2022-11-12', 3, 3),
(3, '2022-10-11', 2, 2),
(4, '2022-10-13', 2, 1);

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`menuItems`
-- -----------------------------------------------------
INSERT INTO `LittleLemonDB`.`menuItems` (`menuItemID`, `courseName`, `starterName`, `dessertName`, `drinkName`) VALUES
(1, 'Appetizers', 'Calamari Fritti', 'Tiramisu', 'Aperol Spritz'),
(2, 'Main Courses', 'Spaghetti Carbonara', 'Panna Cotta', 'Red Wine'),
(3, 'Desserts', 'Cannoli', 'Gelato', 'Espresso'),
(4, 'Drinks', 'Coca-Cola', 'Sprite', 'Water');

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`menus`
-- -----------------------------------------------------
INSERT INTO `LittleLemonDB`.`menus` (`menuID`,`menuName`, `cuisine`, `price`, `menuItemID`) VALUES
(1, 'Tacos al Pastor', 'Mexican', 12.99, 1),
(2, 'Spaghetti Carbonara', 'Italian', 15.99, 2),
(3, 'Kung Pao Chicken', 'Chinese', 13.99, 3),
(4, 'Queso Fundido', 'Mexican', 9.99, 4),
(5, 'Tiramisu', 'Italian', 7.99, 2);



-- -----------------------------------------------------
-- Table `LittleLemonDB`.`orders`
-- -----------------------------------------------------
INSERT INTO `LittleLemonDB`.`orders` (`orderID`, `date`, `quantity`, `totalCost`, `customerID`, `menuID`) VALUES
(1, '2023-11-05', 1, 160.99, 1, 1),
(2, '2023-11-05', 2, 200.99, 2, 2),
(3, '2023-11-05', 3, 100.99, 3, 3),
(4, '2023-11-05', 4, 20.99, 4, 4),
(5, '2023-11-05', 5, 96.99, 5, 5);

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`order_delivery_status`
-- -----------------------------------------------------
INSERT INTO `LittleLemonDB`.`order_delivery_status` (`deliveryID`, `deliveryDate`, `status`, `orderID`) VALUES
(1, '2023-11-05', 'In Progress', 1),
(2, '2023-11-05', 'Delivered', 2),
(3, '2023-11-05', 'In Progress', 3),
(4, '2023-11-05', 'Delivered', 4),
(5, '2023-11-05', 'Cancel', 5);

