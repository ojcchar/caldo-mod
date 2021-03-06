SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
CREATE SCHEMA IF NOT EXISTS `phpbb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`token`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`token` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`token` (
  `token` VARCHAR(10) NOT NULL ,
  `asignado` TINYINT(1)  NOT NULL COMMENT 'Indica si el token ya ha sido asignado para que no pueda ser usado una vez mas' ,
  `fecha_vencimiento` TIMESTAMP NOT NULL COMMENT 'Fecha de vencimiento para que no queden almacenados por siempe los tokens que se generen' ,
  PRIMARY KEY (`token`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `phpbb`.`phpbb_forums`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `phpbb`.`phpbb_forums` ;

CREATE  TABLE IF NOT EXISTS `phpbb`.`phpbb_forums` (
  `forum_id` MEDIUMINT(8) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `parent_id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' ,
  `left_id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' ,
  `right_id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' ,
  `forum_parents` MEDIUMTEXT CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  `forum_name` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `forum_desc` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  `forum_desc_bitfield` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `forum_desc_options` INT(11) UNSIGNED NOT NULL DEFAULT '7' ,
  `forum_desc_uid` VARCHAR(8) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `forum_link` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `forum_password` VARCHAR(40) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `forum_style` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' ,
  `forum_image` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `forum_rules` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  `forum_rules_link` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `forum_rules_bitfield` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `forum_rules_options` INT(11) UNSIGNED NOT NULL DEFAULT '7' ,
  `forum_rules_uid` VARCHAR(8) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `forum_topics_per_page` TINYINT(4) NOT NULL DEFAULT '0' ,
  `forum_type` TINYINT(4) NOT NULL DEFAULT '0' ,
  `forum_status` TINYINT(4) NOT NULL DEFAULT '0' ,
  `forum_posts` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' ,
  `forum_topics` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' ,
  `forum_topics_real` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' ,
  `forum_last_post_id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' ,
  `forum_last_poster_id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' ,
  `forum_last_post_subject` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `forum_last_post_time` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `forum_last_poster_name` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `forum_last_poster_colour` VARCHAR(6) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `forum_flags` TINYINT(4) NOT NULL DEFAULT '32' ,
  `forum_options` INT(20) UNSIGNED NOT NULL DEFAULT '0' ,
  `display_subforum_list` TINYINT(1) UNSIGNED NOT NULL DEFAULT '1' ,
  `display_on_index` TINYINT(1) UNSIGNED NOT NULL DEFAULT '1' ,
  `enable_indexing` TINYINT(1) UNSIGNED NOT NULL DEFAULT '1' ,
  `enable_icons` TINYINT(1) UNSIGNED NOT NULL DEFAULT '1' ,
  `enable_prune` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' ,
  `prune_next` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `prune_days` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' ,
  `prune_viewed` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' ,
  `prune_freq` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`forum_id`) ,
  INDEX `left_right_id` (`left_id` ASC, `right_id` ASC) ,
  INDEX `forum_lastpost_id` (`forum_last_post_id` ASC) )
