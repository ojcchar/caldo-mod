

-- -----------------------------------------------------
-- Table `phpbb`.`caldo_tokens`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `phpbb`.`caldo_tokens` ;

CREATE  TABLE IF NOT EXISTS `phpbb`.`caldo_tokens` (
  `token` VARCHAR(10) NOT NULL ,
  `asignado` TINYINT(1)  NOT NULL COMMENT 'Indica si el token ya ha sido asignado para que no pueda ser usado una vez mas' ,
  `fecha_vencimiento` TIMESTAMP NOT NULL COMMENT 'Fecha de vencimiento para que no queden almacenados por siempe los tokens que se generen' ,
  PRIMARY KEY (`token`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `phpbb`.`conferencia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `phpbb`.`conferencia` ;

CREATE  TABLE IF NOT EXISTS `phpbb`.`conferencia` (
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
-- Table `phpbb`.`criterios_evaluacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `phpbb`.`criterios_evaluacion` ;

CREATE  TABLE IF NOT EXISTS `phpbb`.`criterios_evaluacion` (
  `id_criterios_evaluacion` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  `descripcion` VARCHAR(45) NULL ,
  PRIMARY KEY (`id_criterios_evaluacion`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `phpbb`.`criterios_evaluacion_has_conferencia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `phpbb`.`criterios_evaluacion_has_conferencia` ;

CREATE  TABLE IF NOT EXISTS `phpbb`.`criterios_evaluacion_has_conferencia` (
  `criterios_evaluacion_idcriterios_de_evaluacion` INT NOT NULL ,
  `conferencia_id_conferencia` INT NOT NULL ,
  `puntuacion` INT NOT NULL ,
  PRIMARY KEY (`criterios_evaluacion_idcriterios_de_evaluacion`, `conferencia_id_conferencia`) ,
  INDEX `fk_criterios_de_evaluacion_has_Conferencia_criterios_de_evalu` (`criterios_evaluacion_idcriterios_de_evaluacion` ASC) ,
  INDEX `fk_criterios_de_evaluacion_has_Conferencia_Conferencia1` (`conferencia_id_conferencia` ASC) ,
  CONSTRAINT `fk_criterios_de_evaluacion_has_Conferencia_criterios_de_evalu`
    FOREIGN KEY (`criterios_evaluacion_idcriterios_de_evaluacion` )
    REFERENCES `phpbb`.`criterios_evaluacion` (`id_criterios_evaluacion` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_criterios_de_evaluacion_has_Conferencia_Conferencia1`
    FOREIGN KEY (`conferencia_id_conferencia` )
    REFERENCES `phpbb`.`conferencia` (`id_conferencia` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `phpbb`.`phpbb_users_has_conferencia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `phpbb`.`phpbb_users_has_conferencia` ;

CREATE  TABLE IF NOT EXISTS `phpbb`.`phpbb_users_has_conferencia` (
  `phpbb_users_user_id` MEDIUMINT(8) UNSIGNED NOT NULL ,
  `Conferencia_idConferencia` INT NOT NULL ,
  `token_asignado` TINYINT(1)  NOT NULL COMMENT 'Si la relacion tiene un rol de votante, indica si se ha asignado un token al votante o no.  Esto para no dar màs de un token a un votante en una conferencia.\nSi el rol de la relacion es conferencista, este atributo debe se nulo o ignorado.\n' ,
  `rol_relacion` ENUM('V','C') NOT NULL COMMENT 'El rol que toma en la relacion de usuario con conferencia. Un rol de votante o un rol de conferencista.\nSe puede manejar' ,
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
    REFERENCES `phpbb`.`conferencia` (`id_conferencia` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;