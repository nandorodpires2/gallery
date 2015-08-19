-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.6.17 - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura para tabela soccex.atribute
DROP TABLE IF EXISTS `atribute`;
CREATE TABLE IF NOT EXISTS `atribute` (
  `id_atribute` int(11) NOT NULL AUTO_INCREMENT,
  `name_atribute` varchar(100) DEFAULT NULL,
  `positive_atribute` tinyint(1) DEFAULT NULL,
  `active_atribute` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_atribute`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela soccex.atribute: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `atribute` DISABLE KEYS */;
INSERT INTO `atribute` (`id_atribute`, `name_atribute`, `positive_atribute`, `active_atribute`) VALUES
	(1, 'Reflexo', 1, 1),
	(2, 'Saída do Gol', 1, 1),
	(3, 'Defesa de Pênaltis', 1, 1),
	(4, 'Velocidade', 1, 1),
	(5, 'Posicionamento', 1, 1),
	(6, 'Elasticidade', 1, 1);
/*!40000 ALTER TABLE `atribute` ENABLE KEYS */;


-- Copiando estrutura para tabela soccex.confederation
DROP TABLE IF EXISTS `confederation`;
CREATE TABLE IF NOT EXISTS `confederation` (
  `id_confederation` int(11) NOT NULL AUTO_INCREMENT,
  `name_confederation` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_confederation`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela soccex.confederation: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `confederation` DISABLE KEYS */;
INSERT INTO `confederation` (`id_confederation`, `name_confederation`) VALUES
	(1, 'Concacaf'),
	(2, 'Uefa'),
	(3, 'Commebol'),
	(4, 'AFC'),
	(5, 'CAF'),
	(6, 'OFC');
/*!40000 ALTER TABLE `confederation` ENABLE KEYS */;


-- Copiando estrutura para tabela soccex.country
DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `id_country` int(11) NOT NULL AUTO_INCREMENT,
  `name_country` varchar(45) DEFAULT NULL,
  `tiny_name` varchar(3) DEFAULT NULL,
  `id_confederation` int(11) NOT NULL,
  `avatar_country` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_country`,`id_confederation`),
  KEY `fk_country_confederation1_idx` (`id_confederation`),
  CONSTRAINT `fk_country_confederation1` FOREIGN KEY (`id_confederation`) REFERENCES `confederation` (`id_confederation`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela soccex.country: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` (`id_country`, `name_country`, `tiny_name`, `id_confederation`, `avatar_country`) VALUES
	(1, 'Brasil', 'BRA', 3, 'brasil.png'),
	(2, 'Inglaterra', 'ING', 2, 'inglaterra.png'),
	(3, 'Uruguai', 'URU', 3, 'uruguai.png'),
	(4, 'Chile', 'CHI', 3, 'chile.png'),
	(5, 'Espanha', 'ESP', 2, 'espanha.png');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;


-- Copiando estrutura para tabela soccex.finance
DROP TABLE IF EXISTS `finance`;
CREATE TABLE IF NOT EXISTS `finance` (
  `id_finance` int(11) NOT NULL AUTO_INCREMENT,
  `value_finance` float DEFAULT NULL,
  `id_team` int(11) NOT NULL,
  `date_update` datetime DEFAULT NULL,
  `id_kind_finance` int(11) NOT NULL,
  PRIMARY KEY (`id_finance`,`id_team`,`id_kind_finance`),
  KEY `fk_finance_team1_idx` (`id_team`),
  KEY `fk_finance_kind_finance1_idx` (`id_kind_finance`),
  CONSTRAINT `fk_finance_kind_finance1` FOREIGN KEY (`id_kind_finance`) REFERENCES `kind_finance` (`id_kind_finance`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_finance_team1` FOREIGN KEY (`id_team`) REFERENCES `team` (`id_team`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela soccex.finance: ~16 rows (aproximadamente)
/*!40000 ALTER TABLE `finance` DISABLE KEYS */;
INSERT INTO `finance` (`id_finance`, `value_finance`, `id_team`, `date_update`, `id_kind_finance`) VALUES
	(1, 2000, 1, '2015-06-05 20:27:59', 1),
	(2, -292, 1, '2015-06-05 20:41:47', 2),
	(3, -156, 1, '2015-06-05 20:47:20', 2),
	(4, -240, 1, '2015-06-05 20:47:41', 2),
	(5, -180, 1, '2015-06-05 20:52:59', 2),
	(6, -320, 1, NULL, 2),
	(7, -236, 1, NULL, 2),
	(8, -80, 1, NULL, 2),
	(9, -116, 1, NULL, 2),
	(10, -72, 1, NULL, 2),
	(11, -60, 1, NULL, 2),
	(12, -84, 1, NULL, 2),
	(13, -96, 1, NULL, 2),
	(14, 180, 1, NULL, 3),
	(15, 320, 1, NULL, 3),
	(16, -432, 1, NULL, 2);
/*!40000 ALTER TABLE `finance` ENABLE KEYS */;


-- Copiando estrutura para tabela soccex.formation
DROP TABLE IF EXISTS `formation`;
CREATE TABLE IF NOT EXISTS `formation` (
  `id_formation` int(11) NOT NULL AUTO_INCREMENT,
  `formation` varchar(45) DEFAULT NULL,
  `active_formation` tinyint(1) DEFAULT '1',
  `num_goalkeeper` int(11) DEFAULT '1',
  `num_back` int(11) DEFAULT '0',
  `num_back_2` int(11) DEFAULT '0',
  `num_middlefield` int(11) DEFAULT '0',
  `num_middlefield_2` int(11) DEFAULT '0',
  `num_middlefield_3` varchar(45) DEFAULT '0',
  `num_forward` int(11) DEFAULT '0',
  `num_forward_2` int(11) DEFAULT '0',
  PRIMARY KEY (`id_formation`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela soccex.formation: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `formation` DISABLE KEYS */;
INSERT INTO `formation` (`id_formation`, `formation`, `active_formation`, `num_goalkeeper`, `num_back`, `num_back_2`, `num_middlefield`, `num_middlefield_2`, `num_middlefield_3`, `num_forward`, `num_forward_2`) VALUES
	(1, '3-5-2 tradicional', 1, 1, 3, 0, 3, 2, '0', 2, 0),
	(2, '4-2-3-1', 1, 1, 4, 0, 2, 3, '0', 1, 0);
/*!40000 ALTER TABLE `formation` ENABLE KEYS */;


-- Copiando estrutura para tabela soccex.kind_finance
DROP TABLE IF EXISTS `kind_finance`;
CREATE TABLE IF NOT EXISTS `kind_finance` (
  `id_kind_finance` int(11) NOT NULL AUTO_INCREMENT,
  `slug_kinf_finance` varchar(500) DEFAULT NULL,
  `description_kind_finance` varchar(500) DEFAULT NULL,
  `active_kind_finance` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_kind_finance`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela soccex.kind_finance: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `kind_finance` DISABLE KEYS */;
INSERT INTO `kind_finance` (`id_kind_finance`, `slug_kinf_finance`, `description_kind_finance`, `active_kind_finance`) VALUES
	(1, 'INITIAL_FINANCE', 'Saldo inicial', 1),
	(2, 'BUY_PLAYER', 'Compra de jogador', 1),
	(3, 'SELL_PLAYER', 'Venda de jogador', 1);
/*!40000 ALTER TABLE `kind_finance` ENABLE KEYS */;


-- Copiando estrutura para tabela soccex.league
DROP TABLE IF EXISTS `league`;
CREATE TABLE IF NOT EXISTS `league` (
  `id_league` int(11) NOT NULL AUTO_INCREMENT,
  `name_league` varchar(500) DEFAULT NULL,
  `order_league` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_league`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela soccex.league: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `league` DISABLE KEYS */;
INSERT INTO `league` (`id_league`, `name_league`, `order_league`) VALUES
	(1, '1ª Divisão', 1),
	(2, '2ª Divisão', 2),
	(3, '3ª Divisão', 3),
	(4, '4ª Divisão', 4),
	(5, '5ª Divisão', 5),
	(6, '6ª Divisão', 6),
	(7, '7ª Divisão', 7),
	(8, '8ª Divisão', 8),
	(9, '9ª Divisão', 9),
	(10, '10ª Divisão', 10);
/*!40000 ALTER TABLE `league` ENABLE KEYS */;


-- Copiando estrutura para tabela soccex.league_team
DROP TABLE IF EXISTS `league_team`;
CREATE TABLE IF NOT EXISTS `league_team` (
  `id_league` int(11) NOT NULL,
  `id_team` int(11) NOT NULL,
  `active_league` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_league`,`id_team`),
  KEY `fk_league_has_team_team1_idx` (`id_team`),
  KEY `fk_league_has_team_league1_idx` (`id_league`),
  CONSTRAINT `fk_league_has_team_league1` FOREIGN KEY (`id_league`) REFERENCES `league` (`id_league`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_league_has_team_team1` FOREIGN KEY (`id_team`) REFERENCES `team` (`id_team`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela soccex.league_team: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `league_team` DISABLE KEYS */;
INSERT INTO `league_team` (`id_league`, `id_team`, `active_league`) VALUES
	(10, 1, 1);
/*!40000 ALTER TABLE `league_team` ENABLE KEYS */;


-- Copiando estrutura para tabela soccex.match
DROP TABLE IF EXISTS `match`;
CREATE TABLE IF NOT EXISTS `match` (
  `id_match` int(11) NOT NULL AUTO_INCREMENT,
  `id_team_home` int(11) NOT NULL,
  `id_team_away` int(11) NOT NULL,
  `date_match` datetime DEFAULT NULL,
  `realised_match` tinyint(1) DEFAULT NULL,
  `matchcol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_match`,`id_team_home`,`id_team_away`),
  KEY `fk_matche_team1_idx` (`id_team_home`),
  KEY `fk_matche_team2_idx` (`id_team_away`),
  CONSTRAINT `fk_matche_team1` FOREIGN KEY (`id_team_home`) REFERENCES `team` (`id_team`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_matche_team2` FOREIGN KEY (`id_team_away`) REFERENCES `team` (`id_team`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela soccex.match: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `match` DISABLE KEYS */;
/*!40000 ALTER TABLE `match` ENABLE KEYS */;


-- Copiando estrutura para tabela soccex.match_log
DROP TABLE IF EXISTS `match_log`;
CREATE TABLE IF NOT EXISTS `match_log` (
  `id_match_log` int(11) NOT NULL AUTO_INCREMENT,
  `id_match` int(11) NOT NULL,
  PRIMARY KEY (`id_match_log`,`id_match`),
  KEY `fk_match_log_match1_idx` (`id_match`),
  CONSTRAINT `fk_match_log_match1` FOREIGN KEY (`id_match`) REFERENCES `match` (`id_match`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela soccex.match_log: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `match_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `match_log` ENABLE KEYS */;


-- Copiando estrutura para tabela soccex.match_possibility
DROP TABLE IF EXISTS `match_possibility`;
CREATE TABLE IF NOT EXISTS `match_possibility` (
  `id_match` int(11) NOT NULL,
  `id_team_home` int(11) NOT NULL DEFAULT '0',
  `id_team_away` int(11) NOT NULL DEFAULT '0',
  `id_possibility` int(11) NOT NULL,
  PRIMARY KEY (`id_match`,`id_team_home`,`id_team_away`,`id_possibility`),
  KEY `fk_match_has_possibility_possibility1_idx` (`id_possibility`),
  KEY `fk_match_has_possibility_match1_idx` (`id_match`,`id_team_home`,`id_team_away`),
  CONSTRAINT `fk_match_has_possibility_match1` FOREIGN KEY (`id_match`, `id_team_home`, `id_team_away`) REFERENCES `match` (`id_match`, `id_team_home`, `id_team_away`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_match_has_possibility_possibility1` FOREIGN KEY (`id_possibility`) REFERENCES `possibility` (`id_possibility`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela soccex.match_possibility: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `match_possibility` DISABLE KEYS */;
/*!40000 ALTER TABLE `match_possibility` ENABLE KEYS */;


-- Copiando estrutura para tabela soccex.match_result
DROP TABLE IF EXISTS `match_result`;
CREATE TABLE IF NOT EXISTS `match_result` (
  `id_match_result` int(11) NOT NULL AUTO_INCREMENT,
  `id_match` int(11) NOT NULL,
  `score_team_home` int(11) DEFAULT NULL,
  `score_team_away` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_match_result`,`id_match`),
  KEY `fk_match_result_match1_idx` (`id_match`),
  CONSTRAINT `fk_match_result_match1` FOREIGN KEY (`id_match`) REFERENCES `match` (`id_match`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela soccex.match_result: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `match_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `match_result` ENABLE KEYS */;


-- Copiando estrutura para tabela soccex.online
DROP TABLE IF EXISTS `online`;
CREATE TABLE IF NOT EXISTS `online` (
  `id_online` int(11) NOT NULL AUTO_INCREMENT,
  `online` tinyint(1) DEFAULT '1',
  `id_team` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id_online`,`id_team`,`id_user`),
  KEY `fk_online_team1_idx` (`id_team`,`id_user`),
  CONSTRAINT `fk_online_team1` FOREIGN KEY (`id_team`, `id_user`) REFERENCES `team` (`id_team`, `id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela soccex.online: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `online` DISABLE KEYS */;
INSERT INTO `online` (`id_online`, `online`, `id_team`, `id_user`) VALUES
	(1, 1, 1, 1);
/*!40000 ALTER TABLE `online` ENABLE KEYS */;


-- Copiando estrutura para tabela soccex.player
DROP TABLE IF EXISTS `player`;
CREATE TABLE IF NOT EXISTS `player` (
  `id_player` int(11) NOT NULL AUTO_INCREMENT,
  `id_professional_team` int(11) NOT NULL,
  `name_complete_player` varchar(500) DEFAULT NULL,
  `id_position_player` int(11) NOT NULL,
  `tiny_name_player` varchar(45) DEFAULT NULL,
  `date_birthday_player` date DEFAULT NULL,
  `foot_player` char(1) DEFAULT NULL,
  `active_player` tinyint(1) DEFAULT '1',
  `avatar_player` varchar(500) DEFAULT 'player_default.png',
  `star_player` tinyint(1) DEFAULT '0',
  `id_country` int(11) NOT NULL,
  PRIMARY KEY (`id_player`,`id_professional_team`,`id_position_player`,`id_country`),
  KEY `fk_player_profissional_team1_idx` (`id_professional_team`),
  KEY `fk_player_position_player1_idx` (`id_position_player`),
  KEY `fk_player_country1_idx` (`id_country`),
  CONSTRAINT `fk_player_country1` FOREIGN KEY (`id_country`) REFERENCES `country` (`id_country`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_player_position_player1` FOREIGN KEY (`id_position_player`) REFERENCES `position_player` (`id_position_player`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_player_profissional_team1` FOREIGN KEY (`id_professional_team`) REFERENCES `professional_team` (`id_professional_team`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela soccex.player: ~16 rows (aproximadamente)
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` (`id_player`, `id_professional_team`, `name_complete_player`, `id_position_player`, `tiny_name_player`, `date_birthday_player`, `foot_player`, `active_player`, `avatar_player`, `star_player`, `id_country`) VALUES
	(1, 1, 'Fábio Deivson Lopes Maciel', 1, 'Fábio', '1980-09-30', 'D', 1, 'player_default.png', 0, 1),
	(2, 1, 'Mayke Rocha Oliveira', 2, 'Mayke ', '1992-11-10', 'D', 1, 'player_default.png', 0, 1),
	(3, 1, 'Eugenio Esteban Mena Reveco', 3, 'Mena', '0000-00-00', 'E', 1, 'player_default.png', 0, 4),
	(4, 1, 'Rafael Pires Monteiro', 1, 'Rafael', '0000-00-00', 'D', 1, 'player_default.png', 0, 1),
	(5, 1, 'Bruno Rodrigo Fenelon Palomo', 7, 'Bruno Rodrigo', '0000-00-00', 'E', 1, 'player_default.png', 0, 1),
	(6, 1, 'Henrique Pacheco Lima', 4, 'Henrique', '0000-00-00', 'D', 1, 'player_default.png', 0, 1),
	(7, 1, 'Giorgian Daniel De Arrascaeta Benedetti', 5, 'De Arrascaeta', '0000-00-00', 'E', 1, 'player_default.png', 0, 3),
	(8, 33, 'Carlos Eduardo Lecciolle Thomazella', 1, 'Thomazella', '1990-08-15', 'D', 1, 'player_default.png', 0, 1),
	(9, 7, 'Walter Henrique da Silva', 6, 'Walter', '1989-07-22', 'A', 1, 'player_default.png', 0, 1),
	(10, 42, 'Daniel de Jesus dos Santos', 6, 'Magrão', '1984-10-03', 'E', 1, 'player_default.png', 0, 1),
	(11, 42, 'Victor Hugo Machado Maia', 5, 'Vitinho', '1990-06-08', 'D', 1, 'player_default.png', 0, 1),
	(12, 32, 'Michel Loures Benhamia', 4, 'Michel', '1988-05-03', 'E', 1, 'player_default.png', 0, 1),
	(13, 32, 'Kelvin Ferreira Fernandes de Souza', 2, 'Kelvin', '1992-01-23', 'D', 1, 'player_default.png', 0, 1),
	(14, 24, 'Charles Luis Reiter', 7, 'Charles', '1988-04-26', 'E', 1, 'player_default.png', 0, 1),
	(15, 3, 'Wesley Ladeira Matos', 7, 'Wesley', '1986-04-08', 'D', 1, 'player_default.png', 0, 1),
	(16, 43, 'Lionel Andrés Messi', 6, 'Messi', '1987-06-24', 'A', 1, 'player_default.png', 0, 5);
/*!40000 ALTER TABLE `player` ENABLE KEYS */;


-- Copiando estrutura para tabela soccex.player_atribute
DROP TABLE IF EXISTS `player_atribute`;
CREATE TABLE IF NOT EXISTS `player_atribute` (
  `id_player` int(11) NOT NULL,
  `id_atribute` int(11) NOT NULL,
  `active_player_atribute` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_player`,`id_atribute`),
  KEY `fk_player_has_atribute_atribute1_idx` (`id_atribute`),
  KEY `fk_player_has_atribute_player1_idx` (`id_player`),
  CONSTRAINT `fk_player_has_atribute_atribute1` FOREIGN KEY (`id_atribute`) REFERENCES `atribute` (`id_atribute`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_player_has_atribute_player1` FOREIGN KEY (`id_player`) REFERENCES `player` (`id_player`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela soccex.player_atribute: ~24 rows (aproximadamente)
/*!40000 ALTER TABLE `player_atribute` DISABLE KEYS */;
INSERT INTO `player_atribute` (`id_player`, `id_atribute`, `active_player_atribute`) VALUES
	(1, 1, 1),
	(1, 2, 1),
	(1, 5, 1),
	(2, 4, 1),
	(3, 5, 1),
	(4, 5, 1),
	(5, 5, 1),
	(6, 5, 1),
	(7, 4, 1),
	(8, 1, 1),
	(8, 5, 1),
	(9, 5, 1),
	(10, 4, 1),
	(10, 5, 1),
	(11, 5, 1),
	(12, 5, 1),
	(13, 4, 1),
	(13, 5, 1),
	(14, 5, 1),
	(15, 4, 1),
	(15, 5, 1),
	(16, 1, 1),
	(16, 4, 1),
	(16, 5, 1);
/*!40000 ALTER TABLE `player_atribute` ENABLE KEYS */;


-- Copiando estrutura para tabela soccex.player_history
DROP TABLE IF EXISTS `player_history`;
CREATE TABLE IF NOT EXISTS `player_history` (
  `id_player_history` int(11) NOT NULL AUTO_INCREMENT,
  `id_player` int(11) NOT NULL,
  PRIMARY KEY (`id_player_history`),
  KEY `fk_player_history_player1_idx` (`id_player`),
  CONSTRAINT `fk_player_history_player1` FOREIGN KEY (`id_player`) REFERENCES `player` (`id_player`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela soccex.player_history: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `player_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_history` ENABLE KEYS */;


-- Copiando estrutura para tabela soccex.player_rating
DROP TABLE IF EXISTS `player_rating`;
CREATE TABLE IF NOT EXISTS `player_rating` (
  `id_player_rating` int(11) NOT NULL AUTO_INCREMENT,
  `id_player` int(11) NOT NULL,
  `value_player_rating` float DEFAULT NULL,
  `force_player_rating` int(11) DEFAULT NULL,
  `active_player_rating` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_player_rating`,`id_player`),
  KEY `fk_player_rating_player1_idx` (`id_player`),
  CONSTRAINT `fk_player_rating_player1` FOREIGN KEY (`id_player`) REFERENCES `player` (`id_player`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela soccex.player_rating: ~16 rows (aproximadamente)
/*!40000 ALTER TABLE `player_rating` DISABLE KEYS */;
INSERT INTO `player_rating` (`id_player_rating`, `id_player`, `value_player_rating`, `force_player_rating`, `active_player_rating`) VALUES
	(1, 1, 316, 79, 1),
	(2, 2, 292, 73, 1),
	(3, 3, 240, 60, 1),
	(4, 4, 180, 45, 1),
	(5, 5, 276, 69, 1),
	(6, 6, 292, 73, 1),
	(7, 7, 320, 80, 1),
	(8, 8, 156, 39, 1),
	(9, 9, 236, 59, 1),
	(10, 10, 116, 29, 1),
	(11, 11, 80, 20, 1),
	(12, 12, 72, 18, 1),
	(13, 13, 60, 15, 1),
	(14, 14, 84, 21, 1),
	(15, 15, 96, 24, 1),
	(16, 16, 432, 98, 1);
/*!40000 ALTER TABLE `player_rating` ENABLE KEYS */;


-- Copiando estrutura para tabela soccex.position_player
DROP TABLE IF EXISTS `position_player`;
CREATE TABLE IF NOT EXISTS `position_player` (
  `id_position_player` int(11) NOT NULL AUTO_INCREMENT,
  `description_position_player` varchar(200) DEFAULT NULL,
  `tiny_position_player` varchar(3) DEFAULT NULL,
  `order_position_player` int(11) DEFAULT NULL,
  `color_position_player` varchar(50) DEFAULT '#FFFFFF',
  PRIMARY KEY (`id_position_player`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela soccex.position_player: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `position_player` DISABLE KEYS */;
INSERT INTO `position_player` (`id_position_player`, `description_position_player`, `tiny_position_player`, `order_position_player`, `color_position_player`) VALUES
	(1, 'Goleiro', 'GOL', 1, '#FFFFFF'),
	(2, 'Lateral Direito', 'LTD', 2, '#FFFFFF'),
	(3, 'Lateral Esquerdo', 'LTE', 3, '#FFFFFF'),
	(4, 'Volante', 'VOL', 5, '#FFFFFF'),
	(5, 'Meio Campo', 'MEI', 6, '#FFFFFF'),
	(6, 'Atacante', 'ATA', 7, '#FFFFFF'),
	(7, 'Zagueiro', 'ZAG', 4, '#FFFFFF');
/*!40000 ALTER TABLE `position_player` ENABLE KEYS */;


-- Copiando estrutura para tabela soccex.possibility
DROP TABLE IF EXISTS `possibility`;
CREATE TABLE IF NOT EXISTS `possibility` (
  `id_possibility` int(11) NOT NULL AUTO_INCREMENT,
  `description_possibility` varchar(300) DEFAULT NULL,
  `active_possibility` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_possibility`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela soccex.possibility: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `possibility` DISABLE KEYS */;
/*!40000 ALTER TABLE `possibility` ENABLE KEYS */;


-- Copiando estrutura para tabela soccex.professional_team
DROP TABLE IF EXISTS `professional_team`;
CREATE TABLE IF NOT EXISTS `professional_team` (
  `id_professional_team` int(11) NOT NULL AUTO_INCREMENT,
  `name_professional_team` varchar(500) DEFAULT NULL,
  `id_country` int(11) NOT NULL,
  `tiny_name_professional_team` varchar(45) DEFAULT NULL,
  `active_professional_team` tinyint(1) DEFAULT '1',
  `avatar_professional_team` varchar(200) DEFAULT 'default_shield.png',
  `division_professional_team` tinyint(2) DEFAULT NULL,
  `slug_professional_team` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_professional_team`,`id_country`),
  UNIQUE KEY `tiny_name_professional_team_UNIQUE` (`tiny_name_professional_team`),
  KEY `fk_profissional_team_country1_idx` (`id_country`),
  CONSTRAINT `fk_profissional_team_country1` FOREIGN KEY (`id_country`) REFERENCES `country` (`id_country`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela soccex.professional_team: ~41 rows (aproximadamente)
/*!40000 ALTER TABLE `professional_team` DISABLE KEYS */;
INSERT INTO `professional_team` (`id_professional_team`, `name_professional_team`, `id_country`, `tiny_name_professional_team`, `active_professional_team`, `avatar_professional_team`, `division_professional_team`, `slug_professional_team`) VALUES
	(1, 'Cruzeiro Esporte Clube', 1, 'Cruzeiro', 1, 'cruzeiro.png', 1, 'cruzeiro'),
	(2, 'Clube Atlético Mineiro', 1, 'Atlético-MG', 1, 'default_shield.png', 1, 'atletico-mg'),
	(3, 'América Futebol Clube', 1, 'América-MG', 1, 'default_shield.png', 2, 'america-mg'),
	(5, 'Clube de Regatas Flamengo', 1, 'Flamengo', 1, 'default_shield.png', 1, 'flamengo'),
	(6, 'Sport Clube Recife', 1, 'Sport', 1, 'default_shield.png', 1, 'sport'),
	(7, 'Clube Atlético Paranaense', 1, 'Atlético-PR', 1, 'default_shield.png', 1, 'atletico-pr'),
	(8, 'Associação Chapecoense de Futebol', 1, 'Chapecoense', 1, 'default_shield.png', 1, 'chapecoense'),
	(9, 'São Paulo Futebol Clube', 1, 'São Paulo', 1, 'default_shield.png', 1, 'sao-paulo'),
	(10, 'Sport Club Corinthians Paulista', 1, 'Corinthians ', 1, 'default_shield.png', 1, 'corinthians'),
	(11, 'Fluminense Football Club', 1, 'Fluminense', 1, 'default_shield.png', 1, 'fluminense'),
	(12, 'Grêmio Foot-Ball Porto Alegrense', 1, 'Grêmio', 1, 'default_shield.png', 1, 'gremio'),
	(13, 'Associação Atlética Ponte Preta', 1, 'Ponte Preta', 1, 'default_shield.png', 1, 'ponte-preta'),
	(14, 'Sociedade Esportiva Palmeiras', 1, 'Palmeiras', 1, 'default_shield.png', 1, 'palmeiras'),
	(15, 'Avaí Futebol Clube', 1, 'Avaí', 1, 'default_shield.png', 1, 'avai'),
	(16, 'Santos Futebol Clube', 1, 'Santos', 1, 'default_shield.png', 1, 'santos'),
	(17, 'Goiás Esporte Clube', 1, 'Goiás', 1, 'default_shield.png', 1, 'goias'),
	(18, 'Club de Regatas Vasco da Gama', 1, 'Vasco da Gama', 1, 'default_shield.png', 1, 'vasco-gama'),
	(19, 'Coritiba Foot Ball Club', 1, 'Coritiba', 1, 'default_shield.png', 1, 'coritiba'),
	(20, 'Joinville Esporte Clube', 1, 'Joinville', 1, 'default_shield.png', 1, 'joinvile'),
	(21, 'Figueirense Futebol Clube', 1, 'Figueirense', 1, 'default_shield.png', 1, 'figueirense'),
	(22, 'Sport Club Internacional', 1, 'Internacional', 1, 'default_shield.png', 1, 'internacional'),
	(23, 'Boa Esporte Futebol Clube', 1, 'Boa Esporte', 1, 'default_shield.png', 2, 'boa-esporte'),
	(24, 'Ceará Sporting Club', 1, 'Ceará', 1, 'default_shield.png', 2, 'ceara'),
	(25, 'Clube Náutico Capibaribe', 1, 'Náutico', 1, 'default_shield.png', 2, 'nautico'),
	(26, 'Botafogo Futebol Clube', 1, 'Botafogo', 1, 'default_shield.png', 2, 'botafogo'),
	(27, 'Sampaio Corrêa Futebol Clube', 1, 'Sampaio Corrêa', 1, 'default_shield.png', 2, 'sampaio-correa'),
	(28, 'Macaé Esporte Futebol Clube', 1, 'Macaé', 1, 'default_shield.png', 2, 'macae'),
	(30, 'Esporte Clube Bahia', 1, 'Bahia', 1, 'default_shield.png', 2, 'bahia'),
	(31, 'Santa Cruz Futebol Clube', 1, 'Santa Cruz', 1, 'default_shield.png', 2, 'santa-cruz'),
	(32, 'ABC Futebol Clube', 1, 'ABC', 1, 'default_shield.png', 2, 'abc'),
	(33, 'Luverdense Esporte Clube', 1, 'Luverdense', 1, 'luverdense.png', 2, 'luverdense'),
	(34, 'Clube Regatas Brasil', 1, 'CRB', 1, 'default_shield.png', 2, 'crb'),
	(35, 'Esporte Clube Vitória', 1, 'Vitória', 1, 'default_shield.png', 2, 'vitoria'),
	(36, 'Atlético Clube Goianiense', 1, 'Atlético-GO', 1, 'default_shield.png', 2, 'atletico-go'),
	(37, 'Clube Atlético Bragantino', 1, 'Bragantino', 1, 'default_shield.png', 2, 'bragantino'),
	(38, 'Oeste Futebol Clube', 1, 'Oeste', 1, 'default_shield.png', 2, 'oeste'),
	(39, 'Paraná Clube', 1, 'Paraná', 1, 'default_shield.png', 2, 'parana'),
	(40, 'Criciúma Esporte Clube', 1, 'Criciúma', 1, 'default_shield.png', 2, 'criciuma'),
	(41, 'Paysandu Sport Club', 1, 'Paysandu', 1, 'default_shield.png', 2, 'paysandu'),
	(42, 'Mogi Mirim Esporte Clube', 1, 'Mogi Mirim', 1, 'default_shield.png', 2, 'mogi-mirim'),
	(43, 'Futbol Club Barcelona', 5, 'Barcelona', 1, 'barcelona.png', 1, 'barcelona');
/*!40000 ALTER TABLE `professional_team` ENABLE KEYS */;


-- Copiando estrutura para tabela soccex.quality_player
DROP TABLE IF EXISTS `quality_player`;
CREATE TABLE IF NOT EXISTS `quality_player` (
  `id_quality_player` int(11) NOT NULL AUTO_INCREMENT,
  `quality_player` varchar(100) DEFAULT NULL,
  `active_quality_player` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_quality_player`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela soccex.quality_player: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `quality_player` DISABLE KEYS */;
INSERT INTO `quality_player` (`id_quality_player`, `quality_player`, `active_quality_player`) VALUES
	(1, 'Agilidade', 1),
	(2, 'Reflexo', 1),
	(3, 'Saída do Gol', 1),
	(4, 'Pegador de Pênaltis', 1),
	(5, 'Cruzamento', 1),
	(6, 'Velocidade', 1),
	(7, 'Ultrapassagem', 1),
	(8, 'Marcação', 1);
/*!40000 ALTER TABLE `quality_player` ENABLE KEYS */;


-- Copiando estrutura para tabela soccex.quality_position_player
DROP TABLE IF EXISTS `quality_position_player`;
CREATE TABLE IF NOT EXISTS `quality_position_player` (
  `id_position_player` int(11) NOT NULL,
  `id_quality_player` int(11) NOT NULL,
  PRIMARY KEY (`id_position_player`,`id_quality_player`),
  KEY `fk_position_player_has_quality_player_quality_player1_idx` (`id_quality_player`),
  KEY `fk_position_player_has_quality_player_position_player1_idx` (`id_position_player`),
  CONSTRAINT `fk_position_player_has_quality_player_position_player1` FOREIGN KEY (`id_position_player`) REFERENCES `position_player` (`id_position_player`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_position_player_has_quality_player_quality_player1` FOREIGN KEY (`id_quality_player`) REFERENCES `quality_player` (`id_quality_player`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela soccex.quality_position_player: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `quality_position_player` DISABLE KEYS */;
/*!40000 ALTER TABLE `quality_position_player` ENABLE KEYS */;


-- Copiando estrutura para tabela soccex.shield
DROP TABLE IF EXISTS `shield`;
CREATE TABLE IF NOT EXISTS `shield` (
  `id_shield` int(11) NOT NULL AUTO_INCREMENT,
  `avatar_shield` varchar(45) DEFAULT NULL,
  `active_shield` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_shield`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela soccex.shield: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `shield` DISABLE KEYS */;
INSERT INTO `shield` (`id_shield`, `avatar_shield`, `active_shield`) VALUES
	(1, 'default_shield.png', 1);
/*!40000 ALTER TABLE `shield` ENABLE KEYS */;


-- Copiando estrutura para tabela soccex.stadium
DROP TABLE IF EXISTS `stadium`;
CREATE TABLE IF NOT EXISTS `stadium` (
  `id_stadium` int(11) NOT NULL AUTO_INCREMENT,
  `name_stadium` varchar(500) DEFAULT NULL,
  `tiny_name_stadium` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_stadium`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela soccex.stadium: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `stadium` DISABLE KEYS */;
/*!40000 ALTER TABLE `stadium` ENABLE KEYS */;


-- Copiando estrutura para tabela soccex.strategy
DROP TABLE IF EXISTS `strategy`;
CREATE TABLE IF NOT EXISTS `strategy` (
  `id_strategy` int(11) NOT NULL AUTO_INCREMENT,
  `description_strategy` varchar(200) DEFAULT NULL,
  `active_strategy` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_strategy`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela soccex.strategy: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `strategy` DISABLE KEYS */;
INSERT INTO `strategy` (`id_strategy`, `description_strategy`, `active_strategy`) VALUES
	(1, 'Normal', 1),
	(2, 'Marcação pressão', 1),
	(3, 'Conta-ataque', 1);
/*!40000 ALTER TABLE `strategy` ENABLE KEYS */;


-- Copiando estrutura para tabela soccex.team
DROP TABLE IF EXISTS `team`;
CREATE TABLE IF NOT EXISTS `team` (
  `id_team` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `name_team` varchar(200) DEFAULT NULL,
  `id_stadium` int(11) DEFAULT NULL,
  `id_shield` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_team`,`id_user`),
  KEY `fk_team_user1_idx` (`id_user`),
  KEY `fk_team_stadium1_idx` (`id_stadium`),
  KEY `fk_team_shield1_idx` (`id_shield`),
  CONSTRAINT `fk_team_shield1` FOREIGN KEY (`id_shield`) REFERENCES `shield` (`id_shield`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_team_stadium1` FOREIGN KEY (`id_stadium`) REFERENCES `stadium` (`id_stadium`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_team_user1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela soccex.team: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` (`id_team`, `id_user`, `name_team`, `id_stadium`, `id_shield`) VALUES
	(1, 1, 'Super Zero', NULL, 1);
/*!40000 ALTER TABLE `team` ENABLE KEYS */;


-- Copiando estrutura para tabela soccex.team_player
DROP TABLE IF EXISTS `team_player`;
CREATE TABLE IF NOT EXISTS `team_player` (
  `id_team` int(11) NOT NULL,
  `id_player` int(11) NOT NULL,
  `active_team_player` tinyint(1) DEFAULT '1',
  `date_update` datetime DEFAULT NULL,
  PRIMARY KEY (`id_team`,`id_player`),
  KEY `fk_team_has_player_player1_idx` (`id_player`),
  KEY `fk_team_has_player_team_idx` (`id_team`),
  CONSTRAINT `fk_team_has_player_player1` FOREIGN KEY (`id_player`) REFERENCES `player` (`id_player`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_team_has_player_team` FOREIGN KEY (`id_team`) REFERENCES `team` (`id_team`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela soccex.team_player: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `team_player` DISABLE KEYS */;
INSERT INTO `team_player` (`id_team`, `id_player`, `active_team_player`, `date_update`) VALUES
	(1, 3, 1, '2015-06-05 20:47:41'),
	(1, 6, 1, '2015-06-05 20:41:47'),
	(1, 8, 1, '2015-06-05 20:47:20'),
	(1, 9, 1, NULL),
	(1, 10, 1, NULL),
	(1, 11, 1, NULL),
	(1, 12, 1, NULL),
	(1, 13, 1, NULL),
	(1, 14, 1, NULL),
	(1, 15, 1, NULL),
	(1, 16, 1, NULL);
/*!40000 ALTER TABLE `team_player` ENABLE KEYS */;


-- Copiando estrutura para tabela soccex.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `name_user` varchar(500) DEFAULT NULL,
  `mail_user` varchar(100) DEFAULT NULL,
  `pass_user` varchar(32) DEFAULT NULL,
  `active_user` tinyint(1) DEFAULT '0',
  `avatar_user` varchar(45) DEFAULT 'user_default.png',
  `date_signup` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `hash_validate_user` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `mail_user` (`mail_user`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela soccex.user: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id_user`, `name_user`, `mail_user`, `pass_user`, `active_user`, `avatar_user`, `date_signup`, `hash_validate_user`) VALUES
	(1, 'Fernando Rodrigues', 'nandorodpires@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 'user_default.png', '2015-06-05 20:27:58', '3bf41dd12219160398346caa66f543ee');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
