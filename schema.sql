-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema photoshare
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema photoshare
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `photoshare` DEFAULT CHARACTER SET latin1 ;
USE `photoshare` ;

-- -----------------------------------------------------
-- Table `photoshare`.`Users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `photoshare`.`Users` ;

CREATE TABLE IF NOT EXISTS `photoshare`.`Users` (
  `user_id` INT(11) NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NOT NULL,
  `firstname` VARCHAR(25) NOT NULL,
  `lastname` VARCHAR(25) NOT NULL,
  `date_of_birth` DATE NULL DEFAULT NULL,
  `hometown` VARCHAR(25) NULL DEFAULT NULL,
  `gender` VARCHAR(10) NULL DEFAULT NULL,
  `password` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `email` (`email` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `photoshare`.`Albums`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `photoshare`.`Albums` ;

CREATE TABLE IF NOT EXISTS `photoshare`.`Albums` (
  `albums_id` INT(11) NOT NULL AUTO_INCREMENT,
  `albums_name` VARCHAR(25) NOT NULL,
  `date_of_creation` DATE NOT NULL,
  `Users_user_id` INT(11) NOT NULL,
  PRIMARY KEY (`albums_id`),
  UNIQUE INDEX `albums_name` (`albums_name` ASC),
  INDEX `fk_Albums_Users1_idx` (`Users_user_id` ASC),
  CONSTRAINT `fk_Albums_Users1`
    FOREIGN KEY (`Users_user_id`)
    REFERENCES `photoshare`.`Users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `photoshare`.`Photos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `photoshare`.`Photos` ;

CREATE TABLE IF NOT EXISTS `photoshare`.`Photos` (
  `photos_id` INT(11) NOT NULL AUTO_INCREMENT,
  `caption` TEXT NULL DEFAULT NULL,
  `photos_path` LONGBLOB NOT NULL,
  `photos_owner_id` INT(11) NOT NULL,
  `Albums_albums_id` INT(11) NOT NULL,
  PRIMARY KEY (`photos_id`),
  INDEX `fk_Photos_Albums1_idx` (`Albums_albums_id` ASC),
  CONSTRAINT `fk_Photos_Albums1`
    FOREIGN KEY (`Albums_albums_id`)
    REFERENCES `photoshare`.`Albums` (`albums_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 59
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `photoshare`.`Can_Likes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `photoshare`.`Can_Likes` ;

CREATE TABLE IF NOT EXISTS `photoshare`.`Can_Likes` (
  `User_of_like` VARCHAR(65) NOT NULL,
  `photos_id` INT(11) NOT NULL,
  PRIMARY KEY (`User_of_like`, `photos_id`),
  INDEX `photos_id` (`photos_id` ASC),
  CONSTRAINT `can_likes_ibfk_1`
    FOREIGN KEY (`photos_id`)
    REFERENCES `photoshare`.`Photos` (`photos_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `photoshare`.`Comments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `photoshare`.`Comments` ;

CREATE TABLE IF NOT EXISTS `photoshare`.`Comments` (
  `comments_id` INT(11) NOT NULL AUTO_INCREMENT,
  `comments_text` VARCHAR(225) NULL DEFAULT NULL,
  `comments_owner_name` VARCHAR(65) NULL DEFAULT NULL,
  `date_of_comments` DATE NULL DEFAULT NULL,
  `Photos_photos_id` INT(11) NOT NULL,
  `comment_owner_id` INT(11) NOT NULL,
  PRIMARY KEY (`comments_id`),
  INDEX `fk_Comments_Photos1_idx` (`Photos_photos_id` ASC),
  CONSTRAINT `fk_Comments_Photos1`
    FOREIGN KEY (`Photos_photos_id`)
    REFERENCES `photoshare`.`Photos` (`photos_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `photoshare`.`Has_Friends`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `photoshare`.`Has_Friends` ;

CREATE TABLE IF NOT EXISTS `photoshare`.`Has_Friends` (
  `f_email` VARCHAR(225) NOT NULL,
  `user_id` INT(11) NOT NULL,
  `f_firstname` VARCHAR(25) NULL DEFAULT NULL,
  `f_lastname` VARCHAR(25) NULL DEFAULT NULL,
  PRIMARY KEY (`f_email`, `user_id`),
  UNIQUE INDEX `f_email` (`f_email` ASC),
  INDEX `user_id` (`user_id` ASC),
  CONSTRAINT `has_friends_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `photoshare`.`Users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `photoshare`.`Tags`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `photoshare`.`Tags` ;

CREATE TABLE IF NOT EXISTS `photoshare`.`Tags` (
  `tags_text` VARCHAR(65) NOT NULL,
  PRIMARY KEY (`tags_text`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `photoshare`.`Photos_has_Tags`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `photoshare`.`Photos_has_Tags` ;

CREATE TABLE IF NOT EXISTS `photoshare`.`Photos_has_Tags` (
  `Photos_photos_id` INT(11) NOT NULL,
  `Tags_tags_text` VARCHAR(65) NOT NULL,
  INDEX `fk_Photos_has_Tags_Tags1_idx` (`Tags_tags_text` ASC),
  INDEX `fk_Photos_has_Tags_Photos1_idx` (`Photos_photos_id` ASC),
  CONSTRAINT `fk_Photos_has_Tags_Photos1`
    FOREIGN KEY (`Photos_photos_id`)
    REFERENCES `photoshare`.`Photos` (`photos_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Photos_has_Tags_Tags1`
    FOREIGN KEY (`Tags_tags_text`)
    REFERENCES `photoshare`.`Tags` (`tags_text`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
