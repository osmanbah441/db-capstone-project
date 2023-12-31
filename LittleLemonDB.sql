-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8mb3 ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`customers` (
  `customerID` INT NOT NULL,
  `fullName` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `phoneNumber` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`customerID`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `phone_number_UNIQUE` (`phoneNumber` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`bookings` (
  `bookingID` INT NOT NULL,
  `date` DATE NOT NULL,
  `tableNumber` INT NOT NULL,
  `customerID` INT NOT NULL,
  PRIMARY KEY (`bookingID`),
  INDEX `fk_customers_idx` (`customerID` ASC) VISIBLE,
  CONSTRAINT `fk_customers_bookings`
    FOREIGN KEY (`customerID`)
    REFERENCES `LittleLemonDB`.`customers` (`customerID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`menuitems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`menuitems` (
  `menuItemID` INT NOT NULL,
  `courseName` VARCHAR(45) NULL DEFAULT NULL,
  `starterName` VARCHAR(45) NULL DEFAULT NULL,
  `dessertName` VARCHAR(45) NULL DEFAULT NULL,
  `drinkName` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`menuItemID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`menus` (
  `menuID` INT NOT NULL,
  `menuName` VARCHAR(45) NOT NULL,
  `cuisine` VARCHAR(45) NOT NULL,
  `price` DECIMAL(5,2) NOT NULL,
  `menuItemID` INT NOT NULL,
  PRIMARY KEY (`menuID`),
  INDEX `fk_menuItems_idx` (`menuItemID` ASC) VISIBLE,
  CONSTRAINT `fk_menuItems_menu`
    FOREIGN KEY (`menuItemID`)
    REFERENCES `LittleLemonDB`.`menuitems` (`menuItemID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`orders` (
  `orderID` INT NOT NULL,
  `date` DATE NOT NULL,
  `quantity` INT NOT NULL,
  `totalCost` DECIMAL(5,2) NOT NULL,
  `customerID` INT NOT NULL,
  `menuID` INT NOT NULL,
  PRIMARY KEY (`orderID`),
  INDEX `fk_menus_idx` (`menuID` ASC) VISIBLE,
  INDEX `fk_customers_idx` (`customerID` ASC) VISIBLE,
  CONSTRAINT `fk_customer_order`
    FOREIGN KEY (`customerID`)
    REFERENCES `LittleLemonDB`.`customers` (`customerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_menus_order`
    FOREIGN KEY (`menuID`)
    REFERENCES `LittleLemonDB`.`menus` (`menuID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`order_delivery_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`order_delivery_status` (
  `deliveryID` INT NOT NULL,
  `deliveryDate` DATE NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `orderID` INT NOT NULL,
  PRIMARY KEY (`deliveryID`),
  INDEX `fk_order_idx` (`orderID` ASC) VISIBLE,
  CONSTRAINT `fk_order`
    FOREIGN KEY (`orderID`)
    REFERENCES `LittleLemonDB`.`orders` (`orderID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`staffs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`staffs` (
  `staffID` INT NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  `salary` INT NOT NULL,
  `fullName` VARCHAR(45) NOT NULL,
  `phoneNumber` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`staffID`),
  UNIQUE INDEX `phone_number_UNIQUE` (`phoneNumber` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
