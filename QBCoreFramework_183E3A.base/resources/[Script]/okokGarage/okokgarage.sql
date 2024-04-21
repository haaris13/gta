CREATE TABLE `okokgarage_pgarages` (
    `garagename` VARCHAR(250) NULL DEFAULT NULL,
    `coords` VARCHAR(250) NULL DEFAULT NULL,
    `type` VARCHAR(50) NULL DEFAULT NULL,
    `owners` VARCHAR(250) NULL DEFAULT NULL
);

CREATE TABLE `okokgarage_companies` (
    `company_name` VARCHAR(50) NOT NULL,
    `owner` VARCHAR(255) NULL DEFAULT NULL,
    `owner_name` VARCHAR(50) NULL DEFAULT NULL,
    `money` INT(11) NULL DEFAULT NULL,
    `employees` LONGTEXT NULL DEFAULT NULL,
    `total_sales` INT(11) NULL DEFAULT NULL,
    `sales_history` LONGTEXT NULL DEFAULT NULL,
    CONSTRAINT `employees` CHECK (json_valid(`employees`))
);

CREATE TABLE `okokgarage_sharedgarages` (
    `owner` VARCHAR(255) NULL DEFAULT NULL,
    `ownername` VARCHAR(50) NULL DEFAULT NULL,
    `sharedwith` LONGTEXT NULL DEFAULT NULL
);

ALTER TABLE `player_vehicles`
    ADD COLUMN `parking` VARCHAR(60) NULL DEFAULT NULL,
    ADD COLUMN `doorcondition` VARCHAR(255) NULL DEFAULT NULL,
    ADD COLUMN `windowcondition` VARCHAR(255) NULL DEFAULT NULL,
    ADD COLUMN `tyrecondition` VARCHAR(255) NULL DEFAULT NULL,
    ADD COLUMN `favourite` TINYINT(1) NULL DEFAULT 0,
    ADD COLUMN `impoundTime` VARCHAR(255) NULL DEFAULT NULL,
    ADD COLUMN `location` VARCHAR(255) NULL DEFAULT NULL,
    ADD COLUMN `reason` VARCHAR(255) NULL DEFAULT NULL,
    ADD COLUMN `sharedwith` LONGTEXT NULL DEFAULT '[]',
    ADD COLUMN `vehiclename` varchar(23) NULL DEFAULT NULL
;