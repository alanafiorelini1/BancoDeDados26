-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 12/08/2026 às 22:45
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `hotel`
--
CREATE DATABASE IF NOT EXISTS `hotel` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hotel`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `codcliente` int(11) NOT NULL,
  `cliente` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cpf` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`codcliente`, `cliente`, `email`, `cpf`) VALUES
(1, 'Alana Fiorelini', 'alana@email.com', '120.504.502-62'),
(2, 'João Henrique Gimenes', 'joao@email.com', '130.504.502-67'),
(3, 'Maria Eduarda Couto', 'maria@email.com', '112.504.502-62'),
(4, 'Janaina Maria', 'janaina@email.com', '102.504.502-62'),
(5, 'Alan Alonso', 'alan@email.com', '156.504.502-62'),
(6, 'Jacqueline Cruz', 'jacque@email.com', '172.504.502-62');

-- --------------------------------------------------------

--
-- Estrutura para tabela `hospedagem`
--

CREATE TABLE `hospedagem` (
  `idhospedagem` int(11) NOT NULL,
  `dataentrada` date NOT NULL,
  `datasaida` date DEFAULT NULL,
  `horaentrada` time NOT NULL,
  `horasaida` time DEFAULT NULL,
  `totalhospedagem` decimal(7,2) DEFAULT NULL,
  `codcli` int(11) DEFAULT NULL,
  `codquarto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `hospedagem`
--

INSERT INTO `hospedagem` (`idhospedagem`, `dataentrada`, `datasaida`, `horaentrada`, `horasaida`, `totalhospedagem`, `codcli`, `codquarto`) VALUES
(1, '2026-08-01', NULL, '16:02:40', NULL, NULL, 1, 1),
(2, '2026-08-03', NULL, '17:00:00', NULL, NULL, 5, 2),
(3, '2026-08-05', NULL, '12:00:00', NULL, NULL, 6, 6),
(4, '2026-08-01', NULL, '16:00:00', NULL, NULL, 2, 11),
(5, '2026-08-04', NULL, '13:00:00', NULL, NULL, 3, 8),
(6, '2026-07-31', NULL, '15:00:00', NULL, NULL, 4, 12);

-- --------------------------------------------------------

--
-- Estrutura para tabela `quarto`
--

CREATE TABLE `quarto` (
  `codquarto` int(11) NOT NULL,
  `quarto` varchar(255) NOT NULL,
  `andar` varchar(100) NOT NULL,
  `tipo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `quarto`
--

INSERT INTO `quarto` (`codquarto`, `quarto`, `andar`, `tipo`) VALUES
(1, '11', '1º andar', 'Standard - Single'),
(2, '12', '2º andar', 'Luxo - Single'),
(3, '13', '3º andar', 'Suíte - Double'),
(4, '14', '3º andar', 'Luxo - Triple'),
(5, '21', '2º andar', 'Luxo - Double'),
(6, '22', '4º andar', 'Suíte - Triplo'),
(7, '23', '4º andar', 'Suíte - Double'),
(8, '24', '2º andar', 'Luxo - Double'),
(9, '25', '5º andar', 'Suíte - Single'),
(10, '31', '1º andar', 'Standard - Triplo'),
(11, '32', '1º andar', 'Standard - Twin'),
(12, '33', '1º andar', 'Standard - Double');

-- --------------------------------------------------------

--
-- Estrutura para tabela `servico`
--

CREATE TABLE `servico` (
  `codservico` int(11) NOT NULL,
  `servico` varchar(255) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `valor` decimal(7,2) NOT NULL,
  `tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `servico`
--

INSERT INTO `servico` (`codservico`, `servico`, `quantidade`, `valor`, `tipo`) VALUES
(13, 'Café da Manhã Completo', 0, 45.00, 'Refeições'),
(14, 'Almoço completo', 0, 80.00, 'Refeições'),
(15, 'Feijoada', 0, 80.00, 'Refeições'),
(16, 'Água Mineral Garrafa', 0, 6.00, 'Bebida'),
(17, 'Refrigerante Lata', 0, 8.00, 'Bebida'),
(18, 'Suco Natural', 0, 12.00, 'Bebida'),
(19, 'Batata frita', 0, 20.00, 'Petiscos'),
(20, 'Massagem', 0, 180.00, 'Spa'),
(21, 'Day Spa', 0, 800.00, 'Spa'),
(22, 'Iscas de peixe', 0, 60.00, 'Petiscos');

-- --------------------------------------------------------

--
-- Estrutura para tabela `servicohospedagem`
--

CREATE TABLE `servicohospedagem` (
  `idhospedagem` int(11) NOT NULL,
  `idservico` int(11) NOT NULL,
  `dataservico` date NOT NULL,
  `horaservico` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `servicohospedagem`
--

INSERT INTO `servicohospedagem` (`idhospedagem`, `idservico`, `dataservico`, `horaservico`) VALUES
(1, 13, '2026-08-02', '08:40:00'),
(1, 13, '2026-08-03', '09:00:00'),
(1, 21, '2026-08-02', '16:00:00'),
(2, 15, '2026-08-03', '19:30:00'),
(2, 17, '2026-08-03', '17:40:00'),
(2, 22, '2026-08-03', '18:00:00'),
(3, 14, '2026-08-05', '13:00:00'),
(3, 17, '2026-08-05', '15:00:00'),
(4, 15, '2026-08-02', '18:00:00'),
(4, 19, '2026-08-01', '17:00:00'),
(5, 13, '2026-08-05', '10:00:00'),
(5, 19, '2026-08-04', '15:00:00'),
(5, 20, '2026-08-05', '15:00:00'),
(6, 13, '2026-08-01', '07:00:00'),
(6, 15, '2026-08-01', '19:00:00'),
(6, 18, '2026-08-02', '12:00:00');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`codcliente`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `hospedagem`
--
ALTER TABLE `hospedagem`
  ADD PRIMARY KEY (`idhospedagem`),
  ADD KEY `codcli` (`codcli`),
  ADD KEY `codquarto` (`codquarto`);

--
-- Índices de tabela `quarto`
--
ALTER TABLE `quarto`
  ADD PRIMARY KEY (`codquarto`);
ALTER TABLE `quarto` ADD FULLTEXT KEY `andar` (`andar`);
ALTER TABLE `quarto` ADD FULLTEXT KEY `tipo` (`tipo`);

--
-- Índices de tabela `servico`
--
ALTER TABLE `servico`
  ADD PRIMARY KEY (`codservico`);

--
-- Índices de tabela `servicohospedagem`
--
ALTER TABLE `servicohospedagem`
  ADD PRIMARY KEY (`idhospedagem`,`idservico`,`dataservico`,`horaservico`),
  ADD KEY `idservico` (`idservico`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `codcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `hospedagem`
--
ALTER TABLE `hospedagem`
  MODIFY `idhospedagem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `quarto`
--
ALTER TABLE `quarto`
  MODIFY `codquarto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `servico`
--
ALTER TABLE `servico`
  MODIFY `codservico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `hospedagem`
--
ALTER TABLE `hospedagem`
  ADD CONSTRAINT `hospedagem_ibfk_1` FOREIGN KEY (`codcli`) REFERENCES `cliente` (`codcliente`),
  ADD CONSTRAINT `hospedagem_ibfk_2` FOREIGN KEY (`codquarto`) REFERENCES `quarto` (`codquarto`);

--
-- Restrições para tabelas `servicohospedagem`
--
ALTER TABLE `servicohospedagem`
  ADD CONSTRAINT `servicohospedagem_ibfk_1` FOREIGN KEY (`idhospedagem`) REFERENCES `hospedagem` (`idhospedagem`),
  ADD CONSTRAINT `servicohospedagem_ibfk_2` FOREIGN KEY (`idservico`) REFERENCES `servico` (`codservico`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
