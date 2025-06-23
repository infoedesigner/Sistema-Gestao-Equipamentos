-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 12-Out-2023 às 18:33
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `dbsge`
--
CREATE DATABASE IF NOT EXISTS `dbsge` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `dbsge`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbcontract`
--

CREATE TABLE `tbcontract` (
  `id` int(11) NOT NULL,
  `ncontrato` varchar(30) NOT NULL,
  `tipo` varchar(30) NOT NULL,
  `municipio` varchar(30) NOT NULL,
  `secretaria` varchar(30) NOT NULL,
  `inic_contrato` varchar(10) NOT NULL,
  `vencimento` varchar(10) NOT NULL,
  `observacao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbequipaments`
--

CREATE TABLE `tbequipaments` (
  `id` int(11) NOT NULL,
  `idcontrato` int(11) NOT NULL,
  `patrimonio` varchar(11) NOT NULL,
  `tipo` varchar(40) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `nserie` varchar(40) NOT NULL,
  `setor` varchar(60) NOT NULL,
  `data_instalacao` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbfuncionarios`
--

CREATE TABLE `tbfuncionarios` (
  `id` int(11) NOT NULL,
  `nomecompleto` varchar(150) NOT NULL,
  `rg` varchar(15) NOT NULL,
  `cpf` varchar(15) NOT NULL,
  `pis` varchar(15) NOT NULL,
  `ctps` varchar(20) NOT NULL,
  `endereco` varchar(200) NOT NULL,
  `funcao` varchar(100) NOT NULL,
  `admissao` varchar(10) NOT NULL,
  `salario_base` double(10,2) NOT NULL,
  `observacao` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbuser`
--

CREATE TABLE `tbuser` (
  `id` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `funcao` varchar(40) DEFAULT NULL,
  `perfil` varchar(30) NOT NULL,
  `login` varchar(30) NOT NULL,
  `senha` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `tbuser`
--

INSERT INTO `tbuser` (`id`, `nome`, `funcao`, `perfil`, `login`, `senha`) VALUES
(2, 'Administrador', 'ADM', 'admin', 'admin', 'admin');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tbcontract`
--
ALTER TABLE `tbcontract`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ncontrato` (`ncontrato`);

--
-- Índices para tabela `tbequipaments`
--
ALTER TABLE `tbequipaments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `patrimonio` (`patrimonio`),
  ADD KEY `idcontrato` (`idcontrato`);

--
-- Índices para tabela `tbfuncionarios`
--
ALTER TABLE `tbfuncionarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rg` (`rg`),
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD UNIQUE KEY `pis` (`pis`),
  ADD UNIQUE KEY `ctps` (`ctps`);

--
-- Índices para tabela `tbuser`
--
ALTER TABLE `tbuser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tbcontract`
--
ALTER TABLE `tbcontract`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `tbequipaments`
--
ALTER TABLE `tbequipaments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT de tabela `tbfuncionarios`
--
ALTER TABLE `tbfuncionarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tbuser`
--
ALTER TABLE `tbuser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tbequipaments`
--
ALTER TABLE `tbequipaments`
  ADD CONSTRAINT `tbequipaments_ibfk_1` FOREIGN KEY (`idcontrato`) REFERENCES `tbcontract` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
