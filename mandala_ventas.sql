-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 08-08-2020 a las 14:48:29
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
(1, '21741', '', 0, 11, '180f6086b4', 1596918297);

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
(1, 9901, 'Bebidas', 0, 11, 'b386938b93', 1596912782),
(2, 9902, 'Aperitivos', 0, 11, 'f91636f9fc', 1596912800),
(3, 9903, 'Platos Fuertes', 0, 11, 'f7b567eb1c', 1596912823),
(4, 9904, 'Mexicana', 0, 11, 'c8400e313b', 1596912846),
(5, 9905, 'Pizzas', 0, 11, '5177a7fb67', 1596918705);

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
(1, 'Sistema de control RESTAURANTE MANDALA', 'RESTAURANTE MANDALA', 'Sabor y tradición', '', '', 'Restaurante', '', 13.00, 0.00, 'Metapán', '', '1596908241.jpg', 'pizto.png', 'grey-skin', 1, '1', 'Dolares', '$', 'IVA', 'NIT', 0, 1, 1, '', '', 11, '2c3888c36a', 1596908244);

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
(1, 'Y0p4TUNreDJ3ZnFUa24xMXNPN00rdz09', 'eE9CVURDVG1FbWlPQ3dmaHNpODlnZz09', 'SjJJUFJCM0lPczBaZVU4K3IrTnVEZz09', 'SjJJUFJCM0lPczBaZVU4K3IrTnVEZz09', 'SjJJUFJCM0lPczBaZVU4K3IrTnVEZz09', 'SjJJUFJCM0lPczBaZVU4K3IrTnVEZz09', 'SjJJUFJCM0lPczBaZVU4K3IrTnVEZz09', 'ZWE2ekVqU0tZRHkrUDFHdTNLc29Ydz09', 'WWpKeUpVeVoxT1pBZXZhazFrOGM4Zz09', 'aGliNzZ6ellwd1Z4UXc1WTVaUUV1Zz09', 11, '105de55678', 1596838797);

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
(1, 'assets/img/ico/21.png', 1, 0, 9901, 1, 11, '9434cc5f1a', 1596912782),
(2, 'assets/img/ico/3435.png', 2, 0, 9902, 1, 11, 'c78f3844e3', 1596912800),
(3, 'assets/img/ico/camaronesflamenco.png', 3, 0, 9903, 1, 11, 'a4aeeb768e', 1596912823),
(4, 'assets/img/ico/torta.png', 4, 0, 9904, 1, 11, 'a122a9d7a3', 1596912846),
(5, 'assets/img/ico/pizzagigante.png', 5, 0, 9905, 1, 11, '51a8cf1885', 1596918705),
(6, 'assets/img/ico/fresa.png', 6, 1, 101, 1, 11, '91dd20f89a', 1596912974),
(7, 'assets/img/ico/pina.png', 7, 1, 102, 1, 11, 'ca545a4853', 1596912998),
(8, 'assets/img/ico/melon.png', 8, 1, 103, 1, 11, 'e71840846d', 1596913337),
(9, 'assets/img/ico/sandia.png', 9, 1, 104, 1, 11, '5e81bc4aac', 1596913356),
(10, 'assets/img/ico/papaya.png', 10, 1, 105, 1, 11, 'ebf19108e4', 1596913369),
(11, 'assets/img/ico/panconajo.png', 11, 2, 106, 1, 11, 'bec9f69c72', 1596913597),
(12, 'assets/img/ico/71.png', 12, 2, 107, 1, 11, 'd1d26a1931', 1596913630),
(13, 'assets/img/ico/carne.png', 13, 3, 108, 1, 11, 'eb0e1c9c0d', 1596913778),
(14, 'assets/img/ico/parrillada.png', 14, 3, 109, 1, 11, 'c53c9a62d5', 1596913807),
(15, 'assets/img/ico/salami.png', 15, 4, 110, 1, 11, 'f2430021ba', 1596914266),
(16, 'assets/img/ico/pepperoni.png', 16, 4, 111, 1, 11, 'b09541256e', 1596914283),
(17, 'assets/img/ico/jamon.png', 17, 4, 112, 1, 11, '8a85cbf5fe', 1596914306),
(18, 'assets/img/ico/carne2.png', 18, 4, 113, 1, 11, '1e344acaad', 1596914345),
(19, 'assets/img/ico/chorizo.png', 19, 4, 114, 1, 11, '1b49d9c161', 1596914376),
(20, 'assets/img/ico/vegetales.png', 20, 4, 115, 1, 11, 'f367c29f9f', 1596914398),
(21, 'assets/img/ico/pina.png', 21, 4, 116, 1, 11, 'f8dbf04b15', 1596914549),
(22, 'assets/img/ico/carne2.png', 22, 5, 117, 1, 11, 'b9b2024668', 1596914729),
(23, 'assets/img/ico/5777.png', 23, 5, 118, 1, 11, '513c48a8ff', 1596914745),
(24, 'assets/img/ico/pilsener.png', 24, 9901, 1001, 1, 11, '510ad7aba3', 1596914828),
(25, 'assets/img/ico/golden.png', 25, 9901, 1002, 1, 11, 'b3e5a31dcd', 1596914851),
(26, 'assets/img/ico/suprema.png', 26, 9901, 1003, 1, 11, 'd830dd9acd', 1596914890),
(27, 'assets/img/ico/michelada.png', 27, 9901, 1004, 1, 11, 'ed36bdbe2d', 1596914927),
(28, 'assets/img/ico/michelada.png', 28, 9901, 1005, 1, 11, '4400ac3931', 1596914955),
(29, 'assets/img/ico/limonadaconsoda.png', 29, 9901, 1006, 1, 11, '926e6e3e0f', 1596915000),
(30, 'assets/img/ico/licuado.png', 30, 9901, 1007, 1, 11, 'ce864c3a6e', 1596915035),
(31, 'assets/img/ico/21.png', 31, 9901, 1008, 1, 11, '9e7798794d', 1596915062),
(32, 'assets/img/ico/39.png', 32, 9901, 1009, 1, 11, '34aaf811c1', 1596915088),
(33, 'assets/img/ico/mineral.png', 33, 9901, 1010, 1, 11, '3876ff0d61', 1596919032),
(34, 'assets/img/ico/limonada.png', 34, 9901, 1011, 1, 11, '6cd6708edd', 1596915170),
(35, 'assets/img/ico/mojito.png', 35, 9901, 1012, 1, 11, 'b4ae46b1a3', 1596919114),
(36, 'assets/img/ico/tehelado.png', 36, 9901, 1013, 1, 11, 'becc386ea5', 1596915233),
(37, 'assets/img/ico/tecaliente.png', 37, 9901, 1014, 1, 11, '1fc49d7fe7', 1596915358),
(38, 'assets/img/ico/cafe.png', 38, 9901, 1015, 1, 11, '804fda64b9', 1596919317),
(39, 'assets/img/ico/cafeconleche2.png', 39, 9901, 1016, 1, 11, '0668889bd7', 1596918737),
(40, 'assets/img/ico/chocolate.png', 40, 9901, 1017, 1, 11, '48de1e85a6', 1596919225),
(41, 'assets/img/ico/buffalo.png', 41, 6, 119, 1, 11, '1aa375e668', 1596915952),
(42, 'assets/img/ico/bbq.png', 42, 6, 120, 1, 11, 'a1da24ce9a', 1596915967),
(43, 'assets/img/ico/alitas.png', 43, 9902, 1018, 1, 11, 'c34ac13ed5', 1596916039),
(44, 'assets/img/ico/deditosdepollo.png', 44, 9902, 1019, 1, 11, 'b900c31009', 1596916067),
(45, 'assets/img/ico/costillaimportada.png', 45, 9902, 1020, 1, 11, 'fd29aed68b', 1596916109),
(46, 'assets/img/ico/camaronesflamenco.png', 46, 9902, 1021, 1, 11, 'e97bf06470', 1596916138),
(47, 'assets/img/ico/sopes.png', 47, 9902, 1022, 1, 11, 'e049709b1a', 1596918870),
(48, 'assets/img/ico/panconajo.png', 48, 9902, 1023, 1, 11, 'e45661fcfb', 1596916218),
(49, 'assets/img/ico/nachos.png', 49, 9902, 1024, 1, 11, 'c6f3718305', 1596916251),
(50, 'assets/img/ico/papasfrancesas.png', 50, 9902, 1025, 1, 11, '3eafde9350', 1596916273),
(51, 'assets/img/ico/quesadilla.png', 51, 9904, 1026, 1, 11, '8c3e3d4ea2', 1596916378),
(52, 'assets/img/ico/quesadilla.png', 52, 9904, 1027, 1, 11, '7a972e35ff', 1596916410),
(53, 'assets/img/ico/burrito.png', 53, 9904, 1028, 1, 11, '4e94089d0e', 1596916590),
(54, 'assets/img/ico/burrito.png', 54, 9904, 1029, 1, 11, '4333b9755d', 1596916630),
(55, 'assets/img/ico/torta 2.png', 55, 9904, 1030, 1, 11, 'c4f799c2a3', 1596916666),
(56, 'assets/img/ico/torta.png', 56, 9904, 1031, 1, 11, 'a82b982cde', 1596916692),
(57, 'assets/img/ico/8799.png', 57, 9904, 1032, 1, 11, '84992a1016', 1596916737),
(58, 'assets/img/ico/tacos.png', 58, 9904, 1033, 1, 11, 'aef791d8de', 1596916756),
(59, 'assets/img/ico/pizzapersonal.png', 59, 9905, 1034, 1, 11, '517c50a48b', 1596917108),
(60, 'assets/img/ico/pizzapersonal.png', 60, 9904, 1035, 1, 11, 'cb9ed529b6', 1596917143),
(61, 'assets/img/ico/pizzagrande.png', 61, 9905, 1036, 1, 11, '13618df2d0', 1596917177),
(62, 'assets/img/ico/pizzagrande.png', 62, 9905, 1037, 1, 11, '41aca6834a', 1596917203),
(63, 'assets/img/ico/pizzapersonal.png', 63, 9905, 1038, 1, 11, 'd4c09840bd', 1596917237),
(64, 'assets/img/ico/pizzagigante.png', 64, 9905, 1039, 1, 11, 'c962d989f0', 1596917281),
(65, 'assets/img/ico/pizzagigante.png', 65, 9905, 1040, 1, 11, 'db87761e2f', 1596917306),
(66, 'assets/img/ico/churrascocopa.png', 66, 9903, 1041, 1, 11, '586c30871c', 1596917480),
(67, 'assets/img/ico/churrascoalaplancha.png', 67, 9903, 1042, 1, 11, '427b271408', 1596917503),
(68, 'assets/img/ico/marytierra.png', 68, 9903, 1043, 1, 11, '96a02bb314', 1596917601),
(69, 'assets/img/ico/costillaitaliana.png', 69, 9903, 1044, 1, 11, '6f6d1f2977', 1596917646),
(70, 'assets/img/ico/pechuga.png', 70, 9903, 1045, 1, 11, '2778471d68', 1596917698),
(71, 'assets/img/ico/pechugaalaplancha.png', 71, 9903, 1046, 1, 11, 'dffad1dcb2', 1596917734),
(72, 'assets/img/ico/pechugas.png', 72, 9903, 1047, 1, 11, 'beebfe9b4c', 1596917783),
(73, 'assets/img/ico/polloalaparmesana.png', 73, 9903, 1048, 1, 11, 'de271dc1d5', 1596917814),
(74, 'assets/img/ico/3554.png', 74, 9903, 1049, 1, 11, 'a4c8260933', 1596917921),
(75, 'assets/img/ico/deditosdepollo.png', 75, 9903, 1050, 1, 11, '684ad4517f', 1596917999),
(76, 'assets/img/ico/milanesa.png', 76, 9903, 1051, 1, 11, '06b7cfbfae', 1596918173),
(77, 'assets/img/ico/camaronesmojo.png', 77, 9903, 1052, 1, 11, 'e10fc6e91d', 1596918208),
(78, 'assets/img/ico/camaronesalaplancla.png', 78, 9903, 1053, 1, 11, '09ae2ef899', 1596918238),
(79, 'assets/img/ico/camaronesflamenco.png', 79, 9903, 1054, 1, 11, '76ef53d0a0', 1596918260),
(80, 'assets/img/ico/cres.png', 80, 3, 121, 1, 11, '912a55606e', 1596918595),
(81, 'assets/img/ico/cmixta.png', 81, 3, 122, 1, 11, 'cc998cbf1b', 1596918628);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login_attempts`
--

CREATE TABLE `login_attempts` (
  `user_id` int(11) NOT NULL,
  `time` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(28, '344.png', 3),
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
(62, '7979.png', 3),
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
(87, 'cafeconcremora.png', 0),
(88, 'cafeconleche.png', 0),
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
(310, 'powerade.png', 3),
(311, 'melon.png', 0),
(312, 'sandia.png', 0),
(313, 'papaya.png', 0),
(314, 'salami.png', 0),
(315, 'pepperoni.png', 0),
(316, 'carne2.png', 0),
(317, 'tecaliente.png', 0),
(318, 'cafeconleche2.png', 0),
(319, 'buffalo.png', 0),
(320, 'bbq.png', 0),
(321, 'burrito.png', 0),
(322, 'pizzapersonal.png', 0),
(323, 'pizzagrande.png', 0),
(324, 'pizzagigante.png', 0),
(325, 'milanesa.png', 0),
(326, 'cres.png', 0),
(327, 'cmixta.png', 0),
(328, 'sopes.png', 0),
(329, 'mineral.png', 0),
(330, 'chocolate.png', 0),
(331, 'cafe.png', 0);

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
(2, '52ce5b', 'admin@pizto.com', '98f0639d567c832700db09874cdd3880fb27f7b4ddadd060b121f5787a3623c61c3661995c20c776d057699a0dd958d24a093f912d35f38417c0ad5703d5bf88', 'c2114b413899e2b1227171de6194d45083ecf9b7b16553b4fecf96df6212901975c814fa564ec8510de0a39112591404415457e786f5fe39b334ab5ae992cbf3'),
(3, '11c30e', 'gerencia@pizto.com', '678e74fc1e5f760576a42713c7ce6b853a092c908f536808028d87c575162123df9356001757f79e1cdca9eeafc35265dbf40c611a7d92ee2f5aa59e5326601b', 'e09c8f5ddc50a039ccb91169762566bee2b2deea0c7e40beb7ae9ba5020030259a245186ccb79477b43ee8bcae76808f979e1e4d55194e706edb5d6100dcf7c5'),
(4, '33b54a', 'cajero@pizto.com', '15acf4c76a1638583a701684f09185b3f96e6003b27e21239f70924938f68a31d015b53c845c4c167a86000a28b03bcd842576856cf2a966e6d07b4515f101da', '6eded49228822b65c979998ed987b098b7bc20e8b8b00766ed3a3c560e05a2545cf5a25a9e5f9245cb134c92762a10e9ede2cda5bf6b53177bcfd4702c3e3515'),
(5, 'd8f9eb', 'admini@pizto.com', '15a82dba4811f3d5882527836934639a4598dbf9bbd800f5f5bcc5e0a708f1122b5157f4856ccbb7bdbd38018d9677522fc532412f0bc427d95536fb83f60f6a', '451ff6a74ba4f91d0747c9f0bb70492ee8ad4a161dfb4147a52113c6e261be6f71c2bde2907fb30299a7882acd1fa85daaa5f86d025941a2d8d2ec7bdac7fe3b');

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
(1, 'Erick Nunez', 1, 'Erick', '1', '11.png', 11),
(2, 'Administrador del Sistema', 2, '52ce5b', '1', '11.png', 11),
(3, 'Gerencia', 5, '11c30e', '1', '9.png', 11),
(4, 'Cajero', 3, '33b54a', '1', '11.png', 11),
(5, 'Administracion', 2, 'd8f9eb', '1', '10.png', 11);

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

--
-- Volcado de datos para la tabla `opciones`
--

INSERT INTO `opciones` (`id`, `nombre`, `cod`, `edo`, `td`, `hash`, `time`) VALUES
(1, 'Frutas Licuado', 1, 0, 11, '65d161cf83', 1596912936),
(2, 'Pan con Ajo o Tortilla', 2, 0, 11, '3811bf8d9d', 1596913572),
(4, 'Res o Mixto', 3, 0, 11, '1fe77cd09e', 1596913670),
(5, 'Ingrediente Pizza', 4, 0, 11, 'ce4272ece3', 1596914249),
(6, 'Res o Pollo', 5, 0, 11, 'd2b3657de8', 1596914698),
(7, 'Bufalo o Barbacoa', 6, 0, 11, '00f9e92e21', 1596915764);

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

--
-- Volcado de datos para la tabla `opciones_asig`
--

INSERT INTO `opciones_asig` (`id`, `producto`, `opcion`, `edo`, `td`, `hash`, `time`) VALUES
(1, 1006, 1, 0, 11, '38390efebd', 1596915000),
(2, 1007, 1, 0, 11, '513b0ad9d9', 1596915036),
(3, 1018, 6, 0, 11, 'c2634d35e3', 1596916001),
(4, 1026, 3, 0, 11, 'c4de1a0993', 1596916378),
(5, 1029, 3, 0, 11, '3e10db1368', 1596916630),
(6, 1031, 3, 0, 11, '2623b79f47', 1596916692),
(7, 1033, 3, 0, 11, '4ba5ae1614', 1596916756),
(8, 1034, 4, 0, 11, '89c67b0b80', 1596917108),
(9, 1035, 4, 0, 11, 'c38b9e023a', 1596917143),
(10, 1036, 4, 0, 11, '4aeadbd05a', 1596917177),
(11, 1037, 4, 0, 11, '7302e03c79', 1596917203),
(12, 1038, 4, 0, 11, 'a4344fdaa4', 1596917237),
(13, 1039, 4, 0, 11, '1c9ddb0f07', 1596917281),
(14, 1040, 4, 0, 11, 'fa5cf34d58', 1596917306),
(15, 1041, 2, 0, 11, '69e0f19677', 1596917480),
(16, 1042, 2, 0, 11, 'a26be584b3', 1596917504),
(17, 1043, 6, 0, 11, 'a0c4bfadbb', 1596917601),
(18, 1044, 6, 0, 11, '5a09723aa1', 1596917646),
(19, 1045, 2, 0, 11, 'ae75c3f054', 1596917698),
(20, 1046, 2, 0, 11, 'be21a4b9ce', 1596917734),
(21, 1047, 2, 0, 11, 'e27d7f27b3', 1596917783),
(22, 1048, 2, 0, 11, 'c236a70c9e', 1596917814),
(23, 1049, 2, 0, 11, '2d8cfb59ad', 1596917921),
(24, 1051, 2, 0, 11, 'b47d1a5f83', 1596918058),
(25, 1052, 2, 0, 11, '89066f1056', 1596918208),
(26, 1053, 2, 0, 11, 'ae4e39c2c0', 1596918238),
(27, 1054, 2, 0, 11, 'dc859ebf35', 1596918260);

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

--
-- Volcado de datos para la tabla `opciones_name`
--

INSERT INTO `opciones_name` (`id`, `nombre`, `cod`, `opcion`, `edo`, `td`, `hash`, `time`) VALUES
(1, 'Fresa', 101, 1, 0, 11, '8a808da485', 1596912973),
(2, 'Piña', 102, 1, 0, 11, '90d099c296', 1596912998),
(3, 'melon', 103, 1, 0, 11, '6ac849e7e6', 1596913336),
(4, 'Sandia', 104, 1, 0, 11, '8c76cf6707', 1596913356),
(5, 'Papaya', 105, 1, 0, 11, '6f8fcd0a01', 1596913369),
(6, 'Pan con Ajo', 106, 2, 0, 11, 'f7402eee22', 1596913597),
(7, 'Tortilla', 107, 2, 0, 11, '8de1a1ad4f', 1596913630),
(10, 'Salami', 110, 4, 0, 11, 'd2f532a846', 1596914266),
(11, 'Pepperoni', 111, 4, 0, 11, 'db9ede99c6', 1596914282),
(12, 'Jamón', 112, 4, 0, 11, '50c6653998', 1596914306),
(13, 'Carne', 113, 4, 0, 11, 'b2117dcb76', 1596914345),
(14, 'Chorizo', 114, 4, 0, 11, 'fb1bfd3682', 1596914376),
(15, 'Vegetales', 115, 4, 0, 11, 'ce52f632b8', 1596914398),
(16, 'Hawaiana', 116, 4, 0, 11, '90346971af', 1596914549),
(17, 'Res', 117, 5, 0, 11, 'c190308b85', 1596914729),
(18, 'Pollo', 118, 5, 0, 11, '0215ee5cfb', 1596914745),
(19, 'Buffalo', 119, 6, 0, 11, 'e6197f798e', 1596915952),
(20, 'Barbacoa', 120, 6, 0, 11, '23af513344', 1596915967),
(21, 'Res', 121, 3, 0, 11, '70205870ca', 1596918595),
(22, 'Mixto', 122, 3, 0, 11, '53ab86c07c', 1596918628);

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
(1, 1001, 'Verveza Pilsener', 9901, 1.25, 11, '6b689d7b03', 1596914828),
(2, 1002, 'Cerveza Golden', 9901, 1.25, 11, 'fc1a4402de', 1596914851),
(3, 1003, 'Cerveza Suprema', 9901, 1.50, 11, 'd82e7f6284', 1596914890),
(4, 1004, 'Michelada Local', 9901, 2.00, 11, 'a23b117491', 1596914927),
(5, 1005, 'Michelada Extranjera', 9901, 2.75, 11, 'd9ddf0f976', 1596914955),
(6, 1006, 'Licuado Natural', 9901, 1.75, 11, 'f01b29d97a', 1596915000),
(7, 1007, 'Licado con Leche', 9901, 1.75, 11, 'c1f6377f09', 1596915035),
(8, 1008, 'Soda', 9901, 0.75, 11, '29ee01b986', 1596915062),
(9, 1009, 'Botella de agua', 9901, 0.75, 11, 'f39c1c9c3c', 1596915088),
(10, 1010, 'Mineral Preparada', 9901, 1.50, 11, 'a92b3cb248', 1596919032),
(11, 1011, 'Limonada Natural', 9901, 1.00, 11, '3b40eb3236', 1596915170),
(12, 1012, 'Limonada con soda', 9901, 1.50, 11, '251ec3180b', 1596919114),
(13, 1013, 'Te Helado', 9901, 1.00, 11, '6a56fa6c2e', 1596915233),
(14, 1014, 'Te Caliente', 9901, 0.75, 11, '2e759e8afa', 1596915358),
(15, 1015, 'café', 9901, 0.50, 11, 'c73352d941', 1596919317),
(16, 1016, 'Cafe con leche', 9901, 1.00, 11, '2c5f5b3098', 1596918737),
(17, 1017, 'Chocolate', 9901, 0.75, 11, '59add7b440', 1596919225),
(18, 1018, 'Alitas en Salsa', 9902, 4.50, 11, '0d8b41b21c', 1596916039),
(19, 1019, 'Fajitas de pollo', 9902, 3.50, 11, '52ae39ff1c', 1596916067),
(20, 1020, 'Costilla de Cerdo', 9902, 3.75, 11, '83506eed88', 1596916109),
(21, 1021, 'Plato de Bocas', 9902, 10.00, 11, '25630e35c0', 1596916138),
(22, 1022, 'Sopes de Res', 9902, 2.50, 11, 'd6490127c7', 1596918870),
(23, 1023, 'Pan con ajo', 9902, 1.50, 11, 'fdec5335ef', 1596916218),
(24, 1024, 'Nachos con Chily', 9902, 3.50, 11, 'd5115d8fd0', 1596916251),
(25, 1025, 'Papas Fritas', 9902, 1.50, 11, '945827a627', 1596916273),
(26, 1026, 'Quesadilla', 9904, 3.50, 11, 'd9d1bc4643', 1596916378),
(27, 1027, 'Quesadilla de Pollo', 9904, 3.25, 11, '67b6d320f1', 1596916410),
(28, 1028, 'Burrito de pollo', 9904, 3.25, 11, 'da036741c0', 1596916604),
(29, 1029, 'Burrito', 9904, 3.50, 11, '3b8cc69678', 1596916630),
(30, 1030, 'Torta de Pollo', 9904, 3.25, 11, '285e863ea3', 1596916666),
(31, 1031, 'Torta', 9904, 3.50, 11, 'f2e64ab31d', 1596916692),
(32, 1032, 'Tacos de Pollo', 9904, 3.25, 11, '7a59926b21', 1596916737),
(33, 1033, 'Tacos', 9904, 3.50, 11, '8846a16d08', 1596916755),
(34, 1034, 'Personal Un Igrediente', 9905, 2.50, 11, 'b73c7c3229', 1596917108),
(35, 1035, 'Personal Suprema', 9904, 3.50, 11, '12b578efb3', 1596917143),
(36, 1036, 'Grande un Ingrediente', 9905, 5.00, 11, 'a27a812f9e', 1596917177),
(37, 1037, 'Grande Suprema', 9905, 7.00, 11, 'cd6772dcf8', 1596917203),
(38, 1038, 'Personal Suprema', 9905, 3.50, 11, '664fbd111f', 1596917237),
(39, 1039, 'Gigante un Ingrediente', 9905, 1.50, 11, 'f98cbeab95', 1596917281),
(40, 1040, 'Gigante Suprema', 9905, 12.50, 11, '808b6086e6', 1596917305),
(41, 1041, 'Churrasquito', 9903, 5.50, 11, '92c21a6bbc', 1596917480),
(42, 1042, 'Carne a la Plancha', 9903, 4.50, 11, 'ea3cdea5c2', 1596917503),
(43, 1043, 'Mar y Tierra', 9903, 10.00, 11, 'd039b167c4', 1596917601),
(44, 1044, 'Chuleta Ahumada', 9903, 4.50, 11, '399d8d5293', 1596917646),
(45, 1045, 'Pechuga a la Plancha', 9903, 4.25, 11, '2937d0b19b', 1596917698),
(46, 1046, 'Pechuga al Ajillo', 9903, 4.25, 11, '51edb0eac8', 1596917734),
(47, 1047, 'Pechuga en Hongos', 9903, 4.25, 11, '31d91eead9', 1596917783),
(48, 1048, 'Pechuga en Queso', 9903, 4.25, 11, '79553d089f', 1596917814),
(49, 1049, 'Pollo Cordon Blue', 9903, 5.75, 11, '2a6136e393', 1596917921),
(50, 1050, 'Tacos Dorados', 9903, 3.00, 11, '228f0f805c', 1596917999),
(51, 1051, 'Milanesa de pollo', 9903, 4.00, 11, 'bdecc64e83', 1596918173),
(52, 1052, 'Camarones a la plancha', 9903, 6.50, 11, '6b2911d65a', 1596918208),
(53, 1053, 'Camarones a la diabla', 9903, 6.50, 11, '53c17babfa', 1596918238),
(54, 1054, 'Camarones al ajillo', 9903, 6.50, 11, 'b5dbee7dff', 1596918260);

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
(1, 1001, 'Verveza Pilsener', '9901', 0, 1, '08-08-2020', 11, '84cdfc065f', 1596914828),
(2, 1002, 'Cerveza Golden', '9901', 0, 1, '08-08-2020', 11, '421ce77f4e', 1596914851),
(3, 1003, 'Cerveza Suprema', '9901', 0, 1, '08-08-2020', 11, 'f2b77aa179', 1596914890),
(4, 1004, 'Michelada Local', '9901', 0, 1, '08-08-2020', 11, 'a4951b3223', 1596914927),
(5, 1005, 'Michelada Extranjera', '9901', 0, 1, '08-08-2020', 11, '3ca4c733ab', 1596914955),
(6, 1006, 'Licuado Natural', '9901', 0, 1, '08-08-2020', 11, 'fb7c543186', 1596915000),
(7, 1007, 'Licado con Leche', '9901', 0, 1, '08-08-2020', 11, 'bb569e30c6', 1596915035),
(8, 1008, 'Soda', '9901', 0, 1, '08-08-2020', 11, 'ccfc55ad67', 1596915062),
(9, 1009, 'Botella de agua', '9901', 0, 1, '08-08-2020', 11, 'bc2974d798', 1596915088),
(10, 1010, 'Mineral Preparada', '9901', 0, 1, '08-08-2020', 11, '902b179446', 1596919032),
(11, 1011, 'Limonada Natural', '9901', 0, 1, '08-08-2020', 11, '63128959e8', 1596915170),
(12, 1012, 'Limonada con soda', '9901', 0, 1, '08-08-2020', 11, '075624f3e1', 1596919114),
(13, 1013, 'Te Helado', '9901', 0, 1, '08-08-2020', 11, 'befdbf2175', 1596915233),
(14, 1014, 'Te Caliente', '9901', 0, 1, '08-08-2020', 11, '21af611584', 1596915358),
(15, 1015, 'café', '9901', 0, 1, '08-08-2020', 11, 'd1cf21b61a', 1596919317),
(16, 1016, 'Cafe con leche', '9901', 0, 1, '08-08-2020', 11, 'c436b45ef9', 1596918736),
(17, 1017, 'Chocolate', '9901', 0, 1, '08-08-2020', 11, '01b8c0a164', 1596919225),
(18, 1018, 'Alitas en Salsa', '9902', 0, 1, '08-08-2020', 11, 'be3542020d', 1596916039),
(19, 1019, 'Fajitas de pollo', '9902', 0, 1, '08-08-2020', 11, 'c27dc6dfad', 1596916067),
(20, 1020, 'Costilla de Cerdo', '9902', 0, 1, '08-08-2020', 11, '363fa0c68b', 1596916109),
(21, 1021, 'Plato de Bocas', '9902', 0, 1, '08-08-2020', 11, 'e463756f33', 1596916138),
(22, 1022, 'Sopes de Res', '9902', 0, 1, '08-08-2020', 11, '8e61a7b8be', 1596918870),
(23, 1023, 'Pan con ajo', '9902', 0, 1, '08-08-2020', 11, 'dc08a20c2d', 1596916218),
(24, 1024, 'Nachos con Chily', '9902', 0, 1, '08-08-2020', 11, 'ceec8d8779', 1596916251),
(25, 1025, 'Papas Fritas', '9902', 0, 1, '08-08-2020', 11, '5e247f56e1', 1596916273),
(26, 1026, 'Quesadilla', '9904', 0, 1, '08-08-2020', 11, '0ae9fb87a1', 1596916378),
(27, 1027, 'Quesadilla de Pollo', '9904', 0, 1, '08-08-2020', 11, 'b79af93494', 1596916410),
(28, 1028, 'Burrito de pollo', '9904', 0, 1, '08-08-2020', 11, 'a27109caa3', 1596916590),
(29, 1029, 'Burrito', '9904', 0, 1, '08-08-2020', 11, 'e182496b30', 1596916630),
(30, 1030, 'Torta de Pollo', '9904', 0, 1, '08-08-2020', 11, '4895c9ff2c', 1596916666),
(31, 1031, 'Torta', '9904', 0, 1, '08-08-2020', 11, 'cc1b2eb7e5', 1596916692),
(32, 1032, 'Tacos de Pollo', '9904', 0, 1, '08-08-2020', 11, '00fc4c1e3e', 1596916737),
(33, 1033, 'Tacos', '9904', 0, 1, '08-08-2020', 11, '4c283a3187', 1596916755),
(34, 1034, 'Personal Un Igrediente', '9905', 0, 1, '08-08-2020', 11, 'eab6c3a19b', 1596917108),
(35, 1035, 'Personal Suprema', '9904', 0, 1, '08-08-2020', 11, '7e63a2249f', 1596917143),
(36, 1036, 'Grande un Ingrediente', '9905', 0, 1, '08-08-2020', 11, '2d04819003', 1596917177),
(37, 1037, 'Grande Suprema', '9905', 0, 1, '08-08-2020', 11, '3fa76e6511', 1596917203),
(38, 1038, 'Personal Suprema', '9905', 0, 1, '08-08-2020', 11, 'f0d67fb188', 1596917237),
(39, 1039, 'Gigante un Ingrediente', '9905', 0, 1, '08-08-2020', 11, '30c99cbe6a', 1596917281),
(40, 1040, 'Gigante Suprema', '9905', 0, 1, '08-08-2020', 11, 'a9aa5ef7c9', 1596917305),
(41, 1041, 'Churrasquito', '9903', 0, 1, '08-08-2020', 11, '00bf935fef', 1596917480),
(42, 1042, 'Carne a la Plancha', '9903', 0, 1, '08-08-2020', 11, '6ee597bace', 1596917503),
(43, 1043, 'Mar y Tierra', '9903', 0, 1, '08-08-2020', 11, 'ca18755372', 1596917601),
(44, 1044, 'Chuleta Ahumada', '9903', 0, 1, '08-08-2020', 11, '2ce7760d5e', 1596917646),
(45, 1045, 'Pechuga a la Plancha', '9903', 0, 1, '08-08-2020', 11, 'c7aa764e0d', 1596917698),
(46, 1046, 'Pechuga al Ajillo', '9903', 0, 1, '08-08-2020', 11, '7bdc2e32e2', 1596917733),
(47, 1047, 'Pechuga en Hongos', '9903', 0, 1, '08-08-2020', 11, 'affe86709c', 1596917783),
(48, 1048, 'Pechuga en Queso', '9903', 0, 1, '08-08-2020', 11, 'bb2f305aeb', 1596917814),
(49, 1049, 'Pollo Cordon Blue', '9903', 0, 1, '08-08-2020', 11, 'ff8f0aa42c', 1596917921),
(50, 1050, 'Tacos Dorados', '9903', 0, 1, '08-08-2020', 11, '1215952116', 1596917999),
(51, 1051, 'Milanesa de pollo', '9903', 0, 1, '08-08-2020', 11, 'a34435d977', 1596918173),
(52, 1052, 'Camarones a la plancha', '9903', 0, 1, '08-08-2020', 11, 'cbbd1ac066', 1596918208),
(53, 1053, 'Camarones a la diabla', '9903', 0, 1, '08-08-2020', 11, '4d6c432362', 1596918238),
(54, 1054, 'Camarones al ajillo', '9903', 0, 1, '08-08-2020', 11, '34fc7ab447', 1596918260);

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
(1, 'opciones', '33242b7344', 1596913611, 1, 11),
(2, 'producto', 'be3542020d', 1596916039, 2, 11),
(3, 'precios', '0d8b41b21c', 1596916039, 2, 11),
(4, 'images', 'c34ac13ed5', 1596916039, 2, 11),
(5, 'ticket_temp', 'eb916cd56e', 1596916555, 1, 11),
(6, 'producto', 'a27109caa3', 1596916590, 2, 11),
(7, 'precios', 'da036741c0', 1596916604, 2, 11),
(8, 'images', '4e94089d0e', 1596916590, 2, 11),
(9, 'ticket_temp', '4c075b081d', 1596916777, 1, 11),
(10, 'mesa', '1025772445', 1596916778, 1, 11),
(11, 'ticket_temp', '8964c6da45', 1596917330, 1, 11),
(12, 'opciones_ticket', 'fe98a6c8dd', 1596917330, 1, 11),
(13, 'mesa', '9ff95f95a3', 1596917330, 1, 11),
(14, 'mesa', '93b1b04c2a', 1596917344, 1, 11),
(15, 'producto', 'a34435d977', 1596918173, 2, 11),
(16, 'precios', 'bdecc64e83', 1596918173, 2, 11),
(17, 'images', '06b7cfbfae', 1596918173, 2, 11),
(18, 'ticket_temp', '3f1369cb59', 1596918286, 1, 11),
(19, 'mesa', '5ed9e11632', 1596918286, 1, 11),
(20, 'mesa', 'bfcb6e9d90', 1596918290, 1, 11),
(21, 'alter_opciones', '180f6086b4', 1596918297, 2, 11),
(22, 'ticket_temp', 'c37774a183', 1596918320, 1, 11),
(23, 'mesa', 'ca251c7ee8', 1596918320, 1, 11),
(24, 'opciones_name', '5fdb75dfe1', 1596918453, 1, 11),
(25, 'opciones_name', '4209c28d36', 1596918456, 1, 11),
(26, 'categorias', '5177a7fb67', 1596918705, 2, 11),
(27, 'images', '51a8cf1885', 1596918705, 2, 11),
(28, 'producto', 'c436b45ef9', 1596918736, 2, 11),
(29, 'precios', '2c5f5b3098', 1596918737, 2, 11),
(30, 'images', '0668889bd7', 1596918737, 2, 11),
(31, 'producto', '8e61a7b8be', 1596918870, 2, 11),
(32, 'precios', 'd6490127c7', 1596918870, 2, 11),
(33, 'images', 'e049709b1a', 1596918870, 2, 11),
(34, 'producto', '902b179446', 1596919032, 2, 11),
(35, 'precios', 'a92b3cb248', 1596919032, 2, 11),
(36, 'images', '3876ff0d61', 1596919032, 2, 11),
(37, 'producto', '075624f3e1', 1596919114, 2, 11),
(38, 'precios', '251ec3180b', 1596919114, 2, 11),
(39, 'images', 'b4ae46b1a3', 1596919114, 2, 11),
(40, 'producto', '01b8c0a164', 1596919225, 2, 11),
(41, 'precios', '59add7b440', 1596919225, 2, 11),
(42, 'images', '48de1e85a6', 1596919225, 2, 11),
(43, 'producto', 'd1cf21b61a', 1596919317, 2, 11),
(44, 'precios', 'c73352d941', 1596919317, 2, 11),
(45, 'images', '804fda64b9', 1596919317, 2, 11),
(46, 'opciones_ticket', 'c384d09e05', 1596919368, 2, 11),
(47, 'ticket_temp', '6d9b2ebbb2', 1596919404, 1, 11),
(48, 'opciones_ticket', 'c384d09e05', 1596919404, 1, 11),
(49, 'mesa', 'c5b2d7f3bd', 1596919404, 1, 11),
(50, 'mesa', '2160114379', 1596919425, 1, 11),
(51, 'ticket_temp', 'e07ee2d192', 1596919455, 1, 11),
(52, 'mesa', '6065956ada', 1596919455, 1, 11),
(53, 'mesa', 'd7232a00f8', 1596919492, 1, 11),
(54, 'opciones_ticket', 'edb489904c', 1596919538, 1, 11),
(55, 'opciones_ticket', 'c970b17e65', 1596919552, 2, 11),
(56, 'ticket_temp', 'da4d394cca', 1596919643, 1, 11),
(57, 'mesa', 'c1a938be13', 1596919643, 1, 11);

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
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `alter_producto_reporte`
--
ALTER TABLE `alter_producto_reporte`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `clientes_mesa`
--
ALTER TABLE `clientes_mesa`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
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
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `control_panel_mostrar`
--
ALTER TABLE `control_panel_mostrar`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `corte_diario`
--
ALTER TABLE `corte_diario`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `delivery_repartidor`
--
ALTER TABLE `delivery_repartidor`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
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
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `facturar_rtn`
--
ALTER TABLE `facturar_rtn`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
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
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `gastos_images`
--
ALTER TABLE `gastos_images`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `images`
--
ALTER TABLE `images`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;
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
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=332;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
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
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `mesa`
--
ALTER TABLE `mesa`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `mesa_nombre`
--
ALTER TABLE `mesa_nombre`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `opciones`
--
ALTER TABLE `opciones`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `opciones_asig`
--
ALTER TABLE `opciones_asig`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT de la tabla `opciones_name`
--
ALTER TABLE `opciones_name`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT de la tabla `opciones_ticket`
--
ALTER TABLE `opciones_ticket`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
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
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `planilla_extras`
--
ALTER TABLE `planilla_extras`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `planilla_pagos`
--
ALTER TABLE `planilla_pagos`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `precios`
--
ALTER TABLE `precios`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT de la tabla `productos_venta_especial`
--
ALTER TABLE `productos_venta_especial`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pro_asignado`
--
ALTER TABLE `pro_asignado`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pro_bruto`
--
ALTER TABLE `pro_bruto`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pro_dependiente`
--
ALTER TABLE `pro_dependiente`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pro_historial_addpro`
--
ALTER TABLE `pro_historial_addpro`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pro_historial_averias`
--
ALTER TABLE `pro_historial_averias`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pro_registro_averia`
--
ALTER TABLE `pro_registro_averia`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pro_registro_up`
--
ALTER TABLE `pro_registro_up`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pro_unidades_medida`
--
ALTER TABLE `pro_unidades_medida`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `sync_tabla`
--
ALTER TABLE `sync_tabla`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `sync_tables_updates`
--
ALTER TABLE `sync_tables_updates`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT de la tabla `sync_up`
--
ALTER TABLE `sync_up`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `sync_up_cloud`
--
ALTER TABLE `sync_up_cloud`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `system_img_check`
--
ALTER TABLE `system_img_check`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `ticket_num`
--
ALTER TABLE `ticket_num`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `ticket_propina`
--
ALTER TABLE `ticket_propina`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `ticket_temp`
--
ALTER TABLE `ticket_temp`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
