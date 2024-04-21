CREATE TABLE IF NOT EXISTS `farming_creator_players_known_formulas` (
	`identifier` VARCHAR(100) NOT NULL COLLATE 'utf8mb4_general_ci',
	`formula_id` INT(11) NOT NULL,
	PRIMARY KEY (`identifier`, `formula_id`) USING BTREE,
	INDEX `formula_id` (`formula_id`) USING BTREE,
	CONSTRAINT `formula_id` FOREIGN KEY (`formula_id`) REFERENCES `farming_creator_formulas` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;
