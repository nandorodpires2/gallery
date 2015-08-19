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
-- Copiando dados para a tabela soccex.atribute: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `atribute` DISABLE KEYS */;
INSERT INTO `atribute` (`id_atribute`, `name_atribute`, `positive_atribute`, `active_atribute`) VALUES
	(1, 'Saída do Gol', 1, 1),
	(2, 'Reflexo', 1, 1),
	(3, 'Velocidade', 1, 1),
	(5, 'Cruzamento', 1, 1),
	(6, 'Finalização', 1, 1),
	(7, 'Marcação', 1, 1),
	(8, 'Desarme', 1, 1),
	(9, 'Posse de Bola', 1, 1),
	(10, 'Drible', 1, 1),
	(11, 'Cabeceio', 1, 1),
	(12, 'Posicionamento', 1, 1),
	(13, 'Defesa de Pênaltis', 1, 1),
	(14, 'Reposição de Bola', 1, 1);
/*!40000 ALTER TABLE `atribute` ENABLE KEYS */;

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

-- Copiando dados para a tabela soccex.country: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` (`id_country`, `name_country`, `tiny_name`, `id_confederation`) VALUES
	(1, 'Brasil', 'BRA', 3),
	(2, 'Inglaterra', 'ING', 2);
/*!40000 ALTER TABLE `country` ENABLE KEYS */;

-- Copiando dados para a tabela soccex.league: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `league` DISABLE KEYS */;
/*!40000 ALTER TABLE `league` ENABLE KEYS */;

-- Copiando dados para a tabela soccex.league_team: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `league_team` DISABLE KEYS */;
/*!40000 ALTER TABLE `league_team` ENABLE KEYS */;

-- Copiando dados para a tabela soccex.match: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `match` DISABLE KEYS */;
/*!40000 ALTER TABLE `match` ENABLE KEYS */;

-- Copiando dados para a tabela soccex.match_log: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `match_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `match_log` ENABLE KEYS */;

-- Copiando dados para a tabela soccex.match_result: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `match_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `match_result` ENABLE KEYS */;

-- Copiando dados para a tabela soccex.player: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` (`id_player`, `id_professional_team`, `name_complete_player`, `id_position_player`, `tiny_name_player`, `date_birthday_player`, `foot_player`, `avatar_player`, `active_player`) VALUES
	(1, 1, 'Fábio Deivson Lopes Maciel', 1, 'Fábio', '1982-09-30', 'D', 'player_default.png', 1),
	(2, 1, 'Mayke Rocha Oliveira', 2, 'Mayke ', '1992-11-10', 'D', 'player_default.png', 1),
	(3, 1, 'Leandro Damião da Silva dos Santos', 6, 'Leandro Damião', '1989-07-22', 'D', 'player_default.png', 1),
	(4, 1, 'Eugenio Esteban Mena Reveco', 3, 'Mena', '1988-07-18', 'E', 'player_default.png', 1),
	(5, 3, 'João Ricardo Riedi', 1, 'João Ricardo', '1988-09-06', 'D', 'player_default.png', 1);
/*!40000 ALTER TABLE `player` ENABLE KEYS */;

-- Copiando dados para a tabela soccex.player_atribute: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `player_atribute` DISABLE KEYS */;
INSERT INTO `player_atribute` (`id_player`, `id_atribute`, `active_player_atribute`) VALUES
	(1, 1, 1),
	(1, 12, 1),
	(2, 3, 1),
	(2, 5, 1),
	(3, 6, 1),
	(3, 11, 1),
	(4, 7, 1),
	(5, 2, 1),
	(5, 12, 1),
	(5, 13, 1),
	(5, 14, 1);
/*!40000 ALTER TABLE `player_atribute` ENABLE KEYS */;

-- Copiando dados para a tabela soccex.player_history: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `player_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_history` ENABLE KEYS */;

-- Copiando dados para a tabela soccex.player_rating: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `player_rating` DISABLE KEYS */;
INSERT INTO `player_rating` (`id_player_rating`, `id_player`, `value_player_rating`, `force_player_rating`, `active_player_rating`) VALUES
	(1, 2, 300, 75, 0),
	(2, 2, 304, 76, 1),
	(3, 3, 316, 79, 1),
	(5, 1, 292, 73, 1),
	(6, 4, 196, 49, 1),
	(7, 5, 280, 70, 1);
