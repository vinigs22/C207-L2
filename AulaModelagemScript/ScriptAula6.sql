
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Produto` (
  `ID` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Marca` VARCHAR(45) NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  `Preço` FLOAT NOT NULL,
  `qtdEstoque` INT NOT NULL,
  PRIMARY KEY (`ID`))



-- -----------------------------------------------------
-- Table `mydb`.`Loja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Loja` (
  `ID` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Endereço` VARCHAR(45) NOT NULL,
  `Telefone` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))



-- -----------------------------------------------------
-- Table `mydb`.`Compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Compra` (
  `codRastreio` INT NOT NULL,
  `valorTotal` FLOAT NOT NULL,
  `tipoPagamento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codRastreio`))



-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `CPF` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `CEP` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Senha` VARCHAR(45) NOT NULL,
  `Telefone` VARCHAR(45) NOT NULL,
  `Compra_codRastreio` INT NOT NULL,
  PRIMARY KEY (`CPF`, `Compra_codRastreio`),
  INDEX `fk_Cliente_Compra1_idx` (`Compra_codRastreio` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_Compra1`
    FOREIGN KEY (`Compra_codRastreio`)
    REFERENCES `mydb`.`Compra` (`codRastreio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)



-- -----------------------------------------------------
-- Table `mydb`.`Correio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Correio` (
  `idCorreio` INT NOT NULL,
  `prazo` INT NOT NULL,
  `valorFrete` FLOAT NOT NULL,
  `Compra_codRastreio` INT NOT NULL,
  PRIMARY KEY (`idCorreio`, `Compra_codRastreio`),
  INDEX `fk_Correio_Compra1_idx` (`Compra_codRastreio` ASC) VISIBLE,
  CONSTRAINT `fk_Correio_Compra1`
    FOREIGN KEY (`Compra_codRastreio`)
    REFERENCES `mydb`.`Compra` (`codRastreio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)



-- -----------------------------------------------------
-- Table `mydb`.`comprado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`comprado` (
  `Cliente_CPF` INT NOT NULL,
  `Produto_ID` INT NOT NULL,
  PRIMARY KEY (`Cliente_CPF`, `Produto_ID`),
  INDEX `fk_Cliente_has_Produto_Produto1_idx` (`Produto_ID` ASC) VISIBLE,
  INDEX `fk_Cliente_has_Produto_Cliente_idx` (`Cliente_CPF` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_has_Produto_Cliente`
    FOREIGN KEY (`Cliente_CPF`)
    REFERENCES `mydb`.`Cliente` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_has_Produto_Produto1`
    FOREIGN KEY (`Produto_ID`)
    REFERENCES `mydb`.`Produto` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)


-- -----------------------------------------------------
-- Table `mydb`.`vendido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`vendido` (
  `Produto_ID` INT NOT NULL,
  `Loja_ID` INT NOT NULL,
  PRIMARY KEY (`Produto_ID`, `Loja_ID`),
  INDEX `fk_Produto_has_Loja_Loja1_idx` (`Loja_ID` ASC) VISIBLE,
  INDEX `fk_Produto_has_Loja_Produto1_idx` (`Produto_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_has_Loja_Produto1`
    FOREIGN KEY (`Produto_ID`)
    REFERENCES `mydb`.`Produto` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Loja_Loja1`
    FOREIGN KEY (`Loja_ID`)
    REFERENCES `mydb`.`Loja` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)


-- -----------------------------------------------------
-- Table `mydb`.`Avaliações`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Avaliações` (
  `notaAvaliacao` INT NOT NULL,
  `avaliacaoProduto` VARCHAR(45) NOT NULL,
  `Produto_ID` INT NOT NULL,
  INDEX `fk_Avaliações_Produto1_idx` (`Produto_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Avaliações_Produto1`
    FOREIGN KEY (`Produto_ID`)
    REFERENCES `mydb`.`Produto` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
