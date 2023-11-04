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
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`customers` (
  `customerID` INT NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `phoneNumber` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`customerID`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `phone_number_UNIQUE` (`phoneNumber` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`staffs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`staffs` (
  `staffID` INT NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  `salary` VARCHAR(45) NOT NULL,
  `fullName` VARCHAR(45) NOT NULL,
  `phoneNumber` VARCHAR(45) NULL,
  `email` VARCHAR(255) NULL,
  PRIMARY KEY (`staffID`),
  UNIQUE INDEX `phone_number_UNIQUE` (`phoneNumber` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`bookings` (
  `bookingID` INT NOT NULL,
  `date` DATE NOT NULL,
  `tableNumber` INT NOT NULL,
  `customerID` INT NOT NULL,
  `staffID` INT NOT NULL,
  PRIMARY KEY (`bookingID`),
  INDEX `fk_customers_idx` (`customer_id` ASC) VISIBLE,
  INDEX `fk_staff_idx` (`staffID` ASC) VISIBLE,
  CONSTRAINT `fk_customers`
    FOREIGN KEY (`customerID`)
    REFERENCES `LittleLemonDB`.`customers` (`customerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_staff`
    FOREIGN KEY (`staffID`)
    REFERENCES `LittleLemonDB`.`staffs` (`staffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`menuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`menuItems` (
  `menuItemID` INT NOT NULL,
  `courseName` VARCHAR(45) NULL,
  `starterName` VARCHAR(45) NULL,
  `dessertName` VARCHAR(45) NULL,
  `drinkName` VARCHAR(45) NULL,
  PRIMARY KEY (`menuItemID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`menus` (
  `menuID` INT NOT NULL,
  `cuisine` VARCHAR(45) NOT NULL,
  `price` DECIMAL NOT NULL,
  `menuItemID` INT NOT NULL,
  PRIMARY KEY (`menuID`),
  INDEX `fk_menuItems_idx` (`menuItemID` ASC) VISIBLE,
  CONSTRAINT `fk_menuItems`
    FOREIGN KEY (`menuItemID`)
    REFERENCES `LittleLemonDB`.`menuItems` (`menuItemID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`orders` (
  `orderID` INT NOT NULL,
  `date` DATE NOT NULL,
  `quantity` INT NOT NULL,
  `totalCost` DECIMAL NOT NULL,
  `bookingID` INT NOT NULL,
  `menuID` INT NOT NULL,
  PRIMARY KEY (`orderID`),
  INDEX `fk_bookings_idx` (`bookingID` ASC) VISIBLE,
  INDEX `fk_menus_idx` (`menuID` ASC) VISIBLE,
  CONSTRAINT `fk_bookings`
    FOREIGN KEY (`bookingID`)
    REFERENCES `LittleLemonDB`.`bookings` (`bookingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_menus`
    FOREIGN KEY (`menuID`)
    REFERENCES `LittleLemonDB`.`menus` (`menuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


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
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