/*!40000 ALTER TABLE `player_rating` ENABLE KEYS */;

-- Copiando dados para a tabela soccex.position_player: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `position_player` DISABLE KEYS */;
INSERT INTO `position_player` (`id_position_player`, `description_position_player`, `tiny_position_player`, `order_position_player`) VALUES
	(1, 'Goleiro', 'GOL', 1),
	(2, 'Lateral-direito', 'LTD', 2),
	(3, 'Lateral-esquerdo', 'LTE', 4),
	(4, 'Volante', 'VOL', 5),
	(5, 'Meio-campo', 'MEI', 6),
	(6, 'Atacante', 'ATA', 7),
	(7, 'Zagueiro', 'ZAG', 3);
/*!40000 ALTER TABLE `position_player` ENABLE KEYS */;

-- Copiando dados para a tabela soccex.professional_team: ~41 rows (aproximadamente)
/*!40000 ALTER TABLE `professional_team` DISABLE KEYS */;
INSERT INTO `professional_team` (`id_professional_team`, `name_professional_team`, `id_country`, `tiny_name_professional_team`, `division_professional_team`, `slug_professional_team`, `active_professional_team`, `avatar_professional_team`) VALUES
	(1, 'Cruzeiro Esporte Clube', 1, 'Cruzeiro', 1, 'cruzeiro', 1, 'cruzeiro.png'),
	(2, 'Clube Atlético Mineiro', 1, 'Atlético-MG', 1, 'atletico-mg', 1, 'default_shield.png'),
	(3, 'América Futebol Clube', 1, 'América-MG', 2, 'america-mg', 1, 'default_shield.png'),
	(5, 'Clube de Regatas Flamengo', 1, 'Flamengo', 1, 'flamengo', 1, 'default_shield.png'),
	(6, 'Sport Clube Recife', 1, 'Sport', 1, 'sport', 1, 'default_shield.png'),
	(7, 'Clube Atlético Paranaense', 1, 'Atlético-PR', 1, 'atletico-pr', 1, 'default_shield.png'),
	(8, 'Associação Chapecoense de Futebol', 1, 'Chapecoense', 1, 'chapecoense', 1, 'default_shield.png'),
	(9, 'São Paulo Futebol Clube', 1, 'São Paulo', 1, 'sao-paulo', 1, 'default_shield.png'),
	(10, 'Sport Club Corinthians Paulista', 1, 'Corinthians ', 1, 'corinthians', 1, 'default_shield.png'),
	(11, 'Fluminense Football Club', 1, 'Fluminense', 1, 'fluminense', 1, 'default_shield.png'),
	(12, 'Grêmio Foot-Ball Porto Alegrense', 1, 'Grêmio', 1, 'gremio', 1, 'default_shield.png'),
	(13, 'Associação Atlética Ponte Preta', 1, 'Ponte Preta', 1, 'ponte-preta', 1, 'default_shield.png'),
	(14, 'Sociedade Esportiva Palmeiras', 1, 'Palmeiras', 1, 'palmeiras', 1, 'default_shield.png'),
	(15, 'Avaí Futebol Clube', 1, 'Avaí', 1, 'avai', 1, 'default_shield.png'),
	(16, 'Santos Futebol Clube', 1, 'Santos', 1, 'santos', 1, 'default_shield.png'),
	(17, 'Goiás Esporte Clube', 1, 'Goiás', 1, 'goias', 1, 'default_shield.png'),
	(18, 'Club de Regatas Vasco da Gama', 1, 'Vasco da Gama', 1, 'vasco-gama', 1, 'default_shield.png'),
	(19, 'Coritiba Foot Ball Club', 1, 'Coritiba', 1, 'coritiba', 1, 'default_shield.png'),
	(20, 'Joinville Esporte Clube', 1, 'Joinville', 1, 'joinvile', 1, 'default_shield.png'),
	(21, 'Figueirense Futebol Clube', 1, 'Figueirense', 1, 'figueirense', 1, 'default_shield.png'),
	(22, 'Sport Club Internacional', 1, 'Internacional', 1, 'internacional', 1, 'default_shield.png'),
	(23, 'Boa Esporte Futebol Clube', 1, 'Boa Esporte', 2, 'boa-esporte', 1, 'default_shield.png'),
	(24, 'Ceará Sporting Club', 1, 'Ceará', 2, 'ceara', 1, 'default_shield.png'),
	(25, 'Clube Náutico Capibaribe', 1, 'Náutico', 2, 'nautico', 1, 'default_shield.png'),
	(26, 'Botafogo Futebol Clube', 1, 'Botafogo', 2, 'botafogo', 1, 'default_shield.png'),
	(27, 'Sampaio Corrêa Futebol Clube', 1, 'Sampaio Corrêa', 2, 'sampaio-correa', 1, 'default_shield.png'),
	(28, 'Macaé Esporte Futebol Clube', 1, 'Macaé', 2, 'macae', 1, 'default_shield.png'),
	(30, 'Esporte Clube Bahia', 1, 'Bahia', 2, 'bahia', 1, 'default_shield.png'),
	(31, 'Santa Cruz Futebol Clube', 1, 'Santa Cruz', 2, 'santa-cruz', 1, 'default_shield.png'),
	(32, 'ABC Futebol Clube', 1, 'ABC', 2, 'abc', 1, 'default_shield.png'),
	(33, 'Luverdense Esporte Clube', 1, 'Luverdense', 2, 'luverdense', 1, 'default_shield.png'),
	(34, 'Clube Regatas Brasil', 1, 'CRB', 2, 'crb', 1, 'default_shield.png'),
	(35, 'Esporte Clube Vitória', 1, 'Vitória', 2, 'vitoria', 1, 'default_shield.png'),
	(36, 'Atlético Clube Goianiense', 1, 'Atlético-GO', 2, 'atletico-go', 1, 'default_shield.png'),
	(37, 'Clube Atlético Bragantino', 1, 'Bragantino', 2, 'bragantino', 1, 'default_shield.png'),
	(38, 'Oeste Futebol Clube', 1, 'Oeste', 2, 'oeste', 1, 'default_shield.png'),
	(39, 'Paraná Clube', 1, 'Paraná', 2, 'parana', 1, 'default_shield.png'),
	(40, 'Criciúma Esporte Clube', 1, 'Criciúma', 2, 'criciuma', 1, 'default_shield.png'),
	(41, 'Paysandu Sport Club', 1, 'Paysandu', 2, 'paysandu', 1, 'default_shield.png'),
	(42, 'Mogi Mirim Esporte Clube', 1, 'Mogi Mirim', 2, 'mogi-mirim', 1, 'default_shield.png');
