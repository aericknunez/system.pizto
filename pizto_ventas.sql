-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 15-06-2020 a las 06:44:52
-- Versión del servidor: 5.7.17-log
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pizto_ventas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alter_materiaprima_reporte`
--

CREATE TABLE `alter_materiaprima_reporte` (
  `id` int(6) NOT NULL,
  `producto` int(6) NOT NULL,
  `td` int(2) NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='tabla para los productos que se muestran en el reporte especial';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alter_opciones`
--

CREATE TABLE `alter_opciones` (
  `id` int(5) NOT NULL,
  `icono` varchar(50) NOT NULL,
  `up_fecha` varchar(30) NOT NULL,
  `actualizar` int(6) NOT NULL,
  `td` int(2) NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `alter_opciones`
--

INSERT INTO `alter_opciones` (`id`, `icono`, `up_fecha`, `actualizar`, `td`, `hash`, `time`) VALUES
(2, '22953', '', 1, 0, '3d0b3223a0', 1588972865);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alter_producto_reporte`
--

CREATE TABLE `alter_producto_reporte` (
  `id` int(6) NOT NULL,
  `producto` int(6) NOT NULL,
  `td` int(2) NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='tabla para los productos que se muestran en el reporte especial';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(6) NOT NULL,
  `cod` int(4) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `edo` int(2) NOT NULL,
  `td` int(2) NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `cod`, `categoria`, `edo`, `td`, `hash`, `time`) VALUES
(1, 9901, 'Clasicas', 0, 0, '2549f68fd4', 1565038137),
(2, 9902, 'Especialidades', 0, 0, '355bd133a6', 1565038137),
(3, 9903, 'Gourmet Esp', 0, 0, '509841b7d4', 1565038137),
(4, 9904, 'Alitas', 0, 0, '3e012209e2', 1565038137),
(5, 9905, 'Extras', 0, 0, '458381337c', 1565038137);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(6) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `documento` varchar(50) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `municipio` varchar(50) NOT NULL,
  `departamento` varchar(25) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `nacimiento` varchar(50) NOT NULL,
  `comentarios` text NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL,
  `td` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `documento`, `direccion`, `municipio`, `departamento`, `telefono`, `email`, `nacimiento`, `comentarios`, `hash`, `time`, `td`) VALUES
(17, 'ERICK ADONAI NUNEZ', '03547604-0', 'Las Americas 1, pol I #4', 'Metapan', 'Santa Ana', '60623882', 'aerick@gmail.com', '21-03-1986', ' El mejor cliente de todos', '6069b22778', 1588880946, 0),
(18, 'NEAGAN NUNEZ', '79845487-9', 'Las americas', 'Metapan', 'santa Ana', '98562352', 'neagan@gmail.com', '15-09-1990', ' Es el mejor de todos. le gusta bastante la pizza', '8cb1b9f3db', 1588881159, 0),
(19, 'AZUCENA GUTIERREZ', '79879877-9', 'Las americas 1', 'Metapan', 'Santa Ana', '78458785', 'azu@gmail.com', '13-01-1993', ' Vive en frente de los palos', 'bf1c801d74', 1588882750, 0),
(48, 'JUAN PEREZ', '32132121-4', 'Las Americas', 'Metapan', 'Santa Ana', '68258965', 'juan@gmailcom', '16-07-1986', ' El que vive frente a la casa azul', '7f955ea4c3', 1588892262, 0),
(51, 'ENRIQUE BUNBURY', '65656598-9', 'Las americas', 'Metapan', 'santa Ana', '87871245', 'bunbury@gmail.com', '03-05-2013', ' El mejor cantante', '52b898bc20', 1588892836, 0),
(52, 'JAZMIN NUNEZ', '54654654-8', 'Las americas 1, po I', 'Metapan', 'Santa Ana', '13213154', 'jaz@gmail.com', '24-08-2000', '  Vicha loca', '796272d58e', 1588901791, 0),
(53, 'MORENO PELUCHE', '78984565', 'Las Americas 2 pol 5 #8', 'Metapan', 'Santa Ana', '69896523', 'moreno@gmail.com', '13-09-2000', ' ', '33ad75cc48', 1588941407, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes_mesa`
--

CREATE TABLE `clientes_mesa` (
  `id` int(6) NOT NULL,
  `cliente` varchar(12) NOT NULL,
  `mesa` int(6) NOT NULL,
  `repartidor` varchar(12) NOT NULL,
  `tx` int(2) NOT NULL,
  `edo` int(1) NOT NULL COMMENT '1 activo, 2 enviado, 3 entregado, 4 pagado ',
  `tiempo_activo` varchar(20) NOT NULL,
  `tiempo_enviado` varchar(20) NOT NULL,
  `tiempo_entregado` varchar(20) NOT NULL,
  `tiempo_pagado` varchar(20) NOT NULL,
  `tiempo_activoF` varchar(20) NOT NULL,
  `tiempo_enviadoF` varchar(20) NOT NULL,
  `tiempo_entregadoF` varchar(20) NOT NULL,
  `tiempo_pagadoF` varchar(20) NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL,
  `td` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='LLeva el control de los clientes del delivery';

--
-- Volcado de datos para la tabla `clientes_mesa`
--

INSERT INTO `clientes_mesa` (`id`, `cliente`, `mesa`, `repartidor`, `tx`, `edo`, `tiempo_activo`, `tiempo_enviado`, `tiempo_entregado`, `tiempo_pagado`, `tiempo_activoF`, `tiempo_enviadoF`, `tiempo_entregadoF`, `tiempo_pagadoF`, `hash`, `time`, `td`) VALUES
(3, '6069b22778', 34, 'c295a8bd8a', 0, 4, '12:52:36', '13:54:14', '13:54:23', '13:55:00', '1589309556', '1589313254', '1589313263', '1589313300', '57249369ba', 1589313300, 0),
(4, '796272d58e', 35, 'c295a8bd8a', 0, 4, '09:55:38', '09:55:58', '09:57:35', '09:57:38', '1589385338', '1589385358', '1589385455', '1589385458', '3a95470b8f', 1589385458, 0),
(5, '8cb1b9f3db', 36, 'ef4e140a30', 0, 4, '10:19:41', '10:20:33', '10:20:35', '10:20:49', '1589386781', '1589386833', '1589386835', '1589386849', '002b4c8e7e', 1589386849, 0),
(12, '6069b22778', 52, 'ef4e140a30', 0, 4, '12:21:26', '12:21:54', '12:21:57', '12:22:06', '1591294886', '1591294914', '1591294917', '1591294926', '8e0d753538', 1591294926, 0),
(17, '8cb1b9f3db', 53, '', 0, 4, '12:25:54', '12:26:02', '12:26:09', '12:26:22', '1591295154', '1591295162', '1591295169', '1591295182', '21456a8940', 1591295182, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `config_master`
--

CREATE TABLE `config_master` (
  `id` int(6) NOT NULL,
  `sistema` varchar(60) NOT NULL,
  `cliente` varchar(60) NOT NULL,
  `slogan` varchar(60) NOT NULL,
  `propietario` varchar(60) NOT NULL,
  `telefono` varchar(30) NOT NULL,
  `giro` varchar(60) NOT NULL,
  `nit` varchar(40) NOT NULL,
  `imp` float(10,2) NOT NULL,
  `propina` float(10,2) NOT NULL,
  `direccion` varchar(60) NOT NULL,
  `email` varchar(50) NOT NULL,
  `imagen` varchar(50) NOT NULL,
  `logo` varchar(50) NOT NULL,
  `skin` varchar(30) NOT NULL,
  `tipo_inicio` int(2) NOT NULL COMMENT '1= rapida 2 = mesas',
  `pais` varchar(50) NOT NULL,
  `moneda` varchar(30) NOT NULL,
  `moneda_simbolo` varchar(10) NOT NULL,
  `nombre_impuesto` varchar(10) NOT NULL,
  `nombre_documento` varchar(10) NOT NULL,
  `inicio_tx` int(2) NOT NULL,
  `otras_ventas` int(2) NOT NULL COMMENT '0 inactivo, 1 activo',
  `venta_especial` int(2) NOT NULL COMMENT '0 inactivo, 1 activo',
  `imprimir_antes` varchar(4) DEFAULT NULL COMMENT 'imprimir antes de cobrar',
  `cambio_tx` varchar(4) DEFAULT NULL COMMENT 'Permitir Cambio Tx',
  `td` int(5) NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `config_master`
--

INSERT INTO `config_master` (`id`, `sistema`, `cliente`, `slogan`, `propietario`, `telefono`, `giro`, `nit`, `imp`, `propina`, `direccion`, `email`, `imagen`, `logo`, `skin`, `tipo_inicio`, `pais`, `moneda`, `moneda_simbolo`, `nombre_impuesto`, `nombre_documento`, `inicio_tx`, `otras_ventas`, `venta_especial`, `imprimir_antes`, `cambio_tx`, `td`, `hash`, `time`) VALUES
(1, 'Sistema de Control', 'SISTEMA PIZTO', 'Desarrollo de Software', 'Erick Nunez', '27821595', 'Sistema de ventas', '0207-210386-102-9', 13.00, 0.00, 'Urb. Las Maericas', 'aerick.nunez@gmail.com', '1586973247.png', 'pizto.png', 'mdb-skin', 1, '1', 'Dolares', '$', 'IVA', 'NIT', 0, 1, 1, 'on', 'on', 0, '1afcd4ad17', 1589297922);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `config_root`
--

CREATE TABLE `config_root` (
  `id` int(5) NOT NULL,
  `expira` varchar(100) NOT NULL,
  `expiracion` varchar(100) NOT NULL,
  `ftp_servidor` varchar(100) NOT NULL,
  `ftp_path` varchar(100) NOT NULL,
  `ftp_ruta` varchar(100) NOT NULL,
  `ftp_user` varchar(100) NOT NULL,
  `ftp_password` varchar(100) NOT NULL,
  `tipo_sistema` varchar(100) NOT NULL COMMENT '1 - basico, 2- profesionl, 3 -corporativo',
  `plataforma` varchar(100) NOT NULL COMMENT '0 local, 1, web',
  `pantallas` varchar(100) NOT NULL,
  `td` int(4) NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `config_root`
--

INSERT INTO `config_root` (`id`, `expira`, `expiracion`, `ftp_servidor`, `ftp_path`, `ftp_ruta`, `ftp_user`, `ftp_password`, `tipo_sistema`, `plataforma`, `pantallas`, `td`, `hash`, `time`) VALUES
(1, 'eElkVGNBeXVjVFA0TEZhSUQrT2ZkQT09', 'RWljZlFnUStlQ2F1SXExSTBNYXQ1dz09', 'MDQ1dmFqbzBod0Y3cjI2UFZFa1hyZz09', 'MDQ1dmFqbzBod0Y3cjI2UFZFa1hyZz09', 'MDQ1dmFqbzBod0Y3cjI2UFZFa1hyZz09', 'MDQ1dmFqbzBod0Y3cjI2UFZFa1hyZz09', 'MDQ1dmFqbzBod0Y3cjI2UFZFa1hyZz09', 'aStLSk5WaFlmVG5sdG5rbnBWbk1vZz09', 'aStLSk5WaFlmVG5sdG5rbnBWbk1vZz09', 'VE1TeXJIbEFsYVZpcUd4bEdvd3JEQT09', 0, 'b6ca999160', 1588945182);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `control_cocina`
--

CREATE TABLE `control_cocina` (
  `id` int(6) NOT NULL,
  `cod` int(6) NOT NULL COMMENT 'numeracion segun candidad',
  `identificador` int(6) NOT NULL COMMENT 'el id del producto en ticket',
  `producto` int(5) NOT NULL,
  `mesa` int(6) NOT NULL,
  `cliente` int(6) NOT NULL,
  `opciones` int(2) NOT NULL COMMENT '0 - sin opciones, 1 con opciones',
  `panel` int(2) NOT NULL,
  `fecha` varchar(40) NOT NULL,
  `hora` varchar(40) NOT NULL,
  `hora_salida` varchar(30) NOT NULL,
  `edo` int(2) NOT NULL COMMENT '1 activo, 2 eliminado, 3 cancelado',
  `td` int(2) NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `control_cocina`
--

INSERT INTO `control_cocina` (`id`, `cod`, `identificador`, `producto`, `mesa`, `cliente`, `opciones`, `panel`, `fecha`, `hora`, `hora_salida`, `edo`, `td`, `hash`, `time`) VALUES
(1, 1, 407, 1001, 47, 1, 0, 1, '26-05-2020', '05:58:25', '05:59:19', 2, 0, '145320ae31', 1590494359),
(2, 1, 408, 1004, 47, 1, 0, 1, '26-05-2020', '05:58:26', '05:59:21', 2, 0, '6a09e065e2', 1590494361),
(3, 2, 408, 1004, 47, 1, 0, 1, '26-05-2020', '05:58:27', '06:00:22', 2, 0, '5212dd349d', 1590494422),
(4, 1, 409, 1005, 47, 1, 0, 1, '26-05-2020', '05:58:28', '05:59:14', 2, 0, 'b945a916d2', 1590494354),
(5, 2, 409, 1005, 47, 1, 0, 1, '26-05-2020', '05:58:28', '06:00:24', 2, 0, '2bcc2a1689', 1590494424),
(6, 3, 409, 1005, 47, 1, 0, 1, '26-05-2020', '05:58:29', '06:00:24', 2, 0, 'f5008d907d', 1590494424),
(7, 1, 418, 1008, 48, 1, 0, 1, '26-05-2020', '06:02:13', '', 3, 0, 'f6cf872ed6', 1590494540),
(8, 1, 423, 1004, 49, 1, 0, 1, '26-05-2020', '06:15:30', '06:20:00', 2, 0, 'f15f1ca236', 1590495600),
(9, 2, 423, 1004, 49, 1, 0, 1, '26-05-2020', '06:15:30', '06:20:01', 2, 0, '2e85ee3085', 1590495601),
(10, 1, 424, 1005, 49, 1, 0, 1, '26-05-2020', '06:15:31', '06:19:58', 2, 0, '0a5ba24635', 1590495599),
(11, 1, 425, 1001, 49, 1, 0, 1, '26-05-2020', '06:15:31', '06:19:57', 2, 0, 'e47c89f353', 1590495597),
(12, 1, 426, 1008, 50, 1, 0, 1, '26-05-2020', '06:22:35', '07:03:40', 2, 0, '54cba3690c', 1591794220),
(13, 1, 427, 1004, 51, 1, 0, 1, '04-06-2020', '11:58:56', '', 3, 0, 'b9729b7638', 1591293591),
(14, 1, 428, 1005, 51, 1, 0, 1, '04-06-2020', '11:58:57', '', 3, 0, 'e65c25aa62', 1591293591),
(15, 1, 428, 1005, 51, 1, 0, 1, '04-06-2020', '11:59:00', '', 3, 0, '1ff84ec819', 1591293591),
(16, 1, 428, 1005, 51, 1, 0, 1, '04-06-2020', '11:59:14', '', 3, 0, '34f7834c37', 1591293591),
(17, 2, 428, 1005, 51, 1, 0, 1, '04-06-2020', '11:59:17', '', 3, 0, 'c352669e50', 1591293591),
(18, 1, 429, 1005, 51, 1, 0, 1, '04-06-2020', '11:59:29', '', 3, 0, '94605f95ea', 1591293591),
(19, 1, 430, 1004, 51, 1, 0, 1, '04-06-2020', '11:59:31', '', 3, 0, '9dc2fda63f', 1591293591),
(20, 1, 431, 1005, 51, 1, 0, 1, '04-06-2020', '11:59:41', '', 3, 0, 'e1b1ee63d0', 1591293591),
(21, 1, 432, 1004, 51, 1, 0, 1, '04-06-2020', '11:59:44', '', 3, 0, '3b08bf6e22', 1591293591),
(22, 1, 433, 1006, 51, 1, 0, 1, '04-06-2020', '11:59:45', '', 3, 0, 'bae9c887cf', 1591293591),
(23, 1, 435, 1007, 51, 1, 0, 1, '04-06-2020', '12:00:20', '', 3, 0, '4bd69ce75f', 1591293626),
(24, 1, 436, 1006, 51, 1, 0, 1, '04-06-2020', '12:00:22', '', 3, 0, '822373b95e', 1591293624),
(25, 1, 437, 1005, 52, 1, 0, 1, '04-06-2020', '12:00:35', '', 3, 0, 'b4a79ae10a', 1591294873),
(26, 1, 438, 1004, 52, 1, 0, 1, '04-06-2020', '12:00:37', '', 3, 0, 'd7e63afd07', 1591294873),
(27, 1, 439, 1006, 52, 1, 0, 1, '04-06-2020', '12:00:38', '', 3, 0, '1e5a9ee50c', 1591294873),
(28, 1, 440, 1001, 53, 1, 0, 1, '04-06-2020', '12:01:37', '', 3, 0, 'dc9e30ddeb', 1591295149),
(29, 1, 443, 1036, 53, 1, 0, 1, '04-06-2020', '12:01:50', '', 3, 0, 'e3d1b4accf', 1591295149),
(30, 1, 446, 1005, 53, 1, 0, 1, '04-06-2020', '12:01:57', '', 3, 0, '43d02bd0f6', 1591295149),
(31, 1, 447, 1006, 53, 1, 0, 1, '04-06-2020', '12:01:58', '', 3, 0, '4e04688ddf', 1591295149),
(32, 1, 448, 1005, 54, 1, 0, 1, '04-06-2020', '12:04:32', '', 3, 0, 'fde5f4d5c5', 1592221027),
(33, 1, 449, 1006, 54, 1, 0, 1, '04-06-2020', '12:04:33', '', 3, 0, 'c52035390e', 1592221027),
(34, 1, 450, 1004, 54, 1, 0, 1, '04-06-2020', '12:04:34', '', 3, 0, 'd7a1aa128b', 1592221027),
(35, 1, 451, 1001, 54, 2, 0, 1, '04-06-2020', '12:04:39', '', 3, 0, 'bbe734a352', 1592221027),
(36, 1, 452, 1004, 54, 2, 0, 1, '04-06-2020', '12:04:40', '', 3, 0, 'b18514e70a', 1592221027),
(37, 1, 453, 1005, 54, 2, 0, 1, '04-06-2020', '12:04:40', '', 3, 0, '447aeb1dab', 1592221027),
(38, 1, 454, 1004, 53, 1, 0, 1, '04-06-2020', '12:04:55', '', 3, 0, 'ae15cce6ac', 1591295149),
(39, 1, 454, 1004, 53, 1, 0, 1, '04-06-2020', '12:11:59', '', 3, 0, 'bb5de3ee60', 1591295149),
(40, 1, 455, 1004, 52, 1, 0, 1, '04-06-2020', '12:17:49', '', 3, 0, '86c0861fc6', 1591294873),
(41, 1, 456, 1005, 52, 1, 0, 1, '04-06-2020', '12:17:49', '', 3, 0, '7c35c1a9aa', 1591294873),
(42, 1, 457, 1005, 52, 1, 0, 1, '04-06-2020', '12:21:18', '07:03:41', 2, 0, 'ee354f831d', 1591794221),
(43, 1, 458, 1006, 52, 1, 0, 1, '04-06-2020', '12:21:20', '07:03:42', 2, 0, '0ef3a14b40', 1591794222),
(44, 1, 459, 1004, 52, 1, 0, 1, '04-06-2020', '12:21:20', '07:03:43', 2, 0, '4e5350d53a', 1591794223),
(45, 1, 460, 1004, 53, 1, 0, 1, '04-06-2020', '12:22:36', '', 3, 0, 'a025f33ce4', 1591295149),
(46, 1, 461, 1001, 53, 1, 0, 1, '04-06-2020', '12:22:46', '', 3, 0, '0925bc4210', 1591295149),
(47, 1, 462, 1004, 53, 1, 0, 1, '04-06-2020', '12:22:49', '', 3, 0, '54d80b2661', 1591295149),
(48, 1, 463, 1004, 53, 1, 0, 1, '04-06-2020', '12:22:58', '', 3, 0, '717332c909', 1591295149),
(49, 1, 464, 1005, 53, 1, 0, 1, '04-06-2020', '12:23:00', '', 3, 0, 'd7853d9894', 1591295149),
(50, 1, 465, 1006, 53, 1, 0, 1, '04-06-2020', '12:23:00', '', 3, 0, '8e834a1911', 1591295149),
(51, 1, 466, 1004, 53, 1, 0, 1, '04-06-2020', '12:23:40', '', 3, 0, 'f3f1ceab0b', 1591295149),
(52, 1, 467, 1004, 53, 1, 0, 1, '04-06-2020', '12:25:57', '07:03:44', 2, 0, '6126f9a7aa', 1591794224),
(53, 1, 468, 1005, 53, 1, 0, 1, '04-06-2020', '12:25:58', '07:03:45', 2, 0, '1856df3d54', 1591794225),
(54, 1, 469, 1006, 53, 1, 0, 1, '04-06-2020', '12:25:59', '07:03:45', 2, 0, '9f462e8284', 1591794225),
(55, 1, 470, 1006, 54, 1, 0, 1, '10-06-2020', '06:51:35', '', 3, 0, '8b8f32b5f0', 1592221027),
(56, 1, 471, 1001, 54, 1, 0, 1, '10-06-2020', '06:57:21', '', 3, 0, '9cb4f5dd50', 1592221027),
(57, 1, 472, 1004, 54, 1, 0, 1, '10-06-2020', '06:57:21', '', 3, 0, 'ffc9efae31', 1592221027),
(58, 1, 473, 1005, 54, 1, 0, 1, '10-06-2020', '06:57:22', '', 3, 0, '8bbfb7374b', 1592221027),
(59, 1, 478, 1001, 55, 1, 0, 1, '10-06-2020', '07:04:38', '', 3, 0, 'c9c9b1fc81', 1591794359),
(60, 1, 479, 1007, 55, 1, 0, 1, '10-06-2020', '07:04:40', '', 3, 0, '906b5c2ffb', 1591794359),
(61, 1, 480, 1008, 55, 1, 0, 1, '10-06-2020', '07:04:41', '', 3, 0, 'c3f89316f2', 1591794359),
(62, 1, 483, 1005, 55, 1, 0, 1, '10-06-2020', '07:05:42', '', 3, 0, '9ba2e77864', 1591794359),
(63, 1, 484, 1001, 55, 1, 0, 1, '10-06-2020', '07:05:43', '', 3, 0, '54a80d807e', 1591794359),
(64, 1, 485, 1004, 55, 1, 0, 1, '10-06-2020', '07:05:44', '', 3, 0, 'c762017e43', 1591794359),
(65, 1, 486, 1002, 55, 1, 0, 1, '10-06-2020', '07:05:46', '', 3, 0, 'a096db4ff7', 1591794359),
(66, 1, 487, 1003, 55, 1, 0, 1, '10-06-2020', '07:05:47', '', 3, 0, 'b9199828ae', 1591794359),
(67, 1, 487, 1003, 55, 1, 0, 1, '10-06-2020', '07:05:47', '', 3, 0, '4ea86ec8b1', 1591794359),
(68, 1, 488, 1008, 55, 1, 0, 1, '10-06-2020', '07:05:48', '', 3, 0, '52dd209c84', 1591794359),
(69, 1, 491, 1006, 55, 1, 0, 1, '10-06-2020', '07:05:50', '', 3, 0, '55904c426f', 1591794359),
(70, 1, 492, 1008, 55, 1, 0, 1, '10-06-2020', '07:05:56', '', 3, 0, '1ebbf7cfb1', 1591794359),
(71, 1, 493, 1007, 55, 1, 0, 1, '10-06-2020', '07:05:57', '', 3, 0, 'd02d39193b', 1591794359),
(72, 1, 494, 1006, 55, 1, 0, 1, '10-06-2020', '07:05:58', '', 3, 0, 'ae74e0fe60', 1591794359),
(73, 1, 495, 1008, 54, 1, 0, 1, '10-06-2020', '07:06:18', '', 3, 0, 'df07109408', 1592221027),
(74, 1, 496, 1007, 54, 1, 0, 1, '10-06-2020', '07:06:19', '', 3, 0, 'e2778bec4a', 1592221027),
(75, 1, 498, 1049, 54, 1, 0, 1, '10-06-2020', '07:06:20', '', 3, 0, 'c87da06553', 1592221027),
(76, 1, 499, 1006, 54, 1, 0, 1, '10-06-2020', '07:06:29', '', 3, 0, '9905ac4008', 1592221027),
(77, 1, 501, 1005, 54, 1, 0, 1, '10-06-2020', '07:06:30', '', 3, 0, '9be03d9ad7', 1592221027),
(78, 1, 503, 1058, 54, 1, 0, 1, '10-06-2020', '07:07:09', '', 3, 0, '632b054567', 1592221027),
(79, 1, 504, 1008, 54, 1, 0, 1, '10-06-2020', '07:08:54', '', 3, 0, '323945a484', 1592221027),
(80, 1, 507, 1007, 54, 1, 0, 1, '10-06-2020', '07:08:55', '', 3, 0, '11b7e518d9', 1592221027),
(81, 1, 509, 1006, 54, 1, 0, 1, '10-06-2020', '07:08:56', '', 3, 0, 'd841b3228d', 1592221027),
(82, 1, 510, 1005, 54, 1, 0, 1, '10-06-2020', '07:08:57', '', 3, 0, 'c4c7e3a58d', 1592221027),
(83, 1, 511, 1004, 54, 1, 0, 1, '10-06-2020', '07:09:04', '', 3, 0, '8aa4872755', 1592221027),
(84, 1, 513, 1005, 54, 1, 0, 1, '10-06-2020', '07:09:05', '', 3, 0, 'ec34847ce6', 1592221027),
(85, 1, 515, 1006, 54, 1, 0, 1, '10-06-2020', '07:09:06', '', 3, 0, '7d6de859a6', 1592221027),
(86, 1, 520, 1007, 54, 1, 0, 1, '10-06-2020', '07:09:12', '', 3, 0, '28b07cb522', 1592221027),
(87, 1, 523, 1008, 54, 1, 0, 1, '10-06-2020', '07:09:13', '', 3, 0, 'b2a848cb7c', 1592221027),
(88, 1, 533, 1008, 54, 1, 0, 1, '10-06-2020', '07:09:28', '', 3, 0, 'fbee4aa8e4', 1592221027),
(89, 1, 534, 1007, 54, 1, 0, 1, '10-06-2020', '07:09:28', '', 3, 0, '7d7cc84c13', 1592221027),
(90, 1, 536, 1004, 54, 1, 0, 1, '10-06-2020', '07:10:06', '', 3, 0, 'e7f5a26d1f', 1592221027),
(91, 1, 537, 1005, 54, 1, 0, 1, '10-06-2020', '07:10:07', '', 3, 0, '281f865786', 1592221027),
(92, 1, 538, 1006, 54, 1, 0, 1, '10-06-2020', '07:10:08', '', 3, 0, 'c5bb25db5c', 1592221027),
(93, 1, 470, 1007, 54, 1, 0, 1, '15-06-2020', '05:36:09', '', 3, 0, '86b8ad75ba', 1592221027),
(94, 1, 471, 1005, 54, 1, 0, 1, '15-06-2020', '05:37:00', '', 3, 0, 'c8af413f8c', 1592221027),
(95, 1, 472, 1006, 54, 1, 0, 1, '15-06-2020', '05:37:02', '', 3, 0, '88d49c22fc', 1592221027),
(96, 1, 473, 1007, 54, 1, 0, 1, '15-06-2020', '05:37:03', '', 3, 0, '02a03f6865', 1592221027),
(97, 1, 474, 1008, 54, 1, 0, 1, '15-06-2020', '05:37:03', '', 3, 0, 'c498c0dff4', 1592221027);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `control_panel_mostrar`
--

CREATE TABLE `control_panel_mostrar` (
  `id` int(6) NOT NULL,
  `producto` int(6) DEFAULT NULL,
  `panel` int(4) DEFAULT NULL,
  `td` int(4) DEFAULT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='maneja en que pantalla se mostrara el producto';

--
-- Volcado de datos para la tabla `control_panel_mostrar`
--

INSERT INTO `control_panel_mostrar` (`id`, `producto`, `panel`, `td`, `hash`, `time`) VALUES
(1, 1001, 1, 0, '198a778517', 1565038138),
(2, 1008, 1, 0, 'f8f70e5521', 1565038138),
(3, 1050, 1, 0, '898912aaad', 1565038138),
(4, 1058, 1, 0, '4ce690ff91', 1565038138),
(5, 1002, 1, 0, 'abf3ccf7c0', 1588945206),
(6, 1004, 1, 0, '55cfb6169c', 1588945208),
(7, 1005, 1, 0, '94aabdad83', 1588945208),
(8, 1006, 1, 0, 'a5ee11dcc6', 1588945209),
(9, 1007, 1, 0, '82e2b3fceb', 1588945209),
(10, 1003, 1, 0, '2101afa1f9', 1588945211),
(11, 1009, 1, 0, '545998892a', 1588945212);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `corte_diario`
--

CREATE TABLE `corte_diario` (
  `id` int(6) NOT NULL,
  `fecha` varchar(25) NOT NULL,
  `fecha_format` varchar(30) NOT NULL,
  `hora` varchar(30) NOT NULL,
  `mesas` int(10) NOT NULL,
  `clientes` int(10) NOT NULL,
  `efectivo` float(10,2) NOT NULL,
  `propina` float(10,2) NOT NULL,
  `tx` float(10,2) NOT NULL,
  `no_tx` float(10,2) NOT NULL,
  `total` float(10,2) NOT NULL,
  `gastos` float(10,2) NOT NULL,
  `diferencia` float(10,2) NOT NULL,
  `user` varchar(100) NOT NULL,
  `edo` int(4) NOT NULL,
  `td` int(2) NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `corte_diario`
--

INSERT INTO `corte_diario` (`id`, `fecha`, `fecha_format`, `hora`, `mesas`, `clientes`, `efectivo`, `propina`, `tx`, `no_tx`, `total`, `gastos`, `diferencia`, `user`, `edo`, `td`, `hash`, `time`) VALUES
(1, '04-06-2019', '1559628000', '23:02:08', 0, 0, 479.00, 0.00, 0.00, 0.00, 0.00, 0.00, 479.00, '3c67697e18899300a2648199a9798dffb359cab2', 2, 0, '73aadef052', 1565038139),
(2, '04-06-2019', '1559628000', '23:37:57', 0, 0, 479.00, 0.00, 0.00, 0.00, 0.00, 0.00, 479.00, '3c67697e18899300a2648199a9798dffb359cab2', 2, 0, '1232aa88cd', 1565038139),
(3, '04-06-2019', '1559628000', '23:39:34', 0, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '3c67697e18899300a2648199a9798dffb359cab2', 2, 0, '7462db5afd', 1565038139),
(4, '04-06-2019', '1559628000', '23:42:57', 0, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '3c67697e18899300a2648199a9798dffb359cab2', 2, 0, '911df5a649', 1565038139),
(5, '04-06-2019', '1559628000', '23:44:12', 0, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '3c67697e18899300a2648199a9798dffb359cab2', 2, 0, 'ac56c3c30c', 1565038139),
(6, '04-06-2019', '1559628000', '23:48:37', 0, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '3c67697e18899300a2648199a9798dffb359cab2', 1, 0, '8f23b74f56', 1565038139),
(7, '03-04-2020', '1585893600', '00:23:04', 0, 0, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 100.00, 'Erick', 2, 0, '77e61c1e16', 1585896962),
(8, '03-04-2020', '1585893600', '00:24:36', 0, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Erick', 2, 0, '19581e72f0', 1585896962),
(9, '03-04-2020', '1585893600', '00:53:15', 0, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Erick', 2, 0, '58cdf2c27e', 1585896962),
(10, '03-04-2020', '1585893600', '00:55:31', 0, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Erick', 2, 0, 'e7c76c4087', 1585896962),
(11, '08-05-2020', '1588917600', '19:43:08', 18, 23, 11126.00, 0.00, 3272.00, 7854.00, 11126.00, 0.00, 0.00, 'Erick', 2, 0, '8592fc8d80', 1588988728),
(12, '08-05-2020', '1588917600', '21:11:21', 32, 89, 28981.00, 0.00, 15761.00, 13220.00, 28981.00, 0.00, 0.00, 'Erick', 1, 0, 'c4a572472b', 1588993881);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `delivery_repartidor`
--

CREATE TABLE `delivery_repartidor` (
  `id` int(6) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `documento` varchar(10) NOT NULL,
  `comentarios` text NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL,
  `td` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `delivery_repartidor`
--

INSERT INTO `delivery_repartidor` (`id`, `nombre`, `direccion`, `telefono`, `documento`, `comentarios`, `hash`, `time`, `td`) VALUES
(2, 'John Doe', 'Las americas 2', '65235985', '87987987-7', 'Es muy rapido ', 'c295a8bd8a', 1589308639, 0),
(3, 'Jhon Lenon', 'Las americas 1', '98564875', '97879789-7', ' ', 'ef4e140a30', 1589386821, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entradas_efectivo`
--

CREATE TABLE `entradas_efectivo` (
  `id` int(6) NOT NULL,
  `descripcion` text NOT NULL,
  `cantidad` float(10,2) NOT NULL,
  `fecha` varchar(30) NOT NULL,
  `fechaF` varchar(30) NOT NULL,
  `hora` varchar(20) NOT NULL,
  `user` varchar(100) NOT NULL,
  `edo` int(2) NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL,
  `td` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturar_cai`
--

CREATE TABLE `facturar_cai` (
  `id` int(6) NOT NULL,
  `inicial` int(8) UNSIGNED ZEROFILL NOT NULL,
  `final` int(8) UNSIGNED ZEROFILL NOT NULL,
  `cai` varchar(100) NOT NULL,
  `fecha_limite` varchar(20) NOT NULL,
  `fechaF` varchar(30) NOT NULL,
  `td` int(3) NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturar_impresora`
--

CREATE TABLE `facturar_impresora` (
  `id` int(5) NOT NULL,
  `impresora` varchar(50) NOT NULL,
  `comentarios` varchar(100) NOT NULL,
  `td` int(3) NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturar_opciones`
--

CREATE TABLE `facturar_opciones` (
  `id` int(6) NOT NULL,
  `ax0` varchar(5) NOT NULL DEFAULT '0' COMMENT 'Ticket',
  `ax1` varchar(5) NOT NULL DEFAULT '0' COMMENT 'ticket',
  `bx0` varchar(5) NOT NULL DEFAULT '0' COMMENT 'factura',
  `bx1` varchar(5) NOT NULL DEFAULT '0' COMMENT 'factura',
  `cx0` varchar(5) NOT NULL DEFAULT '0' COMMENT 'imprimir antes',
  `cx1` varchar(5) NOT NULL DEFAULT '0' COMMENT 'imprimir antes',
  `dx0` varchar(5) NOT NULL DEFAULT '0' COMMENT 'comanda',
  `dx1` varchar(5) NOT NULL DEFAULT '0' COMMENT 'comanda',
  `td` int(6) NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `facturar_opciones`
--

INSERT INTO `facturar_opciones` (`id`, `ax0`, `ax1`, `bx0`, `bx1`, `cx0`, `cx1`, `dx0`, `dx1`, `td`, `hash`, `time`) VALUES
(4, '0', '0', '0', '0', '0', '0', '0', '0', 0, '327a0186f5', 1588604225);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturar_rtn`
--

CREATE TABLE `facturar_rtn` (
  `id` int(5) NOT NULL,
  `rtn` varchar(100) NOT NULL,
  `cliente` varchar(100) NOT NULL,
  `td` int(3) NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `facturar_rtn`
--

INSERT INTO `facturar_rtn` (`id`, `rtn`, `cliente`, `td`, `hash`, `time`) VALUES
(1, '132132154654654', 'ERIC NUNEZ', 0, '5bf288e783', 1588973121);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturar_rtn_cliente`
--

CREATE TABLE `facturar_rtn_cliente` (
  `id` int(5) NOT NULL,
  `factura` int(5) NOT NULL,
  `rtn` varchar(50) NOT NULL,
  `cliente` varchar(50) NOT NULL,
  `td` int(3) NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturar_ticket`
--

CREATE TABLE `facturar_ticket` (
  `id` int(5) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo` int(3) NOT NULL COMMENT '1 ticket, 2 factura',
  `img` varchar(50) NOT NULL,
  `txt1` int(3) NOT NULL,
  `txt2` int(3) NOT NULL,
  `txt3` int(3) NOT NULL,
  `txt4` int(3) NOT NULL,
  `n1` int(3) NOT NULL,
  `n2` int(3) NOT NULL,
  `n3` int(3) NOT NULL,
  `n4` int(3) NOT NULL,
  `td` int(3) NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturar_users`
--

CREATE TABLE `facturar_users` (
  `id` int(11) NOT NULL,
  `tipo` int(3) NOT NULL,
  `ticket` int(5) NOT NULL,
  `user` varchar(50) NOT NULL,
  `clase` varchar(30) NOT NULL,
  `impresora` varchar(50) NOT NULL,
  `td` int(3) NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gastos`
--

CREATE TABLE `gastos` (
  `id` int(6) NOT NULL,
  `tipo` int(2) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `cantidad` float(10,2) NOT NULL,
  `fecha` varchar(30) NOT NULL,
  `fechaF` varchar(30) NOT NULL,
  `hora` varchar(20) NOT NULL,
  `user` varchar(100) NOT NULL,
  `edo` int(2) NOT NULL,
  `td` int(2) NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `gastos`
--

INSERT INTO `gastos` (`id`, `tipo`, `nombre`, `descripcion`, `cantidad`, `fecha`, `fechaF`, `hora`, `user`, `edo`, `td`, `hash`, `time`) VALUES
(1, 1, 'rryt', 'ryr', 0.00, '25-06-2019', '1561442400', '02:27:40', 'fa41921830ab34ca55a31a2d6572d57d6b312e43', 0, 0, '849f8363c6', 1565038139),
(2, 3, 'hhjkjhjk', 'hjkhjk', 0.00, '25-06-2019', '1561442400', '02:27:54', 'fa41921830ab34ca55a31a2d6572d57d6b312e43', 0, 0, '6e1a31d24c', 1565038139),
(3, 3, 'cbcvb', 'cvbcvb', 0.00, '25-06-2019', '1561442400', '02:28:09', 'fa41921830ab34ca55a31a2d6572d57d6b312e43', 0, 0, 'e3ec6171ab', 1565038139),
(4, 2, 'dfgd', 'fdfgdfg', 5.00, '25-06-2019', '1561442400', '02:28:32', 'fa41921830ab34ca55a31a2d6572d57d6b312e43', 0, 0, 'a8e44cce07', 1565038139),
(5, 2, 'dfgd', 'fdfgdfg', 5.00, '25-06-2019', '1561442400', '02:28:32', 'fa41921830ab34ca55a31a2d6572d57d6b312e43', 0, 0, '9f5904e33c', 1565038139),
(6, 3, 'gfghf', 'fghfg', 44.00, '25-06-2019', '1561442400', '02:28:52', 'fa41921830ab34ca55a31a2d6572d57d6b312e43', 0, 0, '49a1ca8aff', 1565038139),
(7, 3, 'gfghf', 'fghfg', 44.00, '25-06-2019', '1561442400', '02:28:52', 'fa41921830ab34ca55a31a2d6572d57d6b312e43', 0, 0, '343e3b8355', 1565038139),
(8, 1, 'rtry', 'rtytyu', 0.00, '25-06-2019', '1561442400', '02:29:42', 'fa41921830ab34ca55a31a2d6572d57d6b312e43', 0, 0, '29aaf95ddb', 1565038139),
(9, 1, 'rtry', 'rtytyu', 0.00, '25-06-2019', '1561442400', '02:29:42', 'fa41921830ab34ca55a31a2d6572d57d6b312e43', 0, 0, '4698d21fd9', 1565038140),
(10, 2, 'rtry', 'rtyrytr', 0.00, '25-06-2019', '1561442400', '02:34:25', 'fa41921830ab34ca55a31a2d6572d57d6b312e43', 0, 0, 'd39229ac47', 1565038140),
(11, 3, 'tyutu', 'tyutyu', 0.00, '25-06-2019', '1561442400', '02:35:07', 'fa41921830ab34ca55a31a2d6572d57d6b312e43', 0, 0, 'e3c110d94e', 1565038140),
(12, 3, 'uiui', 'uiui', 5.00, '25-06-2019', '1561442400', '02:35:15', 'fa41921830ab34ca55a31a2d6572d57d6b312e43', 0, 0, 'b868e502fb', 1565038140),
(13, 2, 'uiuiouo', 'pp[p]45', 0.00, '25-06-2019', '1561442400', '02:35:29', 'fa41921830ab34ca55a31a2d6572d57d6b312e43', 0, 0, '6581d89075', 1565038140);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gastos_images`
--

CREATE TABLE `gastos_images` (
  `id` int(6) NOT NULL,
  `gasto` int(5) NOT NULL,
  `imagen` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `fecha` varchar(30) NOT NULL,
  `fechaF` varchar(30) NOT NULL,
  `hora` varchar(30) NOT NULL,
  `td` int(2) NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `images`
--

CREATE TABLE `images` (
  `id` int(6) NOT NULL,
  `img_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `img_order` int(5) NOT NULL DEFAULT '0',
  `popup` int(3) NOT NULL,
  `cod` int(4) NOT NULL,
  `edo` int(3) NOT NULL,
  `td` int(2) NOT NULL,
  `hash` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `time` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `images`
--

INSERT INTO `images` (`id`, `img_name`, `img_order`, `popup`, `cod`, `edo`, `td`, `hash`, `time`) VALUES
(1, 'assets/img/ico/19.png', 1, 0, 9901, 1, 0, 'af020f14df', 1565038140),
(2, 'assets/img/ico/sfgeg.png', 2, 9901, 1001, 1, 0, '5c7a69a333', 1565038140),
(3, 'assets/img/ico/egrjy.png', 3, 9901, 1002, 1, 0, '9b99390f04', 1565038140),
(4, 'assets/img/ico/5.png', 4, 9901, 1003, 1, 0, '70ed4b3e19', 1565038140),
(5, 'assets/img/ico/6.png', 5, 0, 1004, 1, 0, '643d201da7', 1565038140),
(6, 'assets/img/ico/22..png', 6, 0, 1005, 1, 0, '93687601a2', 1565038140),
(7, 'assets/img/ico/alitas.png', 7, 0, 1006, 1, 0, 'cc44545350', 1565038140),
(8, 'assets/img/ico/6.png', 8, 0, 1007, 1, 0, '938a78a3ec', 1565038140),
(9, 'assets/img/ico/gegt.png', 9, 0, 1008, 1, 0, '72255bc99b', 1565038140),
(10, 'assets/img/ico/11.png', 10, 0, 9902, 1, 0, '189ce4f4ef', 1565038140),
(11, 'assets/img/ico/12.png', 11, 0, 9903, 1, 0, 'd130c461b6', 1565038140),
(12, 'assets/img/ico/ertry.png', 1, 0, 1001, 1, 0, '5bac5c0f99', 1565038140),
(13, 'assets/img/ico/ertry.png', 12, 9902, 1009, 1, 0, '9a71ba0e66', 1565038140),
(14, 'assets/img/ico/ertry.png', 13, 9902, 1010, 1, 0, '63465ba5d7', 1565038140),
(15, 'assets/img/ico/ertry.png', 14, 9902, 1011, 1, 0, '7f5f88e626', 1565038140),
(17, 'assets/img/ico/ert.png', 15, 9902, 1012, 1, 0, '733516bcc5', 1565038140),
(18, 'assets/img/ico/ert.png', 16, 9902, 1013, 1, 0, 'ebe4fc1f34', 1565038140),
(19, 'assets/img/ico/ert.png', 17, 9902, 1014, 1, 0, 'bacb2af3fd', 1565038141),
(20, 'assets/img/ico/23.png', 18, 9902, 1015, 1, 0, '77439069f3', 1565038141),
(21, 'assets/img/ico/23.png', 19, 9902, 1016, 1, 0, 'c213d85f38', 1565038141),
(22, 'assets/img/ico/23.png', 20, 9902, 1017, 1, 0, '33c65dbe78', 1565038141),
(23, 'assets/img/ico/7.png', 21, 9902, 1018, 1, 0, '0e42184521', 1565038141),
(24, 'assets/img/ico/7.png', 22, 9902, 1019, 1, 0, '4a0d9c6bb5', 1565038141),
(25, 'assets/img/ico/8.png', 23, 9902, 1020, 1, 0, '6ea4187fe9', 1565038141),
(26, 'assets/img/ico/sfgeg.png', 24, 9902, 1021, 1, 0, '63b62f8a6b', 1565038141),
(27, 'assets/img/ico/sfgeg.png', 25, 9902, 1022, 1, 0, '48b034383a', 1565038141),
(28, 'assets/img/ico/sfgeg.png', 26, 9902, 1023, 1, 0, '7e6e014b14', 1565038141),
(29, 'assets/img/ico/10.png', 27, 9902, 1024, 1, 0, '954142e968', 1565038141),
(30, 'assets/img/ico/10.png', 28, 9902, 1025, 1, 0, '9ce5ea03aa', 1565038141),
(31, 'assets/img/ico/10.png', 29, 9902, 1026, 1, 0, 'e6471f5efe', 1565038141),
(32, 'assets/img/ico/12.png', 30, 9902, 1027, 1, 0, 'c881c3b0be', 1565038141),
(33, 'assets/img/ico/12.png', 31, 9902, 1028, 1, 0, '12331bcb69', 1565038141),
(34, 'assets/img/ico/12.png', 32, 9902, 1029, 1, 0, 'f10bc6c406', 1565038141),
(35, 'assets/img/ico/7.png', 33, 9903, 1030, 1, 0, '2379ee73b4', 1565038141),
(36, 'assets/img/ico/7.png', 34, 9903, 1031, 1, 0, '28328dede7', 1565038141),
(37, 'assets/img/ico/7.png', 35, 9903, 1032, 1, 0, 'e404309a57', 1565038141),
(38, 'assets/img/ico/rt.png', 36, 9903, 1033, 1, 0, '27b4f1adfa', 1565038141),
(39, 'assets/img/ico/rt.png', 37, 9903, 1034, 1, 0, '57b7e9dfe7', 1565038141),
(40, 'assets/img/ico/rt.png', 38, 9903, 1035, 1, 0, 'ebb9387fc7', 1565038141),
(41, 'assets/img/ico/sfgeg.png', 39, 9903, 1036, 1, 0, '2ea72cfa67', 1565038141),
(42, 'assets/img/ico/sfgeg.png', 40, 9903, 1037, 1, 0, '4b610f42b1', 1565038142),
(43, 'assets/img/ico/sfgeg.png', 41, 9903, 1038, 1, 0, '88aca0be3f', 1565038142),
(44, 'assets/img/ico/fff.png', 42, 9903, 1039, 1, 0, '4688b62834', 1565038142),
(45, 'assets/img/ico/fff.png', 43, 9903, 1040, 1, 0, '4e2a071504', 1565038142),
(46, 'assets/img/ico/fff.png', 44, 9903, 1041, 1, 0, '2568917785', 1565038142),
(47, 'assets/img/ico/ert.png', 45, 9903, 1042, 1, 0, '88cb77d37a', 1565038142),
(48, 'assets/img/ico/ert.png', 46, 9903, 1043, 1, 0, '1f29459312', 1565038142),
(49, 'assets/img/ico/ert.png', 47, 9903, 1044, 1, 0, 'f07d9b7c02', 1565038142),
(50, 'assets/img/ico/25.png', 48, 0, 1045, 1, 0, '56a775ff6b', 1565038142),
(51, 'assets/img/ico/latas.png', 49, 0, 1046, 1, 0, '4ad2344196', 1565038142),
(52, 'assets/img/ico/39.png', 50, 0, 1047, 1, 0, 'a5a16a75bf', 1565038142),
(53, 'assets/img/ico/24.png', 51, 0, 1048, 1, 0, '743da21f62', 1565038142),
(54, 'assets/img/ico/jugodenaranja.png', 52, 0, 1049, 1, 0, '99d3752043', 1565038142),
(55, 'assets/img/ico/alitass.png', 53, 0, 9904, 1, 0, '21d5860e73', 1565038142),
(56, 'assets/img/ico/102.png', 54, 9904, 1050, 1, 0, 'fce64e0118', 1565038142),
(57, 'assets/img/ico/102.png', 55, 9904, 1051, 1, 0, 'ed7a005bfc', 1565038142),
(58, 'assets/img/ico/102.png', 56, 9904, 1052, 1, 0, '39fa2f3495', 1565038142),
(59, 'assets/img/ico/15.png', 57, 9905, 1053, 1, 0, '3189fccf85', 1565038142),
(60, 'assets/img/ico/15.png', 58, 9905, 1054, 1, 0, '8aac4f537c', 1565038142),
(61, 'assets/img/ico/15.png', 59, 0, 9905, 1, 0, '6a540aa90a', 1565038142),
(63, 'assets/img/ico/gegt.png', 60, 9905, 1055, 1, 0, 'e38be38fc6', 1565038142),
(64, 'assets/img/ico/gegt.png', 61, 9905, 1056, 1, 0, 'de90f3463d', 1565038142),
(65, 'assets/img/ico/gegt.png', 62, 9905, 1057, 1, 0, '810318162a', 1565038142),
(66, 'assets/img/ico/5.png', 63, 0, 1058, 1, 0, '9ae14ad558', 1565038142),
(67, 'assets/img/ico/cebolla.png', 64, 1, 101, 1, 0, 'f1c49cd7bf', 1588974396),
(68, 'assets/img/ico/tomate.png', 65, 1, 102, 1, 0, '60368b8c97', 1588974413),
(69, 'assets/img/ico/pepino.png', 66, 1, 101, 1, 0, 'e8f589518f', 1590494649);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login_attempts`
--

CREATE TABLE `login_attempts` (
  `user_id` int(11) NOT NULL,
  `time` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `login_attempts`
--

INSERT INTO `login_attempts` (`user_id`, `time`) VALUES
(11, '1591726490'),
(11, '1592220860');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login_db_sync`
--

CREATE TABLE `login_db_sync` (
  `id` int(6) NOT NULL,
  `hash` varchar(100) NOT NULL,
  `fecha` varchar(30) NOT NULL,
  `hora` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Lleva el control de los cambios en las bases de datos locales';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login_db_user`
--

CREATE TABLE `login_db_user` (
  `id` int(6) NOT NULL,
  `hash` varchar(100) NOT NULL,
  `td` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login_imagenes`
--

CREATE TABLE `login_imagenes` (
  `id` int(6) NOT NULL,
  `imagen` varchar(50) NOT NULL,
  `categoria` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `login_imagenes`
--

INSERT INTO `login_imagenes` (`id`, `imagen`, `categoria`) VALUES
(1, '0808.png', 3),
(2, '1.png', 1),
(3, '101.png', 1),
(4, '102.png', 1),
(5, '103.png', 1),
(6, '104.png', 1),
(7, '1111.png', 1),
(8, '1787.png', 1),
(9, '1800.png', 3),
(10, '2.png', 1),
(11, '20.png', 3),
(12, '21.png', 3),
(13, '22.png', 3),
(14, '2222.png', 0),
(15, '24.png', 3),
(16, '25.png', 3),
(17, '26.png', 3),
(18, '28.png', 3),
(19, '29.png', 3),
(20, '3.png', 1),
(21, '30.png', 3),
(22, '31.png', 3),
(23, '32.png', 3),
(24, '33.png', 3),
(25, '332342.png', 1),
(26, '34.png', 3),
(27, '3435.png', 2),
(28, '344.png', 4),
(29, '35.png', 3),
(30, '3554.png', 2),
(31, '36.png', 3),
(32, '37.png', 3),
(33, '38 (2).png', 3),
(34, '38.png', 3),
(35, '39.png', 3),
(36, '4.png', 1),
(37, '44.png', 3),
(38, '4534.png', 2),
(39, '4566.png', 2),
(40, '501.png', 1),
(41, '502.png', 1),
(42, '503.png', 1),
(43, '504.png', 1),
(44, '505.png', 1),
(45, '506.png', 1),
(46, '510.png', 0),
(47, '5533.png', 2),
(48, '5777.png', 2),
(49, '633.png', 0),
(50, '655454.png', 2),
(51, '66586.png', 1),
(52, '6666.png', 0),
(53, '6787.png', 2),
(54, '70.png', 0),
(55, '71.png', 2),
(56, '72.png', 0),
(57, '73.png', 3),
(58, '7577.png', 3),
(59, '7777.png', 1),
(60, '78897978.png', 1),
(61, '7897.png', 2),
(62, '7979.png', 4),
(63, '8785.png', 3),
(64, '8799.png', 2),
(65, '8845.png', 2),
(66, '8888.png', 3),
(67, '9787.png', 4),
(68, '9879.png', 0),
(69, '9977.png', 2),
(70, '9999.png', 0),
(71, 'Alo1.png', 3),
(72, 'absolut.png', 3),
(73, 'aderezo.png', 2),
(74, 'aguacate.png', 0),
(75, 'aireytierra.png', 2),
(76, 'ajo.png', 0),
(77, 'alitas.png', 2),
(78, 'alitass.png', 2),
(79, 'arroz.png', 2),
(80, 'as.png', 0),
(81, 'blacklabel.png', 3),
(82, 'bluelabel.png', 3),
(83, 'buchanans12.png', 3),
(84, 'buchanans18.png', 3),
(85, 'cacillerodeldiablo.png', 3),
(86, 'cafeamericanp.png', 0),
(87, 'cafeconcremora.png', 4),
(88, 'cafeconleche.png', 4),
(89, 'camaronesalaplancla.png', 2),
(90, 'camaronesempanixados.png', 2),
(91, 'camaronesflamenco.png', 2),
(92, 'camaronesmojo.png', 2),
(93, 'camaronestequila.png', 2),
(94, 'carne.png', 2),
(95, 'cebolla.png', 0),
(96, 'chivas12.png', 3),
(97, 'chivas18.png', 3),
(98, 'chocolatenestle.png', 4),
(99, 'chorizo.png', 2),
(100, 'churrascoalaplancha.png', 2),
(101, 'churrascocopa.png', 2),
(102, 'coca.png', 3),
(103, 'corona.png', 3),
(104, 'corralejo.png', 3),
(105, 'costilla.png', 2),
(106, 'costillaimportada.png', 2),
(107, 'costillaitaliana.png', 2),
(108, 'costillasanluis.png', 2),
(109, 'cremadepapas.png', 2),
(110, 'croastini.png', 2),
(111, 'cubalibre.png', 2),
(112, 'deditosdepollo.png', 2),
(113, 'dfs.png', 0),
(114, 'donjulio.png', 3),
(115, 'enjoy.png', 3),
(116, 'ensaladaconatun.png', 2),
(117, 'ensaladaconpollo.png', 2),
(118, 'ensaladacopacabana.png', 2),
(119, 'enter.png', 0),
(120, 'entranaderes.png', 2),
(121, 'filetemigno.png', 2),
(122, 'finlandia.png', 3),
(123, 'flordecana.png', 3),
(124, 'fresa.png', 0),
(125, 'frijoles.png', 0),
(126, 'frontera.png', 3),
(127, 'golden.png', 3),
(128, 'goldlabel.png', 3),
(129, 'greeenlabel.png', 3),
(130, 'greygoose.png', 3),
(131, 'habitacion.png', 0),
(132, 'hamburguesa.png', 2),
(133, 'hamburguesapollo.png', 2),
(134, 'hamburguesares.png', 2),
(135, 'heineken.png', 3),
(136, 'hongos.png', 2),
(137, 'hongosespanoles.png', 2),
(138, 'ice.png', 3),
(139, 'jack.png', 3),
(140, 'jamon.png', 0),
(141, 'jarana.png', 3),
(142, 'jose.png', 3),
(143, 'jugodenaranja.png', 3),
(144, 'lata.png', 3),
(145, 'latas.png', 3),
(146, 'lechuga.png', 0),
(147, 'licores.png', 3),
(148, 'licuado.png', 2),
(149, 'limon.png', 0),
(150, 'limonada.png', 3),
(151, 'limonadaconsoda.png', 3),
(152, 'lomoalaparrilla.png', 2),
(153, 'mango.png', 0),
(154, 'margarita.png', 3),
(155, 'marquesdecaceres.png', 3),
(156, 'marytierra.png', 2),
(157, 'michelada.png', 2),
(158, 'milanesadepollo.png', 2),
(159, 'modelo.png', 3),
(160, 'mojito.png', 3),
(161, 'nachos.png', 2),
(162, 'nachosconchili.png', 2),
(163, 'oldparr.png', 3),
(164, 'palomaso.png', 3),
(165, 'panconajo.png', 2),
(166, 'panini.png', 2),
(167, 'papasconqueso.png', 1),
(168, 'papasfrancesas.png', 1),
(169, 'papassalteadas.png', 2),
(170, 'parrillada.png', 2),
(171, 'pechiguitasalaplancha.png', 2),
(172, 'pechuga.png', 2),
(173, 'pechugaalaplancha.png', 2),
(174, 'pechugas.png', 2),
(175, 'pepino.png', 0),
(176, 'pepsil.png', 3),
(177, 'pilsener.png', 3),
(178, 'pina.png', 0),
(179, 'pinacolada.png', 3),
(180, 'piscina.png', 0),
(181, 'pita.png', 2),
(182, 'platano.png', 2),
(183, 'platodebocas.png', 2),
(184, 'polloalaparmesana.png', 2),
(185, 'punta jalapena.png', 2),
(186, 'pure.png', 2),
(187, 'puyasoalaparrilla.png', 2),
(188, 'quesadilla.png', 2),
(189, 'quesadillacamaron.png', 2),
(190, 'queso.png', 0),
(191, 'red.png', 4),
(192, 'redbull.png', 3),
(193, 'redlabel.png', 3),
(194, 'reposado.png', 3),
(195, 'ronzacapa15.png', 3),
(196, 'ronzacapa23.png', 3),
(197, 'ronzacapaxi.png', 3),
(198, 'salmocopacabana.png', 3),
(199, 'sangredetoro.png', 3),
(200, 'santa elena.png', 3),
(201, 'santaelenecarmenere.png', 3),
(202, 'silver.png', 3),
(203, 'smirnof.png', 3),
(204, 'sopadetortilla.png', 2),
(205, 'suprema.png', 3),
(206, 'swing.png', 3),
(207, 'tacos.png', 2),
(208, 'tajada.png', 1),
(209, 'te.png', 4),
(210, 'tehelado.png', 3),
(211, 'tocino.png', 2),
(212, 'tomate.png', 0),
(213, 'torta 2.png', 2),
(214, 'torta.png', 2),
(215, 'vegetales.png', 0),
(216, 'william.png', 3),
(217, '10.png', 1),
(218, '11.png', 1),
(219, '12.png', 1),
(220, '13.png', 1),
(221, '14.png', 1),
(222, '15.png', 1),
(223, '16.png', 1),
(224, '17.png', 1),
(225, '18.png', 1),
(226, '19.png', 1),
(227, '22..png', 1),
(228, '23.png', 1),
(229, '27.png', 1),
(230, '30.jpg', 1),
(231, '5.png', 1),
(232, '6.png', 1),
(233, '7.png', 1),
(234, '8.png', 1),
(235, '9.png', 1),
(236, 'dg.png', 1),
(237, 'ert.png', 1),
(238, 'ertry.png', 1),
(239, 'etrty.png', 1),
(240, 'fg.png', 1),
(241, 'g.png', 1),
(242, 'gegt.png', 1),
(243, 're.png', 1),
(244, 'reyu.png', 1),
(245, 'rt.png', 1),
(246, 'ryy.png', 1),
(247, 'sfgeg.png', 1),
(248, 'egrjy.png', 1),
(249, 'fff.png', 1),
(250, 'afert.png', 1),
(251, 'dfhfh.png', 1),
(252, 'dgdffgd.png', 1),
(253, 'fdghf.png', 1),
(254, 'ffghd.png', 0),
(255, 'fgh.png', 0),
(256, 'fgjhg.png', 0),
(257, 'fhdfghfgh.png', 0),
(258, 'fhfgfgh.png', 1),
(259, 'ggfdg.png', 1),
(260, 'gjf.png', 2),
(261, 'hfdh.png', 1),
(262, 'hgkh.png', 1),
(263, 'hjkkh.png', 1),
(264, 'hjkl.png', 0),
(265, 'hk.png', 0),
(266, 'hretth.png', 1),
(267, 'jfgj.png', 1),
(268, 'jfgjh.png', 1),
(269, 'jhkljl.png', 1),
(270, 'jlkkl.png', 2),
(271, 'jyuku.png', 0),
(272, 'kkh.png', 1),
(273, 'pfh.png', 2),
(274, 'rtt.png', 2),
(275, 'sgfdfgd.png', 0),
(276, 'tr.png', 1),
(277, 'tre.png', 2),
(278, 'trs.png', 4),
(279, 'tutyu.png', 2),
(280, 'tyj.png', 1),
(281, 'uou.png', 1),
(282, 'wet.png', 2),
(283, 'wrwe.png', 0),
(284, 'x1.png', 1),
(285, 'x2.png', 1),
(286, 'xsdfs.png', 1),
(287, 'ytuytui.png', 1),
(288, 'yyu.png', 1),
(289, 'fuze.png', 3),
(290, 'p421564.png', 1),
(291, 'p54987.png', 1),
(292, 'p61546.png', 1),
(293, 'p645564.png', 1),
(294, 'p64565.png', 1),
(295, 'p64654.png', 1),
(296, 'p6465465.png', 1),
(297, 'p67898789.png', 1),
(298, 'p7498798.png', 1),
(299, 'p78946.png', 1),
(300, 'p87987.png', 0),
(301, 'p879878.png', 1),
(302, 'p897987987.png', 1),
(303, 'p9546.png', 1),
(304, 'p9654.png', 1),
(305, 'p97816.png', 0),
(306, 'p98121.png', 1),
(307, 'p9821.png', 1),
(308, 'p98725.png', 1),
(309, 'p987987.png', 0),
(310, 'powerade.png', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login_images_categoria`
--

CREATE TABLE `login_images_categoria` (
  `id` int(6) NOT NULL,
  `categoria` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `login_images_categoria`
--

INSERT INTO `login_images_categoria` (`id`, `categoria`) VALUES
(1, 'Comida Rapida'),
(2, 'Restaurante'),
(3, 'Bar'),
(4, 'Cafeteria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login_inout`
--

CREATE TABLE `login_inout` (
  `id` int(6) NOT NULL,
  `user` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `accion` int(2) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `navegador` varchar(250) NOT NULL,
  `fecha` varchar(30) NOT NULL,
  `fechaF` varchar(30) NOT NULL,
  `hora` varchar(30) NOT NULL,
  `td` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login_members`
--

CREATE TABLE `login_members` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` char(128) NOT NULL,
  `salt` char(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `login_members`
--

INSERT INTO `login_members` (`id`, `username`, `email`, `password`, `salt`) VALUES
(1, 'Erick', 'aerick.nunez@gmail.com', '50236c59c304c8b5c2f6b5c1af94f4416d998e3ba3fd2fc5a795f740431c35e9bbd9d4439a3dad8a182173b14291a308e4716458278fc228ad7c8f9930d9547e', '5f1e8cce7a67bf3282acf41dee11c7c784b5c8b6687bc4a10b3a81e2af81f186402d4f19e545b62e474f308f9dbc142eb3c66c6033b264cd0e1ffe1209cdf57d'),
(11, 'Tatiana', 'jazmin@pizto.com', 'ceb3d2c8caba1d832ff9fb8399967fb4edef5a58211fcbceca9a60de0b45954df034d0e8e79224f8a6d991762c7f9524f1da5e6585787ed7e155f6de44cd36e2', 'b7f16ecd5adcd7e591a7b6fada49ff0033c8411220bda94b14fb23234a348ff9b476937cc03c1a3e5b2b29c962e85d6d40c2ac1587fe976f5f8e4bd68741040c'),
(13, '6a0cd0', 'neagan@gmail.com', 'a5d21c02950dda634c7f285368ca288a420a68336abd39836abf1d895861a21245716addaed51bcb7547eaa85a814712c6c7fff742872f8fe7a8fe7f6bfdee79', '2cce157e8d81e332528b1f591065620cb9b477edede466a788359282e1a54b05717a45a74d558cf43ea8e70e1d79a5009aad5ba9ae51877a9199a19597aa3575');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login_sucursales`
--

CREATE TABLE `login_sucursales` (
  `id` int(5) NOT NULL,
  `user` varchar(50) NOT NULL,
  `sucursal` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login_sync`
--

CREATE TABLE `login_sync` (
  `id` int(6) NOT NULL,
  `hash` varchar(100) NOT NULL,
  `tipo` int(2) NOT NULL,
  `edo` int(2) NOT NULL,
  `fecha` varchar(30) NOT NULL,
  `hora` varchar(30) NOT NULL,
  `td` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='LLeva el registro interno si se realizo el respaldo';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login_userdata`
--

CREATE TABLE `login_userdata` (
  `id` int(6) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `tipo` int(2) NOT NULL COMMENT '1, root , 2 admin, 3 usuario',
  `user` varchar(100) NOT NULL,
  `tkn` varchar(200) NOT NULL,
  `avatar` varchar(50) NOT NULL,
  `td` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `login_userdata`
--

INSERT INTO `login_userdata` (`id`, `nombre`, `tipo`, `user`, `tkn`, `avatar`, `td`) VALUES
(1, 'Erick Nunez', 1, 'Erick', '1', '11.png', 0),
(11, 'Jazmin Nunez', 5, 'Tatiana', '1', '9.png', 0),
(13, 'Neagan Nunez', 4, '6a0cd0', '1', 'neagan.jpg', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesa`
--

CREATE TABLE `mesa` (
  `id` int(6) NOT NULL,
  `clientes` int(3) NOT NULL,
  `mesa` int(5) NOT NULL,
  `tipo` int(1) NOT NULL COMMENT '1. rapido 2. mesas 3. delivery',
  `empleado` varchar(200) NOT NULL,
  `user` varchar(20) NOT NULL,
  `fecha` varchar(20) NOT NULL,
  `hora` varchar(20) NOT NULL,
  `estado` int(1) NOT NULL COMMENT '1 activo , 2 cancelado',
  `tx` int(2) NOT NULL,
  `td` int(2) NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `mesa`
--

INSERT INTO `mesa` (`id`, `clientes`, `mesa`, `tipo`, `empleado`, `user`, `fecha`, `hora`, `estado`, `tx`, `td`, `hash`, `time`) VALUES
(132, 1, 1, 3, 'Erick Nunez', 'Erick', '08-05-2020', '06:34:36', 2, 1, 0, '4baa78d0b7', 1588942072),
(147, 1, 2, 3, 'Erick Nunez', 'Erick', '08-05-2020', '07:41:50', 2, 0, 0, '0b1cb0bc6a', 1588972082),
(148, 1, 3, 1, 'Erick Nunez', 'Erick', '08-05-2020', '07:42:38', 2, 0, 0, '46dbf7498c', 1588945448),
(149, 1, 4, 1, 'Erick Nunez', 'Erick', '08-05-2020', '07:44:10', 2, 0, 0, 'bee03fa65f', 1588945538),
(150, 1, 5, 1, 'Erick Nunez', 'Erick', '08-05-2020', '07:45:40', 2, 0, 0, '626050d6a4', 1588945555),
(161, 1, 2, 1, 'Erick Nunez', 'Erick', '08-05-2020', '15:17:52', 2, 1, 0, 'c91706e936', 1588973072),
(162, 1, 7, 1, 'Erick Nunez', 'Erick', '08-05-2020', '15:21:12', 2, 0, 0, '2dac9b3c94', 1588973181),
(163, 1, 3, 1, 'Erick Nunez', 'Erick', '08-05-2020', '15:24:35', 2, 1, 0, '731b38b526', 1588973090),
(241, 1, 8, 3, 'Erick Nunez', 'Erick', '08-05-2020', '16:38:32', 2, 1, 0, 'cb07d98e50', 1588977543),
(246, 1, 8, 1, 'Jazmin Nunez', 'Tatiana', '08-05-2020', '17:17:41', 2, 0, 0, 'dd988a2837', 1588979865),
(248, 2, 9, 2, 'Jazmin Nunez', 'Tatiana', '08-05-2020', '17:17:54', 2, 0, 0, '4702aa1e9b', 1588979996),
(267, 2, 12, 2, 'Erick Nunez', 'Erick', '08-05-2020', '18:04:41', 2, 0, 0, '6e82a3c187', 1588987688),
(269, 1, 13, 1, 'Erick Nunez', 'Erick', '08-05-2020', '18:08:02', 2, 0, 0, '2fc5676482', 1588987673),
(271, 2, 14, 2, 'Jazmin Nunez', 'Tatiana', '08-05-2020', '18:14:16', 2, 0, 0, 'f58ee5b31f', 1588987751),
(272, 1, 15, 1, 'Jazmin Nunez', 'Tatiana', '08-05-2020', '18:14:29', 2, 0, 0, '7e5f886afe', 1588983296),
(284, 1, 17, 3, 'Erick Nunez', 'Erick', '08-05-2020', '19:17:39', 2, 0, 0, '54b8663aef', 1588987699),
(289, 1, 18, 3, 'Erick Nunez', 'Erick', '08-05-2020', '19:31:41', 2, 0, 0, 'ce9cb99092', 1588987932),
(291, 3, 9, 2, 'Erick Nunez', 'Erick', '08-05-2020', '19:33:31', 2, 1, 0, 'e23e948b92', 1588988179),
(295, 1, 19, 1, 'Erick Nunez', 'Erick', '08-05-2020', '19:56:27', 2, 0, 0, '53015151ba', 1588989399),
(296, 1, 20, 1, 'Erick Nunez', 'Erick', '08-05-2020', '19:58:53', 2, 0, 0, '1f0513fd53', 1588989593),
(298, 1, 21, 3, 'Erick Nunez', 'Erick', '08-05-2020', '20:00:44', 2, 0, 0, '58ecba1791', 1588990563),
(301, 3, 23, 2, 'Erick Nunez', 'Erick', '08-05-2020', '20:03:07', 2, 0, 0, 'bd27007aa9', 1588990574),
(304, 1, 24, 1, 'Erick Nunez', 'Erick', '08-05-2020', '20:16:22', 2, 0, 0, '7477fb309d', 1588990592),
(312, 1, 25, 3, 'Erick Nunez', 'Erick', '08-05-2020', '20:19:29', 2, 0, 0, '4b3ebc796b', 1588991328),
(315, 2, 26, 2, 'Erick Nunez', 'Erick', '08-05-2020', '20:31:52', 2, 0, 0, '38236eacc9', 1588991526),
(316, 1, 27, 3, 'Erick Nunez', 'Erick', '08-05-2020', '20:32:35', 2, 0, 0, '406962df3c', 1588991681),
(317, 1, 28, 1, 'Erick Nunez', 'Erick', '08-05-2020', '20:33:00', 2, 0, 0, '936195b42c', 1588991595),
(318, 1, 29, 1, 'Erick Nunez', 'Erick', '08-05-2020', '20:33:17', 2, 0, 0, '5d9bbca98c', 1588991628),
(322, 1, 10, 1, 'Erick Nunez', 'Erick', '08-05-2020', '20:37:06', 2, 1, 0, '9f8672a20c', 1588991844),
(327, 50, 11, 2, 'Erick Nunez', 'Erick', '08-05-2020', '20:38:59', 2, 1, 0, '4d54380cfa', 1588992637),
(331, 1, 12, 3, 'Erick Nunez', 'Erick', '08-05-2020', '21:02:45', 2, 1, 0, 'f7ad9e78a5', 1588993476),
(334, 1, 30, 1, 'Erick Nunez', 'Erick', '08-05-2020', '21:10:16', 2, 0, 0, '9f21103e95', 1588993832),
(335, 1, 31, 1, 'Erick Nunez', 'Erick', '09-05-2020', '06:31:36', 2, 0, 0, 'b8efc6a09e', 1589027518),
(337, 1, 13, 1, 'Erick Nunez', 'Erick', '09-05-2020', '06:32:47', 2, 1, 0, '9f8dde68e8', 1589028605),
(338, 1, 14, 1, 'Erick Nunez', 'Erick', '09-05-2020', '06:50:07', 2, 1, 0, 'dc43b7ecd6', 1589028615),
(344, 1, 15, 3, 'Erick Nunez', 'Erick', '10-05-2020', '08:07:35', 2, 1, 0, 'b14f2cd702', 1589119785),
(345, 1, 16, 3, 'Erick Nunez', 'Erick', '10-05-2020', '08:09:56', 2, 1, 0, '71a5ffb6f9', 1589120465),
(359, 1, 17, 3, 'Erick Nunez', 'Erick', '10-05-2020', '09:03:17', 2, 1, 0, 'ed9006986e', 1589123005),
(367, 1, 18, 3, 'Erick Nunez', 'Erick', '10-05-2020', '10:35:24', 2, 1, 0, '8f96ca049b', 1589129157),
(368, 1, 19, 3, 'Erick Nunez', 'Erick', '10-05-2020', '10:46:34', 2, 1, 0, '80a80601d2', 1589129225),
(369, 1, 20, 3, 'Erick Nunez', 'Erick', '10-05-2020', '10:47:43', 2, 1, 0, '89f4439751', 1589129277),
(370, 1, 21, 3, 'Erick Nunez', 'Erick', '10-05-2020', '10:48:27', 2, 1, 0, '260e126bd7', 1589129405),
(371, 1, 22, 3, 'Erick Nunez', 'Erick', '10-05-2020', '10:51:05', 2, 1, 0, '4d78de4254', 1589129491),
(372, 1, 23, 3, 'Erick Nunez', 'Erick', '10-05-2020', '10:54:24', 2, 1, 0, '9ee9864da5', 1589129675),
(373, 1, 24, 3, 'Erick Nunez', 'Erick', '10-05-2020', '10:56:02', 2, 1, 0, '2cdca984c5', 1589129779),
(374, 1, 25, 3, 'Erick Nunez', 'Erick', '10-05-2020', '10:57:07', 2, 1, 0, 'e5a6fb9378', 1589129831),
(375, 1, 26, 3, 'Erick Nunez', 'Erick', '10-05-2020', '10:58:33', 2, 1, 0, '991ab6ea2a', 1589129917),
(376, 1, 27, 3, 'Erick Nunez', 'Erick', '10-05-2020', '10:59:44', 2, 1, 0, '7baa5a09a3', 1589129996),
(377, 1, 28, 3, 'Erick Nunez', 'Erick', '10-05-2020', '11:00:36', 2, 1, 0, '439b0bf05d', 1589130040),
(378, 1, 29, 3, 'Erick Nunez', 'Erick', '10-05-2020', '11:02:17', 2, 1, 0, 'cb96196265', 1589130141),
(379, 1, 30, 3, 'Erick Nunez', 'Erick', '10-05-2020', '11:03:36', 2, 1, 0, '0b26a78075', 1589130221),
(380, 1, 31, 3, 'Erick Nunez', 'Erick', '10-05-2020', '11:05:58', 2, 1, 0, 'ed95c023fd', 1589130378),
(381, 1, 32, 3, 'Erick Nunez', 'Erick', '10-05-2020', '11:08:45', 2, 1, 0, '641948f142', 1589130529),
(382, 1, 33, 3, 'Erick Nunez', 'Erick', '10-05-2020', '11:09:25', 2, 1, 0, '8f3cd9d53d', 1589130688),
(383, 1, 34, 3, 'Erick Nunez', 'Erick', '10-05-2020', '11:14:12', 2, 1, 0, '934922f603', 1589130863),
(384, 1, 35, 3, 'Erick Nunez', 'Erick', '10-05-2020', '11:15:02', 2, 1, 0, 'a1be4101a9', 1589130907),
(385, 1, 36, 3, 'Erick Nunez', 'Erick', '10-05-2020', '11:16:35', 2, 1, 0, '705461510c', 1589131023),
(386, 1, 37, 3, 'Erick Nunez', 'Erick', '10-05-2020', '11:17:44', 2, 1, 0, '5b62afc20c', 1589131076),
(387, 1, 38, 3, 'Erick Nunez', 'Erick', '10-05-2020', '11:18:26', 2, 1, 0, '7a38e80f47', 1589131112),
(388, 1, 39, 3, 'Erick Nunez', 'Erick', '10-05-2020', '11:19:14', 2, 1, 0, '1e1c58a4de', 1589131159),
(389, 1, 40, 3, 'Erick Nunez', 'Erick', '10-05-2020', '11:20:07', 2, 1, 0, 'b88d8945e5', 1589131212),
(390, 1, 41, 3, 'Erick Nunez', 'Erick', '10-05-2020', '11:20:34', 2, 1, 0, 'f2540adede', 1589131247),
(391, 1, 42, 3, 'Erick Nunez', 'Erick', '10-05-2020', '11:30:27', 2, 1, 0, '1b07e2d927', 1589131985),
(393, 1, 43, 3, 'Erick Nunez', 'Erick', '10-05-2020', '11:35:06', 2, 1, 0, '6d2d691a01', 1589132710),
(394, 1, 44, 1, 'Erick Nunez', 'Erick', '10-05-2020', '11:37:18', 2, 1, 0, 'b9c3e49c35', 1589132246),
(397, 1, 32, 3, 'Erick Nunez', 'Erick', '10-05-2020', '11:57:53', 2, 0, 0, 'a5957e45aa', 1589133559),
(399, 1, 45, 3, 'Erick Nunez', 'Erick', '10-05-2020', '14:18:06', 2, 1, 0, '7d4af6bbba', 1589142145),
(400, 1, 46, 3, 'Erick Nunez', 'Erick', '10-05-2020', '14:22:46', 2, 1, 0, '7d21176a3c', 1589142641),
(401, 1, 47, 3, 'Erick Nunez', 'Erick', '10-05-2020', '14:30:48', 2, 1, 0, '47cad7b8e2', 1589142867),
(402, 1, 48, 3, 'Erick Nunez', 'Erick', '10-05-2020', '14:34:38', 2, 1, 0, '6dde5e54df', 1589143144),
(408, 1, 49, 3, 'Erick Nunez', 'Erick', '10-05-2020', '14:43:00', 2, 1, 0, '29f4ee6087', 1589143392),
(410, 1, 51, 2, 'Erick Nunez', 'Erick', '10-05-2020', '14:43:43', 2, 1, 0, '25143bb8b2', 1589143431),
(414, 1, 52, 3, 'Erick Nunez', 'Erick', '10-05-2020', '14:47:53', 2, 1, 0, 'ac884d1aa5', 1589144104),
(415, 2, 53, 2, 'Erick Nunez', 'Erick', '10-05-2020', '14:49:42', 2, 1, 0, '3598ad3a73', 1589143874),
(416, 3, 54, 2, 'Erick Nunez', 'Erick', '10-05-2020', '14:53:12', 2, 1, 0, '2ac8a9c794', 1589144115),
(420, 1, 55, 1, 'Erick Nunez', 'Erick', '10-05-2020', '15:14:31', 2, 1, 0, 'e6b3ce69e6', 1589145284),
(424, 1, 56, 3, 'Erick Nunez', 'Erick', '10-05-2020', '15:24:09', 2, 1, 0, '35954be991', 1589146300),
(425, 1, 57, 3, 'Erick Nunez', 'Erick', '10-05-2020', '15:28:19', 2, 1, 0, 'c4bea6c431', 1589146309),
(426, 2, 58, 2, 'Erick Nunez', 'Erick', '10-05-2020', '15:30:10', 2, 1, 0, 'f8e6febe6e', 1589147429),
(427, 1, 59, 1, 'Erick Nunez', 'Erick', '10-05-2020', '15:30:51', 2, 1, 0, 'eddc343ab2', 1589146272),
(429, 1, 60, 3, 'Erick Nunez', 'Erick', '10-05-2020', '15:32:25', 2, 1, 0, '09c1a9af5e', 1589146361),
(431, 1, 61, 3, 'Erick Nunez', 'Erick', '10-05-2020', '15:38:17', 2, 1, 0, '18d8d26abc', 1589147833),
(432, 1, 62, 3, 'Erick Nunez', 'Erick', '10-05-2020', '15:38:28', 2, 1, 0, '365fd06644', 1589147849),
(437, 1, 63, 2, 'Jazmin Nunez', 'Tatiana', '10-05-2020', '16:04:59', 2, 1, 0, '9ee7ab1a89', 1589148308),
(438, 1, 64, 3, 'Erick Nunez', 'Erick', '10-05-2020', '16:09:44', 2, 1, 0, 'b6c3959a2f', 1589148589),
(441, 1, 65, 3, 'Jazmin Nunez', 'Tatiana', '10-05-2020', '16:20:40', 2, 1, 0, 'b91bfc6c17', 1589149262),
(442, 1, 66, 3, 'Erick Nunez', 'Erick', '11-05-2020', '09:21:43', 2, 1, 0, '144413534e', 1589210537),
(443, 1, 67, 3, 'Erick Nunez', 'Erick', '11-05-2020', '09:27:06', 2, 1, 0, 'ae4c561df1', 1589210921),
(444, 3, 68, 2, 'Erick Nunez', 'Erick', '11-05-2020', '09:30:53', 2, 1, 0, 'c89a712ab9', 1589211367),
(446, 1, 69, 1, 'Erick Nunez', 'Erick', '11-05-2020', '09:36:54', 2, 1, 0, '10a90c5b51', 1589214149),
(447, 1, 70, 1, 'Erick Nunez', 'Erick', '11-05-2020', '10:22:30', 2, 1, 0, '14fb2bbe07', 1589214157),
(481, 1, 71, 3, 'Erick Nunez', 'Erick', '11-05-2020', '13:31:02', 2, 1, 0, '4068bbccdc', 1589225500),
(483, 1, 33, 1, 'Erick Nunez', 'Erick', '12-05-2020', '09:37:04', 2, 0, 0, 'e700358c53', 1589297838),
(486, 1, 72, 3, 'Erick Nunez', 'Erick', '12-05-2020', '09:37:27', 2, 1, 0, 'b8bb7c871b', 1589297882),
(491, 1, 34, 3, 'Erick Nunez', 'Erick', '12-05-2020', '13:53:20', 2, 0, 0, 'aea6d72101', 1589313300),
(493, 1, 35, 3, 'Erick Nunez', 'Erick', '13-05-2020', '09:55:38', 2, 0, 0, 'a1a0e65661', 1589385458),
(494, 1, 36, 3, 'Erick Nunez', 'Erick', '13-05-2020', '10:19:41', 2, 0, 0, '4a8eba69bc', 1589386849),
(496, 1, 37, 1, 'Erick Nunez', 'Erick', '26-05-2020', '05:28:14', 2, 0, 0, '02c6b5c039', 1590492501),
(497, 1, 38, 1, 'Erick Nunez', 'Erick', '26-05-2020', '05:28:23', 2, 0, 0, 'e2530c78dd', 1590492530),
(498, 1, 39, 1, 'Erick Nunez', 'Erick', '26-05-2020', '05:28:53', 2, 0, 0, 'c7801ad649', 1590492545),
(499, 1, 40, 1, 'Erick Nunez', 'Erick', '26-05-2020', '05:29:07', 2, 0, 0, 'ab1dbbcf0d', 1590492555),
(500, 1, 41, 1, 'Erick Nunez', 'Erick', '26-05-2020', '05:29:18', 2, 0, 0, '90830a0075', 1590492565),
(505, 1, 42, 1, 'Erick Nunez', 'Erick', '26-05-2020', '05:37:28', 2, 0, 0, 'dd5ed0dc1f', 1590493056),
(506, 1, 43, 1, 'Erick Nunez', 'Erick', '26-05-2020', '05:37:38', 2, 0, 0, '02f3bc5b9c', 1590493064),
(507, 1, 44, 1, 'Erick Nunez', 'Erick', '26-05-2020', '05:37:46', 2, 0, 0, '879e389724', 1590493133),
(508, 1, 45, 1, 'Erick Nunez', 'Erick', '26-05-2020', '05:43:43', 2, 0, 0, '92e3733299', 1590493432),
(509, 1, 46, 1, 'Erick Nunez', 'Erick', '26-05-2020', '05:43:55', 2, 0, 0, 'c3f7a00505', 1590494202),
(510, 1, 47, 1, 'Erick Nunez', 'Erick', '26-05-2020', '05:56:56', 2, 0, 0, 'b5ba2f2f1c', 1590494310),
(516, 1, 49, 1, 'Erick Nunez', 'Erick', '26-05-2020', '06:02:59', 2, 0, 0, 'b6807ac5a1', 1590495746),
(518, 1, 50, 1, 'Erick Nunez', 'Erick', '26-05-2020', '06:22:32', 2, 0, 0, '67ebf11305', 1590495758),
(532, 1, 52, 3, 'Erick Nunez', 'Erick', '04-06-2020', '12:21:15', 2, 0, 0, '37a58f68d4', 1591294926),
(537, 1, 53, 3, 'Erick Nunez', 'Erick', '04-06-2020', '12:25:54', 2, 0, 0, '849849eef5', 1591295181),
(548, 1, 54, 1, 'Erick Nunez', 'Erick', '15-06-2020', '06:03:53', 1, 0, 0, '93f27aa9d5', 1592222633);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesa_nombre`
--

CREATE TABLE `mesa_nombre` (
  `id` int(6) NOT NULL,
  `mesa` int(6) NOT NULL,
  `tx` int(2) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `fecha` varchar(20) NOT NULL,
  `hora` varchar(20) NOT NULL,
  `td` int(2) NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opciones`
--

CREATE TABLE `opciones` (
  `id` int(4) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `cod` int(5) NOT NULL,
  `edo` int(2) NOT NULL,
  `td` int(2) NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opciones_asig`
--

CREATE TABLE `opciones_asig` (
  `id` int(4) NOT NULL,
  `producto` int(4) NOT NULL,
  `opcion` int(4) NOT NULL,
  `edo` int(2) NOT NULL,
  `td` int(2) NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opciones_name`
--

CREATE TABLE `opciones_name` (
  `id` int(4) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `cod` int(4) NOT NULL,
  `opcion` int(4) NOT NULL,
  `edo` int(2) NOT NULL,
  `td` int(2) NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opciones_ticket`
--

CREATE TABLE `opciones_ticket` (
  `id` int(6) NOT NULL,
  `cod` int(6) NOT NULL,
  `identificador` int(6) NOT NULL,
  `opcion` int(6) NOT NULL,
  `mesa` int(6) NOT NULL,
  `cliente` varchar(50) NOT NULL,
  `td` int(2) NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planilla_descuentos`
--

CREATE TABLE `planilla_descuentos` (
  `id` int(5) NOT NULL,
  `descuento` varchar(50) NOT NULL,
  `porcentaje` float(10,2) NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL,
  `td` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='descuentos que se pueden establecer a cada empleado';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planilla_descuentos_asig`
--

CREATE TABLE `planilla_descuentos_asig` (
  `id` int(5) NOT NULL,
  `descuento` varchar(12) NOT NULL,
  `empleado` varchar(12) NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL,
  `td` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Empleados que se le han asignado un descuento';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planilla_empleados`
--

CREATE TABLE `planilla_empleados` (
  `id` int(6) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `puesto` varchar(30) NOT NULL,
  `documento` varchar(25) NOT NULL,
  `nit` varchar(25) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `telefono` varchar(25) NOT NULL,
  `sueldo` float(10,2) NOT NULL COMMENT 'sueldo por 30 dias',
  `entradas` varchar(2) NOT NULL,
  `extra` varchar(2) NOT NULL,
  `nocturnas` varchar(2) NOT NULL,
  `comentarios` varchar(200) NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL,
  `td` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='registra los empleados del negocio';

--
-- Volcado de datos para la tabla `planilla_empleados`
--

INSERT INTO `planilla_empleados` (`id`, `nombre`, `puesto`, `documento`, `nit`, `direccion`, `telefono`, `sueldo`, `entradas`, `extra`, `nocturnas`, `comentarios`, `hash`, `time`, `td`) VALUES
(1, 'ERICK NUNEZ', 'Encargado', '03547604-0', '0207210386-102-9', 'Las Americas', '60623882', 500.00, '', '', '', '', 'a913c9470a', 1585896867, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planilla_extras`
--

CREATE TABLE `planilla_extras` (
  `id` int(5) NOT NULL,
  `empleado` varchar(12) NOT NULL,
  `extra` varchar(100) NOT NULL COMMENT 'extra 1, adelanto 2, descuentos 3',
  `cantidad` float(10,2) NOT NULL,
  `tipo` int(2) NOT NULL,
  `fecha` varchar(20) NOT NULL,
  `hora` varchar(20) NOT NULL,
  `fechaF` varchar(20) NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL,
  `td` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='extras -  adelantos, descuentos o extras';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planilla_pagos`
--

CREATE TABLE `planilla_pagos` (
  `id` int(5) NOT NULL,
  `empleado` varchar(12) NOT NULL,
  `fecha_inicio` varchar(20) NOT NULL,
  `fecha_fin` varchar(20) NOT NULL,
  `inicioF` int(20) NOT NULL,
  `finF` varchar(20) NOT NULL,
  `dias` int(20) NOT NULL,
  `sueldo` float(10,2) NOT NULL,
  `extras` float(10,2) NOT NULL,
  `descuentos` float(10,2) NOT NULL,
  `liquido` float(10,2) NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL,
  `td` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='control de las planillas generadas';

--
-- Volcado de datos para la tabla `planilla_pagos`
--

INSERT INTO `planilla_pagos` (`id`, `empleado`, `fecha_inicio`, `fecha_fin`, `inicioF`, `finF`, `dias`, `sueldo`, `extras`, `descuentos`, `liquido`, `hash`, `time`, `td`) VALUES
(1, 'a913c9470a', '01-04-2020', '15-04-2020', 1585720800, '1586930400', 15, 250.00, 0.00, 0.00, 250.00, 'd41bc1b419', 1585896884, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `precios`
--

CREATE TABLE `precios` (
  `id` int(6) NOT NULL,
  `cod` int(4) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `cat` int(2) NOT NULL,
  `precio` float(10,2) NOT NULL,
  `td` int(2) NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `precios`
--

INSERT INTO `precios` (`id`, `cod`, `nombre`, `cat`, `precio`, `td`, `hash`, `time`) VALUES
(1, 1001, 'Clasica Jamon', 9901, 99.00, 0, '0f99402ff6', 1587599047),
(2, 1002, 'Clasica Pepperoni', 9901, 99.00, 0, '3a13fd2699', 1587599047),
(3, 1003, 'Clasica Extraqueso', 9901, 99.00, 0, 'efa901fd65', 1587599047),
(4, 1004, '2 x 1 Suprema', 0, 269.00, 0, 'bbd6adefa3', 1587599047),
(5, 1005, 'Orilla de queso', 0, 155.00, 0, '6154f71a9b', 1587599047),
(6, 1006, 'Combo Wings', 0, 195.00, 0, 'a438cba4b1', 1587599047),
(7, 1007, 'Super Suprema', 0, 175.00, 0, 'cfa59ae41b', 1587599047),
(8, 1008, 'Calzone Italiano', 0, 85.00, 0, 'f958a94c5d', 1587599047),
(9, 1001, 'Personal 4 Estaciones', 0, 125.00, 0, 'f4bca09cf1', 1587599047),
(10, 1009, 'Personal 4 Estaciones', 9902, 125.00, 0, '18e18c5047', 1587599047),
(11, 1010, 'Grande 4 Estaciones', 9902, 175.00, 0, 'cc92bf31e0', 1587599047),
(12, 1011, 'Gigante 4 Estaciones', 9902, 269.00, 0, '77fe8fb930', 1587599047),
(14, 1012, 'Personal Super Suprema', 9902, 125.00, 0, '00020a6a86', 1587599047),
(15, 1013, 'Grande Super Suprema', 9902, 175.00, 0, 'ccfce6cc2c', 1587599047),
(16, 1014, 'Gigante Super Suprema', 9902, 269.00, 0, '4427687552', 1587599047),
(17, 1015, 'Personal Margarita', 9902, 125.00, 0, 'd22e8b88a1', 1587599047),
(18, 1016, 'Grande Margarita', 9902, 175.00, 0, '1b5a44a55b', 1587599047),
(19, 1017, 'Gigante Margarita', 9902, 269.00, 0, '9ce304c945', 1587599047),
(20, 1018, 'Normal Chicken', 9902, 125.00, 0, '7825ea9dbd', 1587599047),
(21, 1019, 'Grande Chicken', 9902, 175.00, 0, '3c09a6323a', 1587599047),
(22, 1020, 'Gigante Chicken', 9902, 269.00, 0, '8c2134e18f', 1587599047),
(23, 1021, 'Normal Choriqueso', 9902, 125.00, 0, 'c227414ee3', 1587599047),
(24, 1022, 'Grande Choriqueso', 9902, 175.00, 0, '213c516489', 1587599047),
(25, 1023, 'Gigante Choriqueso', 9902, 269.00, 0, '3ae057df7f', 1587599047),
(26, 1024, 'Personal Vegetariana', 9902, 125.00, 0, 'cbbf80eca8', 1587599047),
(27, 1025, 'Grande Vegetariana', 9902, 175.00, 0, '1e94ad3647', 1587599047),
(28, 1026, 'Gigante Vegetariana', 9902, 269.00, 0, '9ca471ca54', 1587599047),
(29, 1027, 'Normal Hawaiana', 9902, 125.00, 0, '84089e0dff', 1587599047),
(30, 1028, 'Grande Hawaiana', 9902, 175.00, 0, 'f5f233e262', 1587599047),
(31, 1029, 'Gigante Hawaiana', 9902, 169.00, 0, '6f2782d74c', 1587599047),
(32, 1030, 'Personal Catracha', 9903, 125.00, 0, '39e08eafdb', 1587599047),
(33, 1031, 'Grande Catracha', 9903, 224.00, 0, 'fc3818a3a6', 1587599047),
(34, 1032, 'Gigante Catracha', 9903, 365.00, 0, '629cb7fad0', 1587599047),
(35, 1033, 'Normal de Camaron', 9903, 125.00, 0, 'c9df84268d', 1587599047),
(36, 1034, 'Grande  de Camaron', 9903, 224.00, 0, '5e8c8b56a0', 1587599047),
(37, 1035, 'Gigante  de Camaron', 9903, 365.00, 0, '215cd0dd12', 1587599047),
(38, 1036, 'Personal Bacon con Maiz', 9903, 125.00, 0, '8cba368664', 1587599047),
(39, 1037, 'Grande Bacon con Maiz', 9903, 224.00, 0, 'f88a1f9adb', 1587599047),
(40, 1038, 'Gigante Bacon con Maiz', 9903, 365.00, 0, '4a9828319d', 1587599047),
(41, 1039, 'Normal Mediterranea', 9903, 125.00, 0, '95f14caa71', 1587599047),
(42, 1040, 'Grande Mediterranea', 9903, 224.00, 0, '7647f8b377', 1587599047),
(43, 1041, 'Gigante  Mediterranea', 9903, 365.00, 0, '2e9110cb40', 1587599047),
(44, 1042, 'Personal Tropical', 9903, 125.00, 0, '79cd1d44b5', 1587599047),
(45, 1043, 'Grande Tropical', 9903, 224.00, 0, '9d306f0679', 1587599047),
(46, 1044, 'Gigante  Tropical', 9903, 365.00, 0, '9d3990efe6', 1587599047),
(47, 1045, 'Fresco 1.5 Lts', 0, 35.00, 0, '1d9594e3e2', 1587599047),
(48, 1046, 'Fresco Lata', 0, 20.00, 0, 'b4a4f780d6', 1587599047),
(49, 1047, 'Bote de Agua', 0, 15.00, 0, '11196ef3c0', 1587599047),
(50, 1048, 'Fresco Jumbo', 0, 60.00, 0, '74672ed7f2', 1587599047),
(51, 1049, 'Fresco Natural', 0, 20.00, 0, 'c516758ac1', 1587599047),
(52, 1050, '6 Alitas', 9904, 95.00, 0, '147f660339', 1587599047),
(53, 1051, '12 Alitas', 9904, 155.00, 0, '1cbc7e596b', 1587599047),
(54, 1052, '24 Alitas', 9904, 299.00, 0, '50886f1dfd', 1587599047),
(55, 1053, 'Pan con Ajo 6 U', 9905, 75.00, 0, '43bd78b994', 1587599047),
(56, 1054, 'Pan con Ajo 12 U', 9905, 110.00, 0, '5a35713edf', 1587599047),
(58, 1055, 'Orilla de queso Pesonal', 9905, 30.00, 0, 'a397103d0b', 1587599047),
(59, 1056, 'Orilla de queso Grande', 9905, 55.00, 0, '11e08cffc6', 1587599047),
(60, 1057, 'Orilla de queso Gigante', 9905, 65.00, 0, 'b1fb259bd1', 1587599047),
(61, 1058, 'Combo Orilla de Queso', 0, 190.00, 0, 'ffb7f0c860', 1587599047);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(6) NOT NULL,
  `cod` int(6) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `cantidad` int(6) NOT NULL,
  `gravado` int(2) NOT NULL,
  `fecha_registro` varchar(30) NOT NULL,
  `td` int(2) NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `cod`, `nombre`, `categoria`, `cantidad`, `gravado`, `fecha_registro`, `td`, `hash`, `time`) VALUES
(1, 1001, 'Clasica Jamon', '9901', 0, 1, '29-05-2019', 0, '32518b12d4', 1565038149),
(2, 1002, 'Clasica Pepperoni', '9901', 0, 1, '29-05-2019', 0, '2bf762629c', 1565038149),
(3, 1003, 'Clasica Extraqueso', '9901', 0, 1, '29-05-2019', 0, '55468ac54e', 1565038149),
(4, 1004, '2 x 1 Suprema', '0', 0, 1, '29-05-2019', 0, 'aeb6cd2e24', 1565038149),
(5, 1005, 'Orilla de queso', '0', 0, 1, '29-05-2019', 0, '0af6cfb9e8', 1565038149),
(6, 1006, 'Combo Wings', '0', 0, 1, '29-05-2019', 0, '319ca804f2', 1565038149),
(7, 1007, 'Super Suprema', '0', 0, 1, '29-05-2019', 0, '328cdfa10d', 1565038149),
(8, 1008, 'Calzone Italiano', '0', 0, 1, '29-05-2019', 0, 'd172e818bb', 1565038149),
(9, 1001, 'Personal 4 Estaciones', '0', 0, 1, '29-05-2019', 0, '4724869c21', 1565038149),
(10, 1009, 'Personal 4 Estaciones', '9902', 0, 1, '29-05-2019', 0, '7bdc054370', 1565038149),
(11, 1010, 'Grande 4 Estaciones', '9902', 0, 1, '29-05-2019', 0, 'dd08dbe2ee', 1565038149),
(12, 1011, 'Gigante 4 Estaciones', '9902', 0, 1, '29-05-2019', 0, 'c32ac3ce39', 1565038149),
(14, 1012, 'Personal Super Suprema', '9902', 0, 1, '29-05-2019', 0, '6b86211551', 1565038149),
(15, 1013, 'Grande Super Suprema', '9902', 0, 1, '29-05-2019', 0, '73b01f72c0', 1565038149),
(16, 1014, 'Gigante Super Suprema', '9902', 0, 1, '29-05-2019', 0, 'd87463c139', 1565038149),
(17, 1015, 'Personal Margarita', '9902', 0, 1, '29-05-2019', 0, '77cc4bf1b4', 1565038149),
(18, 1016, 'Grande Margarita', '9902', 0, 1, '29-05-2019', 0, 'fa005b6097', 1565038149),
(19, 1017, 'Gigante Margarita', '9902', 0, 1, '29-05-2019', 0, '83d79f0478', 1565038149),
(20, 1018, 'Normal Chicken', '9902', 0, 1, '29-05-2019', 0, '0b6ea66dc0', 1565038150),
(21, 1019, 'Grande Chicken', '9902', 0, 1, '29-05-2019', 0, '9f9b8cc52f', 1565038150),
(22, 1020, 'Gigante Chicken', '9902', 0, 1, '29-05-2019', 0, '5e2c1097be', 1565038150),
(23, 1021, 'Normal Choriqueso', '9902', 0, 1, '29-05-2019', 0, '6dded1ce32', 1565038150),
(24, 1022, 'Grande Choriqueso', '9902', 0, 1, '29-05-2019', 0, '01451e56f4', 1565038150),
(25, 1023, 'Gigante Choriqueso', '9902', 0, 1, '29-05-2019', 0, 'd801395595', 1565038150),
(26, 1024, 'Personal Vegetariana', '9902', 0, 1, '29-05-2019', 0, 'e94702ed83', 1565038150),
(27, 1025, 'Grande Vegetariana', '9902', 0, 1, '29-05-2019', 0, '276b113bc5', 1565038150),
(28, 1026, 'Gigante Vegetariana', '9902', 0, 1, '29-05-2019', 0, 'ba69115232', 1565038150),
(29, 1027, 'Normal Hawaiana', '9902', 0, 1, '29-05-2019', 0, 'ca665d7f7a', 1565038150),
(30, 1028, 'Grande Hawaiana', '9902', 0, 1, '29-05-2019', 0, 'd8b2283b35', 1565038150),
(31, 1029, 'Gigante Hawaiana', '9902', 0, 1, '29-05-2019', 0, '39ef76d1ee', 1565038150),
(32, 1030, 'Personal Catracha', '9903', 0, 1, '29-05-2019', 0, 'a2b65f9449', 1565038150),
(33, 1031, 'Grande Catracha', '9903', 0, 1, '29-05-2019', 0, 'e987f0b055', 1565038150),
(34, 1032, 'Gigante Catracha', '9903', 0, 1, '29-05-2019', 0, '34bea54ce0', 1565038150),
(35, 1033, 'Normal de Camaron', '9903', 0, 1, '29-05-2019', 0, '6b436f25f4', 1565038150),
(36, 1034, 'Grande  de Camaron', '9903', 0, 1, '29-05-2019', 0, 'ef51b2d08c', 1565038150),
(37, 1035, 'Gigante  de Camaron', '9903', 0, 1, '29-05-2019', 0, '50e37d481b', 1565038150),
(38, 1036, 'Personal Bacon con Maiz', '9903', 0, 1, '29-05-2019', 0, '1d01597c59', 1565038150),
(39, 1037, 'Grande Bacon con Maiz', '9903', 0, 1, '29-05-2019', 0, '0ba073ae4b', 1565038150),
(40, 1038, 'Gigante Bacon con Maiz', '9903', 0, 1, '29-05-2019', 0, '786278f014', 1565038150),
(41, 1039, 'Normal Mediterranea', '9903', 0, 1, '29-05-2019', 0, '10cc20c027', 1565038150),
(42, 1040, 'Grande Mediterranea', '9903', 0, 1, '29-05-2019', 0, '164a41ad02', 1565038150),
(43, 1041, 'Gigante  Mediterranea', '9903', 0, 1, '29-05-2019', 0, '80ca003642', 1565038150),
(44, 1042, 'Personal Tropical', '9903', 0, 1, '29-05-2019', 0, '486baf1aec', 1565038150),
(45, 1043, 'Grande Tropical', '9903', 0, 1, '29-05-2019', 0, 'b9cd0d837a', 1565038150),
(46, 1044, 'Gigante  Tropical', '9903', 0, 1, '29-05-2019', 0, 'e3fc43e604', 1565038150),
(47, 1045, 'Fresco 1.5 Lts', '0', 0, 1, '29-05-2019', 0, '1be7b8142f', 1565038151),
(48, 1046, 'Fresco Lata', '0', 0, 1, '29-05-2019', 0, 'dae7f44920', 1565038151),
(49, 1047, 'Bote de Agua', '0', 0, 1, '29-05-2019', 0, '656de0ea3f', 1565038151),
(50, 1048, 'Fresco Jumbo', '0', 0, 1, '29-05-2019', 0, '52237f0692', 1565038151),
(51, 1049, 'Fresco Natural', '0', 0, 1, '29-05-2019', 0, 'b0f8c21df2', 1565038151),
(52, 1050, '6 Alitas', '9904', 0, 1, '29-05-2019', 0, '62bfd6b888', 1565038151),
(53, 1051, '12 Alitas', '9904', 0, 1, '29-05-2019', 0, 'ca6684bbee', 1565038151),
(54, 1052, '24 Alitas', '9904', 0, 1, '29-05-2019', 0, '0050fd31e5', 1565038151),
(55, 1053, 'Pan con Ajo 6 U', '9905', 0, 1, '29-05-2019', 0, 'dcc1d7039d', 1565038151),
(56, 1054, 'Pan con Ajo 12 U', '9905', 0, 1, '29-05-2019', 0, '3b05ea2e79', 1565038151),
(58, 1055, 'Orilla de queso Pesonal', '9905', 0, 1, '29-05-2019', 0, '5180498ad3', 1565038151),
(59, 1056, 'Orilla de queso Grande', '9905', 0, 1, '29-05-2019', 0, '87dcb59e7f', 1565038151),
(60, 1057, 'Orilla de queso Gigante', '9905', 0, 1, '29-05-2019', 0, 'a70c112ddd', 1565038151),
(61, 1058, 'Combo Orilla de Queso', '0', 0, 1, '29-05-2019', 0, 'affec36829', 1565038151);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_venta_especial`
--

CREATE TABLE `productos_venta_especial` (
  `id` int(5) NOT NULL,
  `producto` int(5) NOT NULL,
  `td` int(2) NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos_venta_especial`
--

INSERT INTO `productos_venta_especial` (`id`, `producto`, `td`, `hash`, `time`) VALUES
(1, 1045, 0, '8693b08dfb', 1565038151),
(2, 1046, 0, '9b564fc549', 1565038151);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pro_asignado`
--

CREATE TABLE `pro_asignado` (
  `id` int(6) NOT NULL,
  `iden` int(6) NOT NULL,
  `cod` int(6) NOT NULL,
  `dependiente` varchar(60) NOT NULL,
  `td` int(5) NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pro_asignado`
--

INSERT INTO `pro_asignado` (`id`, `iden`, `cod`, `dependiente`, `td`, `hash`, `time`) VALUES
(1, 1, 1001, '2', 0, '5c029d00da', 1565038147),
(2, 2, 1004, '5', 0, '7e1abdba64', 1565038147),
(4, 4, 1058, '5', 0, '79d0a1b62b', 1565038147),
(5, 5, 1045, '5', 0, '3dee266984', 1565038147),
(6, 6, 1046, '4', 0, 'b4d77bf11f', 1565038147),
(7, 7, 1048, '6', 0, '6ce479d2ee', 1565038147),
(8, 8, 1047, '7', 0, '7001f0cb77', 1565038147);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pro_bruto`
--

CREATE TABLE `pro_bruto` (
  `id` int(6) NOT NULL,
  `iden` int(6) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `cantidad` float(10,4) NOT NULL,
  `um` varchar(50) NOT NULL,
  `td` int(2) NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pro_bruto`
--

INSERT INTO `pro_bruto` (`id`, `iden`, `nombre`, `cantidad`, `um`, `td`, `hash`, `time`) VALUES
(1, 1, 'Alitas', 15.0000, '1', 0, '4314aa8bfa', 1565038147),
(2, 2, 'Fresco Lata', 3.0000, '1', 0, 'adb5c4fd01', 1588993886),
(3, 3, 'Fresco 1.5 ', 3.0000, '1', 0, '7f42f12446', 1588993887),
(4, 4, 'Arina', 3.6000, '2', 0, 'd3ecd9ff97', 1588993887),
(5, 5, 'Fresco Jumbo', 4.0000, '1', 0, '06bfcbc822', 1588993887),
(6, 6, 'Bote de Agua', -2.0000, '1', 0, '0ff5e8d48c', 1588993886);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pro_dependiente`
--

CREATE TABLE `pro_dependiente` (
  `id` int(6) NOT NULL,
  `iden` int(6) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `producto` int(5) NOT NULL,
  `cantidad` float(10,4) NOT NULL,
  `td` int(3) NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pro_dependiente`
--

INSERT INTO `pro_dependiente` (`id`, `iden`, `nombre`, `producto`, `cantidad`, `td`, `hash`, `time`) VALUES
(1, 1, 'Arina Personal', 4, 0.5000, 0, '89418c2105', 1565038148),
(2, 2, 'Arina grande', 4, 0.7000, 0, '575d822982', 1565038148),
(3, 3, 'Arina Gigante', 4, 1.2000, 0, '78eaf2866d', 1565038148),
(4, 4, 'Fresco lata', 2, 1.0000, 0, '9f0782e790', 1565038148),
(5, 5, 'Fresco 1.5 Lts', 3, 1.0000, 0, 'eac275211f', 1565038148),
(6, 6, 'Fresco Jumbo', 5, 1.0000, 0, '0791a8411b', 1565038148),
(7, 7, 'Bote de Agua', 6, 1.0000, 0, '5538075459', 1565038148);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pro_historial_addpro`
--

CREATE TABLE `pro_historial_addpro` (
  `id` int(5) NOT NULL,
  `producto` varchar(50) NOT NULL,
  `cantidad` float(10,2) NOT NULL,
  `comentarios` varchar(100) NOT NULL,
  `descuenta` varchar(50) NOT NULL,
  `fecha` varchar(30) NOT NULL,
  `hora` varchar(30) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `td` int(5) NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pro_historial_averias`
--

CREATE TABLE `pro_historial_averias` (
  `id` int(5) NOT NULL,
  `producto` varchar(50) NOT NULL,
  `cantidad` float(10,2) NOT NULL,
  `comentarios` varchar(100) NOT NULL,
  `descuenta` varchar(50) NOT NULL,
  `fecha` varchar(30) NOT NULL,
  `hora` varchar(30) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `td` int(5) NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pro_historial_averias`
--

INSERT INTO `pro_historial_averias` (`id`, `producto`, `cantidad`, `comentarios`, `descuenta`, `fecha`, `hora`, `usuario`, `td`, `hash`, `time`) VALUES
(2, '1', 1.00, 'Se echo a perder', '- 0.5 Libras a Arina', '18-09-2019', '20:48:20', 'Jazmin Nunez', 0, 'caa9a6da91', 1568947700);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pro_registro_averia`
--

CREATE TABLE `pro_registro_averia` (
  `id` int(5) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `cantidad` float(10,4) NOT NULL,
  `fecha` varchar(50) NOT NULL,
  `hora` varchar(50) NOT NULL,
  `td` int(3) NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pro_registro_up`
--

CREATE TABLE `pro_registro_up` (
  `id` int(5) NOT NULL,
  `fecha` varchar(50) NOT NULL,
  `hora` varchar(50) NOT NULL,
  `td` int(2) NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pro_registro_up`
--

INSERT INTO `pro_registro_up` (`id`, `fecha`, `hora`, `td`, `hash`, `time`) VALUES
(6, '04-06-2019', '23:48:38', 0, '1bb1f3d170', 1565038149),
(8, '08-05-2020', '21:11:27', 0, 'c283ea5a67', 1588993887);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pro_unidades_medida`
--

CREATE TABLE `pro_unidades_medida` (
  `id` int(5) NOT NULL,
  `iden` int(6) NOT NULL,
  `unidad` varchar(50) NOT NULL,
  `abreviacion` varchar(30) NOT NULL,
  `td` int(2) NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pro_unidades_medida`
--

INSERT INTO `pro_unidades_medida` (`id`, `iden`, `unidad`, `abreviacion`, `td`, `hash`, `time`) VALUES
(1, 1, 'Unidades', 'U', 0, 'a466b4a233', 1565038149),
(2, 2, 'Libras', 'Lbs', 0, 'd9c7f73e2d', 1565038149),
(3, 3, 'Paquetes', 'Paq', 0, '30be7597d7', 1565038149);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sync_tabla`
--

CREATE TABLE `sync_tabla` (
  `id` int(5) NOT NULL,
  `tabla` varchar(50) NOT NULL,
  `edo` int(2) NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL,
  `td` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='las tablas que deben actualizarse';

--
-- Volcado de datos para la tabla `sync_tabla`
--

INSERT INTO `sync_tabla` (`id`, `tabla`, `edo`, `hash`, `time`, `td`) VALUES
(1, 'alter_materiaprima_reporte', 1, 'd5f4234af5', 1568947126, 0),
(2, 'alter_opciones', 1, 'b4d2506d0d', 1564698509, 0),
(3, 'alter_producto_reporte', 1, '34738426df', 1564698515, 0),
(4, 'categorias', 1, '5066ab080b', 1564698517, 0),
(5, 'config_master', 1, '66552e24f7', 1564698519, 0),
(6, 'config_root', 1, '505ff6e942', 1564698522, 0),
(7, 'control_cocina', 1, 'e23cc455df', 1564698524, 0),
(8, 'control_panel_mostrar', 1, '2f25ccd2bd', 1564698527, 0),
(9, 'corte_diario', 1, 'fd3b08ba9f', 1564698529, 0),
(10, 'facturar_cai', 1, '26436d0ac4', 1564698532, 0),
(11, 'facturar_impresora', 1, '28b56e4ded', 1564698535, 0),
(12, 'facturar_rtn', 1, 'f0df11e802', 1564698538, 0),
(13, 'facturar_rtn_cliente', 1, 'b314635ba1', 1564698541, 0),
(14, 'facturar_ticket', 1, '9b759b5ae6', 1564698545, 0),
(15, 'facturar_users', 1, '22b97c9b61', 1564698548, 0),
(16, 'gastos', 1, '18d9ef3501', 1564698550, 0),
(17, 'gastos_images', 1, 'e5336bec05', 1564698552, 0),
(18, 'images', 1, '99c7d2f0ca', 1564698554, 0),
(19, 'mesa', 1, 'bc14f1168d', 1564698568, 0),
(20, 'mesa_nombre', 1, '4c829ef26b', 1564698572, 0),
(21, 'opciones', 1, '86b58d68ae', 1564698575, 0),
(22, 'opciones_asig', 1, '6e84327d95', 1564698578, 0),
(23, 'opciones_name', 1, '593b218bed', 1564698581, 0),
(24, 'opciones_ticket', 1, '9fe4f7a719', 1564698584, 0),
(25, 'precios', 1, '95f0377715', 1564698588, 0),
(26, 'pro_asignado', 1, '91a907780e', 1564698591, 0),
(27, 'pro_bruto', 1, '939d6c0996', 1564698595, 0),
(28, 'pro_dependiente', 1, '6c881e04d9', 1564698598, 0),
(29, 'pro_dependiente', 1, 'b974660bc7', 1564698616, 0),
(30, 'pro_historial_addpro', 1, 'f839971f61', 1564698656, 0),
(31, 'pro_historial_averias', 1, 'c0bdc91b94', 1564698660, 0),
(32, 'pro_registro_averia', 1, '0eb76c6f95', 1564698664, 0),
(33, 'pro_registro_up', 1, '0dbec6a73e', 1564698673, 0),
(34, 'pro_unidades_medida', 1, '72bf81b22d', 1564698709, 0),
(35, 'producto', 1, 'b9218a9cd9', 1564698713, 0),
(36, 'productos_venta_especial', 1, '8f6f17af02', 1564698717, 0),
(41, 'ticket', 1, '7a9cfb6c6b', 1564698738, 0),
(42, 'ticket_num', 1, 'd0a02a2ba4', 1564698742, 0),
(43, 'ticket_propina', 1, '14459b72d6', 1564698746, 0),
(44, 'entradas_efectivo', 1, '57881bea35', 1585896630, 0),
(45, 'sync_up_cloud', 1, '0469356f51', 1585896643, 0),
(46, 'planilla_pagos', 1, 'a9aedda715', 1585896661, 0),
(47, 'planilla_extras', 1, '99c59ae18b', 1585896689, 0),
(48, 'planilla_empleados', 1, 'dd084dd7ae', 1585896700, 0),
(49, 'planilla_descuentos_asig', 1, '318ad1b64a', 1585896708, 0),
(50, 'planilla_descuentos', 1, '9bca7617cf', 1585896716, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sync_tables_updates`
--

CREATE TABLE `sync_tables_updates` (
  `id` int(5) NOT NULL,
  `tabla` varchar(50) NOT NULL,
  `hash` varchar(12) NOT NULL COMMENT 'has de la tabla a eliminar',
  `time` int(12) NOT NULL,
  `action` int(2) NOT NULL COMMENT '1 =  borrar. 2= actualizar',
  `td` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sync_tables_updates`
--

INSERT INTO `sync_tables_updates` (`id`, `tabla`, `hash`, `time`, `action`, `td`) VALUES
(2, 'alter_opciones', '3d0b3223a0', 1588790947, 2, 0),
(62, 'control_cocina', '918142fa54', 1585894964, 2, 0),
(96, 'ticket_temp', 'e52de311af', 1585894964, 1, 0),
(97, 'mesa', 'ce34380a8f', 1585894964, 1, 0),
(98, 'mesa', 'db38617a18', 1585894978, 1, 0),
(99, 'corte_diario', '77e61c1e16', 1585896962, 2, 0),
(100, 'pro_registro_up', 'c9a9bd2d07', 1585895071, 1, 0),
(101, 'pro_registro_up', 'f99db05abb', 1585896782, 1, 0),
(102, 'pro_registro_up', '65f5bf59a3', 1585896814, 1, 0),
(103, 'pro_registro_up', 'bf876bca51', 1585896962, 1, 0),
(104, 'ticket_temp', 'f68452959e', 1585896973, 2, 0),
(105, 'mesa', 'a759fa7d08', 1585896974, 2, 0),
(106, 'ticket_temp', 'd0c229a32a', 1585896996, 2, 0),
(107, 'mesa', '9212afcacb', 1585896997, 2, 0),
(108, 'mesa', 'e4f617ed69', 1585945516, 1, 0),
(109, 'ticket_temp', '93e5a1f852', 1585945528, 1, 0),
(110, 'mesa', '8dcd79064d', 1585945528, 1, 0),
(111, 'control_cocina', '0457f95b65', 1586987371, 2, 0),
(112, 'ticket_temp', 'ef649e9390', 1585947142, 1, 0),
(113, 'mesa', '9bb6991082', 1585947142, 1, 0),
(114, 'mesa', 'de6cf4ce64', 1586033071, 1, 0),
(115, 'config_master', '1afcd4ad17', 1588901838, 2, 0),
(116, 'mesa', '511c120ef8', 1586980558, 1, 0),
(117, 'ticket_temp', '75ab1d70a7', 1586980586, 2, 0),
(118, 'ticket_temp', '75ab1d70a7', 1586980601, 1, 0),
(119, 'mesa', 'fc7ee06c44', 1586980601, 1, 0),
(120, 'ticket_temp', '3355ebf9ba', 1586980996, 2, 0),
(121, 'ticket_temp', '3355ebf9ba', 1586980998, 1, 0),
(122, 'mesa', '9be1f7e9d2', 1586980998, 1, 0),
(123, 'ticket_temp', '8a9e34d06c', 1586982965, 1, 0),
(124, 'mesa', '8918745f71', 1586982965, 1, 0),
(125, 'ticket_temp', '9afe6866bf', 1586983745, 1, 0),
(126, 'mesa', '2b48949688', 1586983746, 1, 0),
(127, 'ticket_temp', '5313d740c2', 1586983987, 1, 0),
(128, 'mesa', '7ab87527b3', 1586983987, 1, 0),
(129, 'control_cocina', '54a1d49ce6', 1586983987, 2, 0),
(130, 'mesa', '259bf1baa7', 1586984002, 2, 0),
(131, 'mesa', '259bf1baa7', 1586984017, 1, 0),
(132, 'mesa', '05b9b80496', 1586984389, 1, 0),
(133, 'ticket_temp', '29cbd89fee', 1586986593, 1, 0),
(134, 'mesa', '8ade2d8c28', 1586986593, 1, 0),
(135, 'control_cocina', '956badc559', 1586986593, 2, 0),
(136, 'ticket_temp', 'de44a366b2', 1586986617, 1, 0),
(137, 'mesa', '4f005bce9f', 1586986618, 1, 0),
(138, 'control_cocina', '150ea96525', 1587612291, 2, 0),
(139, 'mesa', 'd8ae6681a5', 1586986629, 1, 0),
(140, 'mesa', '1802d910f1', 1586986653, 1, 0),
(141, 'ticket_temp', '40f3744dad', 1586986963, 1, 0),
(142, 'mesa', 'c5c6123454', 1586986964, 1, 0),
(143, 'mesa_nombre', '4fa1637feb', 1586986964, 1, 0),
(144, 'control_cocina', 'dc6da0ee30', 1586986964, 2, 0),
(145, 'ticket_temp', 'f28940ca9c', 1586986972, 1, 0),
(146, 'mesa', 'bf2d448a78', 1586986972, 1, 0),
(147, 'control_cocina', '77cc90e2d1', 1586986972, 2, 0),
(148, 'ticket_temp', '2c2444515e', 1586986976, 1, 0),
(149, 'mesa', '5ad236c56a', 1586986976, 1, 0),
(150, 'control_cocina', '44e760ffb2', 1588891820, 2, 0),
(151, 'ticket_temp', 'd0509e8e94', 1586986979, 1, 0),
(152, 'mesa', '887d0786f2', 1586986980, 1, 0),
(153, 'control_cocina', '933ac5f339', 1586986980, 2, 0),
(154, 'ticket_temp', '7abbf522fe', 1586986983, 1, 0),
(155, 'mesa', 'ab25a880e7', 1586986983, 1, 0),
(156, 'ticket_temp', '61d292b8ec', 1586986986, 1, 0),
(157, 'mesa', '518e9a30a7', 1586986986, 1, 0),
(158, 'control_cocina', '8aed21490a', 1587612520, 2, 0),
(159, 'mesa', 'e445d6d03a', 1586987286, 1, 0),
(160, 'mesa', '381f5aef37', 1586987294, 1, 0),
(161, 'mesa', '86b9e23236', 1586987296, 1, 0),
(162, 'ticket_temp', '7d9f3fc6e6', 1586987371, 1, 0),
(163, 'mesa', 'e1e1b5f418', 1586987371, 1, 0),
(164, 'mesa', 'f6e428e903', 1586987375, 1, 0),
(165, 'ticket_temp', '1ad21c8eba', 1586987384, 1, 0),
(166, 'mesa', 'fbddca2ad8', 1586987384, 1, 0),
(167, 'control_cocina', '8391009452', 1588773032, 2, 0),
(168, 'ticket_temp', '93c845d0a3', 1586987570, 1, 0),
(169, 'mesa', '7b72eae45c', 1586987571, 1, 0),
(170, 'mesa', '9f213acb46', 1586987607, 1, 0),
(171, 'mesa', 'a2c934bff1', 1586989382, 1, 0),
(172, 'precios', '0f99402ff6', 1587599349, 2, 0),
(173, 'facturar_opciones', '0', 1587599383, 2, 0),
(174, 'facturar_opciones', 'd1d06d6cb4', 1587603249, 2, 0),
(175, 'facturar_opciones', '327a0186f5', 1588604225, 2, 0),
(176, 'ticket_temp', 'bd8771f60b', 1587609528, 2, 0),
(177, 'mesa', '3a53f9c902', 1587609528, 2, 0),
(178, 'ticket_temp', '01b37d2d5c', 1587609556, 2, 0),
(179, 'mesa', 'b4da6f5100', 1587609557, 2, 0),
(180, 'ticket_temp', '60e6f08f5a', 1587609574, 2, 0),
(181, 'mesa', '9adb979fa9', 1587609574, 2, 0),
(182, 'ticket_temp', 'bac3ba0e8e', 1587610921, 2, 0),
(183, 'mesa', '1ffc4c077e', 1587610921, 2, 0),
(184, 'ticket_temp', '3a7477ea0d', 1587610931, 2, 0),
(185, 'mesa', '8321522e32', 1587610931, 2, 0),
(186, 'mesa', '90d79d602c', 1587612006, 1, 0),
(187, 'ticket_temp', 'cca03f9108', 1587612030, 2, 0),
(188, 'mesa', '9a18183a13', 1587612030, 2, 0),
(189, 'ticket_temp', '9a79b160e1', 1587612286, 1, 0),
(190, 'mesa', '782486b4be', 1587612286, 1, 0),
(191, 'ticket_temp', '2986242e40', 1587612291, 1, 0),
(192, 'mesa', '18c65bf0a9', 1587612291, 1, 0),
(193, 'mesa', '08c6ce04e7', 1587612294, 1, 0),
(194, 'mesa', '7d94941f76', 1587612300, 1, 0),
(195, 'ticket_temp', '4a7d9190a6', 1587612520, 1, 0),
(196, 'mesa', '9ea4a99bea', 1587612520, 1, 0),
(197, 'ticket_temp', '8885f06d36', 1587614127, 2, 0),
(198, 'mesa', 'ac25b41950', 1587621648, 2, 0),
(199, 'ticket_temp', 'b166d99c2a', 1587615243, 2, 0),
(200, 'mesa', '42698b09aa', 1587615243, 2, 0),
(201, 'ticket_temp', '126cacbc74', 1587615264, 2, 0),
(202, 'mesa', 'f7d982eebb', 1587615265, 2, 0),
(203, 'ticket_temp', '9b462e271f', 1587621648, 2, 0),
(204, 'mesa', 'bbe4ed2cf0', 1588604156, 1, 0),
(205, 'mesa', 'c8edf52b43', 1588609011, 1, 0),
(206, 'mesa', '9b56743a25', 1588609068, 2, 0),
(207, 'ticket_temp', '95297598ef', 1588609039, 2, 0),
(208, 'ticket_temp', 'eb96c97221', 1588609068, 2, 0),
(209, 'ticket_temp', '85374b1f5a', 1588609934, 2, 0),
(210, 'ticket_temp', '750b9bb4de', 1588609947, 2, 0),
(211, 'mesa', 'd12c39e516', 1588609947, 2, 0),
(212, 'ticket_temp', 'a35f19e0b9', 1588610024, 2, 0),
(213, 'mesa', 'e88e1d2867', 1588610024, 2, 0),
(214, 'ticket_temp', '1103fefb5e', 1588610068, 2, 0),
(215, 'mesa', 'b8d889d20b', 1588610069, 2, 0),
(216, 'ticket_temp', '00208b1f1f', 1588610234, 1, 0),
(217, 'mesa', '7aff552600', 1588610234, 1, 0),
(218, 'control_cocina', 'e70bcfd166', 1588772621, 2, 0),
(219, 'mesa', '1f1738533f', 1588610237, 1, 0),
(220, 'mesa', 'f515f8ee95', 1588616028, 1, 0),
(221, 'ticket_temp', 'f3916c9287', 1588616035, 1, 0),
(222, 'mesa', '5aa27f0344', 1588616035, 1, 0),
(223, 'mesa', 'b08fa2b9c5', 1588616040, 1, 0),
(224, 'ticket_temp', '57081595bc', 1588772235, 1, 0),
(225, 'mesa', '6fbb6858ab', 1588772235, 1, 0),
(226, 'mesa', 'bb33dc1c07', 1588772240, 1, 0),
(227, 'ticket_temp', 'e070be7c56', 1588772270, 2, 0),
(228, 'mesa', '0f8ced1899', 1588772270, 2, 0),
(229, 'ticket_temp', 'e0b97ba0aa', 1588772618, 2, 0),
(230, 'ticket_temp', '7f223730ca', 1588772621, 1, 0),
(231, 'ticket_temp', 'e1dc1a5338', 1588772628, 1, 0),
(232, 'mesa', '9d375f532d', 1588772628, 1, 0),
(233, 'ticket_temp', '879b094450', 1588772683, 2, 0),
(234, 'mesa', '5f418639c9', 1588772684, 2, 0),
(235, 'ticket_temp', '1c2def22e9', 1588773024, 1, 0),
(236, 'mesa', 'ba0abf30b1', 1588773024, 1, 0),
(237, 'control_cocina', '91bfc5d622', 1588896216, 2, 0),
(238, 'mesa', '9fa7b5c44f', 1588773027, 1, 0),
(239, 'mesa', '0063147bd6', 1588773032, 1, 0),
(240, 'ticket_temp', '54bb31c4a4', 1588776488, 2, 0),
(241, 'mesa', '9bea429291', 1588776488, 2, 0),
(242, 'mesa', '4307db0405', 1588776493, 1, 0),
(243, 'ticket_temp', '3dd6ea388e', 1588776585, 2, 0),
(244, 'ticket_temp', 'e93f6fddfd', 1588776582, 1, 0),
(245, 'control_cocina', '41729e09ee', 1588776585, 2, 0),
(246, 'ticket_temp', '458764b11a', 1588776586, 1, 0),
(247, 'mesa', 'c29160961a', 1588776700, 1, 0),
(248, 'ticket_temp', 'a226113510', 1588776717, 1, 0),
(249, 'mesa', 'a9d10c68fb', 1588776717, 1, 0),
(250, 'control_cocina', '4a2192dcfb', 1588776717, 2, 0),
(251, 'ticket_temp', 'e315e76cf4', 1588776721, 1, 0),
(252, 'mesa', 'c7e045c8a7', 1588776721, 1, 0),
(253, 'ticket_temp', '6a2aab8bfc', 1588776753, 2, 0),
(254, 'ticket_temp', '9e739da338', 1588776779, 2, 0),
(255, 'mesa', '494998f901', 1588776779, 2, 0),
(256, 'ticket_temp', 'b9d0e1f190', 1588776784, 2, 0),
(257, 'mesa', '1820dcf64e', 1588776785, 2, 0),
(258, 'ticket_temp', '0b8916feba', 1588776791, 2, 0),
(259, 'mesa', 'fc8c73a0e1', 1588776792, 2, 0),
(260, 'mesa', '756b503e64', 1588778071, 1, 0),
(261, 'ticket_temp', '3e3235d6b5', 1588778154, 2, 0),
(262, 'mesa', '5a4074fc3a', 1588778154, 2, 0),
(263, 'mesa', '8ad593d7e4', 1588778161, 1, 0),
(264, 'ticket_temp', '2b9d15020e', 1588778247, 2, 0),
(265, 'mesa', '93c0ecf1dc', 1588778247, 2, 0),
(266, 'mesa', 'e9cf088193', 1588778613, 1, 0),
(267, 'ticket_temp', '47f5fa10b4', 1588778653, 1, 0),
(268, 'mesa', 'deac1f5fe5', 1588778653, 1, 0),
(269, 'control_cocina', 'b59d6ce7b4', 1588881847, 2, 0),
(270, 'mesa', '995a48841c', 1588778668, 1, 0),
(271, 'ticket_temp', '0d292edf8d', 1588778753, 1, 0),
(272, 'mesa', '724f3a3095', 1588778753, 1, 0),
(273, 'ticket_temp', 'c049ae2cfe', 1588778821, 2, 0),
(274, 'mesa', '8801a2901f', 1588778821, 2, 0),
(275, 'mesa', '1d427cd703', 1588778922, 1, 0),
(276, 'ticket_temp', '1fa8c0ef1a', 1588779139, 2, 0),
(277, 'mesa', 'fa82b20a3f', 1588779139, 2, 0),
(278, 'mesa', '8f9e989a6f', 1588779144, 1, 0),
(279, 'control_cocina', '58b624ad32', 1588779698, 2, 0),
(280, 'control_cocina', '190e90235e', 1588779700, 2, 0),
(281, 'control_cocina', 'b18b225d3f', 1588779702, 2, 0),
(282, 'control_cocina', '1cb071fa9c', 1588779704, 2, 0),
(283, 'control_cocina', '696b42311d', 1588779705, 2, 0),
(284, 'control_cocina', 'ee50ea201b', 1588779706, 2, 0),
(285, 'mesa', '3d672836fc', 1588779810, 1, 0),
(286, 'mesa', '45eaeff1fe', 1588786965, 1, 0),
(287, 'mesa', '3ba637c38b', 1588786975, 1, 0),
(288, 'mesa', '3bef6593c5', 1588788118, 1, 0),
(289, 'mesa', '2f9d10ae73', 1588788129, 1, 0),
(290, 'mesa', '630a66fb76', 1588788140, 1, 0),
(291, 'mesa', '7f549c8c38', 1588788152, 1, 0),
(292, 'mesa', 'b174391cc7', 1588788214, 1, 0),
(293, 'mesa', '47e552df23', 1588788315, 1, 0),
(294, 'mesa', '0d016ec626', 1588788382, 1, 0),
(295, 'mesa', '7e25875386', 1588788404, 1, 0),
(296, 'mesa', '392c13687c', 1588788500, 1, 0),
(297, 'ticket_temp', '52697a6b84', 1588788798, 1, 0),
(298, 'mesa', '207b91c1f2', 1588788798, 1, 0),
(299, 'control_cocina', 'f7ff6f958b', 1588790769, 2, 0),
(300, 'mesa', '6d5af61d82', 1588790518, 1, 0),
(301, 'ticket_temp', 'af46de9c55', 1588790769, 1, 0),
(302, 'mesa', '96d4497882', 1588790769, 1, 0),
(303, 'ticket_temp', 'e9d11bb2c1', 1588790978, 2, 0),
(304, 'mesa', '7a4e194353', 1588790978, 2, 0),
(305, 'ticket_temp', '8aff950e04', 1588790982, 2, 0),
(306, 'mesa', '11ee82aec5', 1588790982, 2, 0),
(307, 'ticket_temp', '983ef9c865', 1588790993, 2, 0),
(308, 'mesa', 'ab84e0059b', 1588790994, 2, 0),
(309, 'ticket_temp', '7ebf17a390', 1588790994, 2, 0),
(310, 'mesa', '457f609fea', 1588790994, 2, 0),
(311, 'mesa', '8d0d343def', 1588791001, 1, 0),
(312, 'ticket_temp', '017a594fe5', 1588791007, 2, 0),
(313, 'mesa', '6912e64e77', 1588791007, 2, 0),
(314, 'mesa', 'cfccf34983', 1588791011, 1, 0),
(315, 'ticket_temp', 'fe155b5010', 1588791091, 2, 0),
(316, 'mesa', '0a922da2da', 1588791091, 2, 0),
(317, 'ticket_temp', 'b9eb907ba5', 1588791185, 2, 0),
(318, 'mesa', '94208bf657', 1588791185, 2, 0),
(319, 'mesa', '8929143e45', 1588791189, 1, 0),
(320, 'mesa', '1fc6042f50', 1588791204, 2, 0),
(321, 'mesa', '1fc6042f50', 1588791210, 1, 0),
(322, 'mesa', '4cfc79fa21', 1588855761, 1, 0),
(323, 'clientes', '7022607c9a', 1588858077, 2, 0),
(324, 'clientes', '7022607c9a', 1588858172, 1, 0),
(325, 'clientes', '0a4958e211', 1588858267, 1, 0),
(326, 'clientes', '56681df57f', 1588858526, 1, 0),
(327, 'clientes', 'bfe1093de5', 1588858562, 1, 0),
(328, 'clientes', 'eeb6ab7959', 1588858655, 1, 0),
(329, 'clientes', '11cc8a1199', 1588858957, 1, 0),
(330, 'clientes', '6d9810a6c2', 1588859105, 2, 0),
(331, 'clientes', '6d9810a6c2', 1588859117, 1, 0),
(332, 'clientes', '9abffc6106', 1588860645, 1, 0),
(333, 'clientes', 'a27c840c20', 1588860697, 1, 0),
(334, 'clientes', '51bb719133', 1588861034, 1, 0),
(335, 'clientes', 'fa15b82955', 1588861049, 1, 0),
(336, 'clientes', '739d17fb4c', 1588861120, 1, 0),
(337, 'clientes', '481f00e015', 1588862008, 1, 0),
(338, 'clientes', '1e10308f13', 1588862049, 1, 0),
(339, 'clientes', '2028d36e1d', 1588862240, 1, 0),
(340, 'mesa', '492285586b', 1588865329, 1, 0),
(341, 'mesa', '946631acde', 1588866612, 1, 0),
(342, 'mesa', '3256e85d6a', 1588867097, 1, 0),
(343, 'mesa', '4a826ed7e3', 1588867191, 1, 0),
(344, 'mesa', 'efbb2f9baf', 1588867210, 1, 0),
(345, 'mesa', '348dff85d0', 1588867234, 1, 0),
(346, 'mesa', '6f7f087a7d', 1588867718, 1, 0),
(347, 'mesa', '169d920a49', 1588868065, 1, 0),
(348, 'mesa', '71646d77d5', 1588868565, 1, 0),
(349, 'mesa', 'cb37275ad6', 1588868656, 1, 0),
(350, 'mesa', 'd716019c86', 1588868661, 1, 0),
(351, 'mesa', '6380030c5d', 1588869621, 1, 0),
(352, 'mesa', 'c4f5ed360c', 1588869625, 1, 0),
(353, 'mesa', 'eae83400dd', 1588869642, 1, 0),
(354, 'mesa', '81f7dfce38', 1588869690, 1, 0),
(355, 'mesa', '2c9c8f8c66', 1588869706, 1, 0),
(356, 'mesa', '65a8222eae', 1588869713, 1, 0),
(357, 'mesa', '1c99818679', 1588869834, 1, 0),
(358, 'mesa', '585d9700ae', 1588870069, 1, 0),
(359, 'mesa', 'bc72a4b0e1', 1588870081, 1, 0),
(360, 'mesa', 'a096ed7df8', 1588870356, 1, 0),
(361, 'mesa', 'f73440e6a7', 1588870416, 1, 0),
(362, 'mesa', 'd148e3809a', 1588871985, 1, 0),
(363, 'mesa', '0123744469', 1588872036, 1, 0),
(364, 'mesa', 'c1356ccd69', 1588872063, 1, 0),
(365, 'mesa', '32c39ffd7d', 1588872097, 1, 0),
(366, 'ticket_temp', 'a3535256cb', 1588881846, 1, 0),
(367, 'mesa', '43447e1889', 1588881847, 1, 0),
(368, 'mesa', 'ed49f2c385', 1588882081, 1, 0),
(369, 'mesa', '79a92921e3', 1588882140, 1, 0),
(370, 'mesa', '3bed0aa35f', 1588882148, 1, 0),
(371, 'mesa', 'c891bcba44', 1588882236, 1, 0),
(372, 'mesa', '624ed73fcc', 1588882244, 1, 0),
(373, 'mesa', '1ffbe9b580', 1588882253, 1, 0),
(374, 'mesa', 'e38a3ea8eb', 1588882265, 1, 0),
(375, 'mesa', '3004dbdee7', 1588882271, 1, 0),
(376, 'mesa', '40ccb3563c', 1588882275, 1, 0),
(377, 'mesa', '9b7826ffbd', 1588891723, 1, 0),
(378, 'ticket_temp', '839faa521f', 1588891820, 2, 0),
(379, 'ticket_temp', 'bd50f3b197', 1588891818, 1, 0),
(380, 'ticket_temp', '839faa521f', 1588891822, 1, 0),
(381, 'mesa', '6f9397b72c', 1588891822, 1, 0),
(382, 'ticket_temp', '3ba918d468', 1588891946, 2, 0),
(383, 'mesa', '3911e9e288', 1588891946, 2, 0),
(384, 'ticket_temp', '6ee25ec55e', 1588892078, 1, 0),
(385, 'mesa', '8635f9daf0', 1588892079, 1, 0),
(386, 'ticket_temp', '13d2ccf318', 1588892896, 1, 0),
(387, 'mesa', '23a85ee51a', 1588892896, 1, 0),
(388, 'control_cocina', '2c777d2245', 1588899936, 2, 0),
(389, 'ticket_temp', '62206229f3', 1588892906, 1, 0),
(390, 'mesa', 'e801f16485', 1588892906, 1, 0),
(391, 'control_cocina', '0e2c3d12f8', 1588899588, 2, 0),
(392, 'ticket_temp', '7563a8f3dd', 1588893054, 1, 0),
(393, 'mesa', 'adcf1ed1e8', 1588893054, 1, 0),
(394, 'mesa', '1edfc1eec7', 1588893170, 1, 0),
(395, 'mesa', 'ebded75995', 1588893304, 1, 0),
(396, 'mesa', '14e42a4dd1', 1588893355, 1, 0),
(397, 'mesa', 'eb4b16add4', 1588893370, 1, 0),
(398, 'mesa', '7d0ffa057b', 1588893468, 1, 0),
(399, 'ticket_temp', '0c0832f2cc', 1588893542, 1, 0),
(400, 'mesa', 'a369b34e6e', 1588893542, 1, 0),
(401, 'mesa', 'ff60c97575', 1588893570, 1, 0),
(402, 'mesa', '5f8f00c632', 1588893682, 1, 0),
(403, 'mesa', '5df36319b8', 1588893778, 1, 0),
(404, 'mesa', 'c716fca11b', 1588893804, 1, 0),
(405, 'mesa', '4e049c6f67', 1588894534, 1, 0),
(406, 'mesa', '69fbb318c6', 1588894571, 1, 0),
(407, 'ticket_temp', '657828a014', 1588894871, 1, 0),
(408, 'ticket_temp', '70109242c3', 1588894873, 1, 0),
(409, 'mesa', 'c19cfda101', 1588894873, 1, 0),
(410, 'control_cocina', 'b62f923aa7', 1588894873, 2, 0),
(411, 'mesa', '3de44594ee', 1588894889, 1, 0),
(412, 'mesa', '14587c4b21', 1588894904, 1, 0),
(413, 'clientes_mesa', '379a1db7b4', 1588894904, 1, 0),
(414, 'mesa', 'f54e02f19c', 1588894964, 1, 0),
(415, 'ticket_temp', '9b64387cb6', 1588896212, 1, 0),
(416, 'control_cocina', '68b9bddfcb', 1588896212, 2, 0),
(417, 'ticket_temp', 'da952ae2bb', 1588896213, 1, 0),
(418, 'ticket_temp', '94ff16fd04', 1588896214, 1, 0),
(419, 'ticket_temp', '8c3aeead9e', 1588896215, 1, 0),
(420, 'ticket_temp', 'b535a4ab81', 1588896216, 1, 0),
(421, 'mesa', '06fa7c762f', 1588896216, 1, 0),
(422, 'mesa', '06b356da7b', 1588896238, 1, 0),
(423, 'clientes_mesa', '29981f57eb', 1588896238, 1, 0),
(424, 'mesa', '7c3870dcbc', 1588896250, 1, 0),
(425, 'mesa', 'be7e7dfa55', 1588896264, 1, 0),
(426, 'clientes_mesa', '051943cbed', 1588896264, 1, 0),
(427, 'mesa', 'c69fc35a25', 1588897755, 1, 0),
(428, 'clientes_mesa', 'eb69aab2d8', 1588897755, 1, 0),
(429, 'mesa', '4e7f945ccb', 1588897943, 1, 0),
(430, 'clientes_mesa', '13515969c6', 1588897943, 1, 0),
(431, 'mesa', 'db9a8ee080', 1588898025, 1, 0),
(432, 'clientes_mesa', '06e4bbe9af', 1588898025, 1, 0),
(433, 'mesa', '108fa2cf9a', 1588898155, 1, 0),
(434, 'clientes_mesa', '6878455bfc', 1588898155, 1, 0),
(435, 'ticket_temp', '2847864010', 1588898270, 1, 0),
(436, 'mesa', '580c007e1a', 1588898270, 1, 0),
(437, 'clientes_mesa', '486b54b7ff', 1588898270, 1, 0),
(438, 'mesa', '4b0976078f', 1588898287, 1, 0),
(439, 'clientes_mesa', '7b2351716d', 1588898287, 1, 0),
(440, 'mesa', '53da25f611', 1588898295, 1, 0),
(441, 'clientes_mesa', '59b9220d37', 1588898295, 1, 0),
(442, 'mesa', '3931281c3e', 1588898304, 1, 0),
(443, 'clientes_mesa', 'ece855d0c4', 1588899058, 1, 0),
(444, 'clientes_mesa', '5cc1a32a50', 1588899070, 1, 0),
(445, 'mesa', 'a17e9fde19', 1588899155, 1, 0),
(446, 'ticket_temp', 'f90b29c8aa', 1588899276, 2, 0),
(447, 'mesa', 'f44ac72afb', 1588899276, 2, 0),
(448, 'mesa', '0feb07b552', 1588899288, 1, 0),
(449, 'clientes_mesa', '2e175c7240', 1588899288, 1, 0),
(450, 'mesa', '29c7468867', 1588899295, 1, 0),
(451, 'mesa', '40f9b80e1f', 1588899506, 1, 0),
(452, 'mesa', '7b5a7a13cd', 1588899535, 1, 0),
(453, 'mesa', 'f56209bf98', 1588899539, 1, 0),
(454, 'mesa', 'dd9691ac86', 1588899543, 1, 0),
(455, 'mesa', '875d38b357', 1588899561, 1, 0),
(456, 'mesa', '06dcc255e7', 1588899588, 1, 0),
(457, 'clientes_mesa', 'bf6ee7406b', 1588899588, 1, 0),
(458, 'ticket_temp', 'e22b293cfd', 1588899640, 2, 0),
(459, 'mesa', '7cd6c8a645', 1588899641, 2, 0),
(460, 'ticket_temp', 'e9007e2107', 1588899935, 1, 0),
(461, 'mesa', 'afde025048', 1588899935, 1, 0),
(462, 'clientes_mesa', '0f5d518f93', 1588899935, 1, 0),
(463, 'ticket_temp', '5919244615', 1588899993, 1, 0),
(464, 'mesa', 'd364af8a10', 1588899993, 1, 0),
(465, 'control_cocina', 'a652b7e9d7', 1588899993, 2, 0),
(466, 'mesa', '2193d4db22', 1588901453, 1, 0),
(467, 'ticket_temp', 'f25e6ce69d', 1588901494, 1, 0),
(468, 'mesa', '4ccbd025e8', 1588901494, 1, 0),
(469, 'clientes_mesa', '8c1cc02a0e', 1588901494, 1, 0),
(470, 'control_cocina', '26f5000ee0', 1588901583, 2, 0),
(471, 'ticket_temp', '14ac09d079', 1588901515, 1, 0),
(472, 'mesa', 'a0c3c09d08', 1588901515, 1, 0),
(473, 'control_cocina', '0d9965c195', 1588901515, 2, 0),
(474, 'ticket_temp', '5e863c0870', 1588901558, 1, 0),
(475, 'mesa', '3318d777c8', 1588901558, 1, 0),
(476, 'ticket_temp', '94112da7c8', 1588901582, 1, 0),
(477, 'mesa', '8deeb68683', 1588901582, 1, 0),
(478, 'ticket_temp', 'b893773b58', 1588901605, 1, 0),
(479, 'clientes', '8d15f9164c', 1588901634, 1, 0),
(480, 'clientes', '9aa0e63140', 1588901647, 1, 0),
(481, 'clientes', '98fefb6364', 1588901652, 1, 0),
(482, 'clientes', '50d1569ee8', 1588901656, 1, 0),
(483, 'clientes', 'd6886fb80d', 1588901663, 1, 0),
(484, 'clientes', '4c6338553b', 1588901667, 1, 0),
(485, 'clientes', '345a2f2e8f', 1588901670, 1, 0),
(486, 'clientes', '990c92b384', 1588901693, 1, 0),
(487, 'clientes', '6383c405c8', 1588901699, 1, 0),
(488, 'clientes', '7bd8fb8841', 1588901707, 1, 0),
(489, 'mesa', 'e66eb8d2ed', 1588901744, 1, 0),
(490, 'clientes', '796272d58e', 1588901791, 2, 0),
(491, 'mesa', 'e88b0582af', 1588901844, 1, 0),
(492, 'mesa', 'b21d684042', 1588901850, 1, 0),
(493, 'mesa', 'c1fc8c63c8', 1588901854, 1, 0),
(494, 'mesa', 'dd182cb539', 1588901859, 1, 0),
(495, 'mesa', '653a85a90d', 1588901865, 1, 0),
(496, 'config_root', 'b6ca999160', 1588901940, 2, 0),
(497, 'mesa', '489de54d41', 1588901914, 1, 0),
(498, 'mesa', '333ab513d7', 1588901919, 1, 0),
(499, 'mesa', '762cf76f5d', 1588901923, 1, 0),
(500, 'mesa', '69f0af2f2a', 1588902239, 1, 0),
(501, 'mesa', 'ee7436f554', 1588902245, 1, 0),
(502, 'mesa', 'c3b7ba23a3', 1588902275, 1, 0),
(503, 'clientes_mesa', '57011cc9b8', 1588902275, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sync_up`
--

CREATE TABLE `sync_up` (
  `id` int(6) NOT NULL,
  `creado` int(2) NOT NULL COMMENT '0 = no, 1 = si',
  `subido` int(2) NOT NULL COMMENT '0 = no, 1 = si',
  `ejecutado` int(2) NOT NULL COMMENT '0 = no, 1 = si',
  `fecha` varchar(30) NOT NULL,
  `hora` varchar(30) NOT NULL,
  `fechaF` varchar(40) NOT NULL,
  `comprobacion` varchar(100) NOT NULL,
  `inicio` int(12) NOT NULL,
  `final` int(12) NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL,
  `td` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sync_up`
--

INSERT INTO `sync_up` (`id`, `creado`, `subido`, `ejecutado`, `fecha`, `hora`, `fechaF`, `comprobacion`, `inicio`, `final`, `hash`, `time`, `td`) VALUES
(1, 1, 1, 1, '05-08-2019', '14:49:16', '1564984800', 'hashdeiniciodesistema', 1565038156, 1565038156, 'a5933b5e11', 1565038156, 0),
(2, 1, 0, 0, '03-04-2020', '00:23:07', '1585893600', '1585894987-0-16eaf3bf976d18d4dde42c3ae8f02da0', 1565038156, 1585894987, '8f8f33281c', 1585894987, 0),
(3, 1, 0, 0, '03-04-2020', '00:24:38', '1585893600', '1585895078-0-043505471fdff8672f35cfab6858f67d', 1585894987, 1585895078, '00b9cf3a2b', 1585895078, 0),
(4, 1, 0, 0, '03-04-2020', '00:53:17', '1585893600', '1585896797-0-e35b7a4601cd6116fd079c1c55a9f24b', 1585895078, 1585896797, '9b94a04190', 1585896797, 0),
(5, 1, 0, 0, '03-04-2020', '00:55:33', '1585893600', '1585896933-0-7e238b22a22037e17058dd1ac1e40cf7', 1585896797, 1585896933, '972d8195a0', 1585896933, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sync_up_cloud`
--

CREATE TABLE `sync_up_cloud` (
  `id` int(6) NOT NULL,
  `creado` int(2) NOT NULL COMMENT '0 = no, 1 = si',
  `subido` int(2) NOT NULL COMMENT '0 = no, 1 = si',
  `ejecutado` int(2) NOT NULL COMMENT '0 = no, 1 = si',
  `fecha` varchar(30) NOT NULL,
  `hora` varchar(30) NOT NULL,
  `fechaF` varchar(40) NOT NULL,
  `comprobacion` varchar(100) NOT NULL,
  `inicio` int(12) NOT NULL,
  `final` int(12) NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL,
  `td` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `system_img_check`
--

CREATE TABLE `system_img_check` (
  `id` int(5) NOT NULL,
  `checker` varchar(10) NOT NULL,
  `td` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `system_img_check`
--

INSERT INTO `system_img_check` (`id`, `checker`, `td`) VALUES
(4, '1586054062', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ticket`
--

CREATE TABLE `ticket` (
  `id` int(6) NOT NULL,
  `cod` int(4) NOT NULL,
  `cant` int(4) NOT NULL,
  `producto` varchar(100) NOT NULL,
  `pv` float(10,2) NOT NULL,
  `stotal` float(10,2) NOT NULL,
  `imp` float(10,2) NOT NULL,
  `total` float(10,2) NOT NULL,
  `num_fac` int(6) NOT NULL,
  `fecha` varchar(20) NOT NULL,
  `hora` varchar(20) NOT NULL,
  `mesa` int(6) NOT NULL,
  `cliente` varchar(100) NOT NULL,
  `cancela` varchar(100) NOT NULL COMMENT 'si la cuenta la pagara otro cliente',
  `cajero` varchar(100) NOT NULL,
  `tipo_pago` varchar(30) NOT NULL,
  `user` varchar(100) NOT NULL,
  `gravado` int(2) NOT NULL,
  `tx` int(2) NOT NULL,
  `fechaF` varchar(50) NOT NULL,
  `edo` int(2) NOT NULL COMMENT 'a= activo, 2= eliminada',
  `td` int(2) NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ticket`
--

INSERT INTO `ticket` (`id`, `cod`, `cant`, `producto`, `pv`, `stotal`, `imp`, `total`, `num_fac`, `fecha`, `hora`, `mesa`, `cliente`, `cancela`, `cajero`, `tipo_pago`, `user`, `gravado`, `tx`, `fechaF`, `edo`, `td`, `hash`, `time`) VALUES
(30, 1032, 1, 'Gigante Catracha', 365.00, 323.01, 41.99, 365.00, 36, '07-05-2020', '18:53:02', 10, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588831200', 1, 0, 'd9648ebbcb', 1588899276),
(33, 1001, 1, 'Clasica Jamon', 99.00, 87.61, 11.39, 99.00, 11, '07-05-2020', '19:00:26', 6, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588831200', 1, 0, 'e22b293cfd', 1588899640),
(34, 1055, 1, 'Orilla de queso Pesonal', 30.00, 26.55, 3.45, 30.00, 11, '07-05-2020', '19:00:29', 6, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588831200', 1, 0, '0df0d7ad37', 1588899640),
(35, 1056, 1, 'Orilla de queso Grande', 55.00, 48.67, 6.33, 55.00, 11, '07-05-2020', '19:00:31', 6, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588831200', 1, 0, '8682135096', 1588899640),
(36, 1046, 1, 'Fresco Lata', 20.00, 17.70, 2.30, 20.00, 11, '07-05-2020', '19:00:33', 6, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588831200', 1, 0, '77b8028f2f', 1588899640),
(37, 1031, 1, 'Grande Catracha', 224.00, 198.23, 25.77, 224.00, 11, '07-05-2020', '19:00:35', 6, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588831200', 1, 0, '0a5b874d8b', 1588899640),
(38, 1002, 1, 'Clasica Pepperoni', 99.00, 87.61, 11.39, 99.00, 11, '07-05-2020', '19:00:37', 6, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588831200', 1, 0, '3b7cfad87d', 1588899640),
(39, 1004, 1, '2 x 1 Suprema', 269.00, 238.05, 30.95, 269.00, 11, '07-05-2020', '19:00:38', 6, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588831200', 1, 0, '086491c3bd', 1588899640),
(40, 1009, 1, 'Personal 4 Estaciones', 125.00, 110.62, 14.38, 125.00, 37, '08-05-2020', '06:30:28', 11, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, 'e1c0c942f3', 1588941084),
(41, 1015, 1, 'Personal Margarita', 125.00, 110.62, 14.38, 125.00, 37, '08-05-2020', '06:30:29', 11, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, 'c0611b26f2', 1588941084),
(42, 1014, 1, 'Gigante Super Suprema', 269.00, 238.05, 30.95, 269.00, 37, '08-05-2020', '06:30:30', 11, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, '4389d3ed45', 1588941084),
(43, 1022, 1, 'Grande Choriqueso', 175.00, 154.87, 20.13, 175.00, 37, '08-05-2020', '06:30:31', 11, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, '27b471613c', 1588941084),
(44, 1023, 1, 'Gigante Choriqueso', 269.00, 238.05, 30.95, 269.00, 37, '08-05-2020', '06:30:31', 11, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, 'd4a22a2f24', 1588941084),
(47, 1001, 1, 'Clasica Jamon', 99.00, 87.61, 11.39, 99.00, 1, '08-05-2020', '06:46:13', 1, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '24ca6a9a32', 1588942072),
(48, 1004, 1, '2 x 1 Suprema', 269.00, 238.05, 30.95, 269.00, 1, '08-05-2020', '06:46:15', 1, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '3e31a5c950', 1588942072),
(49, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 1, '08-05-2020', '06:46:16', 1, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '8b6166f8f3', 1588942072),
(50, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 1, '08-05-2020', '06:46:17', 1, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'eb2ce622b6', 1588942072),
(51, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 1, '08-05-2020', '06:46:18', 1, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '93c1eeb5b5', 1588942072),
(54, 1006, 2, 'Combo Wings', 195.00, 345.13, 44.87, 390.00, 1, '08-05-2020', '07:42:42', 3, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, 'd14a2f1326', 1588945448),
(55, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 1, '08-05-2020', '07:42:46', 3, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, 'db70862b33', 1588945448),
(56, 1048, 2, 'Fresco Jumbo', 60.00, 106.19, 13.81, 120.00, 1, '08-05-2020', '07:42:49', 3, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, '2f96de83bc', 1588945448),
(57, 1001, 1, 'Clasica Jamon', 99.00, 87.61, 11.39, 99.00, 2, '08-05-2020', '07:44:38', 4, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, 'd054ab0b2d', 1588945538),
(58, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 2, '08-05-2020', '07:44:40', 4, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, 'da1755b7f5', 1588945538),
(59, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 2, '08-05-2020', '07:44:46', 4, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, '8bbc888ea5', 1588945538),
(60, 1003, 2, 'Clasica Extraqueso', 99.00, 175.22, 22.78, 198.00, 2, '08-05-2020', '07:44:51', 4, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, '406a2ecac8', 1588945538),
(61, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 2, '08-05-2020', '07:45:33', 4, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, '4f2727b5bd', 1588945538),
(64, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 3, '08-05-2020', '07:45:42', 5, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, '0a8ed572bd', 1588945555),
(65, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 3, '08-05-2020', '07:45:43', 5, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, '58c8f81932', 1588945555),
(67, 1003, 1, 'Clasica Extraqueso', 99.00, 87.61, 11.39, 99.00, 4, '08-05-2020', '07:42:02', 2, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, 'edc7433d0b', 1588972082),
(68, 1004, 1, '2 x 1 Suprema', 269.00, 238.05, 30.95, 269.00, 4, '08-05-2020', '07:42:08', 2, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, 'a0fc927e5d', 1588972082),
(69, 1001, 2, 'Clasica Jamon', 99.00, 175.22, 22.78, 198.00, 4, '08-05-2020', '07:42:15', 2, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, '18ff1c4d48', 1588972082),
(70, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 2, '08-05-2020', '15:22:56', 2, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'af19e9befc', 1588973072),
(71, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 2, '08-05-2020', '15:22:57', 2, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '96b3f160d6', 1588973072),
(72, 1047, 1, 'Bote de Agua', 15.00, 13.27, 1.73, 15.00, 2, '08-05-2020', '15:22:58', 2, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'c5483fe5a6', 1588973072),
(73, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 2, '08-05-2020', '15:23:07', 2, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '3ee2fec688', 1588973072),
(74, 1049, 2, 'Fresco Natural', 20.00, 35.40, 4.60, 40.00, 2, '08-05-2020', '15:23:08', 2, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'dae7686509', 1588973072),
(75, 1008, 2, 'Calzone Italiano', 85.00, 150.44, 19.56, 170.00, 2, '08-05-2020', '15:23:08', 2, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '70d178c60b', 1588973072),
(76, 1007, 2, 'Super Suprema', 175.00, 309.73, 40.27, 350.00, 2, '08-05-2020', '15:23:09', 2, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '008107a54a', 1588973072),
(77, 1001, 1, 'Clasica Jamon', 99.00, 87.61, 11.39, 99.00, 2, '08-05-2020', '15:24:25', 2, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '925ec228a0', 1588973072),
(78, 1003, 1, 'Clasica Extraqueso', 99.00, 87.61, 11.39, 99.00, 2, '08-05-2020', '15:24:26', 2, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '66721a3207', 1588973072),
(85, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 3, '08-05-2020', '15:24:37', 3, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '0dce78bc0c', 1588973090),
(86, 1003, 1, 'Clasica Extraqueso', 99.00, 87.61, 11.39, 99.00, 3, '08-05-2020', '15:24:40', 3, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '7a0721e215', 1588973090),
(87, 1002, 1, 'Clasica Pepperoni', 99.00, 87.61, 11.39, 99.00, 3, '08-05-2020', '15:24:41', 3, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'cb87fcb67f', 1588973090),
(88, 1031, 1, 'Grande Catracha', 224.00, 198.23, 25.77, 224.00, 3, '08-05-2020', '15:24:43', 3, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '37e077a503', 1588973090),
(92, 1003, 1, 'Clasica Extraqueso', 99.00, 87.61, 11.39, 99.00, 5, '08-05-2020', '15:21:18', 7, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, '42adffbad4', 1588973181),
(93, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 5, '08-05-2020', '15:21:22', 7, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, 'ac244de53d', 1588973181),
(94, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 5, '08-05-2020', '15:21:23', 7, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, 'df3057ad9a', 1588973181),
(95, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 4, '08-05-2020', '16:38:36', 8, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'd5b4a20600', 1588977543),
(96, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 4, '08-05-2020', '16:38:37', 8, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '40432248ef', 1588977543),
(98, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 6, '08-05-2020', '17:17:43', 8, '1', '1', 'Jazmin Nunez', '1', 'Tatiana', 1, 0, '1588917600', 1, 0, 'e65d808b7e', 1588979865),
(99, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 6, '08-05-2020', '17:17:44', 8, '1', '1', 'Jazmin Nunez', '1', 'Tatiana', 1, 0, '1588917600', 1, 0, '658c19eabf', 1588979865),
(101, 1004, 1, '2 x 1 Suprema', 269.00, 238.05, 30.95, 269.00, 7, '08-05-2020', '17:17:57', 9, '1', '1', 'Jazmin Nunez', '1', 'Tatiana', 1, 0, '1588917600', 1, 0, '6724d94039', 1588979996),
(102, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 7, '08-05-2020', '17:17:58', 9, '1', '1', 'Jazmin Nunez', '1', 'Tatiana', 1, 0, '1588917600', 1, 0, '539e0f1fba', 1588979996),
(103, 1047, 1, 'Bote de Agua', 15.00, 13.27, 1.73, 15.00, 7, '08-05-2020', '17:17:59', 9, '1', '1', 'Jazmin Nunez', '1', 'Tatiana', 1, 0, '1588917600', 1, 0, 'eb712590ab', 1588979996),
(104, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 7, '08-05-2020', '17:18:01', 9, '2', '2', 'Jazmin Nunez', '1', 'Tatiana', 1, 0, '1588917600', 1, 0, '7392abbdeb', 1588979996),
(105, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 7, '08-05-2020', '17:18:01', 9, '2', '2', 'Jazmin Nunez', '1', 'Tatiana', 1, 0, '1588917600', 1, 0, '1d90cb135d', 1588979996),
(108, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 8, '08-05-2020', '18:14:31', 15, '1', '1', 'Jazmin Nunez', '1', 'Tatiana', 1, 0, '1588917600', 1, 0, 'bae41e8778', 1588983296),
(109, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 8, '08-05-2020', '18:14:31', 15, '1', '1', 'Jazmin Nunez', '1', 'Tatiana', 1, 0, '1588917600', 1, 0, '2bc7b44844', 1588983296),
(110, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 8, '08-05-2020', '18:14:32', 15, '1', '1', 'Jazmin Nunez', '1', 'Tatiana', 1, 0, '1588917600', 1, 0, 'af947fcd27', 1588983296),
(111, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 8, '08-05-2020', '18:14:33', 15, '1', '1', 'Jazmin Nunez', '1', 'Tatiana', 1, 0, '1588917600', 1, 0, '3efcf5538c', 1588983296),
(115, 1003, 1, 'Clasica Extraqueso', 99.00, 87.61, 11.39, 99.00, 9, '08-05-2020', '18:08:07', 13, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, '881976e354', 1588987673),
(116, 1001, 1, 'Clasica Jamon', 99.00, 87.61, 11.39, 99.00, 10, '08-05-2020', '18:04:45', 12, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, '254986758b', 1588987688),
(117, 1004, 1, '2 x 1 Suprema', 269.00, 238.05, 30.95, 269.00, 10, '08-05-2020', '18:04:46', 12, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, '5ac7a2adcb', 1588987688),
(118, 1006, 2, 'Combo Wings', 195.00, 345.13, 44.87, 390.00, 10, '08-05-2020', '18:13:00', 12, '2', '2', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, '24e452dbff', 1588987688),
(119, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 11, '08-05-2020', '19:17:42', 17, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, 'ce71ad072a', 1588987699),
(120, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 11, '08-05-2020', '19:17:44', 17, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, '5c1b634887', 1588987699),
(122, 1001, 1, 'Clasica Jamon', 99.00, 87.61, 11.39, 99.00, 12, '08-05-2020', '18:14:22', 14, '1', '1', 'Jazmin Nunez', '1', 'Tatiana', 1, 0, '1588917600', 1, 0, 'fd16e2c314', 1588987751),
(123, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 12, '08-05-2020', '18:14:23', 14, '1', '1', 'Jazmin Nunez', '1', 'Tatiana', 1, 0, '1588917600', 1, 0, 'c0e4cffb26', 1588987751),
(124, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 12, '08-05-2020', '18:14:24', 14, '2', '2', 'Jazmin Nunez', '1', 'Tatiana', 1, 0, '1588917600', 1, 0, '0dbda78586', 1588987751),
(125, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 12, '08-05-2020', '18:14:25', 14, '2', '2', 'Jazmin Nunez', '1', 'Tatiana', 1, 0, '1588917600', 1, 0, '653aef2d87', 1588987751),
(129, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 13, '08-05-2020', '19:31:50', 18, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, '55057979d9', 1588987932),
(130, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 13, '08-05-2020', '19:31:51', 18, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, '831b26df62', 1588987932),
(131, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 13, '08-05-2020', '19:31:52', 18, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, '9b48728245', 1588987932),
(132, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 13, '08-05-2020', '19:31:52', 18, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, '3f4f11410c', 1588987932),
(133, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 13, '08-05-2020', '19:31:53', 18, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, 'ce4941ea9a', 1588987932),
(136, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 5, '08-05-2020', '19:33:49', 9, '2', '2', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '14896e3065', 1588988054),
(137, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 5, '08-05-2020', '19:33:50', 9, '2', '2', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '96d0e2668e', 1588988054),
(139, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 6, '08-05-2020', '19:33:52', 9, '3', '3', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '1946b3d2cc', 1588988153),
(140, 1046, 1, 'Fresco Lata', 20.00, 17.70, 2.30, 20.00, 6, '08-05-2020', '19:33:54', 9, '3', '3', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '6b2cf865dd', 1588988153),
(141, 1047, 1, 'Bote de Agua', 15.00, 13.27, 1.73, 15.00, 6, '08-05-2020', '19:34:53', 9, '2', '3', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '5be0354084', 1588988153),
(142, 1004, 1, '2 x 1 Suprema', 269.00, 238.05, 30.95, 269.00, 7, '08-05-2020', '17:17:57', 9, '1', '1', 'Jazmin Nunez', '1', 'Tatiana', 1, 0, '1588917600', 1, 0, '6724d94039', 1588979996),
(143, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 7, '08-05-2020', '17:17:58', 9, '1', '1', 'Jazmin Nunez', '1', 'Tatiana', 1, 0, '1588917600', 1, 0, '539e0f1fba', 1588979996),
(144, 1047, 1, 'Bote de Agua', 15.00, 13.27, 1.73, 15.00, 7, '08-05-2020', '17:17:59', 9, '1', '1', 'Jazmin Nunez', '1', 'Tatiana', 1, 0, '1588917600', 1, 0, 'eb712590ab', 1588979996),
(145, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 7, '08-05-2020', '17:18:01', 9, '2', '2', 'Jazmin Nunez', '1', 'Tatiana', 1, 0, '1588917600', 1, 0, '7392abbdeb', 1588979996),
(146, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 7, '08-05-2020', '17:18:01', 9, '2', '2', 'Jazmin Nunez', '1', 'Tatiana', 1, 0, '1588917600', 1, 0, '1d90cb135d', 1588979996),
(147, 1001, 1, 'Clasica Jamon', 99.00, 87.61, 11.39, 99.00, 7, '08-05-2020', '19:33:40', 9, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '7dd56e9e51', 1588988179),
(148, 1047, 1, 'Bote de Agua', 15.00, 13.27, 1.73, 15.00, 7, '08-05-2020', '19:33:44', 9, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'a88002239d', 1588988179),
(149, 1004, 1, '2 x 1 Suprema', 269.00, 238.05, 30.95, 269.00, 14, '08-05-2020', '19:56:31', 19, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, 'e41fa90aa8', 1588989398),
(150, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 14, '08-05-2020', '19:56:32', 19, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, 'be6b9a13f4', 1588989398),
(151, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 14, '08-05-2020', '19:56:33', 19, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, '5c05f2d02f', 1588989398),
(152, 1039, 1, 'Normal Mediterranea', 125.00, 110.62, 14.38, 125.00, 14, '08-05-2020', '19:56:35', 19, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, '80d809f40b', 1588989398),
(156, 1004, 1, '2 x 1 Suprema', 269.00, 238.05, 30.95, 269.00, 15, '08-05-2020', '19:59:17', 20, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, '3de83ebd35', 1588989593),
(157, 1053, 1, 'Pan con Ajo 6 U', 75.00, 66.37, 8.63, 75.00, 15, '08-05-2020', '19:59:22', 20, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, 'b3ab6cc9a7', 1588989593),
(158, 1055, 1, 'Orilla de queso Pesonal', 30.00, 26.55, 3.45, 30.00, 15, '08-05-2020', '19:59:23', 20, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, 'b04e5a4536', 1588989593),
(159, 1056, 1, 'Orilla de queso Grande', 55.00, 48.67, 6.33, 55.00, 15, '08-05-2020', '19:59:24', 20, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, 'bcf376d9b2', 1588989593),
(163, 1002, 1, 'Clasica Pepperoni', 99.00, 87.61, 11.39, 99.00, 16, '08-05-2020', '20:00:52', 21, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, 'c5f23a5e50', 1588990563),
(164, 1004, 2, '2 x 1 Suprema', 269.00, 476.11, 61.89, 538.00, 16, '08-05-2020', '20:00:54', 21, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, 'a031c43206', 1588990563),
(165, 1005, 2, 'Orilla de queso', 155.00, 274.34, 35.66, 310.00, 16, '08-05-2020', '20:00:55', 21, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, '2ca8be29a4', 1588990563),
(166, 1001, 1, 'Clasica Jamon', 99.00, 87.61, 11.39, 99.00, 16, '08-05-2020', '20:00:58', 21, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, '83e1f5375e', 1588990563),
(167, 1003, 3, 'Clasica Extraqueso', 99.00, 262.83, 34.17, 297.00, 16, '08-05-2020', '20:02:18', 21, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, '5f260331b4', 1588990563),
(170, 1047, 1, 'Bote de Agua', 15.00, 13.27, 1.73, 15.00, 17, '08-05-2020', '20:03:12', 23, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, '9da0df74e5', 1588990574),
(171, 1045, 1, 'Fresco 1.5 Lts', 35.00, 30.97, 4.03, 35.00, 17, '08-05-2020', '20:03:13', 23, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, '42520b0de1', 1588990574),
(172, 1001, 1, 'Clasica Jamon', 99.00, 87.61, 11.39, 99.00, 17, '08-05-2020', '20:03:15', 23, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, 'd42dda4052', 1588990574),
(173, 1003, 1, 'Clasica Extraqueso', 99.00, 87.61, 11.39, 99.00, 17, '08-05-2020', '20:03:39', 23, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, '2c23855392', 1588990574),
(177, 1003, 1, 'Clasica Extraqueso', 99.00, 87.61, 11.39, 99.00, 18, '08-05-2020', '20:16:28', 24, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, '9a371f7e4a', 1588990592),
(178, 1001, 1, 'Clasica Jamon', 99.00, 87.61, 11.39, 99.00, 19, '08-05-2020', '20:28:32', 25, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, '99ae9f3301', 1588991328),
(179, 1053, 1, 'Pan con Ajo 6 U', 75.00, 66.37, 8.63, 75.00, 19, '08-05-2020', '20:28:36', 25, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, '37e8b0ef63', 1588991328),
(180, 1004, 1, '2 x 1 Suprema', 269.00, 238.05, 30.95, 269.00, 19, '08-05-2020', '20:28:38', 25, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, '2d8082925c', 1588991328),
(181, 1002, 1, 'Clasica Pepperoni', 99.00, 87.61, 11.39, 99.00, 20, '08-05-2020', '20:31:56', 26, '2', '2', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, 'cc7c091ec7', 1588991526),
(182, 1003, 1, 'Clasica Extraqueso', 99.00, 87.61, 11.39, 99.00, 20, '08-05-2020', '20:31:57', 26, '2', '2', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, '0bf4448cae', 1588991526),
(183, 1001, 1, 'Clasica Jamon', 99.00, 87.61, 11.39, 99.00, 20, '08-05-2020', '20:31:59', 26, '2', '2', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, '7c09fb8b37', 1588991526),
(184, 1003, 1, 'Clasica Extraqueso', 99.00, 87.61, 11.39, 99.00, 20, '08-05-2020', '20:32:03', 26, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, '07943b4856', 1588991526),
(185, 1002, 1, 'Clasica Pepperoni', 99.00, 87.61, 11.39, 99.00, 20, '08-05-2020', '20:32:03', 26, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, '9c6bfd77e4', 1588991526),
(188, 1045, 1, 'Fresco 1.5 Lts', 35.00, 30.97, 4.03, 35.00, 21, '08-05-2020', '20:33:04', 28, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, '4dab586102', 1588991595),
(189, 1001, 1, 'Clasica Jamon', 99.00, 87.61, 11.39, 99.00, 21, '08-05-2020', '20:33:10', 28, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, 'f467a8c460', 1588991595),
(190, 1003, 1, 'Clasica Extraqueso', 99.00, 87.61, 11.39, 99.00, 21, '08-05-2020', '20:33:11', 28, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, 'a6cce59a0b', 1588991595),
(191, 1004, 1, '2 x 1 Suprema', 269.00, 238.05, 30.95, 269.00, 22, '08-05-2020', '20:33:38', 29, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, '053185bbed', 1588991628),
(192, 1053, 1, 'Pan con Ajo 6 U', 75.00, 66.37, 8.63, 75.00, 22, '08-05-2020', '20:33:45', 29, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, '04741dc37f', 1588991628),
(193, 1056, 1, 'Orilla de queso Grande', 55.00, 48.67, 6.33, 55.00, 22, '08-05-2020', '20:33:45', 29, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, 'be2c2df3b2', 1588991628),
(194, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 23, '08-05-2020', '20:32:46', 27, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, '2318344af7', 1588991681),
(195, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 23, '08-05-2020', '20:32:49', 27, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, '25a213997c', 1588991681),
(196, 1055, 1, 'Orilla de queso Pesonal', 30.00, 26.55, 3.45, 30.00, 23, '08-05-2020', '20:32:53', 27, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, 'c2438a806e', 1588991681),
(197, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 8, '08-05-2020', '20:37:09', 10, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'fec2583330', 1588991843),
(198, 1006, 2, 'Combo Wings', 195.00, 345.13, 44.87, 390.00, 8, '08-05-2020', '20:37:10', 10, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '10c10c1a51', 1588991843),
(199, 1056, 1, 'Orilla de queso Grande', 55.00, 48.67, 6.33, 55.00, 8, '08-05-2020', '20:37:13', 10, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '6e7b24934a', 1588991843),
(200, 1053, 1, 'Pan con Ajo 6 U', 75.00, 66.37, 8.63, 75.00, 8, '08-05-2020', '20:37:13', 10, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '45b07ac3fe', 1588991843),
(201, 1054, 1, 'Pan con Ajo 12 U', 110.00, 97.35, 12.65, 110.00, 8, '08-05-2020', '20:37:13', 10, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'c6eaccbeb4', 1588991843),
(202, 1055, 1, 'Orilla de queso Pesonal', 30.00, 26.55, 3.45, 30.00, 8, '08-05-2020', '20:37:13', 10, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'dc110e90b4', 1588991843),
(203, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 8, '08-05-2020', '20:37:15', 10, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '0da62c22af', 1588991843),
(204, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 8, '08-05-2020', '20:37:17', 10, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'bc7718bd15', 1588991843),
(205, 1033, 1, 'Normal de Camaron', 125.00, 110.62, 14.38, 125.00, 8, '08-05-2020', '20:37:18', 10, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '2fe34c65c4', 1588991843),
(206, 1032, 2, 'Gigante Catracha', 365.00, 646.02, 83.98, 730.00, 8, '08-05-2020', '20:37:19', 10, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'ec4e856e5e', 1588991843),
(207, 1030, 2, 'Personal Catracha', 125.00, 221.24, 28.76, 250.00, 8, '08-05-2020', '20:37:19', 10, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'c56200efb1', 1588991843),
(208, 1035, 2, 'Gigante  de Camaron', 365.00, 646.02, 83.98, 730.00, 8, '08-05-2020', '20:37:19', 10, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '0ffe89b2c8', 1588991843),
(209, 1036, 1, 'Personal Bacon con Maiz', 125.00, 110.62, 14.38, 125.00, 8, '08-05-2020', '20:37:19', 10, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'c702486981', 1588991843),
(210, 1037, 1, 'Grande Bacon con Maiz', 224.00, 198.23, 25.77, 224.00, 8, '08-05-2020', '20:37:19', 10, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'f68196bf33', 1588991843),
(211, 1031, 1, 'Grande Catracha', 224.00, 198.23, 25.77, 224.00, 8, '08-05-2020', '20:37:20', 10, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'b8cd123c63', 1588991843),
(212, 1034, 1, 'Grande  de Camaron', 224.00, 198.23, 25.77, 224.00, 8, '08-05-2020', '20:37:20', 10, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'b85d26a674', 1588991843),
(228, 1001, 1, 'Clasica Jamon', 99.00, 87.61, 11.39, 99.00, 9, '08-05-2020', '20:40:03', 11, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '91cfbe6639', 1588992637),
(229, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 9, '08-05-2020', '20:40:06', 11, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '358c259bcc', 1588992637),
(230, 1001, 1, 'Clasica Jamon', 99.00, 87.61, 11.39, 99.00, 9, '08-05-2020', '20:40:09', 11, '2', '2', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'cc56a8e70d', 1588992637),
(231, 1047, 1, 'Bote de Agua', 15.00, 13.27, 1.73, 15.00, 9, '08-05-2020', '20:40:10', 11, '2', '2', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'b7b42ff76d', 1588992637),
(232, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 9, '08-05-2020', '20:40:14', 11, '3', '3', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '92588251a3', 1588992637),
(233, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 9, '08-05-2020', '20:40:15', 11, '3', '3', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'ea790ea5eb', 1588992637),
(234, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 9, '08-05-2020', '20:40:21', 11, '4', '4', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '4fec327e19', 1588992637),
(235, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 9, '08-05-2020', '20:40:21', 11, '4', '4', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'e513f05ca4', 1588992637),
(236, 1047, 1, 'Bote de Agua', 15.00, 13.27, 1.73, 15.00, 9, '08-05-2020', '20:40:25', 11, '5', '5', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'e3b49a04ed', 1588992637),
(237, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 9, '08-05-2020', '20:40:26', 11, '5', '5', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '98ae2013e0', 1588992637),
(238, 1004, 1, '2 x 1 Suprema', 269.00, 238.05, 30.95, 269.00, 9, '08-05-2020', '20:40:31', 11, '6', '6', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '4d6d21e431', 1588992637),
(239, 1046, 1, 'Fresco Lata', 20.00, 17.70, 2.30, 20.00, 9, '08-05-2020', '20:40:32', 11, '6', '6', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '30834922a7', 1588992637),
(240, 1016, 1, 'Grande Margarita', 175.00, 154.87, 20.13, 175.00, 9, '08-05-2020', '20:40:37', 11, '7', '7', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '257afc6a87', 1588992637),
(241, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 9, '08-05-2020', '20:40:39', 11, '7', '7', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'ea56f6581b', 1588992637),
(242, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 9, '08-05-2020', '20:40:43', 11, '8', '8', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '7b41016369', 1588992637),
(243, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 9, '08-05-2020', '20:40:44', 11, '8', '8', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'a5e7550385', 1588992637),
(244, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 9, '08-05-2020', '20:40:49', 11, '9', '9', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '27f6c67800', 1588992637),
(245, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 9, '08-05-2020', '20:40:50', 11, '9', '9', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'c3c2c915d6', 1588992637),
(246, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 9, '08-05-2020', '20:40:54', 11, '10', '10', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'c3a5d57428', 1588992637),
(247, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 9, '08-05-2020', '20:40:54', 11, '10', '10', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'f77620909c', 1588992637),
(248, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 9, '08-05-2020', '20:40:59', 11, '11', '11', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '56f7c79e3c', 1588992637),
(249, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 9, '08-05-2020', '20:40:59', 11, '11', '11', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'fd5c22ebb1', 1588992637),
(250, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 9, '08-05-2020', '20:41:04', 11, '12', '12', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '10e30b47d8', 1588992637),
(251, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 9, '08-05-2020', '20:41:07', 11, '12', '12', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '4fb2da5860', 1588992637),
(252, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 9, '08-05-2020', '20:41:12', 11, '13', '13', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '44c2d871ca', 1588992637),
(253, 1046, 1, 'Fresco Lata', 20.00, 17.70, 2.30, 20.00, 9, '08-05-2020', '20:41:12', 11, '13', '13', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'fc1ca3bc59', 1588992637),
(254, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 9, '08-05-2020', '20:41:18', 11, '14', '14', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '5d2e1b18ab', 1588992637),
(255, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 9, '08-05-2020', '20:41:18', 11, '14', '14', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'd4c71484f8', 1588992637),
(256, 1046, 1, 'Fresco Lata', 20.00, 17.70, 2.30, 20.00, 9, '08-05-2020', '20:41:23', 11, '15', '15', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'c118d5cfb5', 1588992637),
(257, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 9, '08-05-2020', '20:41:24', 11, '15', '15', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '8cc2970a35', 1588992637),
(258, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 9, '08-05-2020', '20:41:28', 11, '16', '16', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'ea94cf1deb', 1588992637),
(259, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 9, '08-05-2020', '20:41:29', 11, '16', '16', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'fc3a20040f', 1588992637),
(260, 1001, 1, 'Clasica Jamon', 99.00, 87.61, 11.39, 99.00, 9, '08-05-2020', '20:41:33', 11, '17', '17', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '9290d9ec87', 1588992637),
(261, 1045, 1, 'Fresco 1.5 Lts', 35.00, 30.97, 4.03, 35.00, 9, '08-05-2020', '20:41:34', 11, '17', '17', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '7273db8f0f', 1588992637),
(262, 1010, 1, 'Grande 4 Estaciones', 175.00, 154.87, 20.13, 175.00, 9, '08-05-2020', '20:41:39', 11, '18', '18', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'd6cc30677d', 1588992637),
(263, 1016, 1, 'Grande Margarita', 175.00, 154.87, 20.13, 175.00, 9, '08-05-2020', '20:41:40', 11, '18', '18', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'a87ae71929', 1588992637),
(264, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 9, '08-05-2020', '20:41:45', 11, '19', '19', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '21c8c2e5d7', 1588992637),
(265, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 9, '08-05-2020', '20:41:46', 11, '19', '19', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '289374f01e', 1588992637),
(266, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 9, '08-05-2020', '20:41:51', 11, '20', '20', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '88dee7c49b', 1588992637),
(267, 1047, 1, 'Bote de Agua', 15.00, 13.27, 1.73, 15.00, 9, '08-05-2020', '20:41:52', 11, '20', '20', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '454091529e', 1588992637),
(268, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 9, '08-05-2020', '20:41:56', 11, '21', '21', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'bc0bc2da59', 1588992637),
(269, 1047, 1, 'Bote de Agua', 15.00, 13.27, 1.73, 15.00, 9, '08-05-2020', '20:41:56', 11, '21', '21', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '11777cad49', 1588992637),
(270, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 9, '08-05-2020', '20:42:01', 11, '22', '22', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '0b66f9f161', 1588992637),
(271, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 9, '08-05-2020', '20:42:02', 11, '22', '22', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'b517fbdbd8', 1588992637),
(272, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 9, '08-05-2020', '20:42:06', 11, '23', '23', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '1e481eebd7', 1588992637),
(273, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 9, '08-05-2020', '20:42:07', 11, '23', '23', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '9247361aa5', 1588992637),
(274, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 9, '08-05-2020', '20:42:13', 11, '24', '24', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '9aa2ec8683', 1588992637),
(275, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 9, '08-05-2020', '20:42:14', 11, '24', '24', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '1949c0dce0', 1588992637),
(276, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 9, '08-05-2020', '20:42:19', 11, '25', '25', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '6425c55517', 1588992637),
(277, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 9, '08-05-2020', '20:42:19', 11, '25', '25', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'eec5e64567', 1588992637),
(278, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 9, '08-05-2020', '20:42:23', 11, '26', '26', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '35939c3fac', 1588992637),
(279, 1047, 1, 'Bote de Agua', 15.00, 13.27, 1.73, 15.00, 9, '08-05-2020', '20:42:24', 11, '26', '26', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'e2a937c0e8', 1588992637),
(280, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 9, '08-05-2020', '20:42:28', 11, '27', '27', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '5aa0f94a37', 1588992637),
(281, 1047, 1, 'Bote de Agua', 15.00, 13.27, 1.73, 15.00, 9, '08-05-2020', '20:42:30', 11, '27', '27', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '515f19b218', 1588992637),
(282, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 9, '08-05-2020', '20:42:35', 11, '28', '28', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'd39c226931', 1588992637),
(283, 1046, 1, 'Fresco Lata', 20.00, 17.70, 2.30, 20.00, 9, '08-05-2020', '20:42:36', 11, '28', '28', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'cc104cd09f', 1588992637),
(284, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 9, '08-05-2020', '20:43:10', 11, '29', '29', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'df4a6f7911', 1588992637),
(285, 1047, 1, 'Bote de Agua', 15.00, 13.27, 1.73, 15.00, 9, '08-05-2020', '20:43:11', 11, '29', '29', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'a11414a9d0', 1588992637),
(286, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 9, '08-05-2020', '20:43:18', 11, '30', '30', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '2245ee4dfa', 1588992637),
(287, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 9, '08-05-2020', '20:43:19', 11, '30', '30', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '2ff3a82a60', 1588992637),
(288, 1003, 1, 'Clasica Extraqueso', 99.00, 87.61, 11.39, 99.00, 9, '08-05-2020', '20:43:26', 11, '31', '31', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '4a65d452a7', 1588992637),
(289, 1046, 1, 'Fresco Lata', 20.00, 17.70, 2.30, 20.00, 9, '08-05-2020', '20:43:28', 11, '31', '31', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'b8db10d60b', 1588992637),
(290, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 9, '08-05-2020', '20:43:33', 11, '32', '32', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '860189a037', 1588992637),
(291, 1047, 1, 'Bote de Agua', 15.00, 13.27, 1.73, 15.00, 9, '08-05-2020', '20:43:34', 11, '32', '32', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '9974a7c054', 1588992637),
(292, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 9, '08-05-2020', '20:43:39', 11, '33', '33', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '86327c69d1', 1588992637),
(293, 1046, 1, 'Fresco Lata', 20.00, 17.70, 2.30, 20.00, 9, '08-05-2020', '20:43:39', 11, '33', '33', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'a3352a7b20', 1588992637),
(294, 1001, 1, 'Clasica Jamon', 99.00, 87.61, 11.39, 99.00, 9, '08-05-2020', '20:43:45', 11, '34', '34', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'c76b5a4801', 1588992637),
(295, 1047, 1, 'Bote de Agua', 15.00, 13.27, 1.73, 15.00, 9, '08-05-2020', '20:43:46', 11, '34', '34', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'b915aa0a17', 1588992637),
(296, 1004, 1, '2 x 1 Suprema', 269.00, 238.05, 30.95, 269.00, 9, '08-05-2020', '20:43:51', 11, '35', '35', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '0468d6a97e', 1588992637),
(297, 1047, 1, 'Bote de Agua', 15.00, 13.27, 1.73, 15.00, 9, '08-05-2020', '20:43:52', 11, '35', '35', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '68e5dc8053', 1588992637),
(298, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 9, '08-05-2020', '20:43:57', 11, '36', '36', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '040de1f606', 1588992637),
(299, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 9, '08-05-2020', '20:43:58', 11, '36', '36', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'd2aea4d0d0', 1588992637),
(300, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 9, '08-05-2020', '20:44:02', 11, '37', '37', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '1d332301c5', 1588992637),
(301, 1047, 1, 'Bote de Agua', 15.00, 13.27, 1.73, 15.00, 9, '08-05-2020', '20:44:03', 11, '37', '37', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '19e3ae2f05', 1588992637),
(302, 1003, 1, 'Clasica Extraqueso', 99.00, 87.61, 11.39, 99.00, 9, '08-05-2020', '20:44:08', 11, '38', '38', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'b508ec0f65', 1588992637),
(303, 1046, 1, 'Fresco Lata', 20.00, 17.70, 2.30, 20.00, 9, '08-05-2020', '20:44:10', 11, '38', '38', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'ab0ffbd142', 1588992637),
(304, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 9, '08-05-2020', '20:44:14', 11, '39', '39', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '477ba60812', 1588992637),
(305, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 9, '08-05-2020', '20:44:15', 11, '39', '39', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '69d5494456', 1588992637),
(306, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 9, '08-05-2020', '20:44:19', 11, '40', '40', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '3470012f37', 1588992637),
(307, 1046, 1, 'Fresco Lata', 20.00, 17.70, 2.30, 20.00, 9, '08-05-2020', '20:44:20', 11, '40', '40', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'c5dfd35334', 1588992637),
(308, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 9, '08-05-2020', '20:44:25', 11, '41', '41', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'de38aabdf3', 1588992637),
(309, 1047, 1, 'Bote de Agua', 15.00, 13.27, 1.73, 15.00, 9, '08-05-2020', '20:44:25', 11, '41', '41', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '1824564786', 1588992637),
(310, 1001, 1, 'Clasica Jamon', 99.00, 87.61, 11.39, 99.00, 9, '08-05-2020', '20:44:29', 11, '42', '42', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '68bbd99cdc', 1588992637),
(311, 1046, 1, 'Fresco Lata', 20.00, 17.70, 2.30, 20.00, 9, '08-05-2020', '20:44:30', 11, '42', '42', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'd210e1a47e', 1588992637),
(312, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 9, '08-05-2020', '20:44:34', 11, '43', '43', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'db324d157c', 1588992637),
(313, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 9, '08-05-2020', '20:44:35', 11, '43', '43', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '699a052f73', 1588992637),
(314, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 9, '08-05-2020', '20:44:40', 11, '44', '44', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '9b9669ed76', 1588992637),
(315, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 9, '08-05-2020', '20:44:40', 11, '44', '44', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'e4f90271b8', 1588992637),
(316, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 9, '08-05-2020', '20:44:44', 11, '45', '45', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '45a0a42f4f', 1588992637),
(317, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 9, '08-05-2020', '20:44:45', 11, '45', '45', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '21dab4f804', 1588992637),
(318, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 9, '08-05-2020', '20:44:48', 11, '46', '46', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '21bab4fa44', 1588992637),
(319, 1047, 1, 'Bote de Agua', 15.00, 13.27, 1.73, 15.00, 9, '08-05-2020', '20:44:49', 11, '46', '46', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '3b32a32ea8', 1588992637),
(320, 1001, 1, 'Clasica Jamon', 99.00, 87.61, 11.39, 99.00, 9, '08-05-2020', '20:44:53', 11, '47', '47', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '21602b36ca', 1588992637),
(321, 1046, 1, 'Fresco Lata', 20.00, 17.70, 2.30, 20.00, 9, '08-05-2020', '20:44:54', 11, '47', '47', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '37117d5f78', 1588992637),
(322, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 9, '08-05-2020', '20:44:57', 11, '48', '48', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'ca70d608bd', 1588992637),
(323, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 9, '08-05-2020', '20:44:58', 11, '48', '48', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '6b300df9c5', 1588992637),
(324, 1001, 1, 'Clasica Jamon', 99.00, 87.61, 11.39, 99.00, 9, '08-05-2020', '20:45:01', 11, '49', '49', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '2ca12a4b37', 1588992637),
(325, 1046, 1, 'Fresco Lata', 20.00, 17.70, 2.30, 20.00, 9, '08-05-2020', '20:45:02', 11, '49', '49', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '44846e0cc9', 1588992637),
(326, 1001, 1, 'Clasica Jamon', 99.00, 87.61, 11.39, 99.00, 9, '08-05-2020', '20:45:06', 11, '50', '50', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '50d45de168', 1588992637),
(327, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 9, '08-05-2020', '20:45:07', 11, '50', '50', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'c7b8b6a221', 1588992637),
(355, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 10, '08-05-2020', '21:03:01', 12, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, '0e3d014391', 1588993476),
(356, 1003, 1, 'Clasica Extraqueso', 99.00, 87.61, 11.39, 99.00, 10, '08-05-2020', '21:03:05', 12, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1588917600', 1, 0, 'f61425afd5', 1588993476),
(358, 1001, 1, 'Clasica Jamon', 99.00, 87.61, 11.39, 99.00, 24, '08-05-2020', '21:10:19', 30, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, '3f7bc9d3a6', 1588993832),
(359, 1003, 1, 'Clasica Extraqueso', 99.00, 87.61, 11.39, 99.00, 24, '08-05-2020', '21:10:20', 30, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, '27c558f59c', 1588993832),
(360, 1058, 1, 'Combo Orilla de Queso', 190.00, 168.14, 21.86, 190.00, 24, '08-05-2020', '21:10:22', 30, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, '6fea977a5b', 1588993832),
(361, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 24, '08-05-2020', '21:10:25', 30, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, '82847b37f7', 1588993832),
(362, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 24, '08-05-2020', '21:10:26', 30, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1588917600', 1, 0, 'e86d3a79bc', 1588993832),
(363, 1007, 2, 'Super Suprema', 175.00, 309.73, 40.27, 350.00, 25, '09-05-2020', '06:31:52', 31, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589004000', 1, 0, 'da327c64be', 1589027518),
(364, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 25, '09-05-2020', '06:31:54', 31, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589004000', 1, 0, '0a1deeff73', 1589027518),
(365, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 25, '09-05-2020', '06:31:55', 31, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589004000', 1, 0, 'c63486614a', 1589027518),
(366, 1003, 1, 'Clasica Extraqueso', 99.00, 87.61, 11.39, 99.00, 11, '09-05-2020', '06:49:44', 13, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589004000', 1, 0, '16bd4a226f', 1589028605),
(367, 1001, 1, 'Clasica Jamon', 99.00, 87.61, 11.39, 99.00, 11, '09-05-2020', '06:49:45', 13, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589004000', 1, 0, 'a28a8893f7', 1589028605),
(368, 1002, 1, 'Clasica Pepperoni', 99.00, 87.61, 11.39, 99.00, 11, '09-05-2020', '06:49:46', 13, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589004000', 1, 0, '3391b5cfa5', 1589028605),
(369, 1045, 1, 'Fresco 1.5 Lts', 35.00, 30.97, 4.03, 35.00, 11, '09-05-2020', '06:49:47', 13, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589004000', 1, 0, '4a4b6ae62c', 1589028605),
(370, 1046, 1, 'Fresco Lata', 20.00, 17.70, 2.30, 20.00, 11, '09-05-2020', '06:49:48', 13, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589004000', 1, 0, '0cb2b94dfb', 1589028605),
(371, 1047, 1, 'Bote de Agua', 15.00, 13.27, 1.73, 15.00, 11, '09-05-2020', '06:49:48', 13, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589004000', 1, 0, '88a22d0618', 1589028605),
(372, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 11, '09-05-2020', '06:49:49', 13, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589004000', 1, 0, '1aa843d506', 1589028605),
(373, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 11, '09-05-2020', '06:49:49', 13, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589004000', 1, 0, 'd1d30315c5', 1589028605),
(374, 1055, 1, 'Orilla de queso Pesonal', 30.00, 26.55, 3.45, 30.00, 11, '09-05-2020', '06:49:51', 13, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589004000', 1, 0, '57f7430c03', 1589028605),
(375, 1054, 1, 'Pan con Ajo 12 U', 110.00, 97.35, 12.65, 110.00, 11, '09-05-2020', '06:49:52', 13, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589004000', 1, 0, '4553aa0622', 1589028605),
(381, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 12, '09-05-2020', '06:50:13', 14, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589004000', 1, 0, 'da0aad32e5', 1589028615),
(382, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 12, '09-05-2020', '06:50:13', 14, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589004000', 1, 0, '4744dbbd63', 1589028615),
(383, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 12, '09-05-2020', '06:50:14', 14, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589004000', 1, 0, 'dcf5d2f263', 1589028615),
(384, 1001, 1, 'Clasica Jamon', 99.00, 87.61, 11.39, 99.00, 13, '10-05-2020', '08:07:42', 15, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '1d9395c143', 1589119785),
(385, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 13, '10-05-2020', '08:07:45', 15, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'baac51960c', 1589119785),
(386, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 13, '10-05-2020', '08:09:41', 15, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'e8ed067d76', 1589119785),
(387, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 13, '10-05-2020', '08:09:41', 15, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '4be8f2ff1a', 1589119785),
(388, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 13, '10-05-2020', '08:09:42', 15, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'd5bb46cbd4', 1589119785),
(391, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 14, '10-05-2020', '08:10:59', 16, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'e2f3b460bc', 1589120465);
INSERT INTO `ticket` (`id`, `cod`, `cant`, `producto`, `pv`, `stotal`, `imp`, `total`, `num_fac`, `fecha`, `hora`, `mesa`, `cliente`, `cancela`, `cajero`, `tipo_pago`, `user`, `gravado`, `tx`, `fechaF`, `edo`, `td`, `hash`, `time`) VALUES
(392, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 14, '10-05-2020', '08:11:01', 16, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '8f155a750f', 1589120465),
(394, 1003, 1, 'Clasica Extraqueso', 99.00, 87.61, 11.39, 99.00, 15, '10-05-2020', '09:03:23', 17, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '55f6788bc7', 1589123005),
(395, 1008, 2, 'Calzone Italiano', 85.00, 150.44, 19.56, 170.00, 16, '10-05-2020', '10:37:53', 18, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'e50a6497d3', 1589129157),
(396, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 16, '10-05-2020', '10:40:06', 18, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'bd60a886c4', 1589129157),
(398, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 17, '10-05-2020', '10:46:43', 19, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '3c88589ae7', 1589129225),
(399, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 17, '10-05-2020', '10:46:44', 19, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'f8cc791b4b', 1589129225),
(400, 1047, 1, 'Bote de Agua', 15.00, 13.27, 1.73, 15.00, 17, '10-05-2020', '10:46:44', 19, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '8c4f52299e', 1589129225),
(401, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 18, '10-05-2020', '10:47:46', 20, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '686ab8073f', 1589129277),
(402, 1047, 1, 'Bote de Agua', 15.00, 13.27, 1.73, 15.00, 18, '10-05-2020', '10:47:46', 20, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'be5373a366', 1589129277),
(404, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 19, '10-05-2020', '10:48:31', 21, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'da66ecdcd3', 1589129405),
(405, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 19, '10-05-2020', '10:48:32', 21, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '19b93653b7', 1589129405),
(407, 1041, 1, 'Gigante  Mediterranea', 365.00, 323.01, 41.99, 365.00, 20, '10-05-2020', '10:51:20', 22, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'a5a94edea2', 1589129491),
(408, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 20, '10-05-2020', '10:51:22', 22, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'd19891cedd', 1589129491),
(409, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 20, '10-05-2020', '10:51:23', 22, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'e686fd8d60', 1589129491),
(410, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 21, '10-05-2020', '10:54:26', 23, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '4b7f0d1944', 1589129675),
(411, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 21, '10-05-2020', '10:54:27', 23, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '81b9bfd4f2', 1589129675),
(413, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 22, '10-05-2020', '10:56:10', 24, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'b6b9114c99', 1589129779),
(414, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 23, '10-05-2020', '10:57:09', 25, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '4a747c4847', 1589129831),
(415, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 24, '10-05-2020', '10:58:35', 26, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '7f10259f47', 1589129916),
(416, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 25, '10-05-2020', '10:59:53', 27, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '3ded3bbc15', 1589129995),
(417, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 26, '10-05-2020', '11:00:38', 28, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'c8197e9565', 1589130040),
(418, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 26, '10-05-2020', '11:00:39', 28, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '15a87b87e8', 1589130040),
(420, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 27, '10-05-2020', '11:02:20', 29, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'fbeccdd04b', 1589130141),
(421, 1047, 1, 'Bote de Agua', 15.00, 13.27, 1.73, 15.00, 28, '10-05-2020', '11:03:39', 30, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '3998533775', 1589130221),
(422, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 28, '10-05-2020', '11:03:40', 30, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'b3bee36435', 1589130221),
(424, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 29, '10-05-2020', '11:06:01', 31, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'fe31862e7d', 1589130378),
(425, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 30, '10-05-2020', '11:08:47', 32, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '81e80de86b', 1589130529),
(426, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 31, '10-05-2020', '11:11:26', 33, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '31e87a246d', 1589130688),
(427, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 31, '10-05-2020', '11:11:27', 33, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '0cd44bac3b', 1589130688),
(429, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 32, '10-05-2020', '11:14:18', 34, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '56d9b3d319', 1589130862),
(430, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 33, '10-05-2020', '11:15:05', 35, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '00346b7cc7', 1589130907),
(431, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 34, '10-05-2020', '11:16:38', 36, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '01352071ee', 1589131023),
(432, 1048, 2, 'Fresco Jumbo', 60.00, 106.19, 13.81, 120.00, 34, '10-05-2020', '11:16:39', 36, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'c6c9d80873', 1589131023),
(433, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 34, '10-05-2020', '11:16:44', 36, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '6266862373', 1589131023),
(434, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 35, '10-05-2020', '11:17:48', 37, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '2577b78eba', 1589131076),
(435, 1046, 1, 'Fresco Lata', 20.00, 17.70, 2.30, 20.00, 35, '10-05-2020', '11:17:48', 37, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '7472aa6a00', 1589131076),
(437, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 36, '10-05-2020', '11:18:28', 38, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'aa80c85b1a', 1589131112),
(438, 1046, 1, 'Fresco Lata', 20.00, 17.70, 2.30, 20.00, 36, '10-05-2020', '11:18:28', 38, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '98991bc850', 1589131112),
(440, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 37, '10-05-2020', '11:19:17', 39, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '34d4061b8b', 1589131159),
(441, 1047, 1, 'Bote de Agua', 15.00, 13.27, 1.73, 15.00, 37, '10-05-2020', '11:19:18', 39, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '27facb1fee', 1589131159),
(443, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 38, '10-05-2020', '11:20:10', 40, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '1940409a8e', 1589131212),
(444, 1046, 1, 'Fresco Lata', 20.00, 17.70, 2.30, 20.00, 38, '10-05-2020', '11:20:11', 40, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '22815788f3', 1589131212),
(446, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 39, '10-05-2020', '11:20:37', 41, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'f1d25628dd', 1589131247),
(447, 1046, 1, 'Fresco Lata', 20.00, 17.70, 2.30, 20.00, 39, '10-05-2020', '11:20:38', 41, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '8e5225ca61', 1589131247),
(449, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 40, '10-05-2020', '11:30:31', 42, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '4511ea21d9', 1589131985),
(450, 1046, 1, 'Fresco Lata', 20.00, 17.70, 2.30, 20.00, 40, '10-05-2020', '11:30:31', 42, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '5f6b286bea', 1589131985),
(452, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 41, '10-05-2020', '11:37:21', 44, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '3dba818a33', 1589132246),
(453, 1049, 2, 'Fresco Natural', 20.00, 35.40, 4.60, 40.00, 41, '10-05-2020', '11:37:23', 44, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '49a33a4e8f', 1589132246),
(455, 1046, 1, 'Fresco Lata', 20.00, 17.70, 2.30, 20.00, 42, '10-05-2020', '11:35:22', 43, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '8996bd0577', 1589132710),
(456, 1047, 1, 'Bote de Agua', 15.00, 13.27, 1.73, 15.00, 42, '10-05-2020', '11:35:23', 43, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '46dce91ccd', 1589132710),
(458, 1008, 2, 'Calzone Italiano', 85.00, 150.44, 19.56, 170.00, 26, '10-05-2020', '11:58:08', 32, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589090400', 1, 0, '46b66c0e07', 1589133559),
(459, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 26, '10-05-2020', '11:58:18', 32, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589090400', 1, 0, '16afaa1d25', 1589133559),
(460, 1046, 1, 'Fresco Lata', 20.00, 17.70, 2.30, 20.00, 26, '10-05-2020', '11:58:19', 32, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589090400', 1, 0, '127ca04034', 1589133559),
(461, 1001, 1, 'Clasica Jamon', 99.00, 87.61, 11.39, 99.00, 26, '10-05-2020', '11:58:33', 32, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589090400', 1, 0, '82ab2e3912', 1589133559),
(465, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 43, '10-05-2020', '14:22:02', 45, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '9f9d9f8384', 1589142144),
(466, 1058, 1, 'Combo Orilla de Queso', 190.00, 168.14, 21.86, 190.00, 43, '10-05-2020', '14:22:04', 45, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '18c18eb66b', 1589142144),
(467, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 43, '10-05-2020', '14:22:06', 45, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '3a957e2e54', 1589142144),
(468, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 44, '10-05-2020', '14:26:33', 46, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'b0887d292c', 1589142641),
(469, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 44, '10-05-2020', '14:26:33', 46, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '191f065ebd', 1589142641),
(470, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 44, '10-05-2020', '14:26:35', 46, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '4a29759d45', 1589142641),
(471, 1006, 3, 'Combo Wings', 195.00, 517.70, 67.30, 585.00, 45, '10-05-2020', '14:30:51', 47, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '72a4ea9b80', 1589142867),
(472, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 45, '10-05-2020', '14:30:58', 47, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '4ccdacab3a', 1589142867),
(473, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 45, '10-05-2020', '14:33:03', 47, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'e82026d605', 1589142867),
(474, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 45, '10-05-2020', '14:33:04', 47, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'f5fb64684c', 1589142867),
(478, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 46, '10-05-2020', '14:34:40', 48, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '7917ee870b', 1589143144),
(479, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 46, '10-05-2020', '14:34:41', 48, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '384ef14aff', 1589143144),
(481, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 47, '10-05-2020', '14:43:03', 49, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'cd750de460', 1589143391),
(482, 1047, 1, 'Bote de Agua', 15.00, 13.27, 1.73, 15.00, 47, '10-05-2020', '14:43:04', 49, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '17e3a8902a', 1589143391),
(483, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 47, '10-05-2020', '14:43:05', 49, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'a9e002d07b', 1589143391),
(484, 1046, 1, 'Fresco Lata', 20.00, 17.70, 2.30, 20.00, 48, '10-05-2020', '14:43:47', 51, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '787e136f0d', 1589143431),
(485, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 48, '10-05-2020', '14:43:47', 51, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'ddf1f8cb04', 1589143431),
(487, 1001, 1, 'Clasica Jamon', 99.00, 87.61, 11.39, 99.00, 49, '10-05-2020', '14:49:48', 53, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'fd991383bb', 1589143873),
(488, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 49, '10-05-2020', '14:49:49', 53, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'df6a057806', 1589143873),
(489, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 49, '10-05-2020', '14:49:50', 53, '2', '2', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'bc0189dae3', 1589143873),
(490, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 49, '10-05-2020', '14:49:51', 53, '2', '2', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '79bcebeece', 1589143873),
(494, 1055, 1, 'Orilla de queso Pesonal', 30.00, 26.55, 3.45, 30.00, 50, '10-05-2020', '14:47:59', 52, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'd1e6f70124', 1589144104),
(495, 1056, 1, 'Orilla de queso Grande', 55.00, 48.67, 6.33, 55.00, 50, '10-05-2020', '14:47:59', 52, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '3181b28105', 1589144104),
(496, 1057, 1, 'Orilla de queso Gigante', 65.00, 57.52, 7.48, 65.00, 50, '10-05-2020', '14:48:00', 52, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '595bee3d75', 1589144104),
(497, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 50, '10-05-2020', '14:48:01', 52, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '7876aa1327', 1589144104),
(498, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 50, '10-05-2020', '14:48:02', 52, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'f9a5574196', 1589144104),
(499, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 50, '10-05-2020', '14:48:03', 52, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '4cd80e7c41', 1589144104),
(501, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 51, '10-05-2020', '14:53:16', 54, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'a6e3e77bbc', 1589144115),
(502, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 51, '10-05-2020', '14:53:16', 54, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'e6474dbddc', 1589144115),
(503, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 51, '10-05-2020', '14:53:18', 54, '2', '2', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'dbc32aaf71', 1589144115),
(504, 1047, 1, 'Bote de Agua', 15.00, 13.27, 1.73, 15.00, 51, '10-05-2020', '14:53:19', 54, '2', '2', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '72112a4048', 1589144115),
(508, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 52, '10-05-2020', '15:14:33', 55, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'c828e1defe', 1589145284),
(509, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 52, '10-05-2020', '15:14:34', 55, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'b420701a73', 1589145284),
(510, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 52, '10-05-2020', '15:14:34', 55, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'ddd0775ce0', 1589145284),
(511, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 52, '10-05-2020', '15:14:35', 55, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'a4daac9dc1', 1589145284),
(515, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 53, '10-05-2020', '15:30:54', 59, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '4b2308efd8', 1589146271),
(516, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 53, '10-05-2020', '15:30:54', 59, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '1e24e4cfa6', 1589146271),
(517, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 53, '10-05-2020', '15:30:55', 59, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '0a0674fe20', 1589146271),
(518, 1047, 1, 'Bote de Agua', 15.00, 13.27, 1.73, 15.00, 53, '10-05-2020', '15:30:59', 59, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'b67270bca2', 1589146271),
(519, 1046, 1, 'Fresco Lata', 20.00, 17.70, 2.30, 20.00, 53, '10-05-2020', '15:30:59', 59, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '761bb0059a', 1589146271),
(520, 1058, 2, 'Combo Orilla de Queso', 190.00, 336.28, 43.72, 380.00, 53, '10-05-2020', '15:31:02', 59, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'd165827923', 1589146271),
(522, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 54, '10-05-2020', '15:28:06', 56, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '6903bf75ae', 1589146300),
(523, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 54, '10-05-2020', '15:28:07', 56, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '4198b7aa0d', 1589146300),
(524, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 54, '10-05-2020', '15:28:07', 56, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '19a57fee94', 1589146300),
(525, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 54, '10-05-2020', '15:28:08', 56, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'eaf9e73d96', 1589146300),
(526, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 54, '10-05-2020', '15:28:09', 56, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '70626790d6', 1589146300),
(529, 1036, 1, 'Personal Bacon con Maiz', 125.00, 110.62, 14.38, 125.00, 55, '10-05-2020', '15:28:24', 57, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '1186d27278', 1589146309),
(530, 1058, 1, 'Combo Orilla de Queso', 190.00, 168.14, 21.86, 190.00, 55, '10-05-2020', '15:28:26', 57, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'a8ff44b18a', 1589146309),
(531, 1046, 1, 'Fresco Lata', 20.00, 17.70, 2.30, 20.00, 55, '10-05-2020', '15:28:27', 57, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '87c170ed70', 1589146309),
(532, 1047, 1, 'Bote de Agua', 15.00, 13.27, 1.73, 15.00, 56, '10-05-2020', '15:32:35', 60, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '6a89183597', 1589146361),
(533, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 56, '10-05-2020', '15:32:36', 60, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '8f15c5c047', 1589146361),
(534, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 56, '10-05-2020', '15:32:37', 60, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '55cbe92330', 1589146361),
(535, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 57, '10-05-2020', '15:30:14', 58, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '2557c9f49a', 1589147429),
(536, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 57, '10-05-2020', '15:30:15', 58, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'bba253b8de', 1589147429),
(537, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 57, '10-05-2020', '15:30:15', 58, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '4ac69e6a69', 1589147429),
(538, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 57, '10-05-2020', '15:30:17', 58, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'edce55579a', 1589147429),
(539, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 57, '10-05-2020', '15:30:20', 58, '2', '2', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '0aaa07c086', 1589147429),
(540, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 57, '10-05-2020', '15:30:21', 58, '2', '2', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '1ca9bfe598', 1589147429),
(541, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 57, '10-05-2020', '15:30:21', 58, '2', '2', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '9c2970f6d1', 1589147429),
(542, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 58, '10-05-2020', '15:38:20', 61, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'dfe2b38981', 1589147833),
(543, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 58, '10-05-2020', '15:38:20', 61, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '675f3fdec2', 1589147833),
(545, 1001, 1, 'Clasica Jamon', 99.00, 87.61, 11.39, 99.00, 59, '10-05-2020', '15:38:31', 62, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '368a8d58d9', 1589147849),
(546, 1045, 1, 'Fresco 1.5 Lts', 35.00, 30.97, 4.03, 35.00, 59, '10-05-2020', '15:38:33', 62, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'a1e09bbf5a', 1589147849),
(547, 1004, 1, '2 x 1 Suprema', 269.00, 238.05, 30.95, 269.00, 59, '10-05-2020', '15:39:57', 62, '1', '1', 'Jazmin Nunez', '1', 'Tatiana', 1, 1, '1589090400', 1, 0, 'bf372a868a', 1589147849),
(548, 1003, 1, 'Clasica Extraqueso', 99.00, 87.61, 11.39, 99.00, 60, '10-05-2020', '16:05:06', 63, '1', '1', 'Jazmin Nunez', '1', 'Tatiana', 1, 1, '1589090400', 1, 0, 'dc1b110a4d', 1589148308),
(549, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 61, '10-05-2020', '16:09:47', 64, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '20d0cb2719', 1589148589),
(550, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 61, '10-05-2020', '16:09:47', 64, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'ce776762bd', 1589148589),
(552, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 63, '10-05-2020', '16:20:59', 65, '1', '1', 'Jazmin Nunez', '1', 'Tatiana', 1, 1, '1589090400', 1, 0, '035eb17775', 1589149262),
(553, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 64, '11-05-2020', '09:22:14', 66, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589176800', 1, 0, 'a037151455', 1589210536),
(554, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 64, '11-05-2020', '09:22:15', 66, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589176800', 1, 0, 'a5ce78b1e9', 1589210536),
(556, 1004, 1, '2 x 1 Suprema', 269.00, 238.05, 30.95, 269.00, 65, '11-05-2020', '09:28:24', 67, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589176800', 1, 0, '946f165b75', 1589210920),
(557, 1045, 1, 'Fresco 1.5 Lts', 35.00, 30.97, 4.03, 35.00, 65, '11-05-2020', '09:28:25', 67, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589176800', 1, 0, 'b8560355a9', 1589210920),
(559, 1004, 1, '2 x 1 Suprema', 269.00, 238.05, 30.95, 269.00, 66, '11-05-2020', '09:30:57', 68, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589176800', 1, 0, '68b4345d3b', 1589211367),
(560, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 66, '11-05-2020', '09:30:58', 68, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589176800', 1, 0, 'a155874c26', 1589211367),
(561, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 66, '11-05-2020', '09:31:00', 68, '2', '2', 'Erick Nunez', '1', 'Erick', 1, 1, '1589176800', 1, 0, '0bfde1aaf6', 1589211367),
(562, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 66, '11-05-2020', '09:31:01', 68, '2', '2', 'Erick Nunez', '1', 'Erick', 1, 1, '1589176800', 1, 0, '7714f5df0b', 1589211367),
(563, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 66, '11-05-2020', '09:31:02', 68, '3', '3', 'Erick Nunez', '1', 'Erick', 1, 1, '1589176800', 1, 0, '16da026e56', 1589211367),
(564, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 66, '11-05-2020', '09:31:03', 68, '3', '3', 'Erick Nunez', '1', 'Erick', 1, 1, '1589176800', 1, 0, '934205a519', 1589211367),
(565, 1045, 1, 'Fresco 1.5 Lts', 35.00, 30.97, 4.03, 35.00, 66, '11-05-2020', '09:31:04', 68, '3', '3', 'Erick Nunez', '1', 'Erick', 1, 1, '1589176800', 1, 0, '864b3fa6cf', 1589211367),
(566, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 67, '11-05-2020', '10:22:23', 69, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589176800', 1, 0, 'c49df46e84', 1589214149),
(567, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 67, '11-05-2020', '10:22:24', 69, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589176800', 1, 0, '4c657d167f', 1589214149),
(568, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 67, '11-05-2020', '10:22:25', 69, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589176800', 1, 0, '38fe299b58', 1589214149),
(569, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 67, '11-05-2020', '10:22:27', 69, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589176800', 1, 0, 'f3da1d0bd0', 1589214149),
(573, 1053, 1, 'Pan con Ajo 6 U', 75.00, 66.37, 8.63, 75.00, 68, '11-05-2020', '10:22:35', 70, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589176800', 1, 0, '48e877261c', 1589214157),
(574, 1054, 1, 'Pan con Ajo 12 U', 110.00, 97.35, 12.65, 110.00, 68, '11-05-2020', '10:22:35', 70, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589176800', 1, 0, 'fc781c4f69', 1589214157),
(575, 1056, 1, 'Orilla de queso Grande', 55.00, 48.67, 6.33, 55.00, 68, '11-05-2020', '10:22:35', 70, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589176800', 1, 0, '3ad5470759', 1589214157),
(576, 1055, 1, 'Orilla de queso Pesonal', 30.00, 26.55, 3.45, 30.00, 68, '11-05-2020', '10:22:36', 70, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589176800', 1, 0, 'ddd710df51', 1589214157),
(580, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 69, '11-05-2020', '13:31:16', 71, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589176800', 1, 0, 'dffe67848c', 1589225500),
(581, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 69, '11-05-2020', '13:31:17', 71, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589176800', 1, 0, 'd59ca62386', 1589225500),
(582, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 69, '11-05-2020', '13:31:17', 71, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589176800', 1, 0, '3ff96ab5b2', 1589225500),
(583, 1047, 1, 'Bote de Agua', 15.00, 13.27, 1.73, 15.00, 69, '11-05-2020', '13:31:17', 71, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589176800', 1, 0, '3112965cd3', 1589225500),
(587, 1045, 1, 'Fresco 1.5 Lts', 35.00, 30.97, 4.03, 35.00, 27, '12-05-2020', '09:37:12', 33, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589263200', 1, 0, '2589f982da', 1589297838),
(588, 1046, 1, 'Fresco Lata', 20.00, 17.70, 2.30, 20.00, 27, '12-05-2020', '09:37:13', 33, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589263200', 1, 0, '07cd27f5f3', 1589297838),
(589, 1047, 1, 'Bote de Agua', 15.00, 13.27, 1.73, 15.00, 27, '12-05-2020', '09:37:14', 33, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589263200', 1, 0, '39755ed999', 1589297838),
(590, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 27, '12-05-2020', '09:37:14', 33, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589263200', 1, 0, '804ee978de', 1589297838),
(594, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 70, '12-05-2020', '09:37:35', 72, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589263200', 1, 0, '9a8af2435f', 1589297882),
(595, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 70, '12-05-2020', '09:37:36', 72, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589263200', 1, 0, 'abe1431080', 1589297882),
(596, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 70, '12-05-2020', '09:37:37', 72, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589263200', 1, 0, 'c0100287c7', 1589297882),
(597, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 70, '12-05-2020', '09:37:37', 72, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589263200', 1, 0, '9c7c185ab6', 1589297882),
(598, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 70, '12-05-2020', '09:37:38', 72, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589263200', 1, 0, '593a7b3fd2', 1589297882),
(601, 1003, 1, 'Clasica Extraqueso', 99.00, 87.61, 11.39, 99.00, 28, '12-05-2020', '13:53:57', 34, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589263200', 1, 0, 'a79a1f81f1', 1589313300),
(602, 1035, 1, 'Gigante  de Camaron', 365.00, 323.01, 41.99, 365.00, 28, '12-05-2020', '13:54:01', 34, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589263200', 1, 0, 'f9442f81d0', 1589313300),
(603, 1037, 1, 'Grande Bacon con Maiz', 224.00, 198.23, 25.77, 224.00, 28, '12-05-2020', '13:54:01', 34, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589263200', 1, 0, '9892b4130e', 1589313300),
(604, 1046, 1, 'Fresco Lata', 20.00, 17.70, 2.30, 20.00, 28, '12-05-2020', '13:54:05', 34, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589263200', 1, 0, '52f7357157', 1589313300),
(605, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 28, '12-05-2020', '13:54:05', 34, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589263200', 1, 0, 'bd731b0933', 1589313300),
(608, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 29, '13-05-2020', '09:55:40', 35, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589349600', 1, 0, '5dfa22b83b', 1589385458),
(609, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 29, '13-05-2020', '09:55:41', 35, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589349600', 1, 0, '5decfccaa7', 1589385458),
(610, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 29, '13-05-2020', '09:55:42', 35, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589349600', 1, 0, '6a55bd3aa6', 1589385458),
(611, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 29, '13-05-2020', '09:55:42', 35, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589349600', 1, 0, 'fbc86b6491', 1589385458),
(615, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 30, '13-05-2020', '10:19:43', 36, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589349600', 1, 0, 'ce298ddd99', 1589386849),
(616, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 30, '13-05-2020', '10:19:44', 36, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589349600', 1, 0, 'a32da5c8c6', 1589386849),
(617, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 30, '13-05-2020', '10:19:45', 36, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589349600', 1, 0, 'a865a424fd', 1589386849),
(618, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 30, '13-05-2020', '10:19:45', 36, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589349600', 1, 0, 'a0ecdd0ae7', 1589386849),
(619, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 30, '13-05-2020', '10:19:46', 36, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589349600', 1, 0, 'bbb64092c7', 1589386849),
(620, 1001, 1, 'Clasica Jamon', 99.00, 87.61, 11.39, 99.00, 31, '26-05-2020', '05:28:18', 37, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, '17361e9806', 1590492501),
(621, 1002, 1, 'Clasica Pepperoni', 99.00, 87.61, 11.39, 99.00, 31, '26-05-2020', '05:28:18', 37, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, '4e48af1088', 1590492501),
(622, 1003, 1, 'Clasica Extraqueso', 99.00, 87.61, 11.39, 99.00, 31, '26-05-2020', '05:28:18', 37, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, '537d7f7dbd', 1590492501),
(623, 1001, 2, 'Clasica Jamon', 99.00, 175.22, 22.78, 198.00, 32, '26-05-2020', '05:28:46', 38, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, '8d2b8ad84a', 1590492530),
(624, 1001, 1, 'Clasica Jamon', 99.00, 87.61, 11.39, 99.00, 33, '26-05-2020', '05:28:55', 39, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, '942906bcd0', 1590492544),
(625, 1004, 1, '2 x 1 Suprema', 269.00, 238.05, 30.95, 269.00, 33, '26-05-2020', '05:28:58', 39, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, '3d64109550', 1590492544),
(626, 1009, 1, 'Personal 4 Estaciones', 125.00, 110.62, 14.38, 125.00, 33, '26-05-2020', '05:29:00', 39, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, '043c48e9bd', 1590492544),
(627, 1001, 2, 'Clasica Jamon', 99.00, 175.22, 22.78, 198.00, 34, '26-05-2020', '05:29:13', 40, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, 'e1b936c5b8', 1590492555),
(628, 1004, 3, '2 x 1 Suprema', 269.00, 714.16, 92.84, 807.00, 35, '26-05-2020', '05:29:22', 41, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, 'f91a2f94a4', 1590492565),
(629, 1001, 1, 'Clasica Jamon', 99.00, 87.61, 11.39, 99.00, 36, '26-05-2020', '05:37:30', 42, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, '3913ace848', 1590493055),
(630, 1004, 2, '2 x 1 Suprema', 269.00, 476.11, 61.89, 538.00, 36, '26-05-2020', '05:37:31', 42, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, '60c30fa7eb', 1590493055),
(632, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 37, '26-05-2020', '05:37:40', 43, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, '801309f03a', 1590493064),
(633, 1006, 2, 'Combo Wings', 195.00, 345.13, 44.87, 390.00, 37, '26-05-2020', '05:37:41', 43, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, 'f092df145f', 1590493064),
(635, 1001, 1, 'Clasica Jamon', 99.00, 87.61, 11.39, 99.00, 38, '26-05-2020', '05:38:49', 44, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, '162cc196c2', 1590493133),
(636, 1005, 2, 'Orilla de queso', 155.00, 274.34, 35.66, 310.00, 38, '26-05-2020', '05:38:51', 44, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, 'ca7289c2b5', 1590493133),
(638, 1001, 3, 'Clasica Jamon', 99.00, 262.83, 34.17, 297.00, 39, '26-05-2020', '05:43:45', 45, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, '7f2957f534', 1590493432),
(639, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 39, '26-05-2020', '05:43:50', 45, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, '9ea4d39763', 1590493432),
(641, 1004, 3, '2 x 1 Suprema', 269.00, 714.16, 92.84, 807.00, 40, '26-05-2020', '05:56:35', 46, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, '09063dd691', 1590494202),
(642, 1005, 2, 'Orilla de queso', 155.00, 274.34, 35.66, 310.00, 40, '26-05-2020', '05:56:40', 46, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, 'fd7687a8a5', 1590494202),
(644, 1001, 1, 'Clasica Jamon', 99.00, 87.61, 11.39, 99.00, 41, '26-05-2020', '05:58:25', 47, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, '0aba85b1aa', 1590494310),
(645, 1004, 2, '2 x 1 Suprema', 269.00, 476.11, 61.89, 538.00, 41, '26-05-2020', '05:58:26', 47, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, '5b1ec02cc5', 1590494310),
(646, 1005, 3, 'Orilla de queso', 155.00, 411.50, 53.50, 465.00, 41, '26-05-2020', '05:58:28', 47, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, '44d3888918', 1590494310),
(647, 1004, 2, '2 x 1 Suprema', 269.00, 476.11, 61.89, 538.00, 42, '26-05-2020', '06:15:30', 49, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, '8fbb5113a4', 1590495746),
(648, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 42, '26-05-2020', '06:15:31', 49, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, 'b96b904cb0', 1590495746),
(649, 1001, 1, 'Clasica Jamon', 99.00, 87.61, 11.39, 99.00, 42, '26-05-2020', '06:15:31', 49, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, 'ca328c8c3d', 1590495746),
(650, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 43, '26-05-2020', '06:22:35', 50, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, 'fe2fb476d8', 1590495758),
(651, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 44, '04-06-2020', '12:21:18', 52, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1591250400', 1, 0, '84847d0256', 1591294925),
(652, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 44, '04-06-2020', '12:21:19', 52, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1591250400', 1, 0, 'ce70edc872', 1591294925),
(653, 1004, 1, '2 x 1 Suprema', 269.00, 238.05, 30.95, 269.00, 44, '04-06-2020', '12:21:20', 52, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1591250400', 1, 0, 'd7ca7fbc8f', 1591294925),
(654, 1004, 1, '2 x 1 Suprema', 269.00, 238.05, 30.95, 269.00, 45, '04-06-2020', '12:25:57', 53, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1591250400', 1, 0, '54bc12412f', 1591295181),
(655, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 45, '04-06-2020', '12:25:58', 53, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1591250400', 1, 0, '96e15177f6', 1591295181),
(656, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 45, '04-06-2020', '12:25:59', 53, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1591250400', 1, 0, 'b2d4beef63', 1591295181);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ticket_num`
--

CREATE TABLE `ticket_num` (
  `id` int(5) NOT NULL,
  `fecha` varchar(30) NOT NULL,
  `hora` varchar(30) NOT NULL,
  `num_fac` int(6) NOT NULL,
  `mesa` int(5) NOT NULL,
  `efectivo` float(10,2) NOT NULL,
  `edo` int(2) NOT NULL COMMENT '1 = activo , 2= Eliminada',
  `tx` int(2) NOT NULL,
  `td` int(2) NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ticket_num`
--

INSERT INTO `ticket_num` (`id`, `fecha`, `hora`, `num_fac`, `mesa`, `efectivo`, `edo`, `tx`, `td`, `hash`, `time`) VALUES
(49, '08-05-2020', '06:47:52', 1, 1, 0.00, 1, 1, 0, '24b4d7077f', 1588942072),
(50, '08-05-2020', '07:44:08', 1, 3, 0.00, 1, 0, 0, 'ff9b2bec0a', 1588945448),
(51, '08-05-2020', '07:45:38', 2, 4, 0.00, 1, 0, 0, '1b404ef1fe', 1588945538),
(52, '08-05-2020', '07:45:55', 3, 5, 0.00, 1, 0, 0, 'a2996241ce', 1588945555),
(53, '08-05-2020', '15:08:02', 4, 2, 0.00, 1, 0, 0, '284d97f0c1', 1588972082),
(54, '08-05-2020', '15:24:32', 2, 2, 2000.00, 1, 1, 0, '7af4664a85', 1588973072),
(55, '08-05-2020', '15:24:50', 3, 3, 1000.00, 1, 1, 0, '1e0cfc581f', 1588973090),
(56, '08-05-2020', '15:26:21', 5, 7, 0.00, 1, 0, 0, '58b7378107', 1588973181),
(57, '08-05-2020', '16:39:03', 4, 8, 0.00, 1, 1, 0, '50acc63702', 1588977543),
(58, '08-05-2020', '17:17:45', 6, 8, 0.00, 1, 0, 0, '4adaef390a', 1588979865),
(59, '08-05-2020', '17:19:56', 7, 9, 0.00, 1, 0, 0, 'd6035c3f94', 1588979996),
(60, '08-05-2020', '18:14:56', 8, 15, 0.00, 1, 0, 0, 'ffcff27caa', 1588983296),
(61, '08-05-2020', '19:27:53', 9, 13, 0.00, 1, 0, 0, 'f89c53be90', 1588987673),
(62, '08-05-2020', '19:28:08', 10, 12, 0.00, 1, 0, 0, '70a930e284', 1588987688),
(63, '08-05-2020', '19:28:19', 11, 17, 0.00, 1, 0, 0, 'f465022728', 1588987699),
(64, '08-05-2020', '19:29:11', 12, 14, 0.00, 1, 0, 0, 'd8086ccfff', 1588987751),
(65, '08-05-2020', '19:32:12', 13, 18, 0.00, 1, 0, 0, '3dd0329a87', 1588987932),
(66, '08-05-2020', '19:34:14', 5, 9, 200.00, 1, 1, 0, '9561994f08', 1588988054),
(67, '08-05-2020', '19:35:53', 6, 9, 0.00, 1, 1, 0, '1b9f2ed4c1', 1588988153),
(68, '08-05-2020', '19:36:19', 7, 9, 0.00, 1, 1, 0, '8dc0901c8c', 1588988179),
(69, '08-05-2020', '19:56:38', 14, 19, 0.00, 1, 0, 0, '5b9f1b06e7', 1588989398),
(70, '08-05-2020', '19:59:53', 15, 20, 0.00, 1, 0, 0, '91d8e50a4b', 1588989593),
(71, '08-05-2020', '20:16:03', 16, 21, 0.00, 1, 0, 0, '7ad678a95a', 1588990563),
(72, '08-05-2020', '20:16:14', 17, 23, 0.00, 1, 0, 0, '4359ef5580', 1588990574),
(73, '08-05-2020', '20:16:32', 18, 24, 0.00, 1, 0, 0, '9b6c926199', 1588990592),
(74, '08-05-2020', '20:28:48', 19, 25, 0.00, 1, 0, 0, '1228f0c19a', 1588991328),
(75, '08-05-2020', '20:32:06', 20, 26, 0.00, 1, 0, 0, 'c803dc01db', 1588991526),
(76, '08-05-2020', '20:33:15', 21, 28, 0.00, 1, 0, 0, 'd6aef0bc08', 1588991595),
(77, '08-05-2020', '20:33:48', 22, 29, 0.00, 1, 0, 0, 'bc8d81e0eb', 1588991628),
(78, '08-05-2020', '20:34:41', 23, 27, 0.00, 1, 0, 0, '925db18212', 1588991681),
(79, '08-05-2020', '20:37:24', 8, 10, 0.00, 1, 1, 0, '31a77d1a43', 1588991844),
(80, '08-05-2020', '20:50:37', 9, 11, 0.00, 1, 1, 0, '4ac5437fb8', 1588992637),
(81, '08-05-2020', '21:04:36', 10, 12, 200.00, 1, 1, 0, 'f6cbc8c5f8', 1588993476),
(82, '08-05-2020', '21:10:32', 24, 30, 800.00, 1, 0, 0, 'de482421c5', 1588993832),
(83, '09-05-2020', '06:31:58', 25, 31, 0.00, 1, 0, 0, 'ec750fe6be', 1589027518),
(84, '09-05-2020', '06:50:05', 11, 13, 0.00, 1, 1, 0, '1431e02aa8', 1589028605),
(85, '09-05-2020', '06:50:15', 12, 14, 0.00, 1, 1, 0, '05aa831ab9', 1589028615),
(86, '10-05-2020', '08:09:45', 13, 15, 0.00, 1, 1, 0, '62c1e87cdb', 1589119785),
(87, '10-05-2020', '08:21:05', 14, 16, 0.00, 1, 1, 0, '29d977fe96', 1589120465),
(88, '10-05-2020', '09:03:25', 15, 17, 0.00, 1, 1, 0, '9e9637f655', 1589123005),
(89, '10-05-2020', '10:45:57', 16, 18, 0.00, 1, 1, 0, '97d89c1f41', 1589129157),
(90, '10-05-2020', '10:47:05', 17, 19, 400.00, 1, 1, 0, '16cf51163e', 1589129225),
(91, '10-05-2020', '10:47:57', 18, 20, 0.00, 1, 1, 0, '96607d25b4', 1589129277),
(92, '10-05-2020', '10:50:05', 19, 21, 0.00, 1, 1, 0, '3dbadc8ffb', 1589129405),
(93, '10-05-2020', '10:51:31', 20, 22, 0.00, 1, 1, 0, '18f7227f30', 1589129491),
(94, '10-05-2020', '10:54:35', 21, 23, 0.00, 1, 1, 0, '790da4f1b9', 1589129675),
(95, '10-05-2020', '10:56:19', 22, 24, 0.00, 1, 1, 0, '01e23f53f1', 1589129779),
(96, '10-05-2020', '10:57:11', 23, 25, 0.00, 1, 1, 0, '2a66811e41', 1589129831),
(97, '10-05-2020', '10:58:37', 24, 26, 0.00, 1, 1, 0, '2985d9c59a', 1589129917),
(98, '10-05-2020', '10:59:55', 25, 27, 0.00, 1, 1, 0, '8e893e1eff', 1589129996),
(99, '10-05-2020', '11:00:40', 26, 28, 0.00, 1, 1, 0, '8c3d863830', 1589130040),
(100, '10-05-2020', '11:02:21', 27, 29, 0.00, 1, 1, 0, '172671701f', 1589130141),
(101, '10-05-2020', '11:03:41', 28, 30, 0.00, 1, 1, 0, 'b5e4abd528', 1589130221),
(102, '10-05-2020', '11:06:18', 29, 31, 0.00, 1, 1, 0, '97d624835f', 1589130378),
(103, '10-05-2020', '11:08:49', 30, 32, 0.00, 1, 1, 0, 'f266daee85', 1589130529),
(104, '10-05-2020', '11:11:28', 31, 33, 0.00, 1, 1, 0, '2f021c512b', 1589130688),
(105, '10-05-2020', '11:14:23', 32, 34, 0.00, 1, 1, 0, 'e54dd81bbc', 1589130863),
(106, '10-05-2020', '11:15:07', 33, 35, 0.00, 1, 1, 0, 'f1a4a120d0', 1589130907),
(107, '10-05-2020', '11:17:03', 34, 36, 0.00, 1, 1, 0, 'b6f756dcae', 1589131023),
(108, '10-05-2020', '11:17:56', 35, 37, 0.00, 1, 1, 0, 'f5b16b6e18', 1589131076),
(109, '10-05-2020', '11:18:32', 36, 38, 0.00, 1, 1, 0, 'edb5e1e4df', 1589131112),
(110, '10-05-2020', '11:19:19', 37, 39, 0.00, 1, 1, 0, 'a74ff6ef97', 1589131159),
(111, '10-05-2020', '11:20:12', 38, 40, 0.00, 1, 1, 0, '07c105c5ac', 1589131212),
(112, '10-05-2020', '11:20:47', 39, 41, 0.00, 1, 1, 0, '67a11fcc63', 1589131247),
(113, '10-05-2020', '11:33:05', 40, 42, 200.00, 1, 1, 0, '1ad9b5afe7', 1589131985),
(114, '10-05-2020', '11:37:26', 41, 44, 0.00, 1, 1, 0, '9693a1e5b5', 1589132246),
(115, '10-05-2020', '11:45:10', 42, 43, 0.00, 1, 1, 0, 'd56eff6469', 1589132710),
(116, '10-05-2020', '11:59:19', 26, 32, 0.00, 1, 0, 0, '18ac08516e', 1589133559),
(117, '10-05-2020', '14:22:24', 43, 45, 0.00, 1, 1, 0, 'fb201839ba', 1589142144),
(118, '10-05-2020', '14:30:41', 44, 46, 0.00, 1, 1, 0, 'decfbdae08', 1589142641),
(119, '10-05-2020', '14:34:27', 45, 47, 1000.00, 1, 1, 0, '44a8f45d39', 1589142867),
(120, '10-05-2020', '14:39:04', 46, 48, 0.00, 1, 1, 0, '9401658a1b', 1589143144),
(121, '10-05-2020', '14:43:12', 47, 49, 0.00, 1, 1, 0, 'ceb877bdd8', 1589143392),
(122, '10-05-2020', '14:43:51', 48, 51, 0.00, 1, 1, 0, 'a9c1a45d67', 1589143431),
(123, '10-05-2020', '14:51:14', 49, 53, 0.00, 1, 1, 0, '3d3f9a1953', 1589143874),
(124, '10-05-2020', '14:55:04', 50, 52, 0.00, 1, 1, 0, '62a28aee29', 1589144104),
(125, '10-05-2020', '14:55:15', 51, 54, 0.00, 1, 1, 0, 'e2898efa89', 1589144115),
(126, '10-05-2020', '15:14:44', 52, 55, 400.00, 1, 1, 0, 'de6286b281', 1589145284),
(127, '10-05-2020', '15:31:12', 53, 59, 0.00, 1, 1, 0, '90952c4cb9', 1589146272),
(128, '10-05-2020', '15:31:40', 54, 56, 100.00, 1, 1, 0, '186a2a2a58', 1589146300),
(129, '10-05-2020', '15:31:49', 55, 57, 1000.00, 1, 1, 0, '45d9fc01c2', 1589146309),
(130, '10-05-2020', '15:32:41', 56, 60, 200.00, 1, 1, 0, '31d7319ff0', 1589146361),
(131, '10-05-2020', '15:50:29', 57, 58, 0.00, 1, 1, 0, '452e80bfa7', 1589147429),
(132, '10-05-2020', '15:57:13', 58, 61, 0.00, 1, 1, 0, '6f0a05563a', 1589147833),
(133, '10-05-2020', '15:57:29', 59, 62, 0.00, 1, 1, 0, 'c8f9793bde', 1589147849),
(134, '10-05-2020', '16:05:08', 60, 63, 0.00, 1, 1, 0, '0eddc9bd20', 1589148308),
(135, '10-05-2020', '16:09:49', 61, 64, 0.00, 1, 1, 0, '5806d5d034', 1589148589),
(136, '10-05-2020', '16:13:52', 62, 65, 0.00, 1, 1, 0, '0bcff25859', 1589148832),
(137, '10-05-2020', '16:21:02', 63, 65, 0.00, 1, 1, 0, '9dcf774c6f', 1589149262),
(138, '11-05-2020', '09:22:17', 64, 66, 0.00, 1, 1, 0, '0b0c07001b', 1589210537),
(139, '11-05-2020', '09:28:41', 65, 67, 0.00, 1, 1, 0, '2e2778e0e5', 1589210921),
(140, '11-05-2020', '09:36:07', 66, 68, 0.00, 1, 1, 0, '0df215a8f9', 1589211367),
(141, '11-05-2020', '10:22:29', 67, 69, 0.00, 1, 1, 0, '83c159cc3c', 1589214149),
(142, '11-05-2020', '10:22:37', 68, 70, 0.00, 1, 1, 0, '5703923406', 1589214157),
(143, '11-05-2020', '13:31:40', 69, 71, 0.00, 1, 1, 0, 'b50b219935', 1589225500),
(144, '12-05-2020', '09:37:18', 27, 33, 0.00, 1, 0, 0, '17241f7ed5', 1589297838),
(145, '12-05-2020', '09:38:02', 70, 72, 0.00, 1, 1, 0, 'c3047230c6', 1589297882),
(146, '12-05-2020', '13:55:00', 28, 34, 0.00, 1, 0, 0, 'd1b47a8a96', 1589313300),
(147, '13-05-2020', '09:57:38', 29, 35, 0.00, 1, 0, 0, '277181175a', 1589385458),
(148, '13-05-2020', '10:20:49', 30, 36, 0.00, 1, 0, 0, 'cec85cb0a2', 1589386849),
(149, '26-05-2020', '05:28:21', 31, 37, 0.00, 1, 0, 0, '3f7a5a8520', 1590492501),
(150, '26-05-2020', '05:28:50', 32, 38, 0.00, 1, 0, 0, '6fa2b25df0', 1590492530),
(151, '26-05-2020', '05:29:05', 33, 39, 0.00, 1, 0, 0, '71b0b9e4fd', 1590492545),
(152, '26-05-2020', '05:29:15', 34, 40, 0.00, 1, 0, 0, '30f9183148', 1590492555),
(153, '26-05-2020', '05:29:25', 35, 41, 0.00, 1, 0, 0, '5ce5e4b725', 1590492565),
(154, '26-05-2020', '05:37:36', 36, 42, 0.00, 1, 0, 0, '1db46732ff', 1590493056),
(155, '26-05-2020', '05:37:44', 37, 43, 0.00, 1, 0, 0, '5d5d1fe98a', 1590493064),
(156, '26-05-2020', '05:38:53', 38, 44, 0.00, 1, 0, 0, '420f50e8c4', 1590493133),
(157, '26-05-2020', '05:43:52', 39, 45, 0.00, 1, 0, 0, '9f54f0fd3f', 1590493432),
(158, '26-05-2020', '05:56:42', 40, 46, 0.00, 1, 0, 0, '988163f651', 1590494202),
(159, '26-05-2020', '05:58:30', 41, 47, 0.00, 1, 0, 0, 'da0f66984d', 1590494310),
(160, '26-05-2020', '06:22:26', 42, 49, 0.00, 1, 0, 0, 'ea1fd44160', 1590495746),
(161, '26-05-2020', '06:22:38', 43, 50, 0.00, 1, 0, 0, '75df1a7d3d', 1590495758),
(162, '04-06-2020', '12:22:05', 44, 52, 1000.00, 1, 0, 0, '59f96eb4be', 1591294925),
(163, '04-06-2020', '12:26:21', 45, 53, 0.00, 1, 0, 0, '57d12b432f', 1591295181);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ticket_propina`
--

CREATE TABLE `ticket_propina` (
  `id` int(6) NOT NULL,
  `num_fac` int(6) NOT NULL,
  `propina` float(10,2) NOT NULL,
  `efectivo` float(10,2) NOT NULL,
  `total` float(10,2) NOT NULL,
  `fecha` varchar(30) NOT NULL,
  `hora` varchar(30) NOT NULL,
  `tx` int(2) NOT NULL,
  `td` int(4) NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ticket_temp`
--

CREATE TABLE `ticket_temp` (
  `id` int(6) NOT NULL,
  `cod` int(4) NOT NULL,
  `cant` int(4) NOT NULL,
  `producto` varchar(100) NOT NULL,
  `pv` float(10,2) NOT NULL,
  `stotal` float(10,2) NOT NULL,
  `imp` float(10,2) NOT NULL,
  `total` float(10,2) NOT NULL,
  `num_fac` int(6) NOT NULL,
  `fecha` varchar(20) NOT NULL,
  `hora` varchar(20) NOT NULL,
  `mesa` int(6) NOT NULL,
  `cliente` varchar(100) NOT NULL,
  `cancela` varchar(100) NOT NULL COMMENT 'si la cuenta la pagara otro cliente',
  `cajero` varchar(100) NOT NULL,
  `tipo_pago` varchar(30) NOT NULL,
  `user` varchar(100) NOT NULL,
  `gravado` int(2) NOT NULL,
  `tx` int(2) NOT NULL,
  `fechaF` varchar(50) NOT NULL,
  `edo` int(2) NOT NULL COMMENT 'a= activo, 2= eliminada',
  `td` int(2) NOT NULL,
  `hash` varchar(12) NOT NULL,
  `time` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ticket_temp`
--

INSERT INTO `ticket_temp` (`id`, `cod`, `cant`, `producto`, `pv`, `stotal`, `imp`, `total`, `num_fac`, `fecha`, `hora`, `mesa`, `cliente`, `cancela`, `cajero`, `tipo_pago`, `user`, `gravado`, `tx`, `fechaF`, `edo`, `td`, `hash`, `time`) VALUES
(1, 1007, 2, 'Super Suprema', 175.00, 309.73, 40.27, 350.00, 25, '09-05-2020', '06:31:52', 31, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589004000', 1, 0, 'da327c64be', 1589027518),
(2, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 25, '09-05-2020', '06:31:54', 31, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589004000', 1, 0, '0a1deeff73', 1589027518),
(3, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 25, '09-05-2020', '06:31:55', 31, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589004000', 1, 0, 'c63486614a', 1589027518),
(4, 1003, 1, 'Clasica Extraqueso', 99.00, 87.61, 11.39, 99.00, 11, '09-05-2020', '06:49:44', 13, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589004000', 1, 0, '16bd4a226f', 1589028605),
(5, 1001, 1, 'Clasica Jamon', 99.00, 87.61, 11.39, 99.00, 11, '09-05-2020', '06:49:45', 13, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589004000', 1, 0, 'a28a8893f7', 1589028605),
(6, 1002, 1, 'Clasica Pepperoni', 99.00, 87.61, 11.39, 99.00, 11, '09-05-2020', '06:49:46', 13, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589004000', 1, 0, '3391b5cfa5', 1589028605),
(7, 1045, 1, 'Fresco 1.5 Lts', 35.00, 30.97, 4.03, 35.00, 11, '09-05-2020', '06:49:47', 13, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589004000', 1, 0, '4a4b6ae62c', 1589028605),
(8, 1046, 1, 'Fresco Lata', 20.00, 17.70, 2.30, 20.00, 11, '09-05-2020', '06:49:48', 13, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589004000', 1, 0, '0cb2b94dfb', 1589028605),
(9, 1047, 1, 'Bote de Agua', 15.00, 13.27, 1.73, 15.00, 11, '09-05-2020', '06:49:48', 13, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589004000', 1, 0, '88a22d0618', 1589028605),
(10, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 11, '09-05-2020', '06:49:49', 13, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589004000', 1, 0, '1aa843d506', 1589028605),
(11, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 11, '09-05-2020', '06:49:49', 13, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589004000', 1, 0, 'd1d30315c5', 1589028605),
(12, 1055, 1, 'Orilla de queso Pesonal', 30.00, 26.55, 3.45, 30.00, 11, '09-05-2020', '06:49:51', 13, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589004000', 1, 0, '57f7430c03', 1589028605),
(13, 1054, 1, 'Pan con Ajo 12 U', 110.00, 97.35, 12.65, 110.00, 11, '09-05-2020', '06:49:52', 13, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589004000', 1, 0, '4553aa0622', 1589028605),
(14, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 12, '09-05-2020', '06:50:13', 14, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589004000', 1, 0, 'da0aad32e5', 1589028615),
(15, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 12, '09-05-2020', '06:50:13', 14, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589004000', 1, 0, '4744dbbd63', 1589028615),
(16, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 12, '09-05-2020', '06:50:14', 14, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589004000', 1, 0, 'dcf5d2f263', 1589028615),
(28, 1001, 1, 'Clasica Jamon', 99.00, 87.61, 11.39, 99.00, 13, '10-05-2020', '08:07:42', 15, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '1d9395c143', 1589119785),
(29, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 13, '10-05-2020', '08:07:45', 15, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'baac51960c', 1589119785),
(30, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 13, '10-05-2020', '08:09:41', 15, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'e8ed067d76', 1589119785),
(31, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 13, '10-05-2020', '08:09:41', 15, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '4be8f2ff1a', 1589119785),
(32, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 13, '10-05-2020', '08:09:42', 15, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'd5bb46cbd4', 1589119785),
(33, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 14, '10-05-2020', '08:10:59', 16, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'e2f3b460bc', 1589120465),
(34, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 14, '10-05-2020', '08:11:01', 16, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '8f155a750f', 1589120465),
(48, 1003, 1, 'Clasica Extraqueso', 99.00, 87.61, 11.39, 99.00, 15, '10-05-2020', '09:03:23', 17, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '55f6788bc7', 1589123005),
(57, 1008, 2, 'Calzone Italiano', 85.00, 150.44, 19.56, 170.00, 16, '10-05-2020', '10:37:53', 18, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'e50a6497d3', 1589129157),
(58, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 16, '10-05-2020', '10:40:06', 18, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'bd60a886c4', 1589129157),
(59, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 17, '10-05-2020', '10:46:43', 19, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '3c88589ae7', 1589129225),
(60, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 17, '10-05-2020', '10:46:44', 19, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'f8cc791b4b', 1589129225),
(61, 1047, 1, 'Bote de Agua', 15.00, 13.27, 1.73, 15.00, 17, '10-05-2020', '10:46:44', 19, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '8c4f52299e', 1589129225),
(62, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 18, '10-05-2020', '10:47:46', 20, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '686ab8073f', 1589129277),
(63, 1047, 1, 'Bote de Agua', 15.00, 13.27, 1.73, 15.00, 18, '10-05-2020', '10:47:46', 20, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'be5373a366', 1589129277),
(64, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 19, '10-05-2020', '10:48:31', 21, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'da66ecdcd3', 1589129405),
(65, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 19, '10-05-2020', '10:48:32', 21, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '19b93653b7', 1589129405),
(66, 1041, 1, 'Gigante  Mediterranea', 365.00, 323.01, 41.99, 365.00, 20, '10-05-2020', '10:51:20', 22, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'a5a94edea2', 1589129491),
(67, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 20, '10-05-2020', '10:51:22', 22, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'd19891cedd', 1589129491),
(68, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 20, '10-05-2020', '10:51:23', 22, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'e686fd8d60', 1589129491),
(69, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 21, '10-05-2020', '10:54:26', 23, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '4b7f0d1944', 1589129675),
(70, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 21, '10-05-2020', '10:54:27', 23, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '81b9bfd4f2', 1589129675),
(71, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 22, '10-05-2020', '10:56:10', 24, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'b6b9114c99', 1589129779),
(72, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 23, '10-05-2020', '10:57:09', 25, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '4a747c4847', 1589129831),
(73, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 24, '10-05-2020', '10:58:35', 26, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '7f10259f47', 1589129916),
(74, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 25, '10-05-2020', '10:59:53', 27, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '3ded3bbc15', 1589129995),
(75, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 26, '10-05-2020', '11:00:38', 28, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'c8197e9565', 1589130040),
(76, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 26, '10-05-2020', '11:00:39', 28, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '15a87b87e8', 1589130040),
(77, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 27, '10-05-2020', '11:02:20', 29, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'fbeccdd04b', 1589130141),
(78, 1047, 1, 'Bote de Agua', 15.00, 13.27, 1.73, 15.00, 28, '10-05-2020', '11:03:39', 30, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '3998533775', 1589130221),
(79, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 28, '10-05-2020', '11:03:40', 30, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'b3bee36435', 1589130221),
(80, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 29, '10-05-2020', '11:06:01', 31, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'fe31862e7d', 1589130378),
(81, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 30, '10-05-2020', '11:08:47', 32, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '81e80de86b', 1589130529),
(82, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 31, '10-05-2020', '11:11:26', 33, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '31e87a246d', 1589130688),
(83, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 31, '10-05-2020', '11:11:27', 33, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '0cd44bac3b', 1589130688),
(84, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 32, '10-05-2020', '11:14:18', 34, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '56d9b3d319', 1589130862),
(85, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 33, '10-05-2020', '11:15:05', 35, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '00346b7cc7', 1589130907),
(86, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 34, '10-05-2020', '11:16:38', 36, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '01352071ee', 1589131023),
(87, 1048, 2, 'Fresco Jumbo', 60.00, 106.19, 13.81, 120.00, 34, '10-05-2020', '11:16:39', 36, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'c6c9d80873', 1589131023),
(88, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 34, '10-05-2020', '11:16:44', 36, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '6266862373', 1589131023),
(89, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 35, '10-05-2020', '11:17:48', 37, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '2577b78eba', 1589131076),
(90, 1046, 1, 'Fresco Lata', 20.00, 17.70, 2.30, 20.00, 35, '10-05-2020', '11:17:48', 37, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '7472aa6a00', 1589131076),
(91, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 36, '10-05-2020', '11:18:28', 38, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'aa80c85b1a', 1589131112),
(92, 1046, 1, 'Fresco Lata', 20.00, 17.70, 2.30, 20.00, 36, '10-05-2020', '11:18:28', 38, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '98991bc850', 1589131112),
(93, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 37, '10-05-2020', '11:19:17', 39, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '34d4061b8b', 1589131159),
(94, 1047, 1, 'Bote de Agua', 15.00, 13.27, 1.73, 15.00, 37, '10-05-2020', '11:19:18', 39, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '27facb1fee', 1589131159),
(95, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 38, '10-05-2020', '11:20:10', 40, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '1940409a8e', 1589131212),
(96, 1046, 1, 'Fresco Lata', 20.00, 17.70, 2.30, 20.00, 38, '10-05-2020', '11:20:11', 40, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '22815788f3', 1589131212),
(97, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 39, '10-05-2020', '11:20:37', 41, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'f1d25628dd', 1589131247),
(98, 1046, 1, 'Fresco Lata', 20.00, 17.70, 2.30, 20.00, 39, '10-05-2020', '11:20:38', 41, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '8e5225ca61', 1589131247),
(99, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 40, '10-05-2020', '11:30:31', 42, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '4511ea21d9', 1589131985),
(100, 1046, 1, 'Fresco Lata', 20.00, 17.70, 2.30, 20.00, 40, '10-05-2020', '11:30:31', 42, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '5f6b286bea', 1589131985),
(101, 1046, 1, 'Fresco Lata', 20.00, 17.70, 2.30, 20.00, 42, '10-05-2020', '11:35:22', 43, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '8996bd0577', 1589132710),
(102, 1047, 1, 'Bote de Agua', 15.00, 13.27, 1.73, 15.00, 42, '10-05-2020', '11:35:23', 43, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '46dce91ccd', 1589132710),
(103, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 41, '10-05-2020', '11:37:21', 44, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '3dba818a33', 1589132246),
(104, 1049, 2, 'Fresco Natural', 20.00, 35.40, 4.60, 40.00, 41, '10-05-2020', '11:37:23', 44, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '49a33a4e8f', 1589132246),
(105, 1008, 2, 'Calzone Italiano', 85.00, 150.44, 19.56, 170.00, 26, '10-05-2020', '11:58:08', 32, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589090400', 1, 0, '46b66c0e07', 1589133559),
(106, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 26, '10-05-2020', '11:58:18', 32, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589090400', 1, 0, '16afaa1d25', 1589133559),
(107, 1046, 1, 'Fresco Lata', 20.00, 17.70, 2.30, 20.00, 26, '10-05-2020', '11:58:19', 32, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589090400', 1, 0, '127ca04034', 1589133559),
(108, 1001, 1, 'Clasica Jamon', 99.00, 87.61, 11.39, 99.00, 26, '10-05-2020', '11:58:33', 32, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589090400', 1, 0, '82ab2e3912', 1589133559),
(109, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 43, '10-05-2020', '14:22:02', 45, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '9f9d9f8384', 1589142144),
(110, 1058, 1, 'Combo Orilla de Queso', 190.00, 168.14, 21.86, 190.00, 43, '10-05-2020', '14:22:04', 45, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '18c18eb66b', 1589142144),
(111, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 43, '10-05-2020', '14:22:06', 45, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '3a957e2e54', 1589142144),
(112, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 44, '10-05-2020', '14:26:33', 46, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'b0887d292c', 1589142641),
(113, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 44, '10-05-2020', '14:26:33', 46, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '191f065ebd', 1589142641),
(114, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 44, '10-05-2020', '14:26:35', 46, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '4a29759d45', 1589142641),
(115, 1006, 3, 'Combo Wings', 195.00, 517.70, 67.30, 585.00, 45, '10-05-2020', '14:30:51', 47, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '72a4ea9b80', 1589142867),
(116, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 45, '10-05-2020', '14:30:58', 47, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '4ccdacab3a', 1589142867),
(117, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 45, '10-05-2020', '14:33:03', 47, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'e82026d605', 1589142867),
(118, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 45, '10-05-2020', '14:33:04', 47, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'f5fb64684c', 1589142867),
(119, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 46, '10-05-2020', '14:34:40', 48, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '7917ee870b', 1589143144),
(120, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 46, '10-05-2020', '14:34:41', 48, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '384ef14aff', 1589143144),
(135, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 47, '10-05-2020', '14:43:03', 49, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'cd750de460', 1589143391),
(136, 1047, 1, 'Bote de Agua', 15.00, 13.27, 1.73, 15.00, 47, '10-05-2020', '14:43:04', 49, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '17e3a8902a', 1589143391),
(137, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 47, '10-05-2020', '14:43:05', 49, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'a9e002d07b', 1589143391),
(142, 1046, 1, 'Fresco Lata', 20.00, 17.70, 2.30, 20.00, 48, '10-05-2020', '14:43:47', 51, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '787e136f0d', 1589143431),
(143, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 48, '10-05-2020', '14:43:47', 51, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'ddf1f8cb04', 1589143431),
(146, 1055, 1, 'Orilla de queso Pesonal', 30.00, 26.55, 3.45, 30.00, 50, '10-05-2020', '14:47:59', 52, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'd1e6f70124', 1589144104),
(147, 1056, 1, 'Orilla de queso Grande', 55.00, 48.67, 6.33, 55.00, 50, '10-05-2020', '14:47:59', 52, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '3181b28105', 1589144104),
(148, 1057, 1, 'Orilla de queso Gigante', 65.00, 57.52, 7.48, 65.00, 50, '10-05-2020', '14:48:00', 52, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '595bee3d75', 1589144104),
(149, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 50, '10-05-2020', '14:48:01', 52, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '7876aa1327', 1589144104),
(150, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 50, '10-05-2020', '14:48:02', 52, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'f9a5574196', 1589144104),
(151, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 50, '10-05-2020', '14:48:03', 52, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '4cd80e7c41', 1589144104),
(152, 1001, 1, 'Clasica Jamon', 99.00, 87.61, 11.39, 99.00, 49, '10-05-2020', '14:49:48', 53, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'fd991383bb', 1589143873),
(153, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 49, '10-05-2020', '14:49:49', 53, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'df6a057806', 1589143873),
(154, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 49, '10-05-2020', '14:49:50', 53, '2', '2', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'bc0189dae3', 1589143873),
(155, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 49, '10-05-2020', '14:49:51', 53, '2', '2', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '79bcebeece', 1589143873),
(156, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 51, '10-05-2020', '14:53:16', 54, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'a6e3e77bbc', 1589144115),
(157, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 51, '10-05-2020', '14:53:16', 54, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'e6474dbddc', 1589144115),
(158, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 51, '10-05-2020', '14:53:18', 54, '2', '2', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'dbc32aaf71', 1589144115),
(159, 1047, 1, 'Bote de Agua', 15.00, 13.27, 1.73, 15.00, 51, '10-05-2020', '14:53:19', 54, '2', '2', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '72112a4048', 1589144115),
(170, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 52, '10-05-2020', '15:14:33', 55, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'c828e1defe', 1589145284),
(171, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 52, '10-05-2020', '15:14:34', 55, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'b420701a73', 1589145284),
(172, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 52, '10-05-2020', '15:14:34', 55, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'ddd0775ce0', 1589145284),
(173, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 52, '10-05-2020', '15:14:35', 55, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'a4daac9dc1', 1589145284),
(181, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 54, '10-05-2020', '15:28:06', 56, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '6903bf75ae', 1589146300),
(182, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 54, '10-05-2020', '15:28:07', 56, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '4198b7aa0d', 1589146300),
(183, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 54, '10-05-2020', '15:28:07', 56, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '19a57fee94', 1589146300),
(184, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 54, '10-05-2020', '15:28:08', 56, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'eaf9e73d96', 1589146300),
(185, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 54, '10-05-2020', '15:28:09', 56, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '70626790d6', 1589146300),
(186, 1036, 1, 'Personal Bacon con Maiz', 125.00, 110.62, 14.38, 125.00, 55, '10-05-2020', '15:28:24', 57, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '1186d27278', 1589146309),
(187, 1058, 1, 'Combo Orilla de Queso', 190.00, 168.14, 21.86, 190.00, 55, '10-05-2020', '15:28:26', 57, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'a8ff44b18a', 1589146309),
(188, 1046, 1, 'Fresco Lata', 20.00, 17.70, 2.30, 20.00, 55, '10-05-2020', '15:28:27', 57, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '87c170ed70', 1589146309),
(189, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 57, '10-05-2020', '15:30:14', 58, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '2557c9f49a', 1589147429),
(190, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 57, '10-05-2020', '15:30:15', 58, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'bba253b8de', 1589147429),
(191, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 57, '10-05-2020', '15:30:15', 58, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '4ac69e6a69', 1589147429),
(192, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 57, '10-05-2020', '15:30:17', 58, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'edce55579a', 1589147429),
(193, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 57, '10-05-2020', '15:30:20', 58, '2', '2', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '0aaa07c086', 1589147429),
(194, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 57, '10-05-2020', '15:30:21', 58, '2', '2', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '1ca9bfe598', 1589147429),
(195, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 57, '10-05-2020', '15:30:21', 58, '2', '2', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '9c2970f6d1', 1589147429),
(196, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 53, '10-05-2020', '15:30:54', 59, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '4b2308efd8', 1589146271),
(197, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 53, '10-05-2020', '15:30:54', 59, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '1e24e4cfa6', 1589146271),
(198, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 53, '10-05-2020', '15:30:55', 59, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '0a0674fe20', 1589146271),
(199, 1047, 1, 'Bote de Agua', 15.00, 13.27, 1.73, 15.00, 53, '10-05-2020', '15:30:59', 59, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'b67270bca2', 1589146271),
(200, 1046, 1, 'Fresco Lata', 20.00, 17.70, 2.30, 20.00, 53, '10-05-2020', '15:30:59', 59, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '761bb0059a', 1589146271),
(201, 1058, 2, 'Combo Orilla de Queso', 190.00, 336.28, 43.72, 380.00, 53, '10-05-2020', '15:31:02', 59, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'd165827923', 1589146271),
(202, 1047, 1, 'Bote de Agua', 15.00, 13.27, 1.73, 15.00, 56, '10-05-2020', '15:32:35', 60, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '6a89183597', 1589146361),
(203, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 56, '10-05-2020', '15:32:36', 60, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '8f15c5c047', 1589146361),
(204, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 56, '10-05-2020', '15:32:37', 60, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '55cbe92330', 1589146361),
(209, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 58, '10-05-2020', '15:38:20', 61, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'dfe2b38981', 1589147833),
(210, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 58, '10-05-2020', '15:38:20', 61, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '675f3fdec2', 1589147833),
(211, 1001, 1, 'Clasica Jamon', 99.00, 87.61, 11.39, 99.00, 59, '10-05-2020', '15:38:31', 62, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '368a8d58d9', 1589147849),
(212, 1045, 1, 'Fresco 1.5 Lts', 35.00, 30.97, 4.03, 35.00, 59, '10-05-2020', '15:38:33', 62, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'a1e09bbf5a', 1589147849),
(213, 1004, 1, '2 x 1 Suprema', 269.00, 238.05, 30.95, 269.00, 59, '10-05-2020', '15:39:57', 62, '1', '1', 'Jazmin Nunez', '1', 'Tatiana', 1, 1, '1589090400', 1, 0, 'bf372a868a', 1589147849),
(214, 1003, 1, 'Clasica Extraqueso', 99.00, 87.61, 11.39, 99.00, 60, '10-05-2020', '16:05:06', 63, '1', '1', 'Jazmin Nunez', '1', 'Tatiana', 1, 1, '1589090400', 1, 0, 'dc1b110a4d', 1589148308),
(215, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 61, '10-05-2020', '16:09:47', 64, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, '20d0cb2719', 1589148589),
(216, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 61, '10-05-2020', '16:09:47', 64, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589090400', 1, 0, 'ce776762bd', 1589148589),
(221, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 63, '10-05-2020', '16:20:59', 65, '1', '1', 'Jazmin Nunez', '1', 'Tatiana', 1, 1, '1589090400', 1, 0, '035eb17775', 1589149262),
(222, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 64, '11-05-2020', '09:22:14', 66, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589176800', 1, 0, 'a037151455', 1589210536),
(223, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 64, '11-05-2020', '09:22:15', 66, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589176800', 1, 0, 'a5ce78b1e9', 1589210536),
(224, 1004, 1, '2 x 1 Suprema', 269.00, 238.05, 30.95, 269.00, 65, '11-05-2020', '09:28:24', 67, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589176800', 1, 0, '946f165b75', 1589210920),
(225, 1045, 1, 'Fresco 1.5 Lts', 35.00, 30.97, 4.03, 35.00, 65, '11-05-2020', '09:28:25', 67, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589176800', 1, 0, 'b8560355a9', 1589210920),
(226, 1004, 1, '2 x 1 Suprema', 269.00, 238.05, 30.95, 269.00, 66, '11-05-2020', '09:30:57', 68, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589176800', 1, 0, '68b4345d3b', 1589211367),
(227, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 66, '11-05-2020', '09:30:58', 68, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589176800', 1, 0, 'a155874c26', 1589211367),
(228, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 66, '11-05-2020', '09:31:00', 68, '2', '2', 'Erick Nunez', '1', 'Erick', 1, 1, '1589176800', 1, 0, '0bfde1aaf6', 1589211367),
(229, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 66, '11-05-2020', '09:31:01', 68, '2', '2', 'Erick Nunez', '1', 'Erick', 1, 1, '1589176800', 1, 0, '7714f5df0b', 1589211367),
(230, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 66, '11-05-2020', '09:31:02', 68, '3', '3', 'Erick Nunez', '1', 'Erick', 1, 1, '1589176800', 1, 0, '16da026e56', 1589211367),
(231, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 66, '11-05-2020', '09:31:03', 68, '3', '3', 'Erick Nunez', '1', 'Erick', 1, 1, '1589176800', 1, 0, '934205a519', 1589211367),
(232, 1045, 1, 'Fresco 1.5 Lts', 35.00, 30.97, 4.03, 35.00, 66, '11-05-2020', '09:31:04', 68, '3', '3', 'Erick Nunez', '1', 'Erick', 1, 1, '1589176800', 1, 0, '864b3fa6cf', 1589211367),
(246, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 67, '11-05-2020', '10:22:23', 69, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589176800', 1, 0, 'c49df46e84', 1589214149),
(247, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 67, '11-05-2020', '10:22:24', 69, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589176800', 1, 0, '4c657d167f', 1589214149),
(248, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 67, '11-05-2020', '10:22:25', 69, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589176800', 1, 0, '38fe299b58', 1589214149),
(249, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 67, '11-05-2020', '10:22:27', 69, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589176800', 1, 0, 'f3da1d0bd0', 1589214149),
(250, 1053, 1, 'Pan con Ajo 6 U', 75.00, 66.37, 8.63, 75.00, 68, '11-05-2020', '10:22:35', 70, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589176800', 1, 0, '48e877261c', 1589214157),
(251, 1054, 1, 'Pan con Ajo 12 U', 110.00, 97.35, 12.65, 110.00, 68, '11-05-2020', '10:22:35', 70, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589176800', 1, 0, 'fc781c4f69', 1589214157),
(252, 1056, 1, 'Orilla de queso Grande', 55.00, 48.67, 6.33, 55.00, 68, '11-05-2020', '10:22:35', 70, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589176800', 1, 0, '3ad5470759', 1589214157),
(253, 1055, 1, 'Orilla de queso Pesonal', 30.00, 26.55, 3.45, 30.00, 68, '11-05-2020', '10:22:36', 70, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589176800', 1, 0, 'ddd710df51', 1589214157),
(348, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 69, '11-05-2020', '13:31:16', 71, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589176800', 1, 0, 'dffe67848c', 1589225500),
(349, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 69, '11-05-2020', '13:31:17', 71, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589176800', 1, 0, 'd59ca62386', 1589225500),
(350, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 69, '11-05-2020', '13:31:17', 71, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589176800', 1, 0, '3ff96ab5b2', 1589225500),
(351, 1047, 1, 'Bote de Agua', 15.00, 13.27, 1.73, 15.00, 69, '11-05-2020', '13:31:17', 71, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589176800', 1, 0, '3112965cd3', 1589225500),
(358, 1045, 1, 'Fresco 1.5 Lts', 35.00, 30.97, 4.03, 35.00, 27, '12-05-2020', '09:37:12', 33, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589263200', 1, 0, '2589f982da', 1589297838),
(359, 1046, 1, 'Fresco Lata', 20.00, 17.70, 2.30, 20.00, 27, '12-05-2020', '09:37:13', 33, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589263200', 1, 0, '07cd27f5f3', 1589297838),
(360, 1047, 1, 'Bote de Agua', 15.00, 13.27, 1.73, 15.00, 27, '12-05-2020', '09:37:14', 33, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589263200', 1, 0, '39755ed999', 1589297838),
(361, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 27, '12-05-2020', '09:37:14', 33, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589263200', 1, 0, '804ee978de', 1589297838),
(362, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 70, '12-05-2020', '09:37:35', 72, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589263200', 1, 0, '9a8af2435f', 1589297882),
(363, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 70, '12-05-2020', '09:37:36', 72, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589263200', 1, 0, 'abe1431080', 1589297882),
(364, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 70, '12-05-2020', '09:37:37', 72, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589263200', 1, 0, 'c0100287c7', 1589297882),
(365, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 70, '12-05-2020', '09:37:37', 72, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589263200', 1, 0, '9c7c185ab6', 1589297882),
(366, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 70, '12-05-2020', '09:37:38', 72, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 1, '1589263200', 1, 0, '593a7b3fd2', 1589297882),
(368, 1003, 1, 'Clasica Extraqueso', 99.00, 87.61, 11.39, 99.00, 28, '12-05-2020', '13:53:57', 34, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589263200', 1, 0, 'a79a1f81f1', 1589313300),
(369, 1035, 1, 'Gigante  de Camaron', 365.00, 323.01, 41.99, 365.00, 28, '12-05-2020', '13:54:01', 34, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589263200', 1, 0, 'f9442f81d0', 1589313300),
(370, 1037, 1, 'Grande Bacon con Maiz', 224.00, 198.23, 25.77, 224.00, 28, '12-05-2020', '13:54:01', 34, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589263200', 1, 0, '9892b4130e', 1589313300),
(371, 1046, 1, 'Fresco Lata', 20.00, 17.70, 2.30, 20.00, 28, '12-05-2020', '13:54:05', 34, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589263200', 1, 0, '52f7357157', 1589313300),
(372, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 28, '12-05-2020', '13:54:05', 34, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589263200', 1, 0, 'bd731b0933', 1589313300),
(373, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 29, '13-05-2020', '09:55:40', 35, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589349600', 1, 0, '5dfa22b83b', 1589385458),
(374, 1049, 1, 'Fresco Natural', 20.00, 17.70, 2.30, 20.00, 29, '13-05-2020', '09:55:41', 35, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589349600', 1, 0, '5decfccaa7', 1589385458),
(375, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 29, '13-05-2020', '09:55:42', 35, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589349600', 1, 0, '6a55bd3aa6', 1589385458),
(376, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 29, '13-05-2020', '09:55:42', 35, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589349600', 1, 0, 'fbc86b6491', 1589385458),
(377, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 30, '13-05-2020', '10:19:43', 36, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589349600', 1, 0, 'ce298ddd99', 1589386849),
(378, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 30, '13-05-2020', '10:19:44', 36, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589349600', 1, 0, 'a32da5c8c6', 1589386849),
(379, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 30, '13-05-2020', '10:19:45', 36, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589349600', 1, 0, 'a865a424fd', 1589386849),
(380, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 30, '13-05-2020', '10:19:45', 36, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589349600', 1, 0, 'a0ecdd0ae7', 1589386849),
(381, 1048, 1, 'Fresco Jumbo', 60.00, 53.10, 6.90, 60.00, 30, '13-05-2020', '10:19:46', 36, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1589349600', 1, 0, 'bbb64092c7', 1589386849),
(382, 1001, 1, 'Clasica Jamon', 99.00, 87.61, 11.39, 99.00, 31, '26-05-2020', '05:28:18', 37, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, '17361e9806', 1590492501),
(383, 1002, 1, 'Clasica Pepperoni', 99.00, 87.61, 11.39, 99.00, 31, '26-05-2020', '05:28:18', 37, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, '4e48af1088', 1590492501),
(384, 1003, 1, 'Clasica Extraqueso', 99.00, 87.61, 11.39, 99.00, 31, '26-05-2020', '05:28:18', 37, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, '537d7f7dbd', 1590492501),
(385, 1001, 2, 'Clasica Jamon', 99.00, 175.22, 22.78, 198.00, 32, '26-05-2020', '05:28:46', 38, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, '8d2b8ad84a', 1590492530),
(386, 1001, 1, 'Clasica Jamon', 99.00, 87.61, 11.39, 99.00, 33, '26-05-2020', '05:28:55', 39, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, '942906bcd0', 1590492544),
(387, 1004, 1, '2 x 1 Suprema', 269.00, 238.05, 30.95, 269.00, 33, '26-05-2020', '05:28:58', 39, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, '3d64109550', 1590492544),
(388, 1009, 1, 'Personal 4 Estaciones', 125.00, 110.62, 14.38, 125.00, 33, '26-05-2020', '05:29:00', 39, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, '043c48e9bd', 1590492544),
(389, 1001, 2, 'Clasica Jamon', 99.00, 175.22, 22.78, 198.00, 34, '26-05-2020', '05:29:13', 40, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, 'e1b936c5b8', 1590492555),
(390, 1004, 3, '2 x 1 Suprema', 269.00, 714.16, 92.84, 807.00, 35, '26-05-2020', '05:29:22', 41, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, 'f91a2f94a4', 1590492565),
(397, 1001, 1, 'Clasica Jamon', 99.00, 87.61, 11.39, 99.00, 36, '26-05-2020', '05:37:30', 42, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, '3913ace848', 1590493055),
(398, 1004, 2, '2 x 1 Suprema', 269.00, 476.11, 61.89, 538.00, 36, '26-05-2020', '05:37:31', 42, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, '60c30fa7eb', 1590493055),
(399, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 37, '26-05-2020', '05:37:40', 43, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, '801309f03a', 1590493064),
(400, 1006, 2, 'Combo Wings', 195.00, 345.13, 44.87, 390.00, 37, '26-05-2020', '05:37:41', 43, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, 'f092df145f', 1590493064),
(401, 1001, 1, 'Clasica Jamon', 99.00, 87.61, 11.39, 99.00, 38, '26-05-2020', '05:38:49', 44, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, '162cc196c2', 1590493133),
(402, 1005, 2, 'Orilla de queso', 155.00, 274.34, 35.66, 310.00, 38, '26-05-2020', '05:38:51', 44, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, 'ca7289c2b5', 1590493133),
(403, 1001, 3, 'Clasica Jamon', 99.00, 262.83, 34.17, 297.00, 39, '26-05-2020', '05:43:45', 45, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, '7f2957f534', 1590493432),
(404, 1007, 1, 'Super Suprema', 175.00, 154.87, 20.13, 175.00, 39, '26-05-2020', '05:43:50', 45, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, '9ea4d39763', 1590493432),
(405, 1004, 3, '2 x 1 Suprema', 269.00, 714.16, 92.84, 807.00, 40, '26-05-2020', '05:56:35', 46, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, '09063dd691', 1590494202),
(406, 1005, 2, 'Orilla de queso', 155.00, 274.34, 35.66, 310.00, 40, '26-05-2020', '05:56:40', 46, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, 'fd7687a8a5', 1590494202),
(407, 1001, 1, 'Clasica Jamon', 99.00, 87.61, 11.39, 99.00, 41, '26-05-2020', '05:58:25', 47, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, '0aba85b1aa', 1590494310),
(408, 1004, 2, '2 x 1 Suprema', 269.00, 476.11, 61.89, 538.00, 41, '26-05-2020', '05:58:26', 47, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, '5b1ec02cc5', 1590494310),
(409, 1005, 3, 'Orilla de queso', 155.00, 411.50, 53.50, 465.00, 41, '26-05-2020', '05:58:28', 47, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, '44d3888918', 1590494310),
(423, 1004, 2, '2 x 1 Suprema', 269.00, 476.11, 61.89, 538.00, 42, '26-05-2020', '06:15:30', 49, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, '8fbb5113a4', 1590495746),
(424, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 42, '26-05-2020', '06:15:31', 49, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, 'b96b904cb0', 1590495746),
(425, 1001, 1, 'Clasica Jamon', 99.00, 87.61, 11.39, 99.00, 42, '26-05-2020', '06:15:31', 49, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, 'ca328c8c3d', 1590495746),
(426, 1008, 1, 'Calzone Italiano', 85.00, 75.22, 9.78, 85.00, 43, '26-05-2020', '06:22:35', 50, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1590472800', 1, 0, 'fe2fb476d8', 1590495758),
(457, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 44, '04-06-2020', '12:21:18', 52, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1591250400', 1, 0, '84847d0256', 1591294925),
(458, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 44, '04-06-2020', '12:21:19', 52, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1591250400', 1, 0, 'ce70edc872', 1591294925),
(459, 1004, 1, '2 x 1 Suprema', 269.00, 238.05, 30.95, 269.00, 44, '04-06-2020', '12:21:20', 52, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1591250400', 1, 0, 'd7ca7fbc8f', 1591294925),
(467, 1004, 1, '2 x 1 Suprema', 269.00, 238.05, 30.95, 269.00, 45, '04-06-2020', '12:25:57', 53, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1591250400', 1, 0, '54bc12412f', 1591295181),
(468, 1005, 1, 'Orilla de queso', 155.00, 137.17, 17.83, 155.00, 45, '04-06-2020', '12:25:58', 53, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1591250400', 1, 0, '96e15177f6', 1591295181),
(469, 1006, 1, 'Combo Wings', 195.00, 172.57, 22.43, 195.00, 45, '04-06-2020', '12:25:59', 53, '1', '1', 'Erick Nunez', '1', 'Erick', 1, 0, '1591250400', 1, 0, 'b2d4beef63', 1591295181);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alter_materiaprima_reporte`
--
ALTER TABLE `alter_materiaprima_reporte`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `alter_opciones`
--
ALTER TABLE `alter_opciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `alter_producto_reporte`
--
ALTER TABLE `alter_producto_reporte`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes_mesa`
--
ALTER TABLE `clientes_mesa`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `config_master`
--
ALTER TABLE `config_master`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `config_root`
--
ALTER TABLE `config_root`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `control_cocina`
--
ALTER TABLE `control_cocina`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `control_panel_mostrar`
--
ALTER TABLE `control_panel_mostrar`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `corte_diario`
--
ALTER TABLE `corte_diario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `delivery_repartidor`
--
ALTER TABLE `delivery_repartidor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `entradas_efectivo`
--
ALTER TABLE `entradas_efectivo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `facturar_cai`
--
ALTER TABLE `facturar_cai`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `facturar_impresora`
--
ALTER TABLE `facturar_impresora`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `facturar_opciones`
--
ALTER TABLE `facturar_opciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `facturar_rtn`
--
ALTER TABLE `facturar_rtn`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `facturar_rtn_cliente`
--
ALTER TABLE `facturar_rtn_cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `facturar_ticket`
--
ALTER TABLE `facturar_ticket`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `facturar_users`
--
ALTER TABLE `facturar_users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `gastos`
--
ALTER TABLE `gastos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `gastos_images`
--
ALTER TABLE `gastos_images`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `login_db_sync`
--
ALTER TABLE `login_db_sync`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `login_db_user`
--
ALTER TABLE `login_db_user`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `login_imagenes`
--
ALTER TABLE `login_imagenes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `login_images_categoria`
--
ALTER TABLE `login_images_categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `login_inout`
--
ALTER TABLE `login_inout`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `login_members`
--
ALTER TABLE `login_members`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `login_sucursales`
--
ALTER TABLE `login_sucursales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `login_sync`
--
ALTER TABLE `login_sync`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `login_userdata`
--
ALTER TABLE `login_userdata`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mesa`
--
ALTER TABLE `mesa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fecha` (`fecha`),
  ADD KEY `fecha_2` (`fecha`);

--
-- Indices de la tabla `mesa_nombre`
--
ALTER TABLE `mesa_nombre`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `opciones`
--
ALTER TABLE `opciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `opciones_asig`
--
ALTER TABLE `opciones_asig`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `opciones_name`
--
ALTER TABLE `opciones_name`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `opciones_ticket`
--
ALTER TABLE `opciones_ticket`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `planilla_descuentos`
--
ALTER TABLE `planilla_descuentos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `planilla_descuentos_asig`
--
ALTER TABLE `planilla_descuentos_asig`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `planilla_empleados`
--
ALTER TABLE `planilla_empleados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `planilla_extras`
--
ALTER TABLE `planilla_extras`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `planilla_pagos`
--
ALTER TABLE `planilla_pagos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `precios`
--
ALTER TABLE `precios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos_venta_especial`
--
ALTER TABLE `productos_venta_especial`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pro_asignado`
--
ALTER TABLE `pro_asignado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pro_bruto`
--
ALTER TABLE `pro_bruto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pro_dependiente`
--
ALTER TABLE `pro_dependiente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pro_historial_addpro`
--
ALTER TABLE `pro_historial_addpro`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pro_historial_averias`
--
ALTER TABLE `pro_historial_averias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pro_registro_averia`
--
ALTER TABLE `pro_registro_averia`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pro_registro_up`
--
ALTER TABLE `pro_registro_up`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pro_unidades_medida`
--
ALTER TABLE `pro_unidades_medida`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sync_tabla`
--
ALTER TABLE `sync_tabla`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sync_tables_updates`
--
ALTER TABLE `sync_tables_updates`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sync_up`
--
ALTER TABLE `sync_up`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sync_up_cloud`
--
ALTER TABLE `sync_up_cloud`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `system_img_check`
--
ALTER TABLE `system_img_check`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fecha` (`fecha`),
  ADD KEY `fecha_2` (`fecha`);

--
-- Indices de la tabla `ticket_num`
--
ALTER TABLE `ticket_num`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fecha` (`fecha`);

--
-- Indices de la tabla `ticket_propina`
--
ALTER TABLE `ticket_propina`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ticket_temp`
--
ALTER TABLE `ticket_temp`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alter_materiaprima_reporte`
--
ALTER TABLE `alter_materiaprima_reporte`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `alter_opciones`
--
ALTER TABLE `alter_opciones`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `alter_producto_reporte`
--
ALTER TABLE `alter_producto_reporte`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT de la tabla `clientes_mesa`
--
ALTER TABLE `clientes_mesa`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT de la tabla `config_master`
--
ALTER TABLE `config_master`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `config_root`
--
ALTER TABLE `config_root`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `control_cocina`
--
ALTER TABLE `control_cocina`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;
--
-- AUTO_INCREMENT de la tabla `control_panel_mostrar`
--
ALTER TABLE `control_panel_mostrar`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `corte_diario`
--
ALTER TABLE `corte_diario`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `delivery_repartidor`
--
ALTER TABLE `delivery_repartidor`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `entradas_efectivo`
--
ALTER TABLE `entradas_efectivo`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `facturar_cai`
--
ALTER TABLE `facturar_cai`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `facturar_impresora`
--
ALTER TABLE `facturar_impresora`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `facturar_opciones`
--
ALTER TABLE `facturar_opciones`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `facturar_rtn`
--
ALTER TABLE `facturar_rtn`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `facturar_rtn_cliente`
--
ALTER TABLE `facturar_rtn_cliente`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `facturar_ticket`
--
ALTER TABLE `facturar_ticket`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `facturar_users`
--
ALTER TABLE `facturar_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `gastos`
--
ALTER TABLE `gastos`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `gastos_images`
--
ALTER TABLE `gastos_images`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `login_db_sync`
--
ALTER TABLE `login_db_sync`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `login_db_user`
--
ALTER TABLE `login_db_user`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `login_imagenes`
--
ALTER TABLE `login_imagenes`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=311;
--
-- AUTO_INCREMENT de la tabla `login_images_categoria`
--
ALTER TABLE `login_images_categoria`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `login_inout`
--
ALTER TABLE `login_inout`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `login_members`
--
ALTER TABLE `login_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `login_sucursales`
--
ALTER TABLE `login_sucursales`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `login_sync`
--
ALTER TABLE `login_sync`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `login_userdata`
--
ALTER TABLE `login_userdata`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `mesa`
--
ALTER TABLE `mesa`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=549;
--
-- AUTO_INCREMENT de la tabla `mesa_nombre`
--
ALTER TABLE `mesa_nombre`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `opciones`
--
ALTER TABLE `opciones`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `opciones_asig`
--
ALTER TABLE `opciones_asig`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `opciones_name`
--
ALTER TABLE `opciones_name`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `opciones_ticket`
--
ALTER TABLE `opciones_ticket`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `planilla_descuentos`
--
ALTER TABLE `planilla_descuentos`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `planilla_descuentos_asig`
--
ALTER TABLE `planilla_descuentos_asig`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `planilla_empleados`
--
ALTER TABLE `planilla_empleados`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `planilla_extras`
--
ALTER TABLE `planilla_extras`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `planilla_pagos`
--
ALTER TABLE `planilla_pagos`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `productos_venta_especial`
--
ALTER TABLE `productos_venta_especial`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `pro_asignado`
--
ALTER TABLE `pro_asignado`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `pro_bruto`
--
ALTER TABLE `pro_bruto`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `pro_dependiente`
--
ALTER TABLE `pro_dependiente`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `pro_historial_addpro`
--
ALTER TABLE `pro_historial_addpro`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pro_historial_averias`
--
ALTER TABLE `pro_historial_averias`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `pro_registro_averia`
--
ALTER TABLE `pro_registro_averia`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pro_registro_up`
--
ALTER TABLE `pro_registro_up`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `pro_unidades_medida`
--
ALTER TABLE `pro_unidades_medida`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `sync_tabla`
--
ALTER TABLE `sync_tabla`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT de la tabla `sync_tables_updates`
--
ALTER TABLE `sync_tables_updates`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=504;
--
-- AUTO_INCREMENT de la tabla `sync_up`
--
ALTER TABLE `sync_up`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `sync_up_cloud`
--
ALTER TABLE `sync_up_cloud`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `system_img_check`
--
ALTER TABLE `system_img_check`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=657;
--
-- AUTO_INCREMENT de la tabla `ticket_num`
--
ALTER TABLE `ticket_num`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;
--
-- AUTO_INCREMENT de la tabla `ticket_propina`
--
ALTER TABLE `ticket_propina`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `ticket_temp`
--
ALTER TABLE `ticket_temp`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=475;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
