CREATE TABLE IF NOT EXISTS `farming_creator_formulas` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`label` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`data` LONGTEXT NOT NULL COLLATE 'utf8mb4_bin',
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `id` (`id`) USING BTREE
)
COMMENT='Formulas which can be used in the foundry feature'
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB;