ENGINE = MyISAM
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `mydb`.`conferencia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`conferencia` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`conferencia` (
  `id_conferencia` INT NOT NULL AUTO_INCREMENT ,
  `fecha_realizacion` DATE NOT NULL ,
  `tema` VARCHAR(50) NOT NULL ,
  `numero_de_votos` INT NOT NULL DEFAULT 0 COMMENT 'Número de votos realizados para calcular las puntuaciones de cada criterio' ,
  `phpbb_forums_forum_id` MEDIUMINT(8) UNSIGNED NOT NULL ,
  PRIMARY KEY (`id_conferencia`, `phpbb_forums_forum_id`) ,
  INDEX `fk_conferencia_phpbb_forums1` (`phpbb_forums_forum_id` ASC) ,
  CONSTRAINT `fk_conferencia_phpbb_forums1`
    FOREIGN KEY (`phpbb_forums_forum_id` )
    REFERENCES `phpbb`.`phpbb_forums` (`forum_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `mydb`.`criterios_evaluacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`criterios_evaluacion` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`criterios_evaluacion` (
  `id_criterios_evaluacion` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  `descripcion` VARCHAR(45) NULL ,
  PRIMARY KEY (`id_criterios_evaluacion`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `mydb`.`criterios_evaluacion_conferencia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`criterios_evaluacion_conferencia` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`criterios_evaluacion_conferencia` (
  `criterios_evaluacion_idcriterios_de_evaluacion` INT NOT NULL ,
  `conferencia_id_conferencia` INT NOT NULL ,
  `puntuacion` INT NOT NULL ,
  PRIMARY KEY (`criterios_evaluacion_idcriterios_de_evaluacion`, `conferencia_id_conferencia`) ,
  INDEX `fk_criterios_de_evaluacion_has_Conferencia_criterios_de_evalu` (`criterios_evaluacion_idcriterios_de_evaluacion` ASC) ,
  INDEX `fk_criterios_de_evaluacion_has_Conferencia_Conferencia1` (`conferencia_id_conferencia` ASC) ,
  CONSTRAINT `fk_criterios_de_evaluacion_has_Conferencia_criterios_de_evalu`
    FOREIGN KEY (`criterios_evaluacion_idcriterios_de_evaluacion` )
    REFERENCES `mydb`.`criterios_evaluacion` (`id_criterios_evaluacion` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_criterios_de_evaluacion_has_Conferencia_Conferencia1`
    FOREIGN KEY (`conferencia_id_conferencia` )
    REFERENCES `mydb`.`conferencia` (`id_conferencia` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `mydb`.`tokens_conferencia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tokens_conferencia` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`tokens_conferencia` (
  `caldo_tokens_token` VARCHAR(10) NOT NULL ,
  `conferencia_id_conferencia` INT NOT NULL ,
  `conferencia_phpbb_forums_forum_id` MEDIUMINT(8) UNSIGNED NOT NULL ,
  PRIMARY KEY (`caldo_tokens_token`, `conferencia_id_conferencia`, `conferencia_phpbb_forums_forum_id`) ,
  INDEX `fk_caldo_tokens_has_conferencia_caldo_tokens1` (`caldo_tokens_token` ASC) ,
  INDEX `fk_caldo_tokens_has_conferencia_conferencia1` (`conferencia_id_conferencia` ASC, `conferencia_phpbb_forums_forum_id` ASC) ,
  CONSTRAINT `fk_caldo_tokens_has_conferencia_caldo_tokens1`
    FOREIGN KEY (`caldo_tokens_token` )
    REFERENCES `mydb`.`token` (`token` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_caldo_tokens_has_conferencia_conferencia1`
    FOREIGN KEY (`conferencia_id_conferencia` , `conferencia_phpbb_forums_forum_id` )
    REFERENCES `mydb`.`conferencia` (`id_conferencia` , `phpbb_forums_forum_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

USE `phpbb` ;

-- -----------------------------------------------------
-- Table `phpbb`.`phpbb_users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `phpbb`.`phpbb_users` ;

CREATE  TABLE IF NOT EXISTS `phpbb`.`phpbb_users` (
  `user_id` MEDIUMINT(8) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `user_type` TINYINT(2) NOT NULL DEFAULT '0' ,
  `group_id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '3' ,
  `user_permissions` MEDIUMTEXT CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  `user_perm_from` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' ,
  `user_ip` VARCHAR(40) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `user_regdate` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `username` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `username_clean` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `user_password` VARCHAR(40) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `user_passchg` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `user_pass_convert` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' ,
  `user_email` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `user_email_hash` BIGINT(20) NOT NULL DEFAULT '0' ,
  `user_birthday` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `user_lastvisit` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `user_lastmark` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `user_lastpost_time` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `user_lastpage` VARCHAR(200) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `user_last_confirm_key` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `user_last_search` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `user_warnings` TINYINT(4) NOT NULL DEFAULT '0' ,
  `user_last_warning` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `user_login_attempts` TINYINT(4) NOT NULL DEFAULT '0' ,
  `user_inactive_reason` TINYINT(2) NOT NULL DEFAULT '0' ,
  `user_inactive_time` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `user_posts` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' ,
  `user_lang` VARCHAR(30) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `user_timezone` DECIMAL(5,2) NOT NULL DEFAULT '0.00' ,
  `user_dst` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' ,
  `user_dateformat` VARCHAR(30) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT 'd M Y H:i' ,
  `user_style` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' ,
  `user_rank` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' ,
  `user_colour` VARCHAR(6) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `user_new_privmsg` INT(4) NOT NULL DEFAULT '0' ,
  `user_unread_privmsg` INT(4) NOT NULL DEFAULT '0' ,
  `user_last_privmsg` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `user_message_rules` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' ,
  `user_full_folder` INT(11) NOT NULL DEFAULT '-3' ,
  `user_emailtime` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `user_topic_show_days` SMALLINT(4) UNSIGNED NOT NULL DEFAULT '0' ,
  `user_topic_sortby_type` VARCHAR(1) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT 't' ,
  `user_topic_sortby_dir` VARCHAR(1) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT 'd' ,
  `user_post_show_days` SMALLINT(4) UNSIGNED NOT NULL DEFAULT '0' ,
  `user_post_sortby_type` VARCHAR(1) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT 't' ,
  `user_post_sortby_dir` VARCHAR(1) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT 'a' ,
  `user_notify` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' ,
  `user_notify_pm` TINYINT(1) UNSIGNED NOT NULL DEFAULT '1' ,
  `user_notify_type` TINYINT(4) NOT NULL DEFAULT '0' ,
  `user_allow_pm` TINYINT(1) UNSIGNED NOT NULL DEFAULT '1' ,
  `user_allow_viewonline` TINYINT(1) UNSIGNED NOT NULL DEFAULT '1' ,
  `user_allow_viewemail` TINYINT(1) UNSIGNED NOT NULL DEFAULT '1' ,
  `user_allow_massemail` TINYINT(1) UNSIGNED NOT NULL DEFAULT '1' ,
  `user_options` INT(11) UNSIGNED NOT NULL DEFAULT '230271' ,
  `user_avatar` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `user_avatar_type` TINYINT(2) NOT NULL DEFAULT '0' ,
  `user_avatar_width` SMALLINT(4) UNSIGNED NOT NULL DEFAULT '0' ,
  `user_avatar_height` SMALLINT(4) UNSIGNED NOT NULL DEFAULT '0' ,
  `user_sig` MEDIUMTEXT CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  `user_sig_bbcode_uid` VARCHAR(8) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `user_sig_bbcode_bitfield` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `user_from` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `user_icq` VARCHAR(15) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `user_aim` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `user_yim` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `user_msnm` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `user_jabber` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `user_website` VARCHAR(200) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `user_occ` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  `user_interests` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  `user_actkey` VARCHAR(32) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `user_newpasswd` VARCHAR(40) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `user_form_salt` VARCHAR(32) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `user_new` TINYINT(1) UNSIGNED NOT NULL DEFAULT '1' ,
  `user_reminded` TINYINT(4) NOT NULL DEFAULT '0' ,
  `user_reminded_time` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`user_id`) ,
  UNIQUE INDEX `username_clean` (`username_clean` ASC) ,
  INDEX `user_birthday` (`user_birthday` ASC) ,
  INDEX `user_email_hash` (`user_email_hash` ASC) ,
  INDEX `user_type` (`user_type` ASC) )
ENGINE = MyISAM
AUTO_INCREMENT = 53
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `phpbb`.`phpbb_users_conferencia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `phpbb`.`phpbb_users_conferencia` ;

CREATE  TABLE IF NOT EXISTS `phpbb`.`phpbb_users_conferencia` (
  `phpbb_users_user_id` MEDIUMINT(8) UNSIGNED NOT NULL ,
  `Conferencia_idConferencia` INT NOT NULL ,
  `token_asignado` TINYINT(1)  NOT NULL COMMENT 'Si la relacion tiene un rol de votante, indica si se ha asignado un token al votante o no.  Esto para no dar màs de un token a un votante en una conferencia.\nSi el rol de la relacion es conferencista, este atributo debe se nulo o ignorado.\n' ,
  `rol_relacion` ENUM('V','C') NOT NULL COMMENT 'El rol que toma en la relacion de usuario con conferencia. Un rol de votante o un rol de conferencista.\nSe puede manejar de esta forma pues los roles son mutuamente excluyentes.' ,
  PRIMARY KEY (`phpbb_users_user_id`, `Conferencia_idConferencia`) ,
  INDEX `fk_phpbb_users_has_Conferencia_phpbb_users` (`phpbb_users_user_id` ASC) ,
  INDEX `fk_phpbb_users_has_Conferencia_Conferencia1` (`Conferencia_idConferencia` ASC) ,
  CONSTRAINT `fk_phpbb_users_has_Conferencia_phpbb_users`
    FOREIGN KEY (`phpbb_users_user_id` )
    REFERENCES `phpbb`.`phpbb_users` (`user_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_phpbb_users_has_Conferencia_Conferencia1`
    FOREIGN KEY (`Conferencia_idConferencia` )
    REFERENCES `mydb`.`conferencia` (`id_conferencia` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `phpbb`.`phpbb_forums`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `phpbb`.`phpbb_forums` ;

CREATE  TABLE IF NOT EXISTS `phpbb`.`phpbb_forums` (
  `forum_id` MEDIUMINT(8) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `parent_id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' ,
  `left_id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' ,
  `right_id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' ,
  `forum_parents` MEDIUMTEXT CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  `forum_name` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `forum_desc` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  `forum_desc_bitfield` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `forum_desc_options` INT(11) UNSIGNED NOT NULL DEFAULT '7' ,
  `forum_desc_uid` VARCHAR(8) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `forum_link` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `forum_password` VARCHAR(40) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `forum_style` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' ,
  `forum_image` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `forum_rules` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  `forum_rules_link` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `forum_rules_bitfield` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `forum_rules_options` INT(11) UNSIGNED NOT NULL DEFAULT '7' ,
  `forum_rules_uid` VARCHAR(8) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `forum_topics_per_page` TINYINT(4) NOT NULL DEFAULT '0' ,
  `forum_type` TINYINT(4) NOT NULL DEFAULT '0' ,
  `forum_status` TINYINT(4) NOT NULL DEFAULT '0' ,
  `forum_posts` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' ,
  `forum_topics` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' ,
  `forum_topics_real` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' ,
  `forum_last_post_id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' ,
  `forum_last_poster_id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' ,
  `forum_last_post_subject` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `forum_last_post_time` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `forum_last_poster_name` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `forum_last_poster_colour` VARCHAR(6) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '' ,
  `forum_flags` TINYINT(4) NOT NULL DEFAULT '32' ,
  `forum_options` INT(20) UNSIGNED NOT NULL DEFAULT '0' ,
  `display_subforum_list` TINYINT(1) UNSIGNED NOT NULL DEFAULT '1' ,
  `display_on_index` TINYINT(1) UNSIGNED NOT NULL DEFAULT '1' ,
  `enable_indexing` TINYINT(1) UNSIGNED NOT NULL DEFAULT '1' ,
  `enable_icons` TINYINT(1) UNSIGNED NOT NULL DEFAULT '1' ,
  `enable_prune` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' ,
  `prune_next` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `prune_days` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' ,
  `prune_viewed` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' ,
  `prune_freq` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`forum_id`) ,
  INDEX `left_right_id` (`left_id` ASC, `right_id` ASC) ,
  INDEX `forum_lastpost_id` (`forum_last_post_id` ASC) )
ENGINE = MyISAM
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `mydb`.`criterios_evaluacion`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
USE `mydb`;
INSERT INTO `mydb`.`criterios_evaluacion` (`id_criterios_evaluacion`, `nombre`, `descripcion`) VALUES (NULL, 'Contenido', NULL);
INSERT INTO `mydb`.`criterios_evaluacion` (`id_criterios_evaluacion`, `nombre`, `descripcion`) VALUES (NULL, 'Apropiación', NULL);
INSERT INTO `mydb`.`criterios_evaluacion` (`id_criterios_evaluacion`, `nombre`, `descripcion`) VALUES (NULL, 'Laboratorio', NULL);
INSERT INTO `mydb`.`criterios_evaluacion` (`id_criterios_evaluacion`, `nombre`, `descripcion`) VALUES (NULL, 'Diapositivas', NULL);
INSERT INTO `mydb`.`criterios_evaluacion` (`id_criterios_evaluacion`, `nombre`, `descripcion`) VALUES (NULL, 'Oratoria', NULL);

COMMIT;
