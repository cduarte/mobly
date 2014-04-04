-- phpMyAdmin SQL Dump
-- version 4.1.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 04, 2014 at 04:36 PM
-- Server version: 5.5.36-cll
-- PHP Version: 5.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mobly_prova`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Informática'),
(2, 'Telefonia'),
(3, 'Eletrodomestico'),
(4, 'Movéis'),
(5, 'Notebook');

-- --------------------------------------------------------

--
-- Table structure for table `category_product`
--

CREATE TABLE IF NOT EXISTS `category_product` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `fk_product_has_category_category1_idx` (`category_id`),
  KEY `fk_product_has_category_product_idx` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category_product`
--

INSERT INTO `category_product` (`product_id`, `category_id`) VALUES
(3, 1),
(5, 1),
(6, 1),
(4, 2),
(7, 2),
(8, 2),
(9, 2),
(1, 3),
(2, 3),
(10, 3),
(11, 3),
(12, 4),
(13, 4),
(14, 4),
(6, 5);

-- --------------------------------------------------------

--
-- Table structure for table `feature`
--

CREATE TABLE IF NOT EXISTS `feature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `feature`
--

INSERT INTO `feature` (`id`, `name`) VALUES
(1, 'Voltagem'),
(2, 'Tamanho da tela'),
(3, 'Sistema Operacional'),
(4, 'Processador'),
(5, 'Memória'),
(6, 'Quantidade de bocas'),
(7, 'Tipo de sofa'),
(8, 'Material'),
(9, 'Quantidade de lugares'),
(10, 'Gavetas/Portas');

-- --------------------------------------------------------

--
-- Table structure for table `feature_value`
--

CREATE TABLE IF NOT EXISTS `feature_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feature_id` int(11) NOT NULL,
  `value_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_feature_has_value_value1_idx` (`value_id`),
  KEY `fk_feature_has_value_feature1_idx` (`feature_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `feature_value`
--

