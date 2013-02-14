-- phpMyAdmin SQL Dump
-- version 3.5.3
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 14-02-2013 a las 07:20:23
-- Versión del servidor: 5.5.28
-- Versión de PHP: 5.3.18

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de datos: `aspos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cuenta_id` int(11) unsigned NOT NULL DEFAULT '0',
  `tipo_cliente_id` int(11) unsigned DEFAULT '0',
  `rfc` varchar(13) NOT NULL DEFAULT 'XXXX000000XXX',
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `calle` varchar(100) DEFAULT NULL,
  `exterior` varchar(5) DEFAULT NULL,
  `interior` varchar(5) DEFAULT NULL,
  `colonia` varchar(50) DEFAULT NULL,
  `localidad` varchar(50) DEFAULT NULL,
  `referencia` varchar(100) DEFAULT NULL,
  `municipio` varchar(50) DEFAULT NULL,
  `estado` varchar(25) NOT NULL DEFAULT 'JALISCO',
  `pais` varchar(25) NOT NULL DEFAULT 'MÉXICO',
  `cpostal` varchar(5) DEFAULT NULL,
  `telefono` varchar(25) DEFAULT NULL,
  `celular` varchar(25) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `comentarios` text,
  `fecha_registro_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=40 ;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `cuenta_id`, `tipo_cliente_id`, `rfc`, `nombre`, `calle`, `exterior`, `interior`, `colonia`, `localidad`, `referencia`, `municipio`, `estado`, `pais`, `cpostal`, `telefono`, `celular`, `correo`, `comentarios`, `fecha_registro_at`) VALUES
(35, 1, 2, 'VECR8307073J1', 'RAMIRO ALONSO VERA CONTRERAS', 'ALEJANDRO PEÑA', '57', NULL, 'LA REINA', 'AMECA', NULL, 'AMECA', 'JALISCO', 'MÉXICO', '46600', '(375) 758 3494', '(375) 105 0079', 'ramiro.vera@amecasoft.com.mx', NULL, '2012-12-23 23:57:02'),
(36, 1, 1, 'CORM6202276D2', 'MARIA DEL CARMEN CONTRERAS ROBLEDO', 'ALEJANDRO PEÑA', '57', NULL, 'LA REINA', 'AMECA', NULL, 'AMECA', 'JALISCO', 'MÉXICO', '46600', NULL, NULL, NULL, NULL, '2012-12-24 13:12:00'),
(37, 1, 2, 'AME1003254S1', 'AMECASOFT S.A. DE C.V.', 'FRAY JUAN CALERO', '8A', NULL, 'EL MANANTIAL', 'AMECA', NULL, 'AMECA', 'JALISCO', 'MÉXICO', '46600', NULL, NULL, NULL, NULL, '2012-12-24 13:14:27'),
(38, 1, 2, 'LIHA851024I63', 'ALEJANDRO LIZAOLA HARO', 'AVENIDA PATRIA PONIENTE', '223', NULL, 'NIÑOS HEROES', 'AMECA', NULL, 'AMECA', 'JALISCO', 'MÉXICO', '46600', '(375) 758 1176', '(331) 528 9979', 'lizaolaa@gmail.com', 'Hola Mundo', '2013-01-06 20:07:52'),
(39, 1, NULL, 'XXXX000000XXX', 'SADDAS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'JALISCO', 'MÉXICO', NULL, NULL, NULL, 'sadsadas', NULL, '2013-02-12 23:22:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta`
--

CREATE TABLE IF NOT EXISTS `cuenta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activo` varchar(2) DEFAULT 'SI',
  `usuario_creacion_id` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_edicion_id` int(11) DEFAULT NULL,
  `fecha_edicion` datetime DEFAULT NULL,
  `rfc` varchar(13) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `telefono_contacto` varchar(25) DEFAULT NULL,
  `celular_contacto` varchar(25) DEFAULT NULL,
  `correo_contacto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `cuenta`
--

