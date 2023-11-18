-- Источник: https://dpva.ru/Guide/GuideChemistry/PeriodicalMendeleevTable/IsotopiAbundance1/

DROP DATABASE IF EXISTS `isotop`;
CREATE DATABASE IF NOT EXISTS `isotop` DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;

USE isotop;
CREATE TABLE IF NOT EXISTS `isotop_tables`
(
    `id` INT NOT NULL AUTO_INCREMENT,
    `source` VARCHAR(1024) NOT NULL,
    `mass_accuracy` FLOAT NOT NULL,
    `abundance_accurace` FLOAT NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE IF NOT EXISTS `distribution`
(
    `name` VARCHAR(256) NOT NULL,
    `isotop_id` INT NOT NULL,
    `mass` DOUBLE NOT NULL,
    `abundance` DOUBLE NOT NULL,
    `table_id` INT NOT NULL,
    PRIMARY KEY(`name`, `isotop_id`, `table_id`),
    FOREIGN KEY(`table_id`) REFERENCES isotop_tables(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `composition`
(
    `brutto` VARCHAR(256) NOT NULL,
    `element` VARCHAR(2) NOT NULL,
    `index` INT DEFAULT 0,
    `table_id` INT NOT NULL,
    FOREIGN KEY(`table_id`) REFERENCES isotop_tables(id) ON DELETE CASCADE,
    PRIMARY KEY(`brutto`,`table_id`)
);
