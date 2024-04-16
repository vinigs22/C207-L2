
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Diretor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Diretor` (
  `idDiretor` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `idade` INT NOT NULL,
  `cpf` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDiretor`))


-- -----------------------------------------------------
-- Table `mydb`.`Faculdade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Faculdade` (
  `idFaculdade` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `endereço` VARCHAR(100) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `Diretor_idDiretor` INT NOT NULL,
  PRIMARY KEY (`idFaculdade`),
  INDEX `fk_Faculdade_Diretor_idx` (`Diretor_idDiretor` ASC) VISIBLE,
  CONSTRAINT `fk_Faculdade_Diretor`
    FOREIGN KEY (`Diretor_idDiretor`)
    REFERENCES `mydb`.`Diretor` (`idDiretor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)


-- -----------------------------------------------------
-- Table `mydb`.`Professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Professor` (
  `idProfessor` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `idade` INT NOT NULL,
  `materia` VARCHAR(45) NOT NULL,
  `Faculdade_idFaculdade` INT NOT NULL,
  PRIMARY KEY (`idProfessor`),
  INDEX `fk_Professor_Faculdade1_idx` (`Faculdade_idFaculdade` ASC) VISIBLE,
  CONSTRAINT `fk_Professor_Faculdade1`
    FOREIGN KEY (`Faculdade_idFaculdade`)
    REFERENCES `mydb`.`Faculdade` (`idFaculdade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)


-- -----------------------------------------------------
-- Table `mydb`.`Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Curso` (
  `idCurso` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCurso`))


-- -----------------------------------------------------
-- Table `mydb`.`Aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Aluno` (
  `idAluno` VARCHAR(45) NOT NULL,
  `nome` INT NOT NULL,
  `peso` FLOAT NOT NULL,
  `idade` INT NOT NULL,
  `periodo` INT NOT NULL,
  `Curso_idCurso` INT NOT NULL,
  PRIMARY KEY (`idAluno`),
  INDEX `fk_Aluno_Curso1_idx` (`Curso_idCurso` ASC) VISIBLE,
  CONSTRAINT `fk_Aluno_Curso1`
    FOREIGN KEY (`Curso_idCurso`)
    REFERENCES `mydb`.`Curso` (`idCurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)


-- -----------------------------------------------------
-- Table `mydb`.`leciona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`leciona` (
  `Professor_idProfessor` INT NOT NULL,
  `Aluno_idAluno` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Professor_idProfessor`, `Aluno_idAluno`),
  INDEX `fk_Professor_has_Aluno_Aluno1_idx` (`Aluno_idAluno` ASC) VISIBLE,
  INDEX `fk_Professor_has_Aluno_Professor1_idx` (`Professor_idProfessor` ASC) VISIBLE,
  CONSTRAINT `fk_Professor_has_Aluno_Professor1`
    FOREIGN KEY (`Professor_idProfessor`)
    REFERENCES `mydb`.`Professor` (`idProfessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Professor_has_Aluno_Aluno1`
    FOREIGN KEY (`Aluno_idAluno`)
    REFERENCES `mydb`.`Aluno` (`idAluno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
