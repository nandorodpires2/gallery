-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.6.17 - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              9.2.0.4947
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- Copiando dados para a tabela soccex.professional_team: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `professional_team` DISABLE KEYS */;
INSERT INTO `professional_team` (`id_professional_team`, `name_professional_team`, `id_country`, `tiny_name_professional_team`, `division_professional_team`, `slug_professional_team`, `active_professional_team`, `avatar_professional_team`) VALUES
	(1, 'Cruzeiro Esporte Clube', 1, 'Cruzeiro', 1, 'cruzeiro', 1, 'cruzeiro.png'),
	(2, 'Clube Atlético Mineiro', 1, 'Atlético-MG', 1, 'atletico-mg', 1, 'default_shield.png'),
	(3, 'América Futebol Clube', 1, 'América-MG', 2, 'america-mg', 1, 'default_shield.png'),
	(4, 'Chelsea Football Club', 2, 'Chelsea', 1, 'chelsea', 1, 'chelsea.png'),
	(5, 'Clube de Regatas Flamengo', 1, 'Flamengo', 1, NULL, 1, 'default_shield.png'),
	(6, 'Sport Clube Recife', 1, 'Sport', 1, NULL, 1, 'default_shield.png'),
	(7, 'Clube Atlético Paranaense', 1, 'Atlético-PR', 1, NULL, 1, 'default_shield.png'),
	(8, 'Associação Chapecoense de Futebol', 1, 'Chapecoense', 1, NULL, 1, 'default_shield.png'),
	(9, 'São Paulo Futebol Clube', 1, 'São Paulo', 1, NULL, 1, 'default_shield.png'),
	(10, 'Sport Club Corinthians Paulista', 1, 'Corinthians ', 1, NULL, 1, 'default_shield.png'),
	(11, 'Fluminense Football Club', 1, 'Fluminense', 1, NULL, 1, 'default_shield.png'),
	(12, 'Grêmio Foot-Ball Porto Alegrense', 1, 'Grêmio', 1, NULL, 1, 'default_shield.png'),
	(13, 'Associação Atlética Ponte Preta', 1, 'Ponte Preta', 1, NULL, 1, 'default_shield.png'),
	(14, 'Sociedade Esportiva Palmeiras', 1, 'Palmeiras', 1, NULL, 1, 'default_shield.png'),
	(15, 'Avaí Futebol Clube', 1, 'Avaí', 1, NULL, 1, 'default_shield.png'),
	(16, 'Santos Futebol Clube', 1, 'Santos', 1, NULL, 1, 'default_shield.png'),
	(17, 'Goiás Esporte Clube', 1, 'Goiás', 1, NULL, 1, 'default_shield.png'),
	(18, 'Club de Regatas Vasco da Gama', 1, 'Vasco da Gama', 1, NULL, 1, 'default_shield.png'),
	(19, 'Coritiba Foot Ball Club', 1, 'Coritiba', 1, NULL, 1, 'default_shield.png'),
	(20, 'Joinville Esporte Clube', 1, 'Joinville', 1, NULL, 1, 'default_shield.png'),
	(21, 'Figueirense Futebol Clube', 1, 'Figueirense', 1, NULL, 1, 'default_shield.png'),
	(22, 'Sport Club Internacional', 1, 'Internacional', 1, NULL, 1, 'default_shield.png');
/*!40000 ALTER TABLE `professional_team` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