INSERT INTO `cuenta` (`id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `rfc`, `nombre`, `password`, `telefono_contacto`, `celular_contacto`, `correo_contacto`) VALUES
(1, 'SI', 1, '2013-02-19 05:17:22', 1, '2013-02-21 10:23:34', 'VECR8307073J1', 'RAMIRO ALONSO VERA CONTRERAS', NULL, '(375) 758 3494', NULL, 'raalveco@gmail.com'),
(2, 'SI', NULL, '2013-02-12 23:29:10', NULL, '2013-02-12 23:29:10', 'LIHA851024I63', 'ALEJANDRO LIZAOLA HARO', '886fed01789257424228dc95fe3b5b319335ab6d', '(331) 022 1383', '(234) 293 2832', 'lizaolaa@gmail.com'),
(9, 'SI', 0, '2013-02-13 00:27:41', 0, '2013-02-13 00:27:41', 'AME1003254S1', 'AMECASOFT SA DE CV', '09892', '(987) 879 8798', NULL, NULL),
(10, 'SI', 0, '2013-02-13 00:32:28', 0, '2013-02-13 00:32:28', 'XXX000000XXX', 'RFC GENERICO', '01284', '(333) 333 3333', '(111) 111 1111', 'rasadf@asfd.sad'),
(11, 'SI', 0, '2013-02-13 00:41:48', 0, '2013-02-13 00:41:48', 'ASD2131232D3', 'ASDFDSAD', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(10) NOT NULL DEFAULT 'CLIENTE',
  `imagen` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `activo` varchar(2) NOT NULL DEFAULT 'SI',
  `orden` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`id`, `tipo`, `imagen`, `nombre`, `activo`, `orden`) VALUES
(1, 'CLIENTE', 'miniconos/group.png', 'Clientes', 'SI', 1),
(2, 'CLIENTE', 'miniconos/user_gray.png', 'Proveedores', 'SI', 2),
(3, 'CLIENTE', 'miniconos/box.png', 'Productos', 'SI', 3),
(4, 'CLIENTE', 'miniconos/transmit.png', 'Servicios', 'SI', 4),
(5, 'CLIENTE', 'miniconos/lorry.png', 'Compras', 'SI', 5),
(6, 'CLIENTE', 'miniconos/cart.png', 'Ventas', 'SI', 6),
(7, 'CLIENTE', 'miniconos/coins.png', 'Caja', 'SI', 7),
(8, 'CLIENTE', 'miniconos/page_white_key.png', 'Facturación', 'SI', 8),
(9, 'ADMIN', 'miniconos/group.png', 'Cuentas', 'SI', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE IF NOT EXISTS `rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  `activo` varchar(2) NOT NULL DEFAULT 'SI',
  `fecha_registro` datetime NOT NULL,
  `cuenta_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `nombre`, `activo`, `fecha_registro`, `cuenta_id`) VALUES
(1, 'ADMINISTRADOR', 'SI', '2012-11-24 06:24:14', 1),
(2, 'GERENTE', 'SI', '2012-11-24 12:09:24', 1),
(3, 'SUPERVISOR', 'SI', '2012-11-25 02:34:14', 1),
(4, 'VENDEDOR', 'SI', '2012-11-25 11:19:34', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccion`
--

CREATE TABLE IF NOT EXISTS `seccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `imagen` varchar(50) NOT NULL,
  `link` varchar(50) NOT NULL,
  `contenedor` varchar(25) NOT NULL,
  `activo` varchar(2) NOT NULL DEFAULT 'SI',
  `orden` tinyint(4) NOT NULL,
  `fecha_registro` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Volcado de datos para la tabla `seccion`
--

INSERT INTO `seccion` (`id`, `menu_id`, `nombre`, `imagen`, `link`, `contenedor`, `activo`, `orden`, `fecha_registro`) VALUES
(1, 1, 'Nuevo Cliente', 'miniconos/user_add.png', 'clientes/registro', 'contenido', 'SI', 1, '2012-11-01 00:00:00'),
(2, 1, 'Todos los Clientes', 'miniconos/folder_user.png', 'clientes/reporte', 'contenido', 'SI', 2, '2012-11-01 00:00:00'),
(3, 7, 'Apertura de Caja', 'miniconos/coins_add.png', 'caja/abrir', 'contenido', 'SI', 1, '2012-11-01 00:00:00'),
(4, 7, 'Cierre de Caja', 'miniconos/coins_delete.png', 'caja/cierre', 'contenido', 'SI', 4, '2012-11-01 00:00:00'),
(5, 2, 'Nuevo Proveedor', 'miniconos/user_gray.png', 'proveedor/registro', 'contenido', 'SI', 1, '2012-11-01 00:00:00'),
(6, 2, 'Todos los Proveedores', 'miniconos/folder_user.png', 'proveedores/reporte', 'contenido', 'SI', 2, '2012-11-01 00:00:00'),
(7, 3, 'Nuevo Producto', 'miniconos/brick.png', 'productos/registro', 'contenido', 'SI', 1, '2012-11-01 00:00:00'),
(8, 3, 'Todos los Productos', 'miniconos/folder_brick.png', 'productos/reporte', 'contenido', 'SI', 2, '2012-11-01 00:00:00'),
(9, 4, 'Nuevo Servicio', 'miniconos/wrench.png', 'servicios/registro', 'contenido', 'SI', 1, '2012-11-01 00:00:00'),
(10, 4, 'Todos los Servicios', 'miniconos/folder_wrench.png', 'servicios/reporte', 'contenido', 'SI', 2, '2012-11-01 00:00:00'),
(11, 7, 'Ingreso de Efectivo', 'miniconos/money_add.png', 'caja/ingreso', 'contenido', 'SI', 2, '2012-11-01 00:00:00'),
(12, 7, 'Retiro de Efectivo', 'miniconos/money_delete.png', 'caja/retiro', 'contenido', 'SI', 3, '2012-11-01 00:00:00'),
(13, 5, 'Todas las Compras', 'miniconos/folder_page_white.png', 'compras/reporte', 'contenido', 'SI', 1, '2012-11-01 00:00:00'),
(14, 6, 'Todas las Ventas', 'miniconos/folder_page.png', 'ventas/reporte', 'contenido', 'SI', 1, '2012-11-01 00:00:00'),
(15, 5, 'Nueva Compra', 'miniconos/page_white.png', 'compras/registro', 'contenido', 'SI', 1, '2012-11-01 00:00:00'),
(16, 6, 'Nueva Venta', 'miniconos/page.png', 'ventas/registro', 'contenido', 'SI', 1, '2012-11-01 00:00:00'),
(17, 8, 'Nueva Factura', 'miniconos/table_add.png', 'facturacion/registro', 'contenido', 'SI', 1, '2012-11-01 00:00:00'),
(18, 8, 'Todas las Facturas', 'miniconos/folder_table.png', 'facturacion/reporte', 'contenido', 'SI', 2, '2012-11-01 00:00:00'),
(19, 1, 'Tipos de Cliente', 'miniconos/folder_user.png', 'clientes/reporteTiposCliente', 'contenido', 'SI', 3, '2012-11-01 00:00:00'),
(20, 1, 'Nuevo Tipo Cliente', 'miniconos/user_add.png', 'clientes/registroTipoCliente', 'contenido', 'SI', 4, '2012-11-01 00:00:00'),
(21, 9, 'Nueva Cuenta', 'miniconos/user_add.png', 'cuentas/registro', 'contenido', 'SI', 1, '2012-11-01 00:00:00'),
(22, 9, 'Todas las Cuentas', 'miniconos/folder_user.png', 'cuentas/reporte', 'contenido', 'SI', 2, '2012-11-01 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_cliente`
--

CREATE TABLE IF NOT EXISTS `tipo_cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contribuyente_id` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `tipo_cliente`
--

INSERT INTO `tipo_cliente` (`id`, `contribuyente_id`, `nombre`, `descripcion`) VALUES
(1, 1, 'NORMAL', NULL),
(2, 1, 'BÁSICO', NULL),
(3, 1, 'FRECUENTE', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuenta_id` int(11) NOT NULL,
  `activo` varchar(2) DEFAULT 'SI',
  `usuario_creacion_id` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_edicion_id` int(11) DEFAULT NULL,
  `fecha_edicion` datetime DEFAULT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `usuario` varchar(40) NOT NULL,
  `password` varchar(50) NOT NULL COMMENT 'SHA1',
  `nombres` varchar(100) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;