INSERT INTO `feature_value` (`id`, `feature_id`, `value_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 4),
(5, 2, 5),
(6, 2, 6),
(7, 3, 7),
(8, 3, 8),
(9, 3, 9),
(10, 3, 10),
(11, 4, 11),
(12, 4, 12),
(13, 5, 13),
(14, 5, 14),
(15, 5, 15),
(16, 6, 16),
(17, 6, 17),
(18, 2, 18),
(19, 7, 20),
(20, 7, 19),
(21, 8, 22),
(22, 8, 21),
(23, 10, 24),
(24, 10, 25),
(25, 10, 23);

-- --------------------------------------------------------

--
-- Table structure for table `feature_value_product`
--

CREATE TABLE IF NOT EXISTS `feature_value_product` (
  `feature_value_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`feature_value_id`,`product_id`),
  KEY `fk_feature_value_has_product_product1_idx` (`product_id`),
  KEY `fk_feature_value_has_product_feature_value1_idx` (`feature_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `feature_value_product`
--

INSERT INTO `feature_value_product` (`feature_value_id`, `product_id`) VALUES
(1, 1),
(17, 1),
(2, 2),
(3, 3),
(4, 3),
(10, 3),
(11, 3),
(15, 3),
(1, 4),
(9, 4),
(18, 4),
(2, 5),
(6, 5),
(7, 5),
(11, 5),
(3, 6),
(5, 6),
(8, 6),
(12, 6),
(2, 7),
(9, 7),
(3, 8),
(8, 8),
(1, 9),
(8, 9),
(2, 10),
(3, 11),
(19, 12),
(22, 12),
(21, 13),
(25, 13),
(21, 14),
(24, 14);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_email` varchar(45) NOT NULL,
  `customer_name` varchar(45) NOT NULL,
  `customer_address` varchar(100) NOT NULL,
  `customer_city` varchar(45) NOT NULL,
  `customer_postcode` varchar(10) NOT NULL,
  `shipping_name` varchar(45) NOT NULL,
  `shipping_address` varchar(100) NOT NULL,
  `shipping_city` varchar(45) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `total` decimal(8,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `customer_email`, `customer_name`, `customer_address`, `customer_city`, `customer_postcode`, `shipping_name`, `shipping_address`, `shipping_city`, `shipping_postcode`, `total`) VALUES
(12, 'dos.santos.charles@gmail.com', 'Charles Duarte Santos', 'Barata Ribeiro', 'Rio de Janeiro', '22040-002', 'Charles', 'Barata Ribeiro', 'Rio de Janeiro', '22040-002', '1883.60'),
(13, 'felipeleobraga@gmail.com', 'Felipe Leonardo Braga', 'Rua Rosa do Povo', 'Rio de Janeiro', '22743-845', 'CHUPA', 'Rua Machado Portela', 'Rio de Janeiro', '22723-380', '522.00');

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE IF NOT EXISTS `order_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(45) DEFAULT NULL,
  `product_price` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_product_order1_idx` (`order_id`),
  KEY `fk_order_product_product1_idx` (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `order_product`
--

INSERT INTO `order_product` (`id`, `order_id`, `product_id`, `product_name`, `product_price`) VALUES
(14, 12, 6, 'Computador Notebook Samsung ', '1599.00'),
(15, 12, 7, 'Celular Nokia Asha 310 ', '284.60'),
(16, 13, 1, 'Fogão Brastemp', '522.00');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `image`, `price`) VALUES
(1, 'Fogão Brastemp', '<div class="chosenProds infoP" style="margin: 0px 0px 40px; padding: 0px; color: #666666; font-family: arial, freesans, garuda, helvetica, verdana, sans-serif; line-height: 13.199999809265137px;"><strong style="margin: 0px 0px 20px; padding: 0px; font-size: 1.1em; display: block;"><strong style="margin: 0px 0px 20px; padding: 0px; font-size: 1.1em; display: block;"></strong></strong> <div class="chosenProds infoP" style="margin: 0px 0px 40px; padding: 0px; font-size: 11px; font-weight: normal;"><strong style="margin: 0px 0px 20px; padding: 0px; font-size: 1.1em; display: block;">Fog&atilde;o G&aacute;s 5 bocas M&ocirc;naco Inox VS 13</strong></div> <strong style="margin: 0px 0px 20px; padding: 0px; font-size: 1.1em; display: block;"><strong style="margin: 0px 0px 20px; padding: 0px; font-size: 1.1em; display: block;"></strong></strong> <div class="infoProd" style="margin: 0px; padding: 0px; font-size: 11px; font-weight: normal;"> <p style="margin: 1.2em 0px; padding: 0px; font-size: 1.1em;">Para preparar as del&iacute;cias do dia a dia, ou aquela comidinha especial para festas e grandes ocasi&otilde;es &eacute; sempre bom ter um produto de qualidade que facilite sua vida e ainda seja bonito, com design moderno e que seja pratico e f&aacute;cil de usar.&nbsp;<br style="margin: 0px; padding: 0px;" /><br style="margin: 0px; padding: 0px;" />O<strong style="margin: 0px; padding: 0px;">&nbsp;Fog&atilde;o &agrave; G&aacute;s 5 bocas M&ocirc;naco</strong>&nbsp;traz todos os benef&iacute;cios e facilidades que sua cozinha precisa. Com os Fog&otilde;es da M&ocirc;naco voc&ecirc; vai ter mais inspira&ccedil;&atilde;o para elaborar deliciosas receitas para sua fam&iacute;lia. Al&eacute;m disso, conta com grades individuais que acomodam melhor as panelas.&nbsp;<br style="margin: 0px; padding: 0px;" /><br style="margin: 0px; padding: 0px;" />Ele possui frente em A&ccedil;o Inox, com laterais pintadas na cor cinza. Possui acendimento autom&aacute;tico total, forno auto-limpante, vidro duplo na porta do forno, vidro total espelhado.&nbsp;<br style="margin: 0px; padding: 0px;" />. Com 1 grade fixa no forno,&nbsp;<strong style="margin: 0px; padding: 0px;">Mega Chama</strong>&nbsp;3000W, 2 queimadores fam&iacute;lia, queimadores esmaltados, tampa de vidro sem puxador, mesa em a&ccedil;o inox sobreposta, perfeito para preparar refei&ccedil;&otilde;es gostosas o tempo todo.&nbsp;<br style="margin: 0px; padding: 0px;" /><br style="margin: 0px; padding: 0px;" /><strong style="margin: 0px; padding: 0px;">Tome cuidado ao manusear o produto quando quente. Riscos de queimadura.&nbsp;</strong></p> </div> </div>', 'http://iacom.s8.com.br/produtos/01/00/item/115053/2/115053276G1.jpg', '522.00'),
(2, 'Micro-ondas Philco', '<div class="chosenProds infoP" style="margin: 0px 0px 40px; padding: 0px; color: #666666; font-family: arial, freesans, garuda, helvetica, verdana, sans-serif; line-height: 13.199999809265137px;"><strong style="margin: 0px 0px 20px; padding: 0px; font-size: 1.1em; display: block;">Micro-ondas Philco PME25 - 25L c/ Tecla Preparo R&aacute;pido Espelhado</strong></div> <div class="infoProd" style="margin: 0px; padding: 0px; color: #666666; font-family: arial, freesans, garuda, helvetica, verdana, sans-serif; line-height: 13.199999809265137px;"> <p style="margin: 1.2em 0px; padding: 0px; font-size: 1.1em;">Obtenha mais praticidade ao cozinhar com este forno micro-ondas&nbsp;<strong style="margin: 0px; padding: 0px;">PME25</strong>, desse jeito &eacute; poss&iacute;vel preparar deliciosas refei&ccedil;&otilde;es para voc&ecirc; e toda fam&iacute;lia rapidamente.<br style="margin: 0px; padding: 0px;" /><br style="margin: 0px; padding: 0px;" />S&atilde;o diversas as fun&ccedil;&otilde;es que v&atilde;o torna o seu dia a dia na cozinha mais f&aacute;cil. Tais como op&ccedil;&otilde;es de cozinhar e descongelar alimentos por peso, fun&ccedil;&atilde;o reaquecer e teclas f&aacute;ceis que elabora os pratos favoritos da garotada.<br style="margin: 0px; padding: 0px;" /><br style="margin: 0px; padding: 0px;" /><strong style="margin: 0px; padding: 0px;">Funcionalidades</strong><br style="margin: 0px; padding: 0px;" /><br style="margin: 0px; padding: 0px;" /><strong style="margin: 0px; padding: 0px;">Fun&ccedil;&atilde;o Descongelar:</strong>&nbsp;possui duas op&ccedil;&otilde;es de descongelamento o r&aacute;pido e por peso.<br style="margin: 0px; padding: 0px;" /><strong style="margin: 0px; padding: 0px;">Fun&ccedil;&atilde;o Timer:</strong>&nbsp;programe com anteced&ecirc;ncia o hor&aacute;rio do preparo do alimento a ser cozido.<br style="margin: 0px; padding: 0px;" /><strong style="margin: 0px; padding: 0px;">Teclas F&aacute;ceis:</strong>&nbsp;contam com as fun&ccedil;&otilde;es KIDS, que prepara de modo r&aacute;pido receitas como brigadeiro e pipoca. E Cozinhar que aquece e reaquece batatas, lasanha e pizza.<br style="margin: 0px; padding: 0px;" /><strong style="margin: 0px; padding: 0px;">Trava de Seguran&ccedil;a:</strong>&nbsp;ideal para manter o teclado bloqueado, isso evita que pessoas n&atilde;o autorizadas ativem alguma fun&ccedil;&atilde;o. Para bloquear o produto, basta pressionar a tecla&nbsp;<strong style="margin: 0px; padding: 0px;">cancelar</strong>&nbsp;por alguns segundos.<br style="margin: 0px; padding: 0px;" />Design diferenciado: micro-ondas com acabamento na cor prata, sendo que a porta e painel possui efeito espelhado o que tornar&aacute; sua cozinha muito mais sofisticada.</p> </div>', 'http://iacom.s8.com.br/produtos/01/00/item/113998/2/113998217SZ.jpg', '350.00'),
(3, 'Computador Mac Mini ', '<p dir="ltr" style="line-height: 1.15; margin-top: 0pt; margin-bottom: 8pt;"><span style="font-size: 11px; font-family: Arial; color: #333333; background-color: #ffffff; font-weight: normal; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Viva a vida digital com simplicidade e estilo - at&eacute; quatro vezes mais r&aacute;pido! Com apenas 20 cent&iacute;metros de largura e 3,6 cent&iacute;metros de altura, o Mac mini proporciona mais divers&atilde;o para suas m&uacute;sicas, fotos e v&iacute;deos, com mais rapidez e facilidade.O caminho mais acess&iacute;vel para a tecnologia com o processador Intel Core i5! </span></p> <p dir="ltr" style="line-height: 1.15; margin-top: 0pt; margin-bottom: 8pt;"><span style="font-size: 11px; font-family: Arial; color: #333333; background-color: #ffffff; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">A pot&ecirc;ncia nunca foi t&atilde;o econ&ocirc;mica</span></p> <p dir="ltr" style="line-height: 1.15; margin-top: 0pt; margin-bottom: 8pt;"><span style="font-size: 11px; font-family: Arial; color: #333333; background-color: #ffffff; font-weight: normal; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Com a terceira gera&ccedil;&atilde;o de processadores Intel Core, o Mac mini est&aacute; &agrave; altura de computadores com o dobro do seu tamanho. Voc&ecirc; pode escolher um Intel Core i5 de 2,5GHz ou um Intel Core i7 quad core de 2,6GHz ainda mais potente para ter um desempenho duas vezes maior que a gera&ccedil;&atilde;o anterior de Mac mini dual core. Tudo se torna muito mais f&aacute;cil e acess&iacute;vel como trabalhar com fotos digitais, v&iacute;deos, m&uacute;sicas e Internet. Esse modelo traz a potencia e a velocidade espantosa do Intel Core i5. O Mac mini, em conjunto com uma arquitetura totalmente surpreendente, mais o Mac OS X, o sistema operacional mais avan&ccedil;ado do mundo, executa os softwares modernos e inovadores do mercado rapidamente. E quando voc&ecirc; usar aplicativos que exigem muito do processador, conte com a tecnologia Turbo Boost 2.0, que aumenta a velocidade do clock para at&eacute; 3.6GHz. Na tecnologia Hyper-Threading, cada n&uacute;cleo executa dois threads, por isso o OS X executa v&aacute;rias tarefas ao mesmo tempo com mais efici&ecirc;ncia. Um controlador de mem&oacute;ria integrado conecta a r&aacute;pida mem&oacute;ria de 1600MHz ao processador, manipulando diretamente os dados. Em resumo, o Mac mini &eacute; uma caixinha de muita pot&ecirc;ncia. </span></p> <p dir="ltr" style="line-height: 1.15; margin-top: 0pt; margin-bottom: 8pt;"><span style="font-size: 11px; font-family: Arial; color: #333333; background-color: #ffffff; font-weight: bold; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Thunderbolt. A mais r&aacute;pida e mais vers&aacute;til</span></p> <p><span id="docs-internal-guid-93ef8f64-2d84-4099-3c1f-3fe588c988bd"><span style="font-family: Arial; color: #333333; vertical-align: baseline; white-space: pre-wrap;">A tecnologia Thunderbolt do Mac mini &eacute; incrivelmente r&aacute;pida. Vem com dois canais de 10 Gbps para transfer&ecirc;ncia de dados. Essa tecnologia &eacute; at&eacute; 12 vezes mais r&aacute;pida que a FireWire 800 e at&eacute; 2 vezes mais r&aacute;pida que a USB 2.0. Mas al&eacute;m da velocidade, a tecnologia Thunderbolt tamb&eacute;m oferece uma capacidade de expans&atilde;o extraordin&aacute;ria. Voc&ecirc; pode conectar at&eacute; seis dispositivos Thunderbolt, inclusive dois Apple Thunderbolt Displays, em uma &uacute;nica porta. Como o Thunderbolt se baseia na tecnologia DisplayPort, os dispositivos Mini DisplayPort como o Apple LED Cinema Display tamb&eacute;m s&atilde;o conectados diretamente.</span></span></p>', 'http://isuba.s8.com.br/produtos/01/03/item/112182/2/112182283SZ.jpg', '3099.00'),
(4, 'Tablet Dell Venue 8', '<p dir="ltr" style="line-height: 1.4625; margin-top: 0pt; margin-bottom: 8pt;"><span style="font-size: 11px; font-family: Arial; color: #333333; background-color: #ffffff; font-weight: normal; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Para voc&ecirc; que exige tecnologia de &uacute;ltima gera&ccedil;&atilde;o e n&atilde;o abre m&atilde;o de alto desempenho, a Dell traz o Tablet Venue 8 &eacute; o equipamento perfeito. Imagine poder se conectar e interagir com os amigos e a fam&iacute;lias onde voc&ecirc; estiver, sempre que possuir uma rede de internet m&oacute;vel dispon&iacute;vel. Com a configura&ccedil;&atilde;o do Tablet Dell Venue 8 &eacute; poss&iacute;vel.</span></p> <p dir="ltr" style="line-height: 1.4625; margin-top: 0pt; margin-bottom: 8pt;"><span style="font-size: 11px; font-family: Arial; color: #333333; background-color: #ffffff; font-weight: normal; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Produzido com um design compacto e leve, com menos de 9,5mm de espessura, o Dell Venue 8 conta com uma Tela Multitouch de 8 polegadas, um Processador Intel Atom Z2580, com 2 n&uacute;cleos e at&eacute; 2,0GHz, e 16GB de mem&oacute;ria interna para voc&ecirc; armazenar mais arquivos sem a preocupa&ccedil;&atilde;o com a limita&ccedil;&atilde;o de espa&ccedil;o.</span></p> <p>&nbsp;</p> <p dir="ltr" style="line-height: 1.4625; margin-top: 0pt; margin-bottom: 8pt;"><span style="font-size: 11px; font-family: Arial; color: #333333; background-color: #ffffff; font-weight: normal; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Com o Tablet Dell Venue 8 captura imagens a partir da C&acirc;mera Traseira de 5.0 Megapixels com maior nitidez e pode participar de uma videoconfer&ecirc;ncia usando sua C&acirc;mera Frontal de 2 Megapixels HD. Voc&ecirc; ainda conta com acesso completo de qualquer lugar gra&ccedil;as ao Pocket Cloud 2.0 que oferece compartilhamento e acesso a conte&uacute;do de seu PC, smartphone e tablet onde quer que voc&ecirc; v&aacute;. Descubra mais sobre o tablet que todo mundo quer.</span></p>', 'http://isuba.s8.com.br/produtos/01/00/item/117624/3/117624327SZ.jpg', '949.00'),
(5, 'Computador H520-90A3A9P ', '<p dir="ltr" style="line-height: 1.15; margin-top: 0pt; margin-bottom: 0pt;"><span style="font-size: 11px; font-family: Arial; color: #333333; background-color: #ffffff; font-weight: normal; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Com Windows 8, processador Intel Core i3, 6GB de mem&oacute;ria RAM e 500GB de HD, o computador Lenovo &eacute; capaz de executar diversas tarefas ao mesmo tempo e ainda proporcionar momentos de entretenimento para voc&ecirc; e sua fam&iacute;lia.Al&eacute;m da qualidade Lenovo, voc&ecirc; ainda ter&aacute; neste kit todo o realismo e nitidez de imagens com o monitor LG.</span></p> <p dir="ltr" style="line-height: 1.15; margin-top: 0pt; margin-bottom: 0pt;"><span style="font-size: 11px; font-family: Arial; color: #333333; background-color: #ffffff; font-weight: normal; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Econ&ocirc;mica e pr&aacute;tica, a aparelhagem vai agregar muita interatividade e tecnologia em seu dia a dia.</span></p> <p dir="ltr" style="line-height: 1.15; margin-top: 0pt; margin-bottom: 0pt;"><span style="font-size: 11px; font-family: Arial; color: #333333; background-color: #ffffff; font-weight: normal; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Computador LenovoConforme o mundo e a tecnologia evoluem, suas necessidades tamb&eacute;m v&atilde;o mudando. Ter um computador que acompanhe essas inova&ccedil;&otilde;es &eacute; extremamente necess&aacute;rio. O H520-90A3A9P da Lenovo &eacute; ideal para quem busca se atualizar constantementeCom 6GB de mem&oacute;ria, 500GB de HD, processador Intel Core i3 e Windows 8, computador possui todas as necessidades essenciais para voc&ecirc; trabalhar com efici&ecirc;ncia e manter seu dia a dia mais organizado e produtivo.</span><span style="font-size: 11px; font-family: Arial; color: #333333; background-color: #ffffff; font-weight: normal; font-style: italic; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Design</span></p> <p><span id="docs-internal-guid-93ef8f64-2d89-fdf0-0d76-a10481224456"><span style="font-family: Arial; color: #333333; vertical-align: baseline; white-space: pre-wrap;">O gabinete do H520 &eacute; extremamente elegante e funcional. Extremamente simples para integrar ao ambiente de casa ou escrit&oacute;rio, pois n&atilde;o polui o visual da mesa de trabalho, estudos e onde quer que voc&ecirc; queira coloc&aacute;-lo.</span></span></p>', 'http://isuba.s8.com.br/produtos/01/00/item/116179/2/116179250SZ.jpg', '2089.00'),
(6, 'Computador Notebook Samsung ', '<p><span id="docs-internal-guid-93ef8f64-2d8b-79e2-7498-3ce27ae024e2"><span style="font-family: Arial; color: #333333; vertical-align: baseline; white-space: pre-wrap;">Com Windows 8, processador Intel Core 3 i3, 4GB de mem&oacute;ria RAM e 500GB de HD voc&ecirc; ter&aacute; uma verdadeira m&aacute;quina moderna e com &oacute;timo custo benef&iacute;cio atrav&eacute;s do notebook Samsung ATIV Book 2.Agregue agilidade, praticidade e fluidez em suas tarefas di&aacute;rias, al&eacute;m de momentos de entretenimento com divers&atilde;o e nitidez de imagem e som. O aparelho possui todas as caracter&iacute;sticas para proporcionar ao usu&aacute;rio o melhor desempenho em inform&aacute;tica.A eleg&acirc;ncia de um design diferenciado, por um pre&ccedil;o acess&iacute;vel. O Samsung ATIV Book 2 &eacute; o notebook com todos os recursos essenciais, que cabe em qualquer or&ccedil;amento.Acesse todos os conte&uacute;dos online, redes sociais, e-mails e muito mais, com essa verdadeira maravilha da tecnologia.Al&eacute;m disso, voc&ecirc; ir&aacute; interagir constantemente, podendo assistir a filmes e v&iacute;deos, ouvir m&uacute;sicas, compartilhar fotos e jogar online com precis&atilde;o, detalhes relevantes e alto desempenho.</span></span></p>', 'http://isuba.s8.com.br/produtos/01/00/item/113851/9/113851952SZ.jpg', '1599.00'),
(7, 'Celular Nokia Asha 310 ', '<p>&nbsp;</p> <p dir="ltr" style="line-height: 1.4; margin-top: 0pt; margin-bottom: 10pt;"><span style="font-size: 11px; font-family: Arial; color: #000000; background-color: #ffffff; font-weight: normal; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">A Nokia, sempre transformando o modo como voc&ecirc; conecta sua vida ao mundo, traz o Asha 310 Dual Chip, um aparelho que combina design com funcionalidade e uma mem&oacute;ria interna de 50MB expandida atrav&eacute;s do cart&atilde;o de mem&oacute;ria de 2GB.Seu design de tamanho pr&aacute;tico e confort&aacute;vel &eacute; complementado por uma Tela Touchscreen de 3" resistente &agrave; riscos, que permite a perfeita visualiza&ccedil;&atilde;o de fotos e v&iacute;deos feitos a partir da C&acirc;mera de 2MP. O Asha 310 conta ainda com Troca R&aacute;pida de Chip que dispensa inclusive a retirada da bateria para efetu&aacute;-la. Feito para surpreender, o Nokia Asha 310 permite que voc&ecirc; atenda chamadas, alterne entre aplicativos, responda suas mensagens e navegue pelas redes sociais na tela do seucelular com um simples deslize do dedo atrav&eacute;s do novo browser Nokia Express.Fique sempre conectado e tenha seus amigos sempre perto de voc&ecirc; com o Nokia Asha 310, </span><a style="text-decoration: none;" href="http://www.submarino.com.br/sublinha/276349/celulares-e-telefonia-fixa/celulares/celular-2-chips-dual-chip"><span style="font-size: 11px; font-family: Arial; color: #000000; background-color: #ffffff; font-weight: normal; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">um celular perfeito</span></a><span style="font-size: 11px; font-family: Arial; color: #000000; background-color: #ffffff; font-weight: normal; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> para seu estilo de vida.</span></p>', 'http://isuba.s8.com.br/produtos/01/00/item/113064/4/113064414SZ.jpg ', '284.60'),
(8, 'Celular Samsung Ch@t 333 ', '<p>&nbsp;</p> <p dir="ltr" style="line-height: 1.4; margin-top: 0pt; margin-bottom: 10pt;"><span style="font-size: 11px; font-family: Arial; color: #000000; background-color: #ffffff; font-weight: normal; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">De forma r&aacute;pida e pr&aacute;tica o Samsung Ch@t 333 permite a utiliza&ccedil;&atilde;o de tr&ecirc;s chips em um s&oacute; aparelho, dessa maneira voc&ecirc; n&atilde;o ter&aacute; de escolher entre uma ou outra operadora, tenha as melhores vantagens das tr&ecirc;s! Ideal para quem quer separar sua vida pessoal da vida profissional, seu teclado QWERTY &eacute; perfeito para voc&ecirc; desfrutar de acesso ao seu e-mail, suas redes sociais favoritas e at&eacute; mensagens instant&acirc;neas, a qualquer momento, em qualquer lugar com muita rapidez e def&aacute;cil visibilidade. Esteja sempre conectado com os clientes, amigos, colegas de trabalho e fam&iacute;lia!Registre seus melhores momentos com uma resolu&ccedil;&atilde;o de 2 megapixels da c&acirc;mera, envie arquivos pela conex&atilde;o bluetooth e ou&ccedil;a suas m&uacute;sicas favoritas em um s&oacute; celular! Verifique com os fabricantes do produto e de seus componentes eventuais limita&ccedil;&otilde;es &agrave; utiliza&ccedil;&atilde;o de todos os recursos e funcionalidades. Todas as informa&ccedil;&otilde;es divulgadas s&atilde;o de responsabilidade do Fabricante/Fornecedor. Imagem meramente ilustrativa.</span></p>', 'http://isuba.s8.com.br/produtos/01/00/item/113743/3/113743370SZ.jpg', '265.00'),
(9, 'Celular Nokia Lumia 520 ', 'A Nokia conecta você com o mundo através da tecnologia do Lumia 50, um smartphone construído para agradar quem procura por configuração que atenda a rapidez do seu dia a dia. Com um Processador SnapDragon S4 de 1GHz que vai transformar sua vida em uma experiência interativa, o Nokia Lumia 520 combina design inovador com incrível memória interna de 8GB para o armazenamento de vídeos e das incríveis fotos feitas com a câmera de última geração com 5 megapixels. Sua tela LCD de 4 polegadas, com toque supersensível que garante eficiência mesmo você estando com luvas, possui controle de brilho e sensor de luz ambiente que auxilia na melhor definição e resulta em alta qualidade de visualização. O Lumia 520 conta ainda com sistema operacional Windows Phone 8, oferecendo inúmeras funcionalidades como o Pacote Office que garante acesso a todos seus arquivos para você trabalhar onde estiver.Com ele você também tem acesso a Internet 3G e Wi-Fi, navegando com o Explorer 10 ou com a exclusiva Navegação GPS e, para seu entretenimento, um Music Player com equalizador de áudio. Um celular perfeito para seu estilo de vida.Mergulhe no mundo da tecnologia com o Nokia Lumia 520.', 'http://img.submarino.com.br/produtos/01/00/item/113113/0/113113001_1GG.jpg', '474.60'),
(10, 'Ar Condicionado Mono Split ', 'O Ar Condicionado Mono Split Consul Bem Estar vem com um exclusivo filtro de ar que evita a proliferação de bactérias, fungos e ácaros, deixando o ar muito mais saudável para a sua família. A linha Mono Split irá tornar seus espaços mais agradáveis, com temperaturas adequadas que contribuem com o conforto e saúde dos frequentadores do ambiente.A qualidade deste produto reflete diretamente na sua qualidade de vida. Adquira um produto moderno e com grande flexibilidade de instalação. Possui controle remoto total com display de cristal líquido que contempla todas as funções do aparelho. Economia e proteção para você e sua família respirar o ar que merecem, e na temperatura certa. Quem respira melhor, vive melhor. \n', 'http://iacom.s8.com.br/produtos/01/00/item/111974/1/111974107SZ.jpg\n', '1499.00'),
(11, 'Lavadora e Secadora LG ', 'Passe mais tempo aproveitando a família graças a inovação que LG traz para você. Com a Lava e Seca 6 Motion WD1412RT, um equipamento que conta com lavagem e secagem de forma rápida e sem esforço você reduz o tempo que fica na lavanderia e aproveita muito mais o seu dia.Com um design em aço escovado e programação através de Painel Touch em LED, a LG 6 Motion conta com funções pré-programadas de alta performance e 6 movimentos de lavagem que combinados, tornam a lavagem ainda mais eficiente na eliminação de sujeiras. Sua capacidade para até 10,2Kg se deve ao motor de alta tecnologia que não utiliza polia e nem correias, o que garante ainda mais durabilidade, e redução do ruído e vibração. Adequando-se com todos os tipos de tecido, a LG 6 Motion permite a secagem de suas roupas através da condensação de ar que retém a umidade evitando a formação de rugas e deixando as peças mais lisas.Com a Lava e Seca 6 Motion WD1412RT e sua simples forma de uso, caso haja algum erro de manuseio, você conta com um SAC exclusivo que identifica e orienta a resolução sem a necessidade de aguardar a visita de um técnico.', 'http://iacom.s8.com.br/produtos/01/00/item/116993/2/116993243SZ.jpg', '2999.00'),
(12, 'Sofá Cama Daiane Plus', 'Móvel de duas utilidades: Sofá de dois lugares quando fechado e cama quando aberto. Proporciona maior conforto e revestimento, valorizando cada detalhe do produto. Para dar mais flexibilidade e resistência são usadas percintas elásticas em sua estrutura, garantindo sua durabilidade, mas sem abrir mão do conforto\n', 'http://i.mlcdn.com.br/1500x1500/sofa-cama-daiane-plus-2-lugaresmatrix-122111808.jpg', '399.00'),
(13, 'Guarda Roupa Casal ', 'Móvel de duas utilidades: Sofá de dois lugares quando fechado e cama quando aberto. Proporciona maior conforto e revestimento, valorizando cada detalhe do produto. Para dar mais flexibilidade e resistência são usadas percintas elásticas em sua estrutura, garantindo sua durabilidade, mas sem abrir mão do conforto', 'http://i.mlcdn.com.br/1500x1500/guarda-roupa-casal-italia-3-portas-3-gavetas2-sapateiras-demobile-123459781.jpg', '690.00'),
(14, 'Mesa para Computador', 'Mesa de canto com opção de montagem tanto para a direita como para a esquerda. Possui três gavetas com corrediças metálicas e armário com duas portas. Ideal para o seu escritório, possui espaço para teclado, mouse, CPU e monitor', 'http://i.mlcdn.com.br/1500x1500/mesa-para-computador-escrivaninha-kit-espanha2-portas-3-gavetas-politorno-200740800.jpg', '449.00');

-- --------------------------------------------------------

--
-- Table structure for table `value`
--

CREATE TABLE IF NOT EXISTS `value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `value`
--

INSERT INTO `value` (`id`, `value`) VALUES
(1, '110v'),
(2, '220v'),
(3, 'Bivolt'),
(4, '12'),
(5, '14'),
(6, '15'),
(7, 'Linux'),
(8, 'Windows'),
(9, 'Android'),
(10, 'iOS'),
(11, 'i5'),
(12, 'i7'),
(13, '2Gb'),
(14, '4Gb'),
(15, '8Gb'),
(16, '4'),
(17, '5'),
(18, '8'),
(19, '2 lugares'),
(20, '3 lugares'),
(21, 'Tecido Suede Amassado'),
(22, 'Madeira'),
(23, '5'),
(24, '4'),
(25, '3');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category_product`
--
ALTER TABLE `category_product`
  ADD CONSTRAINT `fk_product_has_category_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_product_has_category_category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `feature_value`
--
ALTER TABLE `feature_value`
  ADD CONSTRAINT `fk_feature_has_value_feature1` FOREIGN KEY (`feature_id`) REFERENCES `feature` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_feature_has_value_value1` FOREIGN KEY (`value_id`) REFERENCES `value` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `feature_value_product`
--
ALTER TABLE `feature_value_product`
  ADD CONSTRAINT `fk_feature_value_has_product_feature_value1` FOREIGN KEY (`feature_value_id`) REFERENCES `feature_value` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_feature_value_has_product_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `fk_order_product_order1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_order_product_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
