-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema sostutors
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sostutors
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sostutors` DEFAULT CHARACTER SET latin1 ;
USE `sostutors` ;

-- -----------------------------------------------------
-- Table `sostutors`.`categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sostutors`.`categories` ;

CREATE TABLE IF NOT EXISTS `sostutors`.`categories` (
  `categoryID` INT(11) NOT NULL AUTO_INCREMENT,
  `subjectEN` VARCHAR(45) NULL DEFAULT NULL,
  `subjectFR` VARCHAR(45) NULL DEFAULT NULL,
  `descriptionEN` VARCHAR(100) NULL DEFAULT NULL,
  `descriptionFR` VARCHAR(100) NULL DEFAULT NULL,
  `language` VARCHAR(15) NULL DEFAULT NULL,
  PRIMARY KEY (`categoryID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sostutors`.`comments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sostutors`.`comments` ;

CREATE TABLE IF NOT EXISTS `sostutors`.`comments` (
  `commentID` INT(11) NOT NULL AUTO_INCREMENT,
  `subject` VARCHAR(45) NOT NULL,
  `content` VARCHAR(100) NULL DEFAULT NULL,
  `date_posted` DATE NULL DEFAULT NULL,
  `tutors_tutorID` INT(11) NULL DEFAULT NULL,
  `students_studentID` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`commentID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sostutors`.`notifications`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sostutors`.`notifications` ;

CREATE TABLE IF NOT EXISTS `sostutors`.`notifications` (
  `notificationID` INT(11) NOT NULL AUTO_INCREMENT,
  `subject` VARCHAR(45) NULL DEFAULT NULL,
  `content` VARCHAR(100) NULL DEFAULT NULL,
  `date_posted` DATE NULL DEFAULT NULL,
  `tutors_tutorID` INT(11) NULL DEFAULT NULL,
  `students_studentID` INT(11) NULL DEFAULT NULL,
  `sessions_sessionID` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`notificationID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sostutors`.`sessions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sostutors`.`sessions` ;

CREATE TABLE IF NOT EXISTS `sostutors`.`sessions` (
  `sessionID` INT(11) NOT NULL AUTO_INCREMENT,
  `subject` VARCHAR(15) NULL DEFAULT NULL,
  `booking_available` TINYINT(1) NOT NULL DEFAULT '1',
  `booking_date` DATETIME NULL DEFAULT NULL,
  `booking_location` VARCHAR(45) NULL DEFAULT NULL,
  `tutors_tutorID` INT(11) NULL DEFAULT NULL,
  `categories_categoryID` INT(11) NULL DEFAULT NULL,
  `students_studentID` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`sessionID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sostutors`.`students`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sostutors`.`students` ;

CREATE TABLE IF NOT EXISTS `sostutors`.`students` (
  `studentID` INT(11) NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  `fname` VARCHAR(45) NULL DEFAULT NULL,
  `lname` VARCHAR(45) NULL DEFAULT NULL,
  `profile` VARCHAR(200) NULL DEFAULT NULL,
  `language` VARCHAR(10) NULL DEFAULT NULL,
  `date_joined` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`studentID`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sostutors`.`tutors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sostutors`.`tutors` ;

CREATE TABLE IF NOT EXISTS `sostutors`.`tutors` (
  `tutorID` INT(11) NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  `fname` VARCHAR(45) NULL DEFAULT NULL,
  `lname` VARCHAR(45) NULL DEFAULT NULL,
  `hourly` VARCHAR(15) NULL DEFAULT NULL,
  `date_joined` DATE NULL DEFAULT NULL,
  `image` VARCHAR(45) NULL DEFAULT NULL,
  `college` VARCHAR(50) NULL DEFAULT NULL,
  `rating` INT(11) NULL DEFAULT NULL,
  `profile` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`tutorID`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
