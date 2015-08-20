-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.6.17 - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura do banco de dados para galeria
DROP DATABASE IF EXISTS `galeria`;
CREATE DATABASE IF NOT EXISTS `galeria` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `galeria`;


-- Copiando estrutura para tabela galeria.administrador
DROP TABLE IF EXISTS `administrador`;
CREATE TABLE IF NOT EXISTS `administrador` (
  `administrador_id` int(11) NOT NULL AUTO_INCREMENT,
  `administrador_nome` varchar(200) DEFAULT NULL,
  `administrador_email` varchar(200) DEFAULT NULL,
  `administrador_senha` varchar(32) DEFAULT NULL,
  `administrador_ativo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`administrador_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela galeria.administrador: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` (`administrador_id`, `administrador_nome`, `administrador_email`, `administrador_senha`, `administrador_ativo`) VALUES
	(1, 'Fernando Rodrigues', 'nandorodpires@gmail.com', 'c42e3273c1a653caac79188efa0349a9', 1);
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;


-- Copiando estrutura para tabela galeria.exposicao
DROP TABLE IF EXISTS `exposicao`;
CREATE TABLE IF NOT EXISTS `exposicao` (
  `exposicao_id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_exposicao_id` int(11) NOT NULL,
  `exposicao_nome` varchar(200) DEFAULT NULL,
  `exposicao_descricao` text,
  `exposicao_capa` varchar(50) DEFAULT NULL,
  `exposicao_data_criacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `exposicao_ativo` tinyint(1) DEFAULT '1',
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`exposicao_id`,`usuario_id`),
  KEY `fk_exposicao_tipo_exposicao_idx` (`tipo_exposicao_id`),
  KEY `fk_exposicao_usuario1_idx` (`usuario_id`),
  CONSTRAINT `fk_exposicao_tipo_exposicao` FOREIGN KEY (`tipo_exposicao_id`) REFERENCES `tipo_exposicao` (`tipo_exposicao_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_exposicao_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela galeria.exposicao: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `exposicao` DISABLE KEYS */;
INSERT INTO `exposicao` (`exposicao_id`, `tipo_exposicao_id`, `exposicao_nome`, `exposicao_descricao`, `exposicao_capa`, `exposicao_data_criacao`, `exposicao_ativo`, `usuario_id`) VALUES
	(2, 2, 'Conversíveis Jornal Super', 'Miniaturas de conversíveis da década de 60.', 'capa_galeria_1.jpg', '2015-08-19 14:14:23', 0, 1),
	(4, 1, 'Obras de Monet', 'As belíssimas obras do consagrado pintor renascentista. Obras dos séculos XII e XIII.', 'monet.jpg', '2015-08-19 17:21:19', 0, 2),
	(5, 6, 'Lindas Mulheres', 'As mais belas mulheres do site belladasemana. Uma gata mais sexy do que a outra. Confira!', '0.143513001434115148_carla.jpg', '2015-08-20 14:33:10', 1, 1);
/*!40000 ALTER TABLE `exposicao` ENABLE KEYS */;


-- Copiando estrutura para tabela galeria.exposicao_foto
DROP TABLE IF EXISTS `exposicao_foto`;
CREATE TABLE IF NOT EXISTS `exposicao_foto` (
  `exposicao_foto_id` int(11) NOT NULL AUTO_INCREMENT,
  `exposicao_id` int(11) NOT NULL,
  `exposicao_foto_nome` varchar(200) DEFAULT NULL,
  `exposicao_foto_descricao` text,
  `exposicao_foto_hash` varchar(45) DEFAULT NULL,
  `exposicao_foto_data_cadastro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `exposicao_foto_ativo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`exposicao_foto_id`),
  KEY `fk_exposicao_foto_exposicao1_idx` (`exposicao_id`),
  CONSTRAINT `fk_exposicao_foto_exposicao1` FOREIGN KEY (`exposicao_id`) REFERENCES `exposicao` (`exposicao_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela galeria.exposicao_foto: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `exposicao_foto` DISABLE KEYS */;
/*!40000 ALTER TABLE `exposicao_foto` ENABLE KEYS */;


-- Copiando estrutura para tabela galeria.exposicao_vizualizacao
DROP TABLE IF EXISTS `exposicao_vizualizacao`;
CREATE TABLE IF NOT EXISTS `exposicao_vizualizacao` (
  `exposicao_vizualizacao_id` int(11) NOT NULL AUTO_INCREMENT,
  `exposicao_vizualizacao_data` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `exposicao_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`exposicao_vizualizacao_id`,`exposicao_id`,`usuario_id`),
  KEY `fk_exposicao_vizualizacao_exposicao1_idx` (`exposicao_id`,`usuario_id`),
  CONSTRAINT `fk_exposicao_vizualizacao_exposicao1` FOREIGN KEY (`exposicao_id`, `usuario_id`) REFERENCES `exposicao` (`exposicao_id`, `usuario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela galeria.exposicao_vizualizacao: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `exposicao_vizualizacao` DISABLE KEYS */;
INSERT INTO `exposicao_vizualizacao` (`exposicao_vizualizacao_id`, `exposicao_vizualizacao_data`, `exposicao_id`, `usuario_id`) VALUES
	(1, '2015-08-20 14:00:13', 2, 1),
	(2, '2015-08-20 14:14:07', 2, 1),
	(3, '2015-08-20 14:14:11', 4, 2),
	(4, '2015-08-20 14:14:16', 4, 2),
	(5, '2015-08-20 14:14:19', 2, 1),
	(6, '2015-08-20 14:14:23', 2, 1),
	(7, '2015-08-20 14:41:05', 5, 1),
	(8, '2015-08-20 16:32:16', 5, 1),
	(9, '2015-08-20 16:32:20', 5, 1),
	(10, '2015-08-20 16:32:23', 5, 1),
	(11, '2015-08-20 16:32:26', 5, 1),
	(12, '2015-08-20 16:34:58', 5, 1),
	(13, '2015-08-20 17:03:41', 5, 1),
	(14, '2015-08-20 17:04:07', 5, 1),
	(15, '2015-08-20 17:04:35', 5, 1),
	(16, '2015-08-20 17:13:30', 5, 1),
	(17, '2015-08-20 17:15:08', 5, 1);
/*!40000 ALTER TABLE `exposicao_vizualizacao` ENABLE KEYS */;


-- Copiando estrutura para tabela galeria.tipo_exposicao
DROP TABLE IF EXISTS `tipo_exposicao`;
CREATE TABLE IF NOT EXISTS `tipo_exposicao` (
  `tipo_exposicao_id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_exposicao` varchar(200) DEFAULT NULL,
  `tipo_exposicao_ativo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`tipo_exposicao_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela galeria.tipo_exposicao: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo_exposicao` DISABLE KEYS */;
INSERT INTO `tipo_exposicao` (`tipo_exposicao_id`, `tipo_exposicao`, `tipo_exposicao_ativo`) VALUES
	(1, 'Quadros', 1),
	(2, 'Coleções', 1),
	(3, 'Esculturas', 1),
	(4, 'Tricôs', 1),
	(5, 'Crochês', 1),
	(6, 'Fotografias', 1);
/*!40000 ALTER TABLE `tipo_exposicao` ENABLE KEYS */;


-- Copiando estrutura para tabela galeria.usuario
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `usuario_id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_nome` varchar(200) DEFAULT NULL,
  `usuario_email` varchar(200) DEFAULT NULL,
  `usuario_senha` varchar(32) DEFAULT NULL,
  `usuario_avatar` varchar(200) DEFAULT NULL,
  `usuario_ativo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela galeria.usuario: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`usuario_id`, `usuario_nome`, `usuario_email`, `usuario_senha`, `usuario_avatar`, `usuario_ativo`) VALUES
	(1, 'Fernando Rodrigues', 'nandorodpires@gmail.com', 'c42e3273c1a653caac79188efa0349a9', 'eu.jpg', 1),
	(2, 'Thalita Regina', 'thalitaregina91@gmail.com', 'c42e3273c1a653caac79188efa0349a9', 'thalita.jpg', 1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
