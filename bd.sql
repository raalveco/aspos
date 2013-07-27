-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-07-2013 a las 08:02:30
-- Versión del servidor: 5.5.27
-- Versión de PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de datos: `aspos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

DROP TABLE IF EXISTS `administrador`;
CREATE TABLE IF NOT EXISTS `administrador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `rfc` varchar(15) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `token` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`id`, `nombre`, `rfc`, `usuario`, `password`, `correo`, `token`) VALUES
(1, 'Ramiro Vera', 'VECR8307073J1', 'raalveco', '886fed01789257424228dc95fe3b5b319335ab6d', 'raalveco@gmail.com', '97a9d533ca25632d82ec228307529c4dbd123852'),
(2, 'Alejandro Lizaola', 'LIHA851024I63', 'lizaolaa', '89799278670582c4055bbcd5561dba7acca31aec', 'lizaolaa@gmail.com', '1ff973907159e4fa8d5e0ec0c8ab2ab8c0a8d3a3'),
(3, 'Iván Orlando Monge Marquez', 'MAMI8105098E8', 'ivyaweb', '08d4042ab91a50235d22f7baf8e94e385bd67b95', 'mongenyip@gmail.com', '9bccd32f1155dc0c6073cc1b81560bd3a3121ee5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cbb_concepto`
--

DROP TABLE IF EXISTS `cbb_concepto`;
CREATE TABLE IF NOT EXISTS `cbb_concepto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuenta_id` int(11) NOT NULL,
  `activo` varchar(2) DEFAULT 'SI',
  `usuario_creacion_id` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_edicion_id` int(11) DEFAULT NULL,
  `fecha_edicion` datetime DEFAULT NULL,
  `cbb_id` int(11) NOT NULL,
  `cantidad` decimal(16,4) DEFAULT '0.0000',
  `unidad` varchar(25) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio_unitario` decimal(16,4) DEFAULT '0.0000',
  `descuento` decimal(16,4) NOT NULL DEFAULT '0.0000',
  `importe` decimal(16,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cbb_factura`
--

DROP TABLE IF EXISTS `cbb_factura`;
CREATE TABLE IF NOT EXISTS `cbb_factura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuenta_id` int(11) NOT NULL,
  `activo` varchar(2) DEFAULT 'SI',
  `usuario_creacion_id` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_edicion_id` int(11) DEFAULT NULL,
  `fecha_edicion` datetime DEFAULT NULL,
  `cbb_folios_id` int(11) DEFAULT NULL,
  `sucursal_id` int(11) DEFAULT NULL,
  `serie` varchar(25) DEFAULT NULL,
  `folio` varchar(25) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `no_aprobacion` varchar(25) DEFAULT NULL,
  `forma_pago` varchar(50) DEFAULT NULL,
  `subtotal` decimal(16,4) DEFAULT '0.0000',
  `descuento` decimal(16,4) DEFAULT '0.0000',
  `total` decimal(16,4) DEFAULT '0.0000',
  `comentarios` tinytext,
  `status` varchar(10) DEFAULT 'EMITIDA',
  `motivo_cancelacion` varchar(255) DEFAULT NULL,
  `pago` varchar(2) DEFAULT 'NO',
  `envio` varchar(2) DEFAULT 'NO',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cbb_folio`
--

DROP TABLE IF EXISTS `cbb_folio`;
CREATE TABLE IF NOT EXISTS `cbb_folio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuenta_id` int(11) NOT NULL,
  `activo` varchar(2) DEFAULT 'SI',
  `usuario_creacion_id` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_edicion_id` int(11) DEFAULT NULL,
  `fecha_edicion` datetime DEFAULT NULL,
  `serie` varchar(25) NOT NULL,
  `inicial` int(11) DEFAULT NULL,
  `final` int(11) DEFAULT NULL,
  `actual` int(11) DEFAULT NULL,
  `fecha_recepcion` date DEFAULT NULL,
  `numero_aprobacion` varchar(15) DEFAULT NULL,
  `tipo_documento` varchar(25) DEFAULT NULL,
  `cbb` varchar(25) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cbb_impuesto`
--

DROP TABLE IF EXISTS `cbb_impuesto`;
CREATE TABLE IF NOT EXISTS `cbb_impuesto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuenta_id` int(11) NOT NULL,
  `activo` varchar(2) DEFAULT 'SI',
  `usuario_creacion_id` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_edicion_id` int(11) DEFAULT NULL,
  `fecha_edicion` datetime DEFAULT NULL,
  `cbb_id` int(11) NOT NULL,
  `nombre` varchar(10) NOT NULL,
  `tasa` tinyint(4) NOT NULL DEFAULT '16',
  `importe` decimal(16,2) NOT NULL,
  `tipo` varchar(25) NOT NULL DEFAULT 'TRASLADADO',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cbb_receptor`
--

DROP TABLE IF EXISTS `cbb_receptor`;
CREATE TABLE IF NOT EXISTS `cbb_receptor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuenta_id` int(11) NOT NULL,
  `activo` varchar(2) DEFAULT 'SI',
  `usuario_creacion_id` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_edicion_id` int(11) DEFAULT NULL,
  `fecha_edicion` datetime DEFAULT NULL,
  `cbb_id` int(11) NOT NULL,
  `rfc` varchar(15) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `calle` varchar(100) DEFAULT NULL,
  `exterior` varchar(5) DEFAULT NULL,
  `interior` varchar(5) DEFAULT NULL,
  `colonia` varchar(50) DEFAULT NULL,
  `localidad` varchar(50) DEFAULT NULL,
  `municipio` varchar(50) DEFAULT NULL,
  `estado` varchar(25) DEFAULT NULL,
  `pais` varchar(25) DEFAULT NULL,
  `cpostal` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `certificado`
--

DROP TABLE IF EXISTS `certificado`;
CREATE TABLE IF NOT EXISTS `certificado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuenta_id` int(11) NOT NULL,
  `activo` varchar(2) DEFAULT 'SI',
  `usuario_creacion_id` int(11) DEFAULT '0',
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_edicion_id` int(11) DEFAULT '0',
  `fecha_edicion` datetime DEFAULT NULL,
  `fecha_emision` date NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `numero_serie` varchar(25) NOT NULL,
  `clave_privada` varchar(25) DEFAULT NULL,
  `archivo_key` varchar(100) DEFAULT NULL,
  `archivo_cer` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cfd_folio`
--

DROP TABLE IF EXISTS `cfd_folio`;
CREATE TABLE IF NOT EXISTS `cfd_folio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuenta_id` int(11) NOT NULL,
  `activo` varchar(2) DEFAULT 'SI',
  `usuario_creacion_id` int(11) DEFAULT '0',
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_edicion_id` int(11) DEFAULT '0',
  `fecha_edicion` datetime DEFAULT NULL,
  `certificado_id` int(11) NOT NULL,
  `fecha_recepcion` date DEFAULT NULL,
  `ano_aprobacion` varchar(4) NOT NULL,
  `numero_aprobacion` varchar(12) NOT NULL,
  `serie` varchar(10) NOT NULL,
  `inicial` int(11) NOT NULL,
  `final` int(11) NOT NULL,
  `actual` int(11) NOT NULL,
  `tipo_documento` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuenta_id` int(11) NOT NULL,
  `activo` varchar(2) DEFAULT 'SI',
  `usuario_creacion_id` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_edicion_id` int(11) DEFAULT NULL,
  `fecha_edicion` datetime DEFAULT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `tipo_cliente_id`, `rfc`, `nombre`, `calle`, `exterior`, `interior`, `colonia`, `localidad`, `referencia`, `municipio`, `estado`, `pais`, `cpostal`, `telefono`, `celular`, `correo`, `comentarios`, `fecha_registro_at`) VALUES
(1, 1, 'SI', 0, '2013-07-04 23:04:48', NULL, '2013-07-04 23:04:48', 1, 'XAXX000000XXX', 'CLIENTE GENERICO', 'CONOCIDO', 'S/N', NULL, NULL, NULL, NULL, 'CIUDAD DE MEXICO', 'DISTRITO FEDERAL', 'MÉXICO', '06000', NULL, NULL, NULL, NULL, '2013-07-04 23:04:48'),
(2, 2, 'SI', 0, '2013-07-05 00:59:55', NULL, '2013-07-05 00:59:55', 2, 'XAXX000000XXX', 'CLIENTE GENERICO', 'CONOCIDO', 'S/N', NULL, NULL, NULL, NULL, 'CIUDAD DE MEXICO', 'DISTRITO FEDERAL', 'MÉXICO', '06000', NULL, NULL, NULL, NULL, '2013-07-05 00:59:55'),
(3, 3, 'SI', 0, '2013-07-26 23:04:11', NULL, '2013-07-26 23:04:11', 3, 'XAXX000000XXX', 'CLIENTE GENERICO', 'CONOCIDO', 'S/N', NULL, NULL, NULL, NULL, 'CIUDAD DE MEXICO', 'DISTRITO FEDERAL', 'MÉXICO', '06000', NULL, NULL, NULL, NULL, '2013-07-26 23:04:11'),
(4, 4, 'SI', 0, '2013-07-26 23:53:55', NULL, '2013-07-26 23:53:55', 4, 'XAXX000000XXX', 'CLIENTE GENERICO', 'CONOCIDO', 'S/N', NULL, NULL, NULL, NULL, 'CIUDAD DE MEXICO', 'DISTRITO FEDERAL', 'MÉXICO', '06000', NULL, NULL, NULL, NULL, '2013-07-26 23:53:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente_tipo`
--

DROP TABLE IF EXISTS `cliente_tipo`;
CREATE TABLE IF NOT EXISTS `cliente_tipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuenta_id` int(11) NOT NULL,
  `activo` varchar(2) DEFAULT 'SI',
  `usuario_creacion_id` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_edicion_id` int(11) DEFAULT NULL,
  `fecha_edicion` datetime DEFAULT NULL,
  `nombre` varchar(25) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `cliente_tipo`
--

INSERT INTO `cliente_tipo` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `nombre`, `descripcion`) VALUES
(1, 1, 'SI', 0, '2013-07-04 23:04:48', 0, '2013-07-04 23:04:48', 'NORMAL', 'CLIENTE NORMAL'),
(2, 2, 'SI', 0, '2013-07-05 00:59:55', 0, '2013-07-05 00:59:55', 'NORMAL', 'CLIENTE NORMAL'),
(3, 3, 'SI', 0, '2013-07-26 23:04:11', 0, '2013-07-26 23:04:11', 'NORMAL', 'CLIENTE NORMAL'),
(4, 4, 'SI', 0, '2013-07-26 23:53:55', 0, '2013-07-26 23:53:55', 'NORMAL', 'CLIENTE NORMAL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contrato`
--

DROP TABLE IF EXISTS `contrato`;
CREATE TABLE IF NOT EXISTS `contrato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuenta_id` int(11) NOT NULL,
  `paquete_id` int(11) NOT NULL,
  `inicio` date NOT NULL,
  `fin` date NOT NULL,
  `dia_corte` tinyint(4) NOT NULL,
  `tipo` varchar(10) NOT NULL DEFAULT 'MENSUAL',
  `activo` varchar(2) NOT NULL DEFAULT 'SI',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `contrato`
--

INSERT INTO `contrato` (`id`, `cuenta_id`, `paquete_id`, `inicio`, `fin`, `dia_corte`, `tipo`, `activo`) VALUES
(1, 1, 1, '2013-07-04', '2014-07-04', 3, 'ANUAL', 'SI'),
(2, 2, 2, '2013-07-05', '2014-07-05', 4, 'ANUAL', 'SI'),
(3, 3, 2, '2013-07-26', '2014-07-26', 25, 'ANUAL', 'SI'),
(4, 4, 1, '2013-07-26', '2014-07-26', 25, 'ANUAL', 'SI');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contribuyente`
--

DROP TABLE IF EXISTS `contribuyente`;
CREATE TABLE IF NOT EXISTS `contribuyente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuenta_id` int(11) NOT NULL,
  `activo` varchar(2) DEFAULT 'SI',
  `usuario_creacion_id` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_edicion_id` int(11) DEFAULT NULL,
  `fecha_edicion` datetime DEFAULT NULL,
  `rfc` varchar(14) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `calle` varchar(100) DEFAULT '',
  `exterior` varchar(5) DEFAULT NULL,
  `interior` varchar(5) DEFAULT NULL,
  `colonia` varchar(50) DEFAULT NULL,
  `localidad` varchar(50) DEFAULT NULL,
  `municipio` varchar(50) DEFAULT NULL,
  `estado` varchar(25) DEFAULT NULL,
  `pais` varchar(25) DEFAULT NULL,
  `cpostal` varchar(5) DEFAULT NULL,
  `telefono` varchar(25) DEFAULT NULL,
  `celular` varchar(25) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `nombre_comercial` varchar(100) DEFAULT NULL,
  `cedula` varchar(25) DEFAULT NULL,
  `logotipo` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `contribuyente`
--

INSERT INTO `contribuyente` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `rfc`, `nombre`, `calle`, `exterior`, `interior`, `colonia`, `localidad`, `municipio`, `estado`, `pais`, `cpostal`, `telefono`, `celular`, `correo`, `nombre_comercial`, `cedula`, `logotipo`) VALUES
(1, 1, 'SI', 0, '2013-07-04 23:04:48', NULL, '2013-07-04 23:04:48', 'XAXX000000XXX', 'CUENTA DE PRUEBA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 2, 'SI', 0, '2013-07-05 00:59:55', NULL, '2013-07-05 01:16:28', 'DEMO200020000', 'CUENTA DEMO', 'JUAREZ', '3723', NULL, 'SAN JAVIER', 'TULANSINGO', 'TULANSINGO', 'HIDALGO', 'MÉXICO', '38849', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 3, 'SI', 0, '2013-07-26 23:04:11', NULL, '2013-07-26 23:04:11', 'LIHA851024I63', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 4, 'SI', 0, '2013-07-26 23:53:55', NULL, '2013-07-26 23:53:55', 'LIHA851024I63', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta`
--

DROP TABLE IF EXISTS `cuenta`;
CREATE TABLE IF NOT EXISTS `cuenta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activo` varchar(2) DEFAULT 'SI',
  `usuario_creacion_id` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_edicion_id` int(11) DEFAULT NULL,
  `fecha_edicion` datetime DEFAULT NULL,
  `paquete_id` int(11) NOT NULL,
  `rfc` varchar(13) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `usuario` varchar(25) DEFAULT 'admin',
  `password` varchar(50) DEFAULT NULL,
  `telefono_contacto` varchar(25) DEFAULT NULL,
  `celular_contacto` varchar(25) DEFAULT NULL,
  `correo_contacto` varchar(100) DEFAULT NULL,
  `tipo_contrato` varchar(25) DEFAULT 'ANUAL',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `cuenta`
--

INSERT INTO `cuenta` (`id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `paquete_id`, `rfc`, `nombre`, `usuario`, `password`, `telefono_contacto`, `celular_contacto`, `correo_contacto`, `tipo_contrato`) VALUES
(1, 'SI', 0, '2013-07-04 23:04:48', NULL, '2013-07-04 23:04:48', 1, 'XAXX000000XXX', 'CUENTA DE PRUEBA', 'admin', '3c0eb02ecaf3fee92a3d9d50f2a8c06a5b1eb3be', '(333) 333 3333', NULL, 'pruebas@emisionfiscal.com', 'ANUAL'),
(2, 'SI', 0, '2013-07-05 00:59:55', NULL, '2013-07-05 01:16:28', 2, 'DEMO200020000', 'CUENTA DEMO', 'demo', '89e495e7941cf9e40e6980d14a16bf023ccd4c91', '(333) 333 3333', '(444) 444 4444', 'raalveco@gmail.com', 'ANUAL'),
(4, NULL, 0, '2013-07-26 23:53:55', NULL, '2013-07-27 00:55:42', 1, 'LIHA851024I63', NULL, 'ALEX', '7fe1714e897ff0bcd6a566ca62b8aa19ae5e03fb', NULL, NULL, 'lizaolaa@gmail.com', 'ANUAL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

DROP TABLE IF EXISTS `departamento`;
CREATE TABLE IF NOT EXISTS `departamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  `correo` varchar(100) DEFAULT 'contacto@ciberfactura.com.mx',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`id`, `nombre`, `correo`) VALUES
(1, 'SOPORTE', 'soporte@emisionfiscal.com'),
(2, 'VENTAS', 'ventas@emisionfiscal.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `impuesto`
--

DROP TABLE IF EXISTS `impuesto`;
CREATE TABLE IF NOT EXISTS `impuesto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuenta_id` int(11) NOT NULL,
  `activo` varchar(2) DEFAULT 'SI',
  `usuario_creacion_id` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_edicion_id` int(11) DEFAULT NULL,
  `fecha_edicion` datetime DEFAULT NULL,
  `nombre` varchar(25) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `tasa` smallint(6) NOT NULL,
  `tipo` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `impuesto`
--

INSERT INTO `impuesto` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `nombre`, `descripcion`, `tasa`, `tipo`) VALUES
(1, 1, 'SI', 0, '2013-07-04 23:04:48', 0, '2013-07-04 23:04:48', 'IVA', 'IVA', 16, 'TRASLADADO'),
(2, 2, 'SI', 0, '2013-07-05 00:59:55', 0, '2013-07-05 00:59:55', 'IVA', 'IVA', 16, 'TRASLADADO'),
(3, 3, 'SI', 0, '2013-07-26 23:04:11', 0, '2013-07-26 23:04:11', 'IVA', 'IVA', 16, 'TRASLADADO'),
(4, 4, 'SI', 0, '2013-07-26 23:53:55', 0, '2013-07-26 23:53:55', 'IVA', 'IVA', 16, 'TRASLADADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(10) NOT NULL DEFAULT 'CLIENTE',
  `imagen` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `activo` varchar(2) NOT NULL DEFAULT 'SI',
  `orden` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`id`, `tipo`, `imagen`, `nombre`, `activo`, `orden`) VALUES
(1, 'CLIENTE', 'miniconos/group.png', 'Clientes', 'SI', 1),
(2, 'CLIENTE', 'miniconos/user_gray.png', 'Proveedores', 'NO', 2),
(3, 'CLIENTE', 'miniconos/box.png', 'Productos', 'SI', 3),
(4, 'CLIENTE', 'miniconos/transmit.png', 'Servicios', 'NO', 4),
(5, 'CLIENTE', 'miniconos/lorry.png', 'Compras', 'NO', 5),
(6, 'CLIENTE', 'miniconos/cart.png', 'Ventas', 'NO', 6),
(7, 'CLIENTE', 'miniconos/coins.png', 'Caja', 'NO', 7),
(8, 'CLIENTE', 'miniconos/page_white_key.png', 'Facturación', 'NO', 8),
(9, 'ADMIN', 'miniconos/group.png', 'Cuentas', 'SI', 2),
(10, 'CBB', 'miniconos/page_white_key.png', 'Facturación CBB', 'SI', 9),
(11, 'CLIENTE', 'miniconos/building_add.png', 'Sucursales', 'SI', 10),
(12, 'CLIENTE', 'miniconos/book_open.png', 'Catalogos', 'SI', 11),
(13, 'ADMIN', 'miniconos/package.png', 'Paquetes', 'SI', 1),
(14, 'ADMIN', 'miniconos/newspaper.png', 'Tickets', 'SI', 3),
(15, 'ADMIN', 'miniconos/book.png', 'Departamentos', 'SI', 4),
(16, 'CLIENTE', 'miniconos/user.png', 'Usuarios', 'SI', 5),
(17, 'CFD', 'miniconos/page_white_key.png', 'Facturación CFD', 'SI', 8),
(18, 'CFDI', 'miniconos/page_white_key.png', 'Facturación CFDI', 'SI', 9),
(19, 'ADMIN', 'miniconos/user.png', 'Registro Rapido', 'SI', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `moneda`
--

DROP TABLE IF EXISTS `moneda`;
CREATE TABLE IF NOT EXISTS `moneda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuenta_id` int(11) NOT NULL,
  `activo` varchar(2) DEFAULT 'SI',
  `usuario_creacion_id` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_edicion_id` int(11) DEFAULT NULL,
  `fecha_edicion` datetime DEFAULT NULL,
  `nombre` varchar(25) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `tipo_cambio` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `moneda`
--

INSERT INTO `moneda` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `nombre`, `descripcion`, `tipo_cambio`) VALUES
(1, 1, 'SI', 0, '2013-07-04 23:04:48', 0, '2013-07-04 23:04:48', 'MXN', 'PESO MEXICANO', 1.00),
(2, 2, 'SI', 0, '2013-07-05 00:59:55', 0, '2013-07-05 00:59:55', 'MXN', 'PESO MEXICANO', 1.00),
(3, 3, 'SI', 0, '2013-07-26 23:04:11', 0, '2013-07-26 23:04:11', 'MXN', 'PESO MEXICANO', 1.00),
(4, 4, 'SI', 0, '2013-07-26 23:53:55', 0, '2013-07-26 23:53:55', 'MXN', 'PESO MEXICANO', 1.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paquete`
--

DROP TABLE IF EXISTS `paquete`;
CREATE TABLE IF NOT EXISTS `paquete` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `tipo` varchar(5) NOT NULL,
  `facturas_incluidas` smallint(6) DEFAULT NULL,
  `costo_factura_adicional` decimal(10,2) DEFAULT NULL,
  `usuarios` smallint(6) DEFAULT NULL,
  `almacenamiento` int(11) DEFAULT NULL,
  `soporte_online` varchar(2) DEFAULT 'SI',
  `soporte_chat` varchar(2) DEFAULT 'NO',
  `soporte_telefono` varchar(2) DEFAULT 'NO',
  `multiple_moneda` varchar(2) DEFAULT 'NO',
  `multiple_sucursal` varchar(2) DEFAULT 'NO',
  `costo_mensual` decimal(10,2) DEFAULT NULL,
  `costo_anual` decimal(10,2) DEFAULT NULL,
  `vigencia` date DEFAULT NULL,
  `activo` varchar(2) DEFAULT 'SI',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `paquete`
--

INSERT INTO `paquete` (`id`, `nombre`, `tipo`, `facturas_incluidas`, `costo_factura_adicional`, `usuarios`, `almacenamiento`, `soporte_online`, `soporte_chat`, `soporte_telefono`, `multiple_moneda`, `multiple_sucursal`, `costo_mensual`, `costo_anual`, `vigencia`, `activo`) VALUES
(1, 'GRATUITO', 'CBB', 10, 5.00, 1, 100, 'SI', 'NO', 'NO', 'NO', 'NO', 0.00, 0.00, '2013-12-31', 'SI'),
(2, 'EMPRESARIAL', 'CBB', 100, 5.00, 3, 250, 'SI', 'NO', 'NO', 'NO', 'SI', 29.00, 290.00, '2013-12-31', 'SI'),
(3, 'CORPORATIVO', 'CBB', 10000, 0.00, 5, 1000, 'SI', 'NO', 'NO', 'NO', 'SI', 49.00, 490.00, '2013-12-31', 'SI');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activo` varchar(2) DEFAULT 'SI',
  `usuario_creacion_id` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_edicion_id` int(11) DEFAULT NULL,
  `fecha_edicion` datetime DEFAULT NULL,
  `codigo` varchar(25) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `categoria_id` int(11) DEFAULT NULL,
  `impuesto_id` int(11) DEFAULT NULL,
  `unidad_id` int(11) DEFAULT NULL,
  `precio_unitario` decimal(16,4) NOT NULL,
  `moneda_id` int(11) DEFAULT NULL,
  `cuenta_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `codigo`, `nombre`, `descripcion`, `categoria_id`, `impuesto_id`, `unidad_id`, `precio_unitario`, `moneda_id`, `cuenta_id`) VALUES
(1, 'SI', NULL, '2013-07-05 00:59:55', NULL, '2013-07-05 00:59:55', NULL, 'PRODUCTO DE PRUEBA', NULL, NULL, NULL, NULL, 1.0000, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_categoria`
--

DROP TABLE IF EXISTS `producto_categoria`;
CREATE TABLE IF NOT EXISTS `producto_categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuenta_id` int(11) NOT NULL,
  `activo` varchar(2) DEFAULT 'SI',
  `usuario_creacion_id` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_edicion_id` int(11) DEFAULT NULL,
  `fecha_edicion` datetime DEFAULT NULL,
  `nombre` varchar(25) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `producto_categoria`
--

INSERT INTO `producto_categoria` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `nombre`, `descripcion`) VALUES
(1, 1, 'SI', 0, '2013-07-04 23:04:48', 0, '2013-07-04 23:04:48', 'GENERAL', 'CATEGORIA GENERAL'),
(2, 2, 'SI', 0, '2013-07-05 00:59:55', 0, '2013-07-05 00:59:55', 'GENERAL', 'CATEGORIA GENERAL'),
(3, 3, 'SI', 0, '2013-07-26 23:04:11', 0, '2013-07-26 23:04:11', 'GENERAL', 'CATEGORIA GENERAL'),
(4, 4, 'SI', 0, '2013-07-26 23:53:55', 0, '2013-07-26 23:53:55', 'GENERAL', 'CATEGORIA GENERAL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccion`
--

DROP TABLE IF EXISTS `seccion`;
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=47 ;

--
-- Volcado de datos para la tabla `seccion`
--

INSERT INTO `seccion` (`id`, `menu_id`, `nombre`, `imagen`, `link`, `contenedor`, `activo`, `orden`, `fecha_registro`) VALUES
(1, 1, 'Nuevo Cliente', 'miniconos/user_add.png', 'clientes/registro', 'contenido', 'SI', 1, '2012-11-01 00:00:00'),
(2, 1, 'Catalogo de Clientes', 'miniconos/folder_user.png', 'clientes/reporte', 'contenido', 'SI', 2, '2012-11-01 00:00:00'),
(3, 7, 'Apertura de Caja', 'miniconos/coins_add.png', 'caja/abrir', 'contenido', 'SI', 1, '2012-11-01 00:00:00'),
(4, 7, 'Cierre de Caja', 'miniconos/coins_delete.png', 'caja/cierre', 'contenido', 'SI', 4, '2012-11-01 00:00:00'),
(5, 2, 'Nuevo Proveedor', 'miniconos/user_gray.png', 'proveedor/registro', 'contenido', 'SI', 1, '2012-11-01 00:00:00'),
(6, 2, 'Todos los Proveedores', 'miniconos/folder_user.png', 'proveedores/reporte', 'contenido', 'SI', 2, '2012-11-01 00:00:00'),
(7, 3, 'Nuevo Producto', 'miniconos/brick_add.png', 'productos/registro', 'contenido', 'SI', 1, '2012-11-01 00:00:00'),
(8, 3, 'Catalogo de Productos', 'miniconos/folder_brick.png', 'productos/reporte', 'contenido', 'SI', 2, '2012-11-01 00:00:00'),
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
(19, 1, 'Tipos de Cliente', 'miniconos/group.png', 'clientes/reporteTiposCliente', 'contenido', 'SI', 3, '2012-11-01 00:00:00'),
(20, 1, 'Nuevo Tipo Cliente', 'miniconos/user_add.png', 'clientes/registroTipoCliente', 'contenido', 'NO', 4, '2012-11-01 00:00:00'),
(21, 9, 'Nueva Cuenta', 'miniconos/user_add.png', 'cuentas/registro', 'contenido', 'SI', 1, '2012-11-01 00:00:00'),
(22, 9, 'Todas las Cuentas', 'miniconos/folder_user.png', 'cuentas/reporte', 'contenido', 'SI', 2, '2012-11-01 00:00:00'),
(23, 3, 'Categorías de Producto', 'miniconos/bricks.png', 'productos/reporteProductoCategoria', 'contenido', 'SI', 3, '2012-11-01 00:00:00'),
(24, 10, 'Información Fiscal', 'miniconos/newspaper.png', 'configuracion/fiscal', 'contenido', 'SI', 1, '2012-11-01 00:00:00'),
(25, 11, 'Nueva Sucursal', 'miniconos/house.png', 'sucursales/registro', 'contenido', 'SI', 1, '2013-02-19 00:00:00'),
(26, 11, 'Sucursales', 'miniconos/house_link.png', 'sucursales/reporte', 'contenido', 'SI', 2, '2013-02-19 00:00:00'),
(27, 12, 'Unidades', 'miniconos/style_edit.png', 'unidades/reporte', 'contenido', 'SI', 1, '2013-02-19 00:00:00'),
(28, 12, 'Monedas', 'miniconos/money_dollar.png', 'monedas/reporte', 'contenido', 'SI', 2, '2013-02-19 00:00:00'),
(29, 12, 'Impuestos', 'miniconos/money.png', 'impuestos/reporte', 'contenido', 'SI', 3, '2013-02-19 00:00:00'),
(30, 10, 'Series / Folios', 'miniconos/text_list_numbers.png', 'cbb/folios', 'contenido', 'SI', 4, '2012-11-01 00:00:00'),
(31, 10, 'Todas las Facturas', 'miniconos/newspaper.png', 'cbb/reporte', 'contenido', 'SI', 3, '2012-11-01 00:00:00'),
(32, 10, 'Nueva Factura', 'miniconos/newspaper.png', 'cbb/index', 'contenido', 'SI', 1, '2012-11-01 00:00:00'),
(33, 13, 'Nuevo Paquete', 'miniconos/package_add.png', 'paquetes/registro', 'contenido', 'SI', 1, '2012-11-01 00:00:00'),
(34, 13, 'Reporte', 'miniconos/table.png', 'paquetes/reporte', 'contenido', 'SI', 2, '2012-11-01 00:00:00'),
(35, 14, 'Todos los Tickets', 'miniconos/table.png', 'tickets/reporte', 'contenido', 'SI', 1, '2012-11-01 00:00:00'),
(36, 15, 'Nuevo Departamento', 'miniconos/book_add.png', 'departamentos/registro', 'contenido', 'SI', 1, '2012-11-01 00:00:00'),
(37, 15, 'Catalogo', 'miniconos/book_open.png', 'departamentos/reporte', 'contenido', 'SI', 2, '2012-11-01 00:00:00'),
(38, 16, 'Nuevo Usuario', 'miniconos/user_add.png', 'usuarios/registro', 'contenido', 'SI', 1, '2012-11-01 00:00:00'),
(39, 16, 'Catalogo de Usuarios', 'miniconos/folder_user.png', 'usuarios/reporte', 'contenido', 'SI', 2, '2012-11-01 00:00:00'),
(40, 17, 'Nueva Factura', 'miniconos/newspaper.png', 'cfd/index', 'contenido', 'SI', 4, '2012-11-01 00:00:00'),
(41, 17, 'Todas las Facturas', 'miniconos/newspaper.png', 'cfd/reporte', 'contenido', 'SI', 5, '2012-11-01 00:00:00'),
(42, 17, 'Series / Folios', 'miniconos/text_list_numbers.png', 'cfd/folios', 'contenido', 'SI', 3, '2012-11-01 00:00:00'),
(43, 17, 'Información Fiscal', 'miniconos/newspaper.png', 'configuracion/fiscal', 'contenido', 'SI', 1, '2012-11-01 00:00:00'),
(44, 17, 'Certificados', 'miniconos/house_link.png', 'cfd/certificados', 'contenido', 'SI', 2, '2013-02-19 00:00:00'),
(45, 19, 'Nueva Cuenta', 'miniconos/user_add.png', 'cuentas/registro_rapido', 'contenido', 'SI', 1, '2012-11-01 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
CREATE TABLE IF NOT EXISTS `sucursal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuenta_id` int(11) NOT NULL,
  `activo` varchar(2) DEFAULT 'SI',
  `usuario_creacion_id` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_edicion_id` int(11) DEFAULT NULL,
  `fecha_edicion` datetime DEFAULT NULL,
  `codigo` varchar(10) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `domicilio` varchar(100) DEFAULT NULL,
  `colonia` varchar(50) DEFAULT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  `estado` varchar(25) DEFAULT NULL,
  `cpostal` varchar(5) DEFAULT NULL,
  `cbb_folios_id` int(11) DEFAULT '0',
  `cfd_folios_id` int(11) DEFAULT '0',
  `cfdi_folios_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Volcado de datos para la tabla `sucursal`
--

INSERT INTO `sucursal` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `codigo`, `nombre`, `domicilio`, `colonia`, `ciudad`, `estado`, `cpostal`, `cbb_folios_id`, `cfd_folios_id`, `cfdi_folios_id`) VALUES
(1, 1, 'SI', 0, '2013-07-04 23:04:48', 0, '2013-07-04 23:04:48', NULL, 'GENERAL', NULL, NULL, NULL, NULL, NULL, 0, 0, 0),
(2, 1, 'SI', 0, '2013-07-05 00:59:55', 0, '2013-07-05 00:59:55', NULL, 'GENERAL', NULL, NULL, NULL, NULL, NULL, 0, 0, 0),
(3, 1, 'SI', 0, '2013-07-26 22:53:05', 0, '2013-07-26 22:53:05', NULL, 'GENERAL', NULL, NULL, NULL, NULL, NULL, 0, 0, 0),
(4, 1, 'SI', 0, '2013-07-26 22:53:15', 0, '2013-07-26 22:53:15', NULL, 'GENERAL', NULL, NULL, NULL, NULL, NULL, 0, 0, 0),
(5, 1, 'SI', 0, '2013-07-26 22:53:17', 0, '2013-07-26 22:53:17', NULL, 'GENERAL', NULL, NULL, NULL, NULL, NULL, 0, 0, 0),
(6, 1, 'SI', 0, '2013-07-26 22:53:18', 0, '2013-07-26 22:53:18', NULL, 'GENERAL', NULL, NULL, NULL, NULL, NULL, 0, 0, 0),
(7, 1, 'SI', 0, '2013-07-26 22:53:19', 0, '2013-07-26 22:53:19', NULL, 'GENERAL', NULL, NULL, NULL, NULL, NULL, 0, 0, 0),
(8, 1, 'SI', 0, '2013-07-26 22:53:21', 0, '2013-07-26 22:53:21', NULL, 'GENERAL', NULL, NULL, NULL, NULL, NULL, 0, 0, 0),
(9, 1, 'SI', 0, '2013-07-26 22:53:22', 0, '2013-07-26 22:53:22', NULL, 'GENERAL', NULL, NULL, NULL, NULL, NULL, 0, 0, 0),
(10, 1, 'SI', 0, '2013-07-26 22:53:23', 0, '2013-07-26 22:53:23', NULL, 'GENERAL', NULL, NULL, NULL, NULL, NULL, 0, 0, 0),
(11, 1, 'SI', 0, '2013-07-26 22:53:25', 0, '2013-07-26 22:53:25', NULL, 'GENERAL', NULL, NULL, NULL, NULL, NULL, 0, 0, 0),
(12, 1, 'SI', 0, '2013-07-26 22:53:26', 0, '2013-07-26 22:53:26', NULL, 'GENERAL', NULL, NULL, NULL, NULL, NULL, 0, 0, 0),
(13, 1, 'SI', 0, '2013-07-26 22:53:27', 0, '2013-07-26 22:53:27', NULL, 'GENERAL', NULL, NULL, NULL, NULL, NULL, 0, 0, 0),
(14, 1, 'SI', 0, '2013-07-26 23:00:10', 0, '2013-07-26 23:00:10', NULL, 'GENERAL', NULL, NULL, NULL, NULL, NULL, 0, 0, 0),
(15, 1, 'SI', 0, '2013-07-26 23:01:36', 0, '2013-07-26 23:01:36', NULL, 'GENERAL', NULL, NULL, NULL, NULL, NULL, 0, 0, 0),
(16, 1, 'SI', 0, '2013-07-26 23:04:11', 0, '2013-07-26 23:04:11', NULL, 'GENERAL', NULL, NULL, NULL, NULL, NULL, 0, 0, 0),
(17, 1, 'SI', 0, '2013-07-26 23:53:55', 0, '2013-07-26 23:53:55', NULL, 'GENERAL', NULL, NULL, NULL, NULL, NULL, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ticket`
--

DROP TABLE IF EXISTS `ticket`;
CREATE TABLE IF NOT EXISTS `ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuenta_id` int(11) DEFAULT '0',
  `usuario_id` int(11) DEFAULT '0',
  `admin_id` varchar(25) DEFAULT '',
  `padre` int(11) DEFAULT '0',
  `admin` varchar(2) NOT NULL DEFAULT 'NO',
  `asunto` varchar(255) NOT NULL,
  `mensaje` text NOT NULL,
  `departamento_id` int(11) DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `respondido` varchar(2) NOT NULL DEFAULT 'NO',
  `estado` varchar(2) NOT NULL DEFAULT 'OK',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `ticket`
--

INSERT INTO `ticket` (`id`, `cuenta_id`, `usuario_id`, `admin_id`, `padre`, `admin`, `asunto`, `mensaje`, `departamento_id`, `fecha`, `respondido`, `estado`) VALUES
(1, 1, 0, NULL, 0, 'NO', 'Hola', 'Hola', 1, '2013-07-04 23:20:48', 'SI', 'OK'),
(2, 1, 0, NULL, 1, 'SI', 'RE: Hola', 'Que pedo!!', 1, '2013-07-04 23:21:27', 'SI', 'OK'),
(3, 1, 0, NULL, 2, 'NO', 'RE: RE: Hola', 'nada nada, aqui pasandola', 1, '2013-07-04 23:23:07', 'SI', 'OK'),
(4, 1, 0, NULL, 3, 'SI', 'RE: RE: RE: Hola', 'OK!! Checa!!', 1, '2013-07-04 23:27:26', 'SI', 'KO'),
(5, 1, 0, NULL, 4, 'NO', 'RE: RE: RE: RE: Hola', 'jalando al cien!!', 1, '2013-07-04 23:29:11', 'NO', 'OK'),
(6, 1, 0, '2', 0, 'SI', 'sdgsdgfgdsf', 'gdgdfgdfgdgd', 0, '2013-07-05 00:04:26', 'NO', 'KO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad`
--

DROP TABLE IF EXISTS `unidad`;
CREATE TABLE IF NOT EXISTS `unidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuenta_id` int(11) NOT NULL,
  `activo` varchar(2) DEFAULT 'SI',
  `usuario_creacion_id` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_edicion_id` int(11) DEFAULT NULL,
  `fecha_edicion` datetime DEFAULT NULL,
  `nombre` varchar(25) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `unidad`
--

INSERT INTO `unidad` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `nombre`, `descripcion`) VALUES
(1, 1, 'SI', 0, '2013-07-04 23:04:48', 0, '2013-07-04 23:04:48', 'PIEZA', 'PIEZA'),
(2, 2, 'SI', 0, '2013-07-05 00:59:55', 0, '2013-07-05 00:59:55', 'PIEZA', 'PIEZA'),
(3, 3, 'SI', 0, '2013-07-26 23:04:11', 0, '2013-07-26 23:04:11', 'PIEZA', 'PIEZA'),
(4, 4, 'SI', 0, '2013-07-26 23:53:55', 0, '2013-07-26 23:53:55', 'PIEZA', 'PIEZA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;
