

-- -----------------------------------------------------
-- Table `phpbb`.`conferencia`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `phpbb`.`conferencia` (
  `id_conferencia` INT NOT NULL AUTO_INCREMENT ,
  `fecha_realizacion` DATE NOT NULL ,
  `tema` VARCHAR(50) NOT NULL ,
  `numero_de_votos` INT NOT NULL DEFAULT 0 COMMENT 'Número de votos realizados para calcular las puntuaciones de cada criterio' ,
  `phpbb_topics_topic_id` MEDIUMINT(8) UNSIGNED NOT NULL ,
  PRIMARY KEY (`id_conferencia`) ,
  INDEX `fk_conferencia_phpbb_topics1` (`phpbb_topics_topic_id` ASC) ,
  CONSTRAINT `fk_conferencia_phpbb_topics1`
    FOREIGN KEY (`phpbb_topics_topic_id` )
    REFERENCES `phpbb`.`phpbb_topics` (`topic_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `phpbb`.`token`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `phpbb`.`token` (
  `token` VARCHAR(10) NOT NULL ,
  `asignado` TINYINT(1)  NOT NULL COMMENT 'Indica si el token ya ha sido asignado para que no pueda ser usado una vez mas' ,
  `fecha_vencimiento` TIMESTAMP NOT NULL COMMENT 'Fecha de vencimiento para que no queden almacenados por siempe los tokens que se generen' ,
  `conferencia_id_conferencia` INT NOT NULL ,
  PRIMARY KEY (`token`) ,
  INDEX `fk_token_conferencia1` (`conferencia_id_conferencia` ASC) ,
  CONSTRAINT `fk_token_conferencia1`
    FOREIGN KEY (`conferencia_id_conferencia` )
    REFERENCES `phpbb`.`conferencia` (`id_conferencia` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `phpbb`.`criterios_evaluacion`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `phpbb`.`criterios_evaluacion` (
  `id_criterios_evaluacion` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  `descripcion` VARCHAR(45) NULL ,
  PRIMARY KEY (`id_criterios_evaluacion`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `phpbb`.`criterios_evaluacion_conferencia`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `phpbb`.`criterios_evaluacion_conferencia` (
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

USE `phpbb` ;

-- -----------------------------------------------------
-- Table `phpbb`.`phpbb_users_conferencia`
-- -----------------------------------------------------
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
    REFERENCES `phpbb`.`conferencia` (`id_conferencia` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `phpbb`.`conferencia`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
USE `phpbb`;
INSERT INTO `phpbb`.`conferencia` (`id_conferencia`, `fecha_realizacion`, `tema`, `numero_de_votos`, `phpbb_topics_topic_id`) VALUES ('1', '01-01-2010', 'Conferencia de prueab', '0', '1');

COMMIT;

-- -----------------------------------------------------
-- Data for table `phpbb`.`criterios_evaluacion`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
USE `phpbb`;
INSERT INTO `phpbb`.`criterios_evaluacion` (`id_criterios_evaluacion`, `nombre`, `descripcion`) VALUES ('1', 'Contenido', 'Nivel de profundidad adecuado.');
INSERT INTO `phpbb`.`criterios_evaluacion` (`id_criterios_evaluacion`, `nombre`, `descripcion`) VALUES ('2', 'Apropiación', 'Dominio del tema, que el desarrollo de la exposición sean natural.');
INSERT INTO `phpbb`.`criterios_evaluacion` (`id_criterios_evaluacion`, `nombre`, `descripcion`) VALUES ('3', 'Laboratorio', 'Cheveritud, concordancia con el tema de la exposición, estructuración, realizable, apropiado, etc.');
INSERT INTO `phpbb`.`criterios_evaluacion` (`id_criterios_evaluacion`, `nombre`, `descripcion`) VALUES ('4', 'Diapositivas', 'Buena presentación, redacción, ortografía, uso de la plantilla, agradables visualmente, no aburridas.');
INSERT INTO `phpbb`.`criterios_evaluacion` (`id_criterios_evaluacion`, `nombre`, `descripcion`) VALUES ('5', 'Oratoria', 'La expresión corporal, el manejo del público, el manejo de la voz, la capacidad de expresión.');

COMMIT;

-- -----------------------------------------------------
-- Data for table `phpbb`.`criterios_evaluacion_conferencia`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
USE `phpbb`;
INSERT INTO `phpbb`.`criterios_evaluacion_conferencia` (`criterios_evaluacion_idcriterios_de_evaluacion`, `conferencia_id_conferencia`, `puntuacion`) VALUES ('1', '1', '0.0');
INSERT INTO `phpbb`.`criterios_evaluacion_conferencia` (`criterios_evaluacion_idcriterios_de_evaluacion`, `conferencia_id_conferencia`, `puntuacion`) VALUES ('1', '2', '0.0');
INSERT INTO `phpbb`.`criterios_evaluacion_conferencia` (`criterios_evaluacion_idcriterios_de_evaluacion`, `conferencia_id_conferencia`, `puntuacion`) VALUES ('1', '3', '0.0');

COMMIT;

-- -----------------------------------------------------
-- Data for table `phpbb`.`phpbb_users_conferencia`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
USE `phpbb`;
INSERT INTO `phpbb`.`phpbb_users_conferencia` (`phpbb_users_user_id`, `Conferencia_idConferencia`, `token_asignado`, `rol_relacion`) VALUES ('2', '1', false, 'V');