/*!40000 ALTER TABLE `professional_team` ENABLE KEYS */;

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

-- Copiando dados para a tabela soccex.quality_position_player: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `quality_position_player` DISABLE KEYS */;
INSERT INTO `quality_position_player` (`id_position_player`, `id_quality_player`) VALUES
	(1, 1);
/*!40000 ALTER TABLE `quality_position_player` ENABLE KEYS */;

-- Copiando dados para a tabela soccex.stadium: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `stadium` DISABLE KEYS */;
/*!40000 ALTER TABLE `stadium` ENABLE KEYS */;

-- Copiando dados para a tabela soccex.team: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` (`id_team`, `id_user`, `name_team`, `id_stadium`) VALUES
	(1, 1, 'Super Zero', NULL),
	(2, 2, 'Galão da Massa', NULL),
	(3, 3, 'Avacoelhando', NULL);
/*!40000 ALTER TABLE `team` ENABLE KEYS */;

-- Copiando dados para a tabela soccex.team_player: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `team_player` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_player` ENABLE KEYS */;

-- Copiando dados para a tabela soccex.user: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id_user`, `name_user`, `mail_user`, `pass_user`, `active_user`, `date_signup`, `hash_validate_user`) VALUES
	(1, 'nandorodpires@gmail.com', 'nandorodpires@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, '2015-05-20 09:11:27', '3bf41dd12219160398346caa66f543ee'),
	(2, 'fernando@olyva.com.br', 'fernando@olyva.com.br', 'e10adc3949ba59abbe56e057f20f883e', 0, '2015-05-20 16:10:50', 'd4073392452ecf1ee344a9111478b17b'),
	(3, 'contato@newfinances.com.br', 'contato@newfinances.com.br', 'e10adc3949ba59abbe56e057f20f883e', 0, '2015-05-20 16:13:52', '9d31ea2e934043fc1d56cb52fad804ca');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
