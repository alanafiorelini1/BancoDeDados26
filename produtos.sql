-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 27-Maio-2026 às 22:50
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `produtos`
--
CREATE DATABASE IF NOT EXISTS `produtos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `produtos`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL,
  `categoria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `categoria`) VALUES
(1, 'Enlatados'),
(2, 'Laticínios'),
(3, 'Açougue'),
(4, 'Limpeza'),
(5, 'Bebidas');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `idproduto` int(11) NOT NULL,
  `produto` varchar(200) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `qtd` int(11) NOT NULL,
  `data` date NOT NULL,
  `ativo` bit(1) NOT NULL,
  `idcat` int(11) DEFAULT NULL,
  `observacao` varchar(255) DEFAULT NULL,
  `marca` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`idproduto`, `produto`, `preco`, `qtd`, `data`, `ativo`, `idcat`, `observacao`, `marca`) VALUES
(1, 'Acém peça', '39.99', 50, '2026-05-13', b'1', 3, 'Sem gordura', 'Sadia'),
(2, 'Sabão em pó', '15.99', 30, '2026-05-13', b'1', 4, '', 'OMO'),
(3, 'Ervilha', '5.56', 10, '2026-05-13', b'0', 1, '', 'Quero'),
(4, 'Leite', '25.45', 40, '2026-05-13', b'1', 2, '', 'Piracanjuba'),
(5, 'Refrigerante', '12.50', 60, '2026-05-26', b'1', 5, 'Sem açúcar', 'Coca-cola'),
(6, 'Suco em caixa', '10.20', 40, '2026-05-26', b'1', 5, '', 'Del vale'),
(7, 'Amaciante', '20.99', 43, '2026-05-26', b'1', 4, '', 'Comfort'),
(8, 'Peito de frango', '25.20', 71, '2026-05-26', b'1', 3, 'Sem gordura', 'Sadia'),
(9, 'Requeijão', '11.00', 18, '2026-05-26', b'0', 2, '', 'Vigor'),
(10, 'Milho', '8.60', 23, '2026-05-26', b'0', 1, '', 'Quero'),
(11, 'Queijo', '13.43', 31, '2026-05-26', b'0', 2, '', 'President'),
(12, 'Esponja', '8.99', 60, '2026-05-26', b'1', 4, '', 'Scotch-Brite'),
(13, 'Picanha', '68.99', 56, '2026-05-26', b'1', 3, '', 'Montana'),
(14, 'Energético', '6.00', 34, '2026-05-26', b'1', 5, '', 'Monster');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idcategoria`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`idproduto`),
  ADD KEY `idcat` (`idcat`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idcategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `idproduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`idcat`) REFERENCES `categoria` (`idcategoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
