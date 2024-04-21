CREATE TABLE IF NOT EXISTS `farming_creator_plants` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`seed_id` INT(11) NOT NULL,
	`data` LONGTEXT NOT NULL COLLATE 'utf8mb4_bin',
	`coords` LONGTEXT NOT NULL COLLATE 'utf8mb4_general_ci',
	`ground_material` INT(15) NOT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `id` (`id`) USING BTREE,
	INDEX `seed_id` (`seed_id`) USING BTREE,
	CONSTRAINT `seed_id` FOREIGN KEY (`seed_id`) REFERENCES `farming_creator_seeds` (`id`) ON UPDATE RESTRICT ON DELETE CASCADE
)
COMMENT='Plants planted by players from seeds'
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB;
