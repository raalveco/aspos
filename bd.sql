-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-12-2013 a las 05:10:11
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `cbb_concepto`
--

INSERT INTO `cbb_concepto` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `cbb_id`, `cantidad`, `unidad`, `descripcion`, `precio_unitario`, `descuento`, `importe`) VALUES
(1, 2, 'SI', 0, '2013-09-09 22:32:50', NULL, '2013-09-09 22:32:50', 1, 1.0000, 'PIEZA', 'TESTING', 124.0000, 0.0000, 124.0000),
(2, 2, 'SI', 0, '2013-09-09 22:40:50', NULL, '2013-09-09 22:40:50', 2, 45.0000, 'PIEZA', '6466456456TRDRGDFGDFG', 3.0000, 0.0000, 135.0000),
(3, 2, 'SI', 0, '2013-09-09 22:52:02', NULL, '2013-09-09 22:52:02', 3, 1.0000, 'PIEZA', 'ASDA', 12.0000, 0.0000, 12.0000),
(4, 2, 'SI', 0, '2013-09-16 18:05:19', NULL, '2013-09-16 18:05:19', 4, 0.0000, 'PIEZA', 'PRUEBA 1', 100.0000, 0.0000, 0.0000),
(5, 2, 'SI', 0, '2013-09-16 18:07:10', NULL, '2013-09-16 18:07:10', 5, 1.0000, 'PIEZA', 'PRUEBA 1', 100.0000, 0.0000, 100.0000),
(6, 2, 'SI', 0, '2013-09-16 18:11:42', NULL, '2013-09-16 18:11:42', 6, 1.0000, 'PIEZA', 'GARBANZOS', 1.0000, 0.0000, 1.0000);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `cbb_factura`
--

INSERT INTO `cbb_factura` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `cbb_folios_id`, `sucursal_id`, `serie`, `folio`, `fecha`, `no_aprobacion`, `forma_pago`, `subtotal`, `descuento`, `total`, `comentarios`, `status`, `motivo_cancelacion`, `pago`, `envio`) VALUES
(1, 2, 'SI', 0, '2013-09-09 22:32:50', 0, '2013-09-09 22:32:50', 3, NULL, NULL, '1', '2013-09-09', '1', 'UNA SOLA EXHIBICIÓN', 124.0000, 0.0000, 143.8400, NULL, 'EMITIDA', NULL, 'NO', 'NO'),
(2, 2, 'SI', 0, '2013-09-09 22:40:50', 0, '2013-09-09 22:40:50', 3, NULL, NULL, '2', '2013-09-09', '1', 'UNA SOLA EXHIBICIÓN', 135.0000, 0.0000, 156.6000, NULL, 'EMITIDA', NULL, 'NO', 'NO'),
(3, 2, 'SI', 0, '2013-09-09 22:52:02', NULL, '2013-09-09 22:58:28', 4, NULL, 'A', '32', '2013-09-09', '12', 'UNA SOLA EXHIBICIÓN', 12.0000, 0.0000, 13.9200, NULL, 'CANCELADA', NULL, 'NO', 'NO'),
(4, 2, 'SI', 0, '2013-09-16 18:05:19', NULL, '2013-09-16 18:06:34', 4, NULL, 'A', '33', '2013-09-16', '12', 'UNA SOLA EXHIBICIÓN', NULL, 0.0000, NULL, NULL, 'CANCELADA', NULL, 'NO', 'NO'),
(5, 2, 'SI', 0, '2013-09-16 18:07:10', 0, '2013-09-16 18:07:10', 4, NULL, 'A', '34', '2013-09-16', '12', 'UNA SOLA EXHIBICIÓN', 100.0000, 0.0000, 116.0000, NULL, 'EMITIDA', NULL, 'NO', 'NO'),
(6, 2, 'SI', 0, '2013-09-16 18:11:42', 0, '2013-09-16 18:11:42', 4, NULL, 'A', '35', '2013-09-16', '12', 'UNA SOLA EXHIBICIÓN', 1.0000, 0.0000, 1.1600, NULL, 'EMITIDA', NULL, 'NO', 'NO');

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
  `serie` varchar(25) DEFAULT NULL,
  `inicial` int(11) DEFAULT NULL,
  `final` int(11) DEFAULT NULL,
  `actual` int(11) DEFAULT NULL,
  `fecha_recepcion` date DEFAULT NULL,
  `numero_aprobacion` varchar(15) DEFAULT NULL,
  `tipo_documento` varchar(25) DEFAULT NULL,
  `cbb` varchar(25) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `cbb_folio`
--

INSERT INTO `cbb_folio` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `serie`, `inicial`, `final`, `actual`, `fecha_recepcion`, `numero_aprobacion`, `tipo_documento`, `cbb`) VALUES
(2, 34, 'SI', 0, '2013-09-01 17:45:50', NULL, '2013-09-01 17:45:50', 'A', 1, 111, 11, '2013-09-01', '1', 'FACTURA', '2.jpg'),
(3, 2, 'SI', 0, '2013-09-09 22:32:02', NULL, '2013-09-09 22:32:02', NULL, 1, 12, 3, '2013-09-09', '1', 'FACTURA', '3.jpg');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `cbb_impuesto`
--

INSERT INTO `cbb_impuesto` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `cbb_id`, `nombre`, `tasa`, `importe`, `tipo`) VALUES
(1, 2, 'SI', 0, '2013-09-09 22:32:50', 0, '2013-09-09 22:32:50', 1, 'IVA', 16, 19.84, 'TRASLADADO'),
(2, 2, 'SI', 0, '2013-09-09 22:40:50', 0, '2013-09-09 22:40:50', 2, 'IVA', 16, 21.60, 'TRASLADADO'),
(3, 2, 'SI', 0, '2013-09-09 22:52:02', 0, '2013-09-09 22:52:02', 3, 'IVA', 16, 1.92, 'TRASLADADO'),
(4, 2, 'SI', 0, '2013-09-16 18:07:10', 0, '2013-09-16 18:07:10', 5, 'IVA', 16, 16.00, 'TRASLADADO'),
(5, 2, 'SI', 0, '2013-09-16 18:11:42', 0, '2013-09-16 18:11:42', 6, 'IVA', 16, 0.16, 'TRASLADADO');

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
  `exterior` varchar(25) DEFAULT NULL,
  `interior` varchar(10) DEFAULT NULL,
  `colonia` varchar(50) DEFAULT NULL,
  `localidad` varchar(50) DEFAULT NULL,
  `municipio` varchar(50) DEFAULT NULL,
  `estado` varchar(25) DEFAULT NULL,
  `pais` varchar(25) DEFAULT NULL,
  `cpostal` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `cbb_receptor`
--

INSERT INTO `cbb_receptor` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `cbb_id`, `rfc`, `nombre`, `calle`, `exterior`, `interior`, `colonia`, `localidad`, `municipio`, `estado`, `pais`, `cpostal`) VALUES
(1, 2, 'SI', 0, '2013-09-09 22:32:50', 0, '2013-09-09 22:32:50', 1, 'XAXX000000XXX', 'CLIENTE GENERICO', 'CONOCIDO', 'S/N', NULL, NULL, NULL, 'CIUDAD DE MEXICO', 'DISTRITO FEDERAL', 'MÉXICO', '06000'),
(2, 2, 'SI', 0, '2013-09-09 22:40:50', 0, '2013-09-09 22:40:50', 2, 'XAXX000000XXX', 'CLIENTE GENERICO', 'CONOCIDO', 'S/N', NULL, NULL, NULL, 'CIUDAD DE MEXICO', 'DISTRITO FEDERAL', 'MÉXICO', '06000'),
(3, 2, 'SI', 0, '2013-09-09 22:52:02', 0, '2013-09-09 22:52:02', 3, 'XAXX000000XXX', 'CLIENTE GENERICO', 'CONOCIDO', 'S/N', NULL, NULL, NULL, 'CIUDAD DE MEXICO', 'DISTRITO FEDERAL', 'MÉXICO', '06000'),
(4, 2, 'SI', 0, '2013-09-16 18:05:19', 0, '2013-09-16 18:05:19', 4, 'XAXX000000XXX', 'CLIENTE GENERICO', 'CONOCIDO', 'S/N', NULL, NULL, NULL, 'CIUDAD DE MEXICO', 'DISTRITO FEDERAL', 'MÉXICO', '06000'),
(5, 2, 'SI', 0, '2013-09-16 18:07:10', 0, '2013-09-16 18:07:10', 5, 'XAXX000000XXX', 'CLIENTE GENERICO', 'CONOCIDO', 'S/N', NULL, NULL, NULL, 'CIUDAD DE MEXICO', 'DISTRITO FEDERAL', 'MÉXICO', '06000'),
(6, 2, 'SI', 0, '2013-09-16 18:11:42', 0, '2013-09-16 18:11:42', 6, 'XAXX000000XXX', 'CLIENTE GENERICO', 'CONOCIDO', 'S/N', NULL, NULL, NULL, 'CIUDAD DE MEXICO', 'DISTRITO FEDERAL', 'MÉXICO', '06000');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Volcado de datos para la tabla `certificado`
--

INSERT INTO `certificado` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `fecha_emision`, `fecha_vencimiento`, `numero_serie`, `clave_privada`, `archivo_key`, `archivo_cer`) VALUES
(12, 34, 'NO', 0, '2013-09-01 14:41:47', 0, '2013-09-01 14:41:47', '2013-09-01', '2013-09-01', '0000', 'TEST', '0000.key', '0000.cer'),
(14, 34, 'NO', 0, '2013-09-01 14:41:55', 0, '2013-09-01 14:41:55', '2013-09-01', '2013-09-01', '0002', 'TEST', '0002.key', '0002.cer'),
(17, 34, 'NO', 0, '2013-09-01 19:07:28', 0, '2013-09-01 19:07:28', '2013-09-01', '2013-09-01', '0005', 'TEST', '0005.key', '0005.cer'),
(18, 34, 'SI', 0, '2013-09-01 19:07:34', 0, '2013-09-01 19:07:34', '2013-09-01', '2013-09-01', '0008', 'TEST', '0008.key', '0008.cer');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cfdi_concepto`
--

DROP TABLE IF EXISTS `cfdi_concepto`;
CREATE TABLE IF NOT EXISTS `cfdi_concepto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuenta_id` int(11) NOT NULL,
  `activo` varchar(2) DEFAULT 'SI',
  `usuario_creacion_id` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_edicion_id` int(11) DEFAULT NULL,
  `fecha_edicion` datetime DEFAULT NULL,
  `cfdi_id` int(11) NOT NULL,
  `cantidad` decimal(16,4) DEFAULT NULL,
  `unidad` varchar(50) DEFAULT NULL,
  `no_identificacion` int(11) DEFAULT NULL,
  `descripcion` text,
  `precio_unitario` decimal(16,4) DEFAULT NULL,
  `descuento` decimal(16,4) DEFAULT NULL,
  `importe` decimal(16,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `cfdi_concepto`
--

INSERT INTO `cfdi_concepto` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `cfdi_id`, `cantidad`, `unidad`, `no_identificacion`, `descripcion`, `precio_unitario`, `descuento`, `importe`) VALUES
(1, 34, 'SI', 0, '2013-09-01 18:33:16', NULL, '2013-09-01 18:33:16', 129, 2.0000, 'PIEZA', NULL, 'TEST2', 123.0000, 0.0000, 246.0000),
(2, 34, 'SI', 0, '2013-09-01 18:35:21', NULL, '2013-09-01 18:35:21', 130, 3.0000, 'PIEZA', NULL, 'TEST', 150.0000, 0.0000, 450.0000),
(3, 34, 'SI', 0, '2013-09-01 19:01:45', NULL, '2013-09-01 19:01:45', 131, 15.0000, 'PIEZA', NULL, 'TEST', 150.0000, 0.0000, 2250.0000),
(4, 34, 'SI', 0, '2013-09-01 19:05:39', NULL, '2013-09-01 19:05:39', 132, 2.0000, 'PIEZA', NULL, 'TEST2', 123.0000, 0.0000, 246.0000),
(5, 34, 'SI', 0, '2013-09-01 19:05:39', NULL, '2013-09-01 19:05:39', 132, 1.0000, 'PIEZA', NULL, 'TEST', 150.0000, 0.0000, 150.0000),
(6, 34, 'SI', 0, '2013-09-01 19:09:25', NULL, '2013-09-01 19:09:25', 133, 2.0000, 'PIEZA', NULL, 'TEST2', 123.0000, 0.0000, 246.0000),
(7, 34, 'SI', 0, '2013-09-01 19:29:07', NULL, '2013-09-01 19:29:07', 134, 12.0000, 'PIEZA', NULL, 'TEST2', 123.0000, 0.0000, 1476.0000),
(8, 34, 'SI', 0, '2013-09-01 19:31:35', NULL, '2013-09-01 19:31:35', 135, 12.0000, 'PIEZA', NULL, 'TEST2', 123.0000, 0.0000, 1476.0000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cfdi_emisor`
--

DROP TABLE IF EXISTS `cfdi_emisor`;
CREATE TABLE IF NOT EXISTS `cfdi_emisor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuenta_id` int(11) NOT NULL,
  `activo` varchar(2) DEFAULT 'SI',
  `usuario_creacion_id` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_edicion_id` int(11) DEFAULT NULL,
  `fecha_edicion` datetime DEFAULT NULL,
  `cfdi_id` int(11) NOT NULL,
  `rfc` varchar(15) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `calle` varchar(100) DEFAULT NULL,
  `exterior` varchar(25) DEFAULT NULL,
  `interior` varchar(10) DEFAULT NULL,
  `colonia` varchar(50) DEFAULT NULL,
  `localidad` varchar(50) DEFAULT NULL,
  `referencia` text,
  `municipio` varchar(50) DEFAULT NULL,
  `estado` varchar(25) DEFAULT NULL,
  `pais` varchar(25) DEFAULT NULL,
  `cpostal` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `cfdi_emisor`
--

INSERT INTO `cfdi_emisor` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `cfdi_id`, `rfc`, `nombre`, `calle`, `exterior`, `interior`, `colonia`, `localidad`, `referencia`, `municipio`, `estado`, `pais`, `cpostal`) VALUES
(1, 34, 'SI', 0, '2013-09-01 19:31:35', 0, '2013-09-01 19:31:35', 135, 'TEST400040000', 'TEST 4', 'AVENIDA PATRIA', '22', NULL, 'HEROES', 'ZAPOPAN', NULL, 'ZAPOPAN', 'JALISCO', 'HOLAMÉXICO', '45098');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cfdi_factura`
--

DROP TABLE IF EXISTS `cfdi_factura`;
CREATE TABLE IF NOT EXISTS `cfdi_factura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuenta_id` int(11) NOT NULL,
  `activo` varchar(2) DEFAULT 'SI',
  `usuario_creacion_id` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_edicion_id` int(11) DEFAULT NULL,
  `fecha_edicion` datetime DEFAULT NULL,
  `cfdi_folios_id` int(11) DEFAULT NULL,
  `sucursal_id` int(11) DEFAULT NULL,
  `serie` varchar(25) DEFAULT NULL,
  `folio` varchar(25) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `sello` text,
  `no_certificado` varchar(25) DEFAULT NULL,
  `certificado` text,
  `condiciones_pago` text,
  `forma_pago` varchar(50) DEFAULT NULL,
  `subtotal` decimal(16,4) DEFAULT '0.0000',
  `descuento` decimal(16,4) DEFAULT '0.0000',
  `motivo_descuento` text,
  `tipo_cambio` decimal(16,4) DEFAULT NULL,
  `moneda` varchar(3) DEFAULT NULL,
  `total` decimal(16,4) DEFAULT '0.0000',
  `tipo_comprobante` varchar(25) DEFAULT NULL,
  `metodo_pago` varchar(25) DEFAULT NULL,
  `lugar_expedicion` text,
  `numero_cuenta_pago` varchar(25) DEFAULT NULL,
  `folio_fiscal_original` varchar(25) DEFAULT NULL,
  `serie_folio_fiscal_original` varchar(25) DEFAULT NULL,
  `fecha_folio_fiscal_orinial` date DEFAULT NULL,
  `monto_folio_fiscal_original` decimal(16,4) DEFAULT NULL,
  `comentarios` tinytext,
  `status` varchar(10) DEFAULT 'EMITIDA',
  `motivo_cancelacion` varchar(255) DEFAULT NULL,
  `pago` varchar(2) DEFAULT 'NO',
  `envio` varchar(2) DEFAULT 'NO',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=136 ;

--
-- Volcado de datos para la tabla `cfdi_factura`
--

INSERT INTO `cfdi_factura` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `cfdi_folios_id`, `sucursal_id`, `serie`, `folio`, `fecha`, `sello`, `no_certificado`, `certificado`, `condiciones_pago`, `forma_pago`, `subtotal`, `descuento`, `motivo_descuento`, `tipo_cambio`, `moneda`, `total`, `tipo_comprobante`, `metodo_pago`, `lugar_expedicion`, `numero_cuenta_pago`, `folio_fiscal_original`, `serie_folio_fiscal_original`, `fecha_folio_fiscal_orinial`, `monto_folio_fiscal_original`, `comentarios`, `status`, `motivo_cancelacion`, `pago`, `envio`) VALUES
(130, 34, 'SI', 0, '2013-09-01 18:35:21', 0, '2013-09-01 18:35:21', 1, NULL, 'A', '11', '2013-09-01', NULL, NULL, NULL, NULL, 'UNA SOLA EXHIBICIÓN', 450.0000, 0.0000, NULL, NULL, NULL, 522.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'EMITIDA', NULL, 'NO', 'NO'),
(131, 34, 'SI', 0, '2013-09-01 19:01:45', 0, '2013-09-01 19:01:45', 1, NULL, 'A', '12', '2013-09-01', 'pnDmZwX0Tp+AXoDPuA1hs5n0pMRONzJ7F45gIHoY7sqnfhRvzuZRGqPHnxJPzvgPeDKVrYNYNr6XHICHhzTcdy+Mpj7DPWCb0KBYUu/STuZM/jLTPuX9wrMcPPGbhsQpj1pDhQRzxxd8nRJLAI8SN+qIRE3DW4YnbfRMHSI6iJ8=', NULL, 'MIIE1jCCA76gAwIBAgIUMDAwMDEwMDAwMDAyMDE0NzU2MTEwDQYJKoZIhvcNAQEFBQAwggGVMTgwNgYDVQQDDC9BLkMuIGRlbCBTZXJ2aWNpbyBkZSBBZG1pbmlzdHJhY2nDs24gVHJpYnV0YXJpYTEvMC0GA1UECgwmU2VydmljaW8gZGUgQWRtaW5pc3RyYWNpw7NuIFRyaWJ1dGFyaWExODA2BgNVBAsML0FkbWluaXN0cmFjacOzbiBkZSBTZWd1cmlkYWQgZGUgbGEgSW5mb3JtYWNpw7NuMSEwHwYJKoZIhvcNAQkBFhJhc2lzbmV0QHNhdC5nb2IubXgxJjAkBgNVBAkMHUF2LiBIaWRhbGdvIDc3LCBDb2wuIEd1ZXJyZXJvMQ4wDAYDVQQRDAUwNjMwMDELMAkGA1UEBhMCTVgxGTAXBgNVBAgMEERpc3RyaXRvIEZlZGVyYWwxFDASBgNVBAcMC0N1YXVodMOpbW9jMRUwEwYDVQQtEwxTQVQ5NzA3MDFOTjMxPjA8BgkqhkiG9w0BCQIML1Jlc3BvbnNhYmxlOiBDZWNpbGlhIEd1aWxsZXJtaW5hIEdhcmPDrWEgR3VlcnJhMB4XDTEyMDcwMzE4MzA1NVoXDTE2MDcwMzE4MzA1NVowggEWMT8wPQYDVQQDEzZBTkFMSVNJUyBDTElOSUNPUyBZIFJBWU9TIFggREUgT0NDSURFTlRFIFMgREUgUkwgREUgQ1YxPzA9BgNVBCkTNkFOQUxJU0lTIENMSU5JQ09TIFkgUkFZT1MgWCBERSBPQ0NJREVOVEUgUyBERSBSTCBERSBDVjE/MD0GA1UEChM2QU5BTElTSVMgQ0xJTklDT1MgWSBSQVlPUyBYIERFIE9DQ0lERU5URSBTIERFIFJMIERFIENWMSUwIwYDVQQtExxBQ1IwNTExMTFJNDcgLyBMRUdKNTkwNDI4NlgyMR4wHAYDVQQFExUgLyBMRUdKNTkwNDI4SEpDRE1SMDIxCjAIBgNVBAsTAUQwgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBALoFbuiR7tU9QZL3jetHt5FiP9HNuD7WQi+ZZSQD8lotjLNp1l9hWLqLjh6LC8Qbo2878QBGmJDcBwGXg/vzDmzqrAhC/fs0UHA/uMgv5A6q4R0okOsbVTKatq5IzWOBAoJHqUm9o2ByvqgSkfXWctZuBQ14zbB+8LY+/At9i2UDAgMBAAGjHTAbMAwGA1UdEwEB/wQCMAAwCwYDVR0PBAQDAgbAMA0GCSqGSIb3DQEBBQUAA4IBAQCW6CSof1MRIAizAaLxVZpkoVl+y03eNDSx9o9t4Q0NrEAAS/KaAHD1gOm3YFfwDdP7wPX15qG5UoJ0UCiLfrK97ct7kZMOukPAW+uPx9NnabJ+eh0x5JCtRPJ64Upvpd/ccSowHC7H2Gtr21Bvr1eZstXsSsGzC95g5XOPRQJFlhQ4DnDo+RSg0E1CBPLh1SS4lPfnsPdD16X53ldjSM52YHLPTOjeD/Ze+QdmI/vubboU3gCmTLNybethO83zKscF1IFXLYViT2UvQiQBXwbWElwUQPCGRWZ34TMWcy+e0+n3pCcjPd4bn/k1YIwUMvDFymtqjaZz20gQst4ufsBd', NULL, 'UNA SOLA EXHIBICIÓN', 2250.0000, 0.0000, NULL, 1.0000, 'MXN', 2610.0000, 'INGRESO', 'EFECTIVO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'EMITIDA', NULL, 'NO', 'NO'),
(132, 34, 'SI', 0, '2013-09-01 19:05:39', 0, '2013-09-01 19:05:39', 1, NULL, 'A', '13', '2013-09-01', 'pnDmZwX0Tp+AXoDPuA1hs5n0pMRONzJ7F45gIHoY7sqnfhRvzuZRGqPHnxJPzvgPeDKVrYNYNr6XHICHhzTcdy+Mpj7DPWCb0KBYUu/STuZM/jLTPuX9wrMcPPGbhsQpj1pDhQRzxxd8nRJLAI8SN+qIRE3DW4YnbfRMHSI6iJ8=', NULL, 'MIIE1jCCA76gAwIBAgIUMDAwMDEwMDAwMDAyMDE0NzU2MTEwDQYJKoZIhvcNAQEFBQAwggGVMTgwNgYDVQQDDC9BLkMuIGRlbCBTZXJ2aWNpbyBkZSBBZG1pbmlzdHJhY2nDs24gVHJpYnV0YXJpYTEvMC0GA1UECgwmU2VydmljaW8gZGUgQWRtaW5pc3RyYWNpw7NuIFRyaWJ1dGFyaWExODA2BgNVBAsML0FkbWluaXN0cmFjacOzbiBkZSBTZWd1cmlkYWQgZGUgbGEgSW5mb3JtYWNpw7NuMSEwHwYJKoZIhvcNAQkBFhJhc2lzbmV0QHNhdC5nb2IubXgxJjAkBgNVBAkMHUF2LiBIaWRhbGdvIDc3LCBDb2wuIEd1ZXJyZXJvMQ4wDAYDVQQRDAUwNjMwMDELMAkGA1UEBhMCTVgxGTAXBgNVBAgMEERpc3RyaXRvIEZlZGVyYWwxFDASBgNVBAcMC0N1YXVodMOpbW9jMRUwEwYDVQQtEwxTQVQ5NzA3MDFOTjMxPjA8BgkqhkiG9w0BCQIML1Jlc3BvbnNhYmxlOiBDZWNpbGlhIEd1aWxsZXJtaW5hIEdhcmPDrWEgR3VlcnJhMB4XDTEyMDcwMzE4MzA1NVoXDTE2MDcwMzE4MzA1NVowggEWMT8wPQYDVQQDEzZBTkFMSVNJUyBDTElOSUNPUyBZIFJBWU9TIFggREUgT0NDSURFTlRFIFMgREUgUkwgREUgQ1YxPzA9BgNVBCkTNkFOQUxJU0lTIENMSU5JQ09TIFkgUkFZT1MgWCBERSBPQ0NJREVOVEUgUyBERSBSTCBERSBDVjE/MD0GA1UEChM2QU5BTElTSVMgQ0xJTklDT1MgWSBSQVlPUyBYIERFIE9DQ0lERU5URSBTIERFIFJMIERFIENWMSUwIwYDVQQtExxBQ1IwNTExMTFJNDcgLyBMRUdKNTkwNDI4NlgyMR4wHAYDVQQFExUgLyBMRUdKNTkwNDI4SEpDRE1SMDIxCjAIBgNVBAsTAUQwgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBALoFbuiR7tU9QZL3jetHt5FiP9HNuD7WQi+ZZSQD8lotjLNp1l9hWLqLjh6LC8Qbo2878QBGmJDcBwGXg/vzDmzqrAhC/fs0UHA/uMgv5A6q4R0okOsbVTKatq5IzWOBAoJHqUm9o2ByvqgSkfXWctZuBQ14zbB+8LY+/At9i2UDAgMBAAGjHTAbMAwGA1UdEwEB/wQCMAAwCwYDVR0PBAQDAgbAMA0GCSqGSIb3DQEBBQUAA4IBAQCW6CSof1MRIAizAaLxVZpkoVl+y03eNDSx9o9t4Q0NrEAAS/KaAHD1gOm3YFfwDdP7wPX15qG5UoJ0UCiLfrK97ct7kZMOukPAW+uPx9NnabJ+eh0x5JCtRPJ64Upvpd/ccSowHC7H2Gtr21Bvr1eZstXsSsGzC95g5XOPRQJFlhQ4DnDo+RSg0E1CBPLh1SS4lPfnsPdD16X53ldjSM52YHLPTOjeD/Ze+QdmI/vubboU3gCmTLNybethO83zKscF1IFXLYViT2UvQiQBXwbWElwUQPCGRWZ34TMWcy+e0+n3pCcjPd4bn/k1YIwUMvDFymtqjaZz20gQst4ufsBd', NULL, 'UNA SOLA EXHIBICIÓN', 396.0000, 0.0000, NULL, 1.0000, 'MXN', 459.3600, 'INGRESO', 'EFECTIVO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'EMITIDA', NULL, 'NO', 'NO'),
(133, 34, 'SI', 0, '2013-09-01 19:09:25', 0, '2013-09-01 19:09:25', 1, NULL, 'A', '14', '2013-09-01', 'pnDmZwX0Tp+AXoDPuA1hs5n0pMRONzJ7F45gIHoY7sqnfhRvzuZRGqPHnxJPzvgPeDKVrYNYNr6XHICHhzTcdy+Mpj7DPWCb0KBYUu/STuZM/jLTPuX9wrMcPPGbhsQpj1pDhQRzxxd8nRJLAI8SN+qIRE3DW4YnbfRMHSI6iJ8=', '0008', 'MIIE1jCCA76gAwIBAgIUMDAwMDEwMDAwMDAyMDE0NzU2MTEwDQYJKoZIhvcNAQEFBQAwggGVMTgwNgYDVQQDDC9BLkMuIGRlbCBTZXJ2aWNpbyBkZSBBZG1pbmlzdHJhY2nDs24gVHJpYnV0YXJpYTEvMC0GA1UECgwmU2VydmljaW8gZGUgQWRtaW5pc3RyYWNpw7NuIFRyaWJ1dGFyaWExODA2BgNVBAsML0FkbWluaXN0cmFjacOzbiBkZSBTZWd1cmlkYWQgZGUgbGEgSW5mb3JtYWNpw7NuMSEwHwYJKoZIhvcNAQkBFhJhc2lzbmV0QHNhdC5nb2IubXgxJjAkBgNVBAkMHUF2LiBIaWRhbGdvIDc3LCBDb2wuIEd1ZXJyZXJvMQ4wDAYDVQQRDAUwNjMwMDELMAkGA1UEBhMCTVgxGTAXBgNVBAgMEERpc3RyaXRvIEZlZGVyYWwxFDASBgNVBAcMC0N1YXVodMOpbW9jMRUwEwYDVQQtEwxTQVQ5NzA3MDFOTjMxPjA8BgkqhkiG9w0BCQIML1Jlc3BvbnNhYmxlOiBDZWNpbGlhIEd1aWxsZXJtaW5hIEdhcmPDrWEgR3VlcnJhMB4XDTEyMDcwMzE4MzA1NVoXDTE2MDcwMzE4MzA1NVowggEWMT8wPQYDVQQDEzZBTkFMSVNJUyBDTElOSUNPUyBZIFJBWU9TIFggREUgT0NDSURFTlRFIFMgREUgUkwgREUgQ1YxPzA9BgNVBCkTNkFOQUxJU0lTIENMSU5JQ09TIFkgUkFZT1MgWCBERSBPQ0NJREVOVEUgUyBERSBSTCBERSBDVjE/MD0GA1UEChM2QU5BTElTSVMgQ0xJTklDT1MgWSBSQVlPUyBYIERFIE9DQ0lERU5URSBTIERFIFJMIERFIENWMSUwIwYDVQQtExxBQ1IwNTExMTFJNDcgLyBMRUdKNTkwNDI4NlgyMR4wHAYDVQQFExUgLyBMRUdKNTkwNDI4SEpDRE1SMDIxCjAIBgNVBAsTAUQwgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBALoFbuiR7tU9QZL3jetHt5FiP9HNuD7WQi+ZZSQD8lotjLNp1l9hWLqLjh6LC8Qbo2878QBGmJDcBwGXg/vzDmzqrAhC/fs0UHA/uMgv5A6q4R0okOsbVTKatq5IzWOBAoJHqUm9o2ByvqgSkfXWctZuBQ14zbB+8LY+/At9i2UDAgMBAAGjHTAbMAwGA1UdEwEB/wQCMAAwCwYDVR0PBAQDAgbAMA0GCSqGSIb3DQEBBQUAA4IBAQCW6CSof1MRIAizAaLxVZpkoVl+y03eNDSx9o9t4Q0NrEAAS/KaAHD1gOm3YFfwDdP7wPX15qG5UoJ0UCiLfrK97ct7kZMOukPAW+uPx9NnabJ+eh0x5JCtRPJ64Upvpd/ccSowHC7H2Gtr21Bvr1eZstXsSsGzC95g5XOPRQJFlhQ4DnDo+RSg0E1CBPLh1SS4lPfnsPdD16X53ldjSM52YHLPTOjeD/Ze+QdmI/vubboU3gCmTLNybethO83zKscF1IFXLYViT2UvQiQBXwbWElwUQPCGRWZ34TMWcy+e0+n3pCcjPd4bn/k1YIwUMvDFymtqjaZz20gQst4ufsBd', NULL, 'UNA SOLA EXHIBICIÓN', 246.0000, 0.0000, NULL, 1.0000, 'MXN', 285.3600, 'INGRESO', 'EFECTIVO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'EMITIDA', NULL, 'NO', 'NO'),
(134, 34, 'SI', 0, '2013-09-01 19:29:07', 0, '2013-09-01 19:29:07', 1, NULL, 'A', '15', '2013-09-01', 'pnDmZwX0Tp+AXoDPuA1hs5n0pMRONzJ7F45gIHoY7sqnfhRvzuZRGqPHnxJPzvgPeDKVrYNYNr6XHICHhzTcdy+Mpj7DPWCb0KBYUu/STuZM/jLTPuX9wrMcPPGbhsQpj1pDhQRzxxd8nRJLAI8SN+qIRE3DW4YnbfRMHSI6iJ8=', '0008', 'MIIE1jCCA76gAwIBAgIUMDAwMDEwMDAwMDAyMDE0NzU2MTEwDQYJKoZIhvcNAQEFBQAwggGVMTgwNgYDVQQDDC9BLkMuIGRlbCBTZXJ2aWNpbyBkZSBBZG1pbmlzdHJhY2nDs24gVHJpYnV0YXJpYTEvMC0GA1UECgwmU2VydmljaW8gZGUgQWRtaW5pc3RyYWNpw7NuIFRyaWJ1dGFyaWExODA2BgNVBAsML0FkbWluaXN0cmFjacOzbiBkZSBTZWd1cmlkYWQgZGUgbGEgSW5mb3JtYWNpw7NuMSEwHwYJKoZIhvcNAQkBFhJhc2lzbmV0QHNhdC5nb2IubXgxJjAkBgNVBAkMHUF2LiBIaWRhbGdvIDc3LCBDb2wuIEd1ZXJyZXJvMQ4wDAYDVQQRDAUwNjMwMDELMAkGA1UEBhMCTVgxGTAXBgNVBAgMEERpc3RyaXRvIEZlZGVyYWwxFDASBgNVBAcMC0N1YXVodMOpbW9jMRUwEwYDVQQtEwxTQVQ5NzA3MDFOTjMxPjA8BgkqhkiG9w0BCQIML1Jlc3BvbnNhYmxlOiBDZWNpbGlhIEd1aWxsZXJtaW5hIEdhcmPDrWEgR3VlcnJhMB4XDTEyMDcwMzE4MzA1NVoXDTE2MDcwMzE4MzA1NVowggEWMT8wPQYDVQQDEzZBTkFMSVNJUyBDTElOSUNPUyBZIFJBWU9TIFggREUgT0NDSURFTlRFIFMgREUgUkwgREUgQ1YxPzA9BgNVBCkTNkFOQUxJU0lTIENMSU5JQ09TIFkgUkFZT1MgWCBERSBPQ0NJREVOVEUgUyBERSBSTCBERSBDVjE/MD0GA1UEChM2QU5BTElTSVMgQ0xJTklDT1MgWSBSQVlPUyBYIERFIE9DQ0lERU5URSBTIERFIFJMIERFIENWMSUwIwYDVQQtExxBQ1IwNTExMTFJNDcgLyBMRUdKNTkwNDI4NlgyMR4wHAYDVQQFExUgLyBMRUdKNTkwNDI4SEpDRE1SMDIxCjAIBgNVBAsTAUQwgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBALoFbuiR7tU9QZL3jetHt5FiP9HNuD7WQi+ZZSQD8lotjLNp1l9hWLqLjh6LC8Qbo2878QBGmJDcBwGXg/vzDmzqrAhC/fs0UHA/uMgv5A6q4R0okOsbVTKatq5IzWOBAoJHqUm9o2ByvqgSkfXWctZuBQ14zbB+8LY+/At9i2UDAgMBAAGjHTAbMAwGA1UdEwEB/wQCMAAwCwYDVR0PBAQDAgbAMA0GCSqGSIb3DQEBBQUAA4IBAQCW6CSof1MRIAizAaLxVZpkoVl+y03eNDSx9o9t4Q0NrEAAS/KaAHD1gOm3YFfwDdP7wPX15qG5UoJ0UCiLfrK97ct7kZMOukPAW+uPx9NnabJ+eh0x5JCtRPJ64Upvpd/ccSowHC7H2Gtr21Bvr1eZstXsSsGzC95g5XOPRQJFlhQ4DnDo+RSg0E1CBPLh1SS4lPfnsPdD16X53ldjSM52YHLPTOjeD/Ze+QdmI/vubboU3gCmTLNybethO83zKscF1IFXLYViT2UvQiQBXwbWElwUQPCGRWZ34TMWcy+e0+n3pCcjPd4bn/k1YIwUMvDFymtqjaZz20gQst4ufsBd', NULL, 'UNA SOLA EXHIBICIÓN', 1476.0000, 0.0000, NULL, 1.0000, 'MXN', 1712.1600, 'INGRESO', 'EFECTIVO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'EMITIDA', NULL, 'NO', 'NO'),
(135, 34, 'SI', 0, '2013-09-01 19:31:35', 0, '2013-09-01 19:31:35', 1, NULL, 'A', '16', '2013-09-01', 'pnDmZwX0Tp+AXoDPuA1hs5n0pMRONzJ7F45gIHoY7sqnfhRvzuZRGqPHnxJPzvgPeDKVrYNYNr6XHICHhzTcdy+Mpj7DPWCb0KBYUu/STuZM/jLTPuX9wrMcPPGbhsQpj1pDhQRzxxd8nRJLAI8SN+qIRE3DW4YnbfRMHSI6iJ8=', '0008', 'MIIE1jCCA76gAwIBAgIUMDAwMDEwMDAwMDAyMDE0NzU2MTEwDQYJKoZIhvcNAQEFBQAwggGVMTgwNgYDVQQDDC9BLkMuIGRlbCBTZXJ2aWNpbyBkZSBBZG1pbmlzdHJhY2nDs24gVHJpYnV0YXJpYTEvMC0GA1UECgwmU2VydmljaW8gZGUgQWRtaW5pc3RyYWNpw7NuIFRyaWJ1dGFyaWExODA2BgNVBAsML0FkbWluaXN0cmFjacOzbiBkZSBTZWd1cmlkYWQgZGUgbGEgSW5mb3JtYWNpw7NuMSEwHwYJKoZIhvcNAQkBFhJhc2lzbmV0QHNhdC5nb2IubXgxJjAkBgNVBAkMHUF2LiBIaWRhbGdvIDc3LCBDb2wuIEd1ZXJyZXJvMQ4wDAYDVQQRDAUwNjMwMDELMAkGA1UEBhMCTVgxGTAXBgNVBAgMEERpc3RyaXRvIEZlZGVyYWwxFDASBgNVBAcMC0N1YXVodMOpbW9jMRUwEwYDVQQtEwxTQVQ5NzA3MDFOTjMxPjA8BgkqhkiG9w0BCQIML1Jlc3BvbnNhYmxlOiBDZWNpbGlhIEd1aWxsZXJtaW5hIEdhcmPDrWEgR3VlcnJhMB4XDTEyMDcwMzE4MzA1NVoXDTE2MDcwMzE4MzA1NVowggEWMT8wPQYDVQQDEzZBTkFMSVNJUyBDTElOSUNPUyBZIFJBWU9TIFggREUgT0NDSURFTlRFIFMgREUgUkwgREUgQ1YxPzA9BgNVBCkTNkFOQUxJU0lTIENMSU5JQ09TIFkgUkFZT1MgWCBERSBPQ0NJREVOVEUgUyBERSBSTCBERSBDVjE/MD0GA1UEChM2QU5BTElTSVMgQ0xJTklDT1MgWSBSQVlPUyBYIERFIE9DQ0lERU5URSBTIERFIFJMIERFIENWMSUwIwYDVQQtExxBQ1IwNTExMTFJNDcgLyBMRUdKNTkwNDI4NlgyMR4wHAYDVQQFExUgLyBMRUdKNTkwNDI4SEpDRE1SMDIxCjAIBgNVBAsTAUQwgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBALoFbuiR7tU9QZL3jetHt5FiP9HNuD7WQi+ZZSQD8lotjLNp1l9hWLqLjh6LC8Qbo2878QBGmJDcBwGXg/vzDmzqrAhC/fs0UHA/uMgv5A6q4R0okOsbVTKatq5IzWOBAoJHqUm9o2ByvqgSkfXWctZuBQ14zbB+8LY+/At9i2UDAgMBAAGjHTAbMAwGA1UdEwEB/wQCMAAwCwYDVR0PBAQDAgbAMA0GCSqGSIb3DQEBBQUAA4IBAQCW6CSof1MRIAizAaLxVZpkoVl+y03eNDSx9o9t4Q0NrEAAS/KaAHD1gOm3YFfwDdP7wPX15qG5UoJ0UCiLfrK97ct7kZMOukPAW+uPx9NnabJ+eh0x5JCtRPJ64Upvpd/ccSowHC7H2Gtr21Bvr1eZstXsSsGzC95g5XOPRQJFlhQ4DnDo+RSg0E1CBPLh1SS4lPfnsPdD16X53ldjSM52YHLPTOjeD/Ze+QdmI/vubboU3gCmTLNybethO83zKscF1IFXLYViT2UvQiQBXwbWElwUQPCGRWZ34TMWcy+e0+n3pCcjPd4bn/k1YIwUMvDFymtqjaZz20gQst4ufsBd', NULL, 'UNA SOLA EXHIBICIÓN', 1476.0000, 0.0000, NULL, 1.0000, 'MXN', 1712.1600, 'INGRESO', 'EFECTIVO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'EMITIDA', NULL, 'NO', 'NO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cfdi_folio`
--

DROP TABLE IF EXISTS `cfdi_folio`;
CREATE TABLE IF NOT EXISTS `cfdi_folio` (
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
  `cfdi` varchar(25) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `cfdi_folio`
--

INSERT INTO `cfdi_folio` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `serie`, `inicial`, `final`, `actual`, `fecha_recepcion`, `numero_aprobacion`, `tipo_documento`, `cfdi`) VALUES
(1, 34, 'SI', 0, '2013-09-01 18:05:21', NULL, '2013-09-01 18:05:21', 'A', 1, 111, 17, '2013-09-01', '123', 'FACTURA', '1.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cfdi_impuesto`
--

DROP TABLE IF EXISTS `cfdi_impuesto`;
CREATE TABLE IF NOT EXISTS `cfdi_impuesto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuenta_id` int(11) NOT NULL,
  `activo` varchar(2) DEFAULT 'SI',
  `usuario_creacion_id` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_edicion_id` int(11) DEFAULT NULL,
  `fecha_edicion` datetime DEFAULT NULL,
  `cfdi_id` int(11) NOT NULL,
  `nombre` varchar(10) NOT NULL,
  `tasa` tinyint(4) NOT NULL DEFAULT '16',
  `importe` decimal(16,2) NOT NULL,
  `tipo` varchar(25) NOT NULL DEFAULT 'TRASLADADO',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `cfdi_impuesto`
--

INSERT INTO `cfdi_impuesto` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `cfdi_id`, `nombre`, `tasa`, `importe`, `tipo`) VALUES
(1, 34, 'SI', 0, '2013-09-01 18:33:16', 0, '2013-09-01 18:33:16', 129, 'IVA', 16, 39.36, 'TRASLADADO'),
(2, 34, 'SI', 0, '2013-09-01 18:35:21', 0, '2013-09-01 18:35:21', 130, 'IVA', 16, 72.00, 'TRASLADADO'),
(3, 34, 'SI', 0, '2013-09-01 19:01:45', 0, '2013-09-01 19:01:45', 131, 'IVA', 16, 360.00, 'TRASLADADO'),
(4, 34, 'SI', 0, '2013-09-01 19:05:39', 0, '2013-09-01 19:05:39', 132, 'IVA', 16, 63.36, 'TRASLADADO'),
(5, 34, 'SI', 0, '2013-09-01 19:09:25', 0, '2013-09-01 19:09:25', 133, 'IVA', 16, 39.36, 'TRASLADADO'),
(6, 34, 'SI', 0, '2013-09-01 19:29:07', 0, '2013-09-01 19:29:07', 134, 'IVA', 16, 236.16, 'TRASLADADO'),
(7, 34, 'SI', 0, '2013-09-01 19:31:35', 0, '2013-09-01 19:31:35', 135, 'IVA', 16, 236.16, 'TRASLADADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cfdi_receptor`
--

DROP TABLE IF EXISTS `cfdi_receptor`;
CREATE TABLE IF NOT EXISTS `cfdi_receptor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuenta_id` int(11) NOT NULL,
  `activo` varchar(2) DEFAULT 'SI',
  `usuario_creacion_id` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_edicion_id` int(11) DEFAULT NULL,
  `fecha_edicion` datetime DEFAULT NULL,
  `cfdi_id` int(11) NOT NULL,
  `rfc` varchar(15) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `calle` varchar(100) DEFAULT NULL,
  `exterior` varchar(25) DEFAULT NULL,
  `interior` varchar(10) DEFAULT NULL,
  `colonia` varchar(50) DEFAULT NULL,
  `localidad` varchar(50) DEFAULT NULL,
  `referencia` text,
  `municipio` varchar(50) DEFAULT NULL,
  `estado` varchar(25) DEFAULT NULL,
  `pais` varchar(25) DEFAULT NULL,
  `cpostal` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `cfdi_receptor`
--

INSERT INTO `cfdi_receptor` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `cfdi_id`, `rfc`, `nombre`, `calle`, `exterior`, `interior`, `colonia`, `localidad`, `referencia`, `municipio`, `estado`, `pais`, `cpostal`) VALUES
(1, 34, 'SI', 0, '2013-09-01 18:33:16', 0, '2013-09-01 18:33:16', 129, 'XAXX000000XXX', 'CLIENTE GENERICO', 'CONOCIDO', 'S/N', NULL, NULL, NULL, NULL, 'CIUDAD DE MEXICO', 'DISTRITO FEDERAL', 'MÉXICO', '06000'),
(2, 34, 'SI', 0, '2013-09-01 18:35:21', 0, '2013-09-01 18:35:21', 130, 'XAXX000000XXX', 'CLIENTE GENERICO', 'CONOCIDO', 'S/N', NULL, NULL, NULL, NULL, 'CIUDAD DE MEXICO', 'DISTRITO FEDERAL', 'MÉXICO', '06000'),
(3, 34, 'SI', 0, '2013-09-01 19:01:45', 0, '2013-09-01 19:01:45', 131, 'XAXX000000XXX', 'CLIENTE GENERICO', 'CONOCIDO', 'S/N', NULL, NULL, NULL, NULL, 'CIUDAD DE MEXICO', 'DISTRITO FEDERAL', 'MÉXICO', '06000'),
(4, 34, 'SI', 0, '2013-09-01 19:05:39', 0, '2013-09-01 19:05:39', 132, 'XAXX000000XXX', 'CLIENTE GENERICO', 'CONOCIDO', 'S/N', NULL, NULL, NULL, NULL, 'CIUDAD DE MEXICO', 'DISTRITO FEDERAL', 'MÉXICO', '06000'),
(5, 34, 'SI', 0, '2013-09-01 19:09:25', 0, '2013-09-01 19:09:25', 133, 'XAXX000000XXX', 'CLIENTE GENERICO', 'CONOCIDO', 'S/N', NULL, NULL, NULL, NULL, 'CIUDAD DE MEXICO', 'DISTRITO FEDERAL', 'MÉXICO', '06000'),
(6, 34, 'SI', 0, '2013-09-01 19:31:35', 0, '2013-09-01 19:31:35', 135, 'XAXX000000XXX', 'CLIENTE GENERICO', 'CONOCIDO', 'S/N', NULL, NULL, NULL, NULL, 'CIUDAD DE MEXICO', 'DISTRITO FEDERAL', 'MÉXICO', '06000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cfdi_regimen`
--

DROP TABLE IF EXISTS `cfdi_regimen`;
CREATE TABLE IF NOT EXISTS `cfdi_regimen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuenta_id` int(11) NOT NULL,
  `activo` varchar(2) DEFAULT 'SI',
  `usuario_creacion_id` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_edicion_id` int(11) DEFAULT NULL,
  `fecha_edicion` datetime DEFAULT NULL,
  `cfdi_id` int(11) NOT NULL,
  `regimen` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cfdi_sucursal`
--

DROP TABLE IF EXISTS `cfdi_sucursal`;
CREATE TABLE IF NOT EXISTS `cfdi_sucursal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuenta_id` int(11) NOT NULL,
  `activo` varchar(2) DEFAULT 'SI',
  `usuario_creacion_id` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_edicion_id` int(11) DEFAULT NULL,
  `fecha_edicion` datetime DEFAULT NULL,
  `cfdi_id` int(11) NOT NULL,
  `calle` varchar(100) DEFAULT NULL,
  `exterior` varchar(5) DEFAULT NULL,
  `interior` varchar(5) DEFAULT NULL,
  `colonia` varchar(50) DEFAULT NULL,
  `localidad` varchar(50) DEFAULT NULL,
  `referencia` text,
  `municipio` varchar(50) DEFAULT NULL,
  `estado` varchar(25) DEFAULT NULL,
  `pais` varchar(25) DEFAULT NULL,
  `cpostal` varchar(5) DEFAULT NULL,
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
  `exterior` varchar(25) DEFAULT NULL,
  `interior` varchar(10) DEFAULT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `tipo_cliente_id`, `rfc`, `nombre`, `calle`, `exterior`, `interior`, `colonia`, `localidad`, `referencia`, `municipio`, `estado`, `pais`, `cpostal`, `telefono`, `celular`, `correo`, `comentarios`, `fecha_registro_at`) VALUES
(1, 1, 'SI', 0, '2013-07-04 23:04:48', NULL, '2013-07-04 23:04:48', 1, 'XAXX000000XXX', 'CLIENTE GENERICO', 'CONOCIDO', 'S/N', NULL, NULL, NULL, NULL, 'CIUDAD DE MEXICO', 'DISTRITO FEDERAL', 'MÉXICO', '06000', NULL, NULL, NULL, NULL, '2013-07-04 23:04:48'),
(2, 2, 'SI', 0, '2013-07-05 00:59:55', NULL, '2013-07-05 00:59:55', 2, 'XAXX000000XXX', 'CLIENTE GENERICO', 'CONOCIDO', 'S/N', NULL, NULL, NULL, NULL, 'CIUDAD DE MEXICO', 'DISTRITO FEDERAL', 'MÉXICO', '06000', NULL, NULL, NULL, NULL, '2013-07-05 00:59:55'),
(3, 3, 'SI', 0, '2013-07-26 23:04:11', NULL, '2013-07-26 23:04:11', 3, 'XAXX000000XXX', 'CLIENTE GENERICO', 'CONOCIDO', 'S/N', NULL, NULL, NULL, NULL, 'CIUDAD DE MEXICO', 'DISTRITO FEDERAL', 'MÉXICO', '06000', NULL, NULL, NULL, NULL, '2013-07-26 23:04:11'),
(4, 4, 'SI', 0, '2013-07-26 23:53:55', NULL, '2013-07-26 23:53:55', 4, 'XAXX000000XXX', 'CLIENTE GENERICO', 'CONOCIDO', 'S/N', NULL, NULL, NULL, NULL, 'CIUDAD DE MEXICO', 'DISTRITO FEDERAL', 'MÉXICO', '06000', NULL, NULL, NULL, NULL, '2013-07-26 23:53:55'),
(5, 5, 'SI', 0, '2013-08-01 00:34:15', NULL, '2013-08-01 00:34:15', 5, 'XAXX000000XXX', 'CLIENTE GENERICO', 'CONOCIDO', 'S/N', NULL, NULL, NULL, NULL, 'CIUDAD DE MEXICO', 'DISTRITO FEDERAL', 'MÉXICO', '06000', NULL, NULL, NULL, NULL, '2013-08-01 00:34:15'),
(6, 6, 'SI', 0, '2013-08-01 00:35:45', NULL, '2013-08-01 00:35:45', 6, 'XAXX000000XXX', 'CLIENTE GENERICO', 'CONOCIDO', 'S/N', NULL, NULL, NULL, NULL, 'CIUDAD DE MEXICO', 'DISTRITO FEDERAL', 'MÉXICO', '06000', NULL, NULL, NULL, NULL, '2013-08-01 00:35:45'),
(7, 7, 'SI', 0, '2013-08-01 00:37:41', NULL, '2013-08-01 00:37:41', 7, 'XAXX000000XXX', 'CLIENTE GENERICO', 'CONOCIDO', 'S/N', NULL, NULL, NULL, NULL, 'CIUDAD DE MEXICO', 'DISTRITO FEDERAL', 'MÉXICO', '06000', NULL, NULL, NULL, NULL, '2013-08-01 00:37:41'),
(8, 8, 'SI', 0, '2013-08-01 00:39:33', NULL, '2013-08-01 00:39:33', 8, 'XAXX000000XXX', 'CLIENTE GENERICO', 'CONOCIDO', 'S/N', NULL, NULL, NULL, NULL, 'CIUDAD DE MEXICO', 'DISTRITO FEDERAL', 'MÉXICO', '06000', NULL, NULL, NULL, NULL, '2013-08-01 00:39:33'),
(9, 9, 'SI', 0, '2013-08-01 00:46:27', NULL, '2013-08-01 00:46:27', 9, 'XAXX000000XXX', 'CLIENTE GENERICO', 'CONOCIDO', 'S/N', NULL, NULL, NULL, NULL, 'CIUDAD DE MEXICO', 'DISTRITO FEDERAL', 'MÉXICO', '06000', NULL, NULL, NULL, NULL, '2013-08-01 00:46:27'),
(10, 10, 'SI', 0, '2013-08-01 01:24:56', 0, '2013-08-01 01:24:56', 10, 'XAXX000000XXX', 'CLIENTE GENERICO', 'CONOCIDO', 'S/N', NULL, NULL, NULL, NULL, 'CIUDAD DE MEXICO', 'DISTRITO FEDERAL', 'MÉXICO', '06000', NULL, NULL, NULL, NULL, '2013-08-01 01:24:56'),
(11, 11, 'SI', 0, '2013-08-01 02:00:53', 0, '2013-08-01 02:00:53', 11, 'XAXX000000XXX', 'CLIENTE GENERICO', 'CONOCIDO', 'S/N', NULL, NULL, NULL, NULL, 'CIUDAD DE MEXICO', 'DISTRITO FEDERAL', 'MÉXICO', '06000', NULL, NULL, NULL, NULL, '2013-08-01 02:00:53'),
(12, 12, 'SI', 0, '2013-08-02 20:48:54', NULL, '2013-08-02 20:48:54', 12, 'XAXX000000XXX', 'CLIENTE GENERICO', 'CONOCIDO', 'S/N', NULL, NULL, NULL, NULL, 'CIUDAD DE MEXICO', 'DISTRITO FEDERAL', 'MÉXICO', '06000', NULL, NULL, NULL, NULL, '2013-08-02 20:48:54'),
(13, 13, 'SI', 0, '2013-08-02 20:54:42', NULL, '2013-08-02 20:54:42', 13, 'XAXX000000XXX', 'CLIENTE GENERICO', 'CONOCIDO', 'S/N', NULL, NULL, NULL, NULL, 'CIUDAD DE MEXICO', 'DISTRITO FEDERAL', 'MÉXICO', '06000', NULL, NULL, NULL, NULL, '2013-08-02 20:54:42'),
(14, 14, 'SI', 0, '2013-08-02 23:43:49', NULL, '2013-08-02 23:43:49', 14, 'XAXX000000XXX', 'CLIENTE GENERICO', 'CONOCIDO', 'S/N', NULL, NULL, NULL, NULL, 'CIUDAD DE MEXICO', 'DISTRITO FEDERAL', 'MÉXICO', '06000', NULL, NULL, NULL, NULL, '2013-08-02 23:43:49'),
(15, 15, 'SI', 0, '2013-08-02 23:54:22', NULL, '2013-08-02 23:54:22', 15, 'XAXX000000XXX', 'CLIENTE GENERICO', 'CONOCIDO', 'S/N', NULL, NULL, NULL, NULL, 'CIUDAD DE MEXICO', 'DISTRITO FEDERAL', 'MÉXICO', '06000', NULL, NULL, NULL, NULL, '2013-08-02 23:54:22'),
(16, 16, 'SI', 0, '2013-08-03 00:02:51', NULL, '2013-08-03 00:02:51', 16, 'XAXX000000XXX', 'CLIENTE GENERICO', 'CONOCIDO', 'S/N', NULL, NULL, NULL, NULL, 'CIUDAD DE MEXICO', 'DISTRITO FEDERAL', 'MÉXICO', '06000', NULL, NULL, NULL, NULL, '2013-08-03 00:02:51'),
(17, 17, 'SI', 0, '2013-08-03 00:03:56', NULL, '2013-08-03 00:03:56', 17, 'XAXX000000XXX', 'CLIENTE GENERICO', 'CONOCIDO', 'S/N', NULL, NULL, NULL, NULL, 'CIUDAD DE MEXICO', 'DISTRITO FEDERAL', 'MÉXICO', '06000', NULL, NULL, NULL, NULL, '2013-08-03 00:03:56'),
(18, 18, 'SI', 0, '2013-08-03 00:05:51', NULL, '2013-08-03 00:05:51', 18, 'XAXX000000XXX', 'CLIENTE GENERICO', 'CONOCIDO', 'S/N', NULL, NULL, NULL, NULL, 'CIUDAD DE MEXICO', 'DISTRITO FEDERAL', 'MÉXICO', '06000', NULL, NULL, NULL, NULL, '2013-08-03 00:05:51'),
(19, 19, 'SI', 0, '2013-08-03 00:07:58', NULL, '2013-08-03 00:07:58', 19, 'XAXX000000XXX', 'CLIENTE GENERICO', 'CONOCIDO', 'S/N', NULL, NULL, NULL, NULL, 'CIUDAD DE MEXICO', 'DISTRITO FEDERAL', 'MÉXICO', '06000', NULL, NULL, NULL, NULL, '2013-08-03 00:07:58'),
(20, 20, 'SI', 0, '2013-08-03 00:10:41', NULL, '2013-08-03 00:10:41', 20, 'XAXX000000XXX', 'CLIENTE GENERICO', 'CONOCIDO', 'S/N', NULL, NULL, NULL, NULL, 'CIUDAD DE MEXICO', 'DISTRITO FEDERAL', 'MÉXICO', '06000', NULL, NULL, NULL, NULL, '2013-08-03 00:10:41'),
(21, 21, 'SI', 0, '2013-08-03 00:15:04', NULL, '2013-08-03 00:15:04', 21, 'XAXX000000XXX', 'CLIENTE GENERICO', 'CONOCIDO', 'S/N', NULL, NULL, NULL, NULL, 'CIUDAD DE MEXICO', 'DISTRITO FEDERAL', 'MÉXICO', '06000', NULL, NULL, NULL, NULL, '2013-08-03 00:15:04'),
(22, 22, 'SI', 0, '2013-08-03 00:16:40', NULL, '2013-08-03 00:16:40', 22, 'XAXX000000XXX', 'CLIENTE GENERICO', 'CONOCIDO', 'S/N', NULL, NULL, NULL, NULL, 'CIUDAD DE MEXICO', 'DISTRITO FEDERAL', 'MÉXICO', '06000', NULL, NULL, NULL, NULL, '2013-08-03 00:16:40'),
(23, 23, 'SI', 0, '2013-08-03 00:20:31', NULL, '2013-08-03 00:20:31', 23, 'XAXX000000XXX', 'CLIENTE GENERICO', 'CONOCIDO', 'S/N', NULL, NULL, NULL, NULL, 'CIUDAD DE MEXICO', 'DISTRITO FEDERAL', 'MÉXICO', '06000', NULL, NULL, NULL, NULL, '2013-08-03 00:20:31'),
(24, 24, 'SI', 0, '2013-08-03 00:26:36', NULL, '2013-08-03 00:26:36', 24, 'XAXX000000XXX', 'CLIENTE GENERICO', 'CONOCIDO', 'S/N', NULL, NULL, NULL, NULL, 'CIUDAD DE MEXICO', 'DISTRITO FEDERAL', 'MÉXICO', '06000', NULL, NULL, NULL, NULL, '2013-08-03 00:26:36'),
(25, 25, 'SI', 0, '2013-08-03 00:28:06', NULL, '2013-08-03 00:28:06', 25, 'XAXX000000XXX', 'CLIENTE GENERICO', 'CONOCIDO', 'S/N', NULL, NULL, NULL, NULL, 'CIUDAD DE MEXICO', 'DISTRITO FEDERAL', 'MÉXICO', '06000', NULL, NULL, NULL, NULL, '2013-08-03 00:28:06'),
(26, 26, 'SI', 0, '2013-08-03 10:56:30', 0, '2013-08-03 10:56:30', 26, 'XAXX000000XXX', 'CLIENTE GENERICO', 'CONOCIDO', 'S/N', NULL, NULL, NULL, NULL, 'CIUDAD DE MEXICO', 'DISTRITO FEDERAL', 'MÉXICO', '06000', NULL, NULL, NULL, NULL, '2013-08-03 10:56:30'),
(28, 27, 'SI', 0, '2013-08-09 22:32:27', NULL, '2013-08-09 22:32:27', 27, 'XAXX000000XXX', 'CLIENTE GENERICO', 'CONOCIDO', 'S/N', NULL, NULL, NULL, NULL, 'CIUDAD DE MEXICO', 'DISTRITO FEDERAL', 'MÉXICO', '06000', NULL, NULL, NULL, NULL, '2013-08-09 22:32:27'),
(29, 34, 'SI', 0, '2013-08-21 22:14:47', NULL, '2013-08-21 22:14:47', 0, 'XAXX000000XXX', 'CLIENTE GENERICO', 'CONOCIDO', 'S/N', NULL, NULL, NULL, NULL, 'CIUDAD DE MEXICO', 'DISTRITO FEDERAL', 'MÉXICO', '06000', NULL, NULL, NULL, NULL, '2013-08-21 22:14:47');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Volcado de datos para la tabla `cliente_tipo`
--

INSERT INTO `cliente_tipo` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `nombre`, `descripcion`) VALUES
(1, 1, 'SI', 0, '2013-07-04 23:04:48', 0, '2013-07-04 23:04:48', 'NORMAL', 'CLIENTE NORMAL'),
(2, 2, 'SI', 0, '2013-07-05 00:59:55', 0, '2013-07-05 00:59:55', 'NORMAL', 'CLIENTE NORMAL'),
(3, 3, 'SI', 0, '2013-07-26 23:04:11', 0, '2013-07-26 23:04:11', 'NORMAL', 'CLIENTE NORMAL'),
(4, 4, 'SI', 0, '2013-07-26 23:53:55', 0, '2013-07-26 23:53:55', 'NORMAL', 'CLIENTE NORMAL'),
(5, 5, 'SI', 0, '2013-08-01 00:34:15', 0, '2013-08-01 00:34:15', 'NORMAL', 'CLIENTE NORMAL'),
(6, 6, 'SI', 0, '2013-08-01 00:35:45', 0, '2013-08-01 00:35:45', 'NORMAL', 'CLIENTE NORMAL'),
(7, 7, 'SI', 0, '2013-08-01 00:37:41', 0, '2013-08-01 00:37:41', 'NORMAL', 'CLIENTE NORMAL'),
(8, 8, 'SI', 0, '2013-08-01 00:39:33', 0, '2013-08-01 00:39:33', 'NORMAL', 'CLIENTE NORMAL'),
(9, 9, 'SI', 0, '2013-08-01 00:46:27', 0, '2013-08-01 00:46:27', 'NORMAL', 'CLIENTE NORMAL'),
(10, 10, 'SI', 0, '2013-08-01 01:24:56', 0, '2013-08-01 01:24:56', 'NORMAL', 'CLIENTE NORMAL'),
(11, 11, 'SI', 0, '2013-08-01 02:00:53', 0, '2013-08-01 02:00:53', 'NORMAL', 'CLIENTE NORMAL'),
(12, 12, 'SI', 0, '2013-08-02 20:48:53', 0, '2013-08-02 20:48:53', 'NORMAL', 'CLIENTE NORMAL'),
(13, 13, 'SI', 0, '2013-08-02 20:54:42', 0, '2013-08-02 20:54:42', 'NORMAL', 'CLIENTE NORMAL'),
(14, 14, 'SI', 0, '2013-08-02 23:43:49', 0, '2013-08-02 23:43:49', 'NORMAL', 'CLIENTE NORMAL'),
(15, 15, 'SI', 0, '2013-08-02 23:54:22', 0, '2013-08-02 23:54:22', 'NORMAL', 'CLIENTE NORMAL'),
(16, 16, 'SI', 0, '2013-08-03 00:02:51', 0, '2013-08-03 00:02:51', 'NORMAL', 'CLIENTE NORMAL'),
(17, 17, 'SI', 0, '2013-08-03 00:03:56', 0, '2013-08-03 00:03:56', 'NORMAL', 'CLIENTE NORMAL'),
(18, 18, 'SI', 0, '2013-08-03 00:05:51', 0, '2013-08-03 00:05:51', 'NORMAL', 'CLIENTE NORMAL'),
(19, 19, 'SI', 0, '2013-08-03 00:07:58', 0, '2013-08-03 00:07:58', 'NORMAL', 'CLIENTE NORMAL'),
(20, 20, 'SI', 0, '2013-08-03 00:10:40', 0, '2013-08-03 00:10:40', 'NORMAL', 'CLIENTE NORMAL'),
(21, 21, 'SI', 0, '2013-08-03 00:15:04', 0, '2013-08-03 00:15:04', 'NORMAL', 'CLIENTE NORMAL'),
(22, 22, 'SI', 0, '2013-08-03 00:16:40', 0, '2013-08-03 00:16:40', 'NORMAL', 'CLIENTE NORMAL'),
(23, 23, 'SI', 0, '2013-08-03 00:20:31', 0, '2013-08-03 00:20:31', 'NORMAL', 'CLIENTE NORMAL'),
(24, 24, 'SI', 0, '2013-08-03 00:26:36', 0, '2013-08-03 00:26:36', 'NORMAL', 'CLIENTE NORMAL'),
(25, 25, 'SI', 0, '2013-08-03 00:28:06', 0, '2013-08-03 00:28:06', 'NORMAL', 'CLIENTE NORMAL'),
(26, 26, 'SI', 0, '2013-08-03 10:56:30', 0, '2013-08-03 10:56:30', 'NORMAL', 'CLIENTE NORMAL'),
(27, 27, 'SI', 0, '2013-08-09 22:32:27', 0, '2013-08-09 22:32:27', 'NORMAL', 'CLIENTE NORMAL'),
(28, 34, 'SI', 0, '2013-08-21 22:14:47', 0, '2013-08-21 22:14:47', 'NORMAL', 'CLIENTE NORMAL');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Volcado de datos para la tabla `contrato`
--

INSERT INTO `contrato` (`id`, `cuenta_id`, `paquete_id`, `inicio`, `fin`, `dia_corte`, `tipo`, `activo`) VALUES
(1, 1, 1, '2013-07-04', '2014-07-04', 3, 'ANUAL', 'SI'),
(2, 2, 2, '2013-07-05', '2014-07-05', 4, 'ANUAL', 'SI'),
(3, 3, 2, '2013-07-26', '2014-07-26', 25, 'ANUAL', 'SI'),
(4, 4, 1, '2013-07-26', '2014-07-26', 25, 'ANUAL', 'SI'),
(5, 5, 1, '2013-08-01', '2014-08-01', 31, 'ANUAL', 'SI'),
(6, 6, 1, '2013-08-01', '2014-08-01', 31, 'ANUAL', 'SI'),
(7, 7, 1, '2013-08-01', '2014-08-01', 31, 'ANUAL', 'SI'),
(8, 8, 1, '2013-08-01', '2014-08-01', 31, 'ANUAL', 'SI'),
(9, 9, 1, '2013-08-01', '2014-08-01', 31, 'ANUAL', 'SI'),
(10, 10, 2, '2013-08-01', '2014-08-01', 31, 'ANUAL', 'SI'),
(11, 11, 1, '2013-08-01', '2014-08-01', 31, 'ANUAL', 'SI'),
(12, 18, 1, '2013-08-03', '2014-08-03', 2, 'ANUAL', 'SI'),
(13, 19, 2, '2013-08-03', '2014-02-01', 2, 'SEMESTRAL', 'SI'),
(14, 20, 1, '2013-08-03', '2014-08-03', 2, 'ANUAL', 'SI'),
(15, 21, 1, '2013-08-03', '2014-08-03', 2, 'ANUAL', 'SI'),
(16, 22, 1, '2013-08-03', '2014-08-03', 2, 'ANUAL', 'SI'),
(17, 23, 1, '2013-08-03', '2014-08-03', 2, 'ANUAL', 'SI'),
(18, 24, 1, '2013-08-03', '2014-08-03', 2, 'ANUAL', 'SI'),
(19, 25, 1, '2013-08-03', '2014-08-03', 2, 'ANUAL', 'SI'),
(20, 26, 1, '2013-08-03', '2013-09-02', 2, 'MENSUAL', 'SI'),
(21, 27, 1, '2013-08-09', '2014-08-09', 8, 'ANUAL', 'SI'),
(22, 34, 4, '2013-08-21', '2014-08-21', 20, 'ANUAL', 'SI');

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
  `exterior` varchar(25) DEFAULT NULL,
  `interior` varchar(10) DEFAULT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Volcado de datos para la tabla `contribuyente`
--

INSERT INTO `contribuyente` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `rfc`, `nombre`, `calle`, `exterior`, `interior`, `colonia`, `localidad`, `municipio`, `estado`, `pais`, `cpostal`, `telefono`, `celular`, `correo`, `nombre_comercial`, `cedula`, `logotipo`) VALUES
(1, 1, 'SI', 0, '2013-07-04 23:04:48', NULL, '2013-07-04 23:04:48', 'XAXX000000XXX', 'CUENTA DE PRUEBA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 2, 'SI', 0, '2013-07-05 00:59:55', NULL, '2013-09-09 22:26:25', 'DEMO200020000', 'CUENTA DEMO', 'JUAREZ', '3723', NULL, 'SAN JAVIER', 'TULANSINGO', 'TULANSINGO', 'HIDALGO', 'HOLAMÉXICO', '38849', NULL, NULL, NULL, NULL, 'demo200020000.png', 'demo200020000.png'),
(3, 3, 'SI', 0, '2013-07-26 23:04:11', NULL, '2013-07-26 23:04:11', 'LIHA851024I63', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 4, 'SI', 0, '2013-07-26 23:53:55', NULL, '2013-07-26 23:53:55', 'LIHA851024I63', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 5, 'SI', 0, '2013-08-01 00:34:15', NULL, '2013-08-01 00:34:15', 'AAAA000000A00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 6, 'SI', 0, '2013-08-01 00:35:45', NULL, '2013-08-01 00:35:45', 'AAAA000000A00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 7, 'SI', 0, '2013-08-01 00:37:41', NULL, '2013-08-01 00:37:41', 'AAAA000000A00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 8, 'SI', 0, '2013-08-01 00:39:33', NULL, '2013-08-01 00:39:33', 'AAAA000000A00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 9, 'SI', 0, '2013-08-01 00:46:27', NULL, '2013-08-01 00:46:27', 'AAAA000000A00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 10, 'SI', 0, '2013-08-01 01:24:56', 0, '2013-08-01 01:24:56', 'QQQQ000000Q00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 11, 'SI', 0, '2013-08-01 02:00:53', 0, '2013-08-01 02:00:53', 'AAAA000000A00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 18, 'SI', 0, '2013-08-03 00:05:51', NULL, '2013-08-03 00:05:51', 'AAAA000000A00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 19, 'SI', 0, '2013-08-03 00:07:58', NULL, '2013-08-03 00:07:58', 'LIHA851024I63', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 20, 'SI', 0, '2013-08-03 00:10:41', NULL, '2013-08-03 00:10:41', 'LIHA851024I63', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 21, 'SI', 0, '2013-08-03 00:15:04', NULL, '2013-08-03 00:15:04', 'AAAA222222Q12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 22, 'SI', 0, '2013-08-03 00:16:40', NULL, '2013-08-03 00:16:40', 'AAAA323232W23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 23, 'SI', 0, '2013-08-03 00:20:31', NULL, '2013-08-03 00:20:31', 'AAAA111111Q12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 24, 'SI', 0, '2013-08-03 00:26:36', NULL, '2013-08-03 00:26:36', 'LIHA851024I63', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 25, 'SI', 0, '2013-08-03 00:28:06', NULL, '2013-08-03 00:28:06', 'LIHA851024I63', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 26, 'SI', 0, '2013-08-03 10:56:30', 0, '2013-08-03 10:56:30', 'LIHA851024I63', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 27, 'SI', 0, '2013-08-09 22:32:27', NULL, '2013-08-09 22:32:27', 'AAA000000A00', 'SDASDAS', 'AAAAA', '1', NULL, 'ASDASSA', 'ADADAD', 'SDASAASD', 'AGUASCALIENTES', 'MÉXICO', '11111', NULL, NULL, NULL, NULL, NULL, NULL),
(22, 34, 'SI', 0, '2013-08-21 22:14:47', NULL, '2013-08-21 22:58:12', 'TEST400040000', 'TEST 4', 'AVENIDA PATRIA', '22', NULL, 'HEROES', 'ZAPOPAN', 'ZAPOPAN', 'JALISCO', 'HOLAMÉXICO', '45098', NULL, NULL, NULL, 'EMISION', 'test400040000.jpg', 'test400040000.jpg');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

--
-- Volcado de datos para la tabla `cuenta`
--

INSERT INTO `cuenta` (`id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `paquete_id`, `rfc`, `nombre`, `usuario`, `password`, `telefono_contacto`, `celular_contacto`, `correo_contacto`, `tipo_contrato`) VALUES
(2, 'SI', 0, '2013-07-05 00:59:55', NULL, '2013-07-05 01:16:28', 2, 'DEMO200020000', 'CUENTA DEMO', 'demo', '89e495e7941cf9e40e6980d14a16bf023ccd4c91', '(333) 333 3333', '(444) 444 4444', 'raalveco@gmail.com', 'ANUAL'),
(3, 'SI', 0, '2013-08-21 21:56:33', 0, '2013-08-21 21:56:33', 4, 'TEST100010000', 'TEST 1', 'admin', NULL, NULL, NULL, NULL, 'ANUAL'),
(4, 'SI', 0, '2013-08-21 22:02:14', 0, '2013-08-21 22:02:14', 4, 'TEST200020000', 'TEST 2', 'admin', NULL, NULL, NULL, NULL, 'ANUAL'),
(5, 'SI', 0, '2013-08-21 22:06:27', 0, '2013-08-21 22:06:27', 4, 'TEST300030000', 'TEST 3', 'admin', NULL, NULL, NULL, NULL, 'ANUAL'),
(34, 'SI', 0, '2013-08-21 22:14:47', NULL, '2013-08-21 22:14:47', 4, 'TEST400040000', 'TEST 4', 'test4', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3', '(444) 444 4444', '(444) 444 4444', 'lizaolaa@gmail.com', 'ANUAL');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Volcado de datos para la tabla `impuesto`
--

INSERT INTO `impuesto` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `nombre`, `descripcion`, `tasa`, `tipo`) VALUES
(1, 1, 'SI', 0, '2013-07-04 23:04:48', 0, '2013-07-04 23:04:48', 'IVA', 'IVA', 16, 'TRASLADADO'),
(2, 2, 'SI', 0, '2013-07-05 00:59:55', 0, '2013-07-05 00:59:55', 'IVA', 'IVA', 16, 'TRASLADADO'),
(3, 3, 'SI', 0, '2013-07-26 23:04:11', 0, '2013-07-26 23:04:11', 'IVA', 'IVA', 16, 'TRASLADADO'),
(4, 4, 'SI', 0, '2013-07-26 23:53:55', 0, '2013-07-26 23:53:55', 'IVA', 'IVA', 16, 'TRASLADADO'),
(5, 5, 'SI', 0, '2013-08-01 00:34:15', 0, '2013-08-01 00:34:15', 'IVA', 'IVA', 16, 'TRASLADADO'),
(6, 6, 'SI', 0, '2013-08-01 00:35:45', 0, '2013-08-01 00:35:45', 'IVA', 'IVA', 16, 'TRASLADADO'),
(7, 7, 'SI', 0, '2013-08-01 00:37:41', 0, '2013-08-01 00:37:41', 'IVA', 'IVA', 16, 'TRASLADADO'),
(8, 8, 'SI', 0, '2013-08-01 00:39:33', 0, '2013-08-01 00:39:33', 'IVA', 'IVA', 16, 'TRASLADADO'),
(9, 9, 'SI', 0, '2013-08-01 00:46:26', 0, '2013-08-01 00:46:26', 'IVA', 'IVA', 16, 'TRASLADADO'),
(10, 10, 'SI', 0, '2013-08-01 01:24:56', 0, '2013-08-01 01:24:56', 'IVA', 'IVA', 16, 'TRASLADADO'),
(11, 11, 'SI', 0, '2013-08-01 02:00:53', 0, '2013-08-01 02:00:53', 'IVA', 'IVA', 16, 'TRASLADADO'),
(12, 12, 'SI', 0, '2013-08-02 20:48:53', 0, '2013-08-02 20:48:53', 'IVA', 'IVA', 16, 'TRASLADADO'),
(13, 13, 'SI', 0, '2013-08-02 20:54:42', 0, '2013-08-02 20:54:42', 'IVA', 'IVA', 16, 'TRASLADADO'),
(14, 14, 'SI', 0, '2013-08-02 23:43:49', 0, '2013-08-02 23:43:49', 'IVA', 'IVA', 16, 'TRASLADADO'),
(15, 15, 'SI', 0, '2013-08-02 23:54:22', 0, '2013-08-02 23:54:22', 'IVA', 'IVA', 16, 'TRASLADADO'),
(16, 16, 'SI', 0, '2013-08-03 00:02:51', 0, '2013-08-03 00:02:51', 'IVA', 'IVA', 16, 'TRASLADADO'),
(17, 17, 'SI', 0, '2013-08-03 00:03:56', 0, '2013-08-03 00:03:56', 'IVA', 'IVA', 16, 'TRASLADADO'),
(18, 18, 'SI', 0, '2013-08-03 00:05:51', 0, '2013-08-03 00:05:51', 'IVA', 'IVA', 16, 'TRASLADADO'),
(19, 19, 'SI', 0, '2013-08-03 00:07:58', 0, '2013-08-03 00:07:58', 'IVA', 'IVA', 16, 'TRASLADADO'),
(20, 20, 'SI', 0, '2013-08-03 00:10:40', 0, '2013-08-03 00:10:40', 'IVA', 'IVA', 16, 'TRASLADADO'),
(21, 21, 'SI', 0, '2013-08-03 00:15:04', 0, '2013-08-03 00:15:04', 'IVA', 'IVA', 16, 'TRASLADADO'),
(22, 22, 'SI', 0, '2013-08-03 00:16:40', 0, '2013-08-03 00:16:40', 'IVA', 'IVA', 16, 'TRASLADADO'),
(23, 23, 'SI', 0, '2013-08-03 00:20:31', 0, '2013-08-03 00:20:31', 'IVA', 'IVA', 16, 'TRASLADADO'),
(24, 24, 'SI', 0, '2013-08-03 00:26:36', 0, '2013-08-03 00:26:36', 'IVA', 'IVA', 16, 'TRASLADADO'),
(25, 25, 'SI', 0, '2013-08-03 00:28:06', 0, '2013-08-03 00:28:06', 'IVA', 'IVA', 16, 'TRASLADADO'),
(26, 26, 'SI', 0, '2013-08-03 10:56:30', 0, '2013-08-03 10:56:30', 'IVA', 'IVA', 16, 'TRASLADADO'),
(27, 27, 'SI', 0, '2013-08-09 22:32:27', 0, '2013-08-09 22:32:27', 'IVA', 'IVA', 16, 'TRASLADADO'),
(28, 34, 'SI', 0, '2013-08-21 22:14:47', 0, '2013-08-21 22:14:47', 'IVA', 'IVA', 16, 'TRASLADADO');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Volcado de datos para la tabla `moneda`
--

INSERT INTO `moneda` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `nombre`, `descripcion`, `tipo_cambio`) VALUES
(1, 1, 'SI', 0, '2013-07-04 23:04:48', 0, '2013-07-04 23:04:48', 'MXN', 'PESO MEXICANO', 1.00),
(2, 2, 'SI', 0, '2013-07-05 00:59:55', 0, '2013-07-05 00:59:55', 'MXN', 'PESO MEXICANO', 1.00),
(3, 3, 'SI', 0, '2013-07-26 23:04:11', 0, '2013-07-26 23:04:11', 'MXN', 'PESO MEXICANO', 1.00),
(4, 4, 'SI', 0, '2013-07-26 23:53:55', 0, '2013-07-26 23:53:55', 'MXN', 'PESO MEXICANO', 1.00),
(5, 5, 'SI', 0, '2013-08-01 00:34:15', 0, '2013-08-01 00:34:15', 'MXN', 'PESO MEXICANO', 1.00),
(6, 6, 'SI', 0, '2013-08-01 00:35:45', 0, '2013-08-01 00:35:45', 'MXN', 'PESO MEXICANO', 1.00),
(7, 7, 'SI', 0, '2013-08-01 00:37:41', 0, '2013-08-01 00:37:41', 'MXN', 'PESO MEXICANO', 1.00),
(8, 8, 'SI', 0, '2013-08-01 00:39:33', 0, '2013-08-01 00:39:33', 'MXN', 'PESO MEXICANO', 1.00),
(9, 9, 'SI', 0, '2013-08-01 00:46:26', 0, '2013-08-01 00:46:26', 'MXN', 'PESO MEXICANO', 1.00),
(10, 10, 'SI', 0, '2013-08-01 01:24:56', 0, '2013-08-01 01:24:56', 'MXN', 'PESO MEXICANO', 1.00),
(11, 11, 'SI', 0, '2013-08-01 02:00:53', 0, '2013-08-01 02:00:53', 'MXN', 'PESO MEXICANO', 1.00),
(12, 12, 'SI', 0, '2013-08-02 20:48:53', 0, '2013-08-02 20:48:53', 'MXN', 'PESO MEXICANO', 1.00),
(13, 13, 'SI', 0, '2013-08-02 20:54:42', 0, '2013-08-02 20:54:42', 'MXN', 'PESO MEXICANO', 1.00),
(14, 14, 'SI', 0, '2013-08-02 23:43:49', 0, '2013-08-02 23:43:49', 'MXN', 'PESO MEXICANO', 1.00),
(15, 15, 'SI', 0, '2013-08-02 23:54:22', 0, '2013-08-02 23:54:22', 'MXN', 'PESO MEXICANO', 1.00),
(16, 16, 'SI', 0, '2013-08-03 00:02:51', 0, '2013-08-03 00:02:51', 'MXN', 'PESO MEXICANO', 1.00),
(17, 17, 'SI', 0, '2013-08-03 00:03:56', 0, '2013-08-03 00:03:56', 'MXN', 'PESO MEXICANO', 1.00),
(18, 18, 'SI', 0, '2013-08-03 00:05:51', 0, '2013-08-03 00:05:51', 'MXN', 'PESO MEXICANO', 1.00),
(19, 19, 'SI', 0, '2013-08-03 00:07:58', 0, '2013-08-03 00:07:58', 'MXN', 'PESO MEXICANO', 1.00),
(20, 20, 'SI', 0, '2013-08-03 00:10:40', 0, '2013-08-03 00:10:40', 'MXN', 'PESO MEXICANO', 1.00),
(21, 21, 'SI', 0, '2013-08-03 00:15:04', 0, '2013-08-03 00:15:04', 'MXN', 'PESO MEXICANO', 1.00),
(22, 22, 'SI', 0, '2013-08-03 00:16:40', 0, '2013-08-03 00:16:40', 'MXN', 'PESO MEXICANO', 1.00),
(23, 23, 'SI', 0, '2013-08-03 00:20:31', 0, '2013-08-03 00:20:31', 'MXN', 'PESO MEXICANO', 1.00),
(24, 24, 'SI', 0, '2013-08-03 00:26:36', 0, '2013-08-03 00:26:36', 'MXN', 'PESO MEXICANO', 1.00),
(25, 25, 'SI', 0, '2013-08-03 00:28:06', 0, '2013-08-03 00:28:06', 'MXN', 'PESO MEXICANO', 1.00),
(26, 26, 'SI', 0, '2013-08-03 10:56:30', 0, '2013-08-03 10:56:30', 'MXN', 'PESO MEXICANO', 1.00),
(27, 27, 'SI', 0, '2013-08-09 22:32:27', 0, '2013-08-09 22:32:27', 'MXN', 'PESO MEXICANO', 1.00),
(28, 34, 'SI', 0, '2013-08-21 22:14:47', 0, '2013-08-21 22:14:47', 'MXN', 'PESO MEXICANO', 1.00);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `paquete`
--

INSERT INTO `paquete` (`id`, `nombre`, `tipo`, `facturas_incluidas`, `costo_factura_adicional`, `usuarios`, `almacenamiento`, `soporte_online`, `soporte_chat`, `soporte_telefono`, `multiple_moneda`, `multiple_sucursal`, `costo_mensual`, `costo_anual`, `vigencia`, `activo`) VALUES
(1, 'GRATUITO', 'CBB', 10, 5.00, 1, 100, 'SI', 'NO', 'NO', 'NO', 'NO', 0.00, 0.00, '2013-12-31', 'SI'),
(2, 'EMPRESARIAL', 'CBB', 100, 5.00, 3, 250, 'SI', 'NO', 'NO', 'NO', 'SI', 29.00, 290.00, '2013-12-31', 'SI'),
(3, 'CORPORATIVO', 'CBB', 10000, 0.00, 5, 1000, 'SI', 'NO', 'NO', 'NO', 'SI', 49.00, 490.00, '2013-12-31', 'SI'),
(4, 'CFDI-BASICO', 'CFDI', 10, 3.50, 1, 15, 'SI', 'NO', 'NO', 'NO', 'NO', 100.00, 1000.00, '2013-12-31', 'SI');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `codigo`, `nombre`, `descripcion`, `categoria_id`, `impuesto_id`, `unidad_id`, `precio_unitario`, `moneda_id`, `cuenta_id`) VALUES
(1, 'SI', NULL, '2013-07-05 00:59:55', NULL, '2013-07-05 00:59:55', NULL, 'PRODUCTO DE PRUEBA', NULL, NULL, NULL, NULL, 1.0000, NULL, 1),
(2, 'SI', NULL, '2013-09-01 17:43:02', NULL, '2013-09-01 17:43:02', '1', 'TEST', 'TESTS', 28, NULL, 28, 150.0000, 28, 34),
(3, 'SI', NULL, '2013-09-01 17:44:00', NULL, '2013-09-01 17:44:00', '2', 'TEST2', 'TESTS', 28, NULL, 28, 123.0000, 28, 34),
(4, 'SI', NULL, '2013-09-16 18:11:02', NULL, '2013-09-16 18:11:02', '1', 'GARBANZOS', 'GARBANZO BOTANA', 2, NULL, 2, 1.0000, 2, 2);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Volcado de datos para la tabla `producto_categoria`
--

INSERT INTO `producto_categoria` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `nombre`, `descripcion`) VALUES
(1, 1, 'SI', 0, '2013-07-04 23:04:48', 0, '2013-07-04 23:04:48', 'GENERAL', 'CATEGORIA GENERAL'),
(2, 2, 'SI', 0, '2013-07-05 00:59:55', 0, '2013-07-05 00:59:55', 'GENERAL', 'CATEGORIA GENERAL'),
(3, 3, 'SI', 0, '2013-07-26 23:04:11', 0, '2013-07-26 23:04:11', 'GENERAL', 'CATEGORIA GENERAL'),
(4, 4, 'SI', 0, '2013-07-26 23:53:55', 0, '2013-07-26 23:53:55', 'GENERAL', 'CATEGORIA GENERAL'),
(5, 5, 'SI', 0, '2013-08-01 00:34:15', 0, '2013-08-01 00:34:15', 'GENERAL', 'CATEGORIA GENERAL'),
(6, 6, 'SI', 0, '2013-08-01 00:35:45', 0, '2013-08-01 00:35:45', 'GENERAL', 'CATEGORIA GENERAL'),
(7, 7, 'SI', 0, '2013-08-01 00:37:41', 0, '2013-08-01 00:37:41', 'GENERAL', 'CATEGORIA GENERAL'),
(8, 8, 'SI', 0, '2013-08-01 00:39:33', 0, '2013-08-01 00:39:33', 'GENERAL', 'CATEGORIA GENERAL'),
(9, 9, 'SI', 0, '2013-08-01 00:46:27', 0, '2013-08-01 00:46:27', 'GENERAL', 'CATEGORIA GENERAL'),
(10, 10, 'SI', 0, '2013-08-01 01:24:56', 0, '2013-08-01 01:24:56', 'GENERAL', 'CATEGORIA GENERAL'),
(11, 11, 'SI', 0, '2013-08-01 02:00:53', 0, '2013-08-01 02:00:53', 'GENERAL', 'CATEGORIA GENERAL'),
(12, 12, 'SI', 0, '2013-08-02 20:48:53', 0, '2013-08-02 20:48:53', 'GENERAL', 'CATEGORIA GENERAL'),
(13, 13, 'SI', 0, '2013-08-02 20:54:42', 0, '2013-08-02 20:54:42', 'GENERAL', 'CATEGORIA GENERAL'),
(14, 14, 'SI', 0, '2013-08-02 23:43:49', 0, '2013-08-02 23:43:49', 'GENERAL', 'CATEGORIA GENERAL'),
(15, 15, 'SI', 0, '2013-08-02 23:54:22', 0, '2013-08-02 23:54:22', 'GENERAL', 'CATEGORIA GENERAL'),
(16, 16, 'SI', 0, '2013-08-03 00:02:51', 0, '2013-08-03 00:02:51', 'GENERAL', 'CATEGORIA GENERAL'),
(17, 17, 'SI', 0, '2013-08-03 00:03:56', 0, '2013-08-03 00:03:56', 'GENERAL', 'CATEGORIA GENERAL'),
(18, 18, 'SI', 0, '2013-08-03 00:05:51', 0, '2013-08-03 00:05:51', 'GENERAL', 'CATEGORIA GENERAL'),
(19, 19, 'SI', 0, '2013-08-03 00:07:58', 0, '2013-08-03 00:07:58', 'GENERAL', 'CATEGORIA GENERAL'),
(20, 20, 'SI', 0, '2013-08-03 00:10:40', 0, '2013-08-03 00:10:40', 'GENERAL', 'CATEGORIA GENERAL'),
(21, 21, 'SI', 0, '2013-08-03 00:15:04', 0, '2013-08-03 00:15:04', 'GENERAL', 'CATEGORIA GENERAL'),
(22, 22, 'SI', 0, '2013-08-03 00:16:40', 0, '2013-08-03 00:16:40', 'GENERAL', 'CATEGORIA GENERAL'),
(23, 23, 'SI', 0, '2013-08-03 00:20:31', 0, '2013-08-03 00:20:31', 'GENERAL', 'CATEGORIA GENERAL'),
(24, 24, 'SI', 0, '2013-08-03 00:26:36', 0, '2013-08-03 00:26:36', 'GENERAL', 'CATEGORIA GENERAL'),
(25, 25, 'SI', 0, '2013-08-03 00:28:06', 0, '2013-08-03 00:28:06', 'GENERAL', 'CATEGORIA GENERAL'),
(26, 26, 'SI', 0, '2013-08-03 10:56:30', 0, '2013-08-03 10:56:30', 'GENERAL', 'CATEGORIA GENERAL'),
(27, 27, 'SI', 0, '2013-08-09 22:32:27', 0, '2013-08-09 22:32:27', 'GENERAL', 'CATEGORIA GENERAL'),
(28, 34, 'SI', 0, '2013-08-21 22:14:47', 0, '2013-08-21 22:14:47', 'GENERAL', 'CATEGORIA GENERAL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regimen`
--

DROP TABLE IF EXISTS `regimen`;
CREATE TABLE IF NOT EXISTS `regimen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuenta_id` int(11) NOT NULL,
  `activo` varchar(2) DEFAULT 'SI',
  `usuario_creacion_id` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_edicion_id` int(11) DEFAULT NULL,
  `fecha_edicion` datetime DEFAULT NULL,
  `regimen` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `regimen`
--

INSERT INTO `regimen` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `regimen`) VALUES
(7, 34, 'SI', 0, '2013-08-22 00:08:09', NULL, '2013-08-22 00:08:09', 'REGIMEN 1'),
(8, 34, 'SI', 0, '2013-08-22 00:08:15', NULL, '2013-08-22 00:08:15', 'REGIMEN 2'),
(9, 34, 'SI', 0, '2013-08-22 00:08:24', NULL, '2013-08-22 00:08:24', 'REGIMEN 3'),
(10, 34, 'SI', 0, '2013-08-22 00:08:57', NULL, '2013-08-22 00:08:57', 'REGIMEN 4');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=52 ;

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
(45, 19, 'Nueva Cuenta', 'miniconos/user_add.png', 'cuentas/registro_rapido', 'contenido', 'SI', 1, '2012-11-01 00:00:00'),
(46, 18, 'Series / Folios', 'miniconos/text_list_numbers.png', 'cfdi/folios', 'contenido', 'SI', 4, '2012-11-01 00:00:00'),
(47, 18, 'Información Fiscal', 'miniconos/newspaper.png', 'configuracion/fiscal', 'contenido', 'SI', 1, '2012-11-01 00:00:00'),
(48, 18, 'Nueva Factura', 'miniconos/table_add.png', 'cfdi/index', 'contenido', 'SI', 1, '2012-11-01 00:00:00'),
(49, 18, 'Todas las Facturas', 'miniconos/folder_table.png', 'cfdi/reporte', 'contenido', 'SI', 2, '2012-11-01 00:00:00'),
(50, 18, 'Regimenes', 'miniconos/text_list_numbers.png', 'regimenes/index', 'contenido', 'SI', 5, '2012-11-01 00:00:00'),
(51, 18, 'Certificados', 'miniconos/text_list_numbers.png', 'cfdi/certificados', 'contenido', 'SI', 6, '2012-11-01 00:00:00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=45 ;

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
(17, 1, 'SI', 0, '2013-07-26 23:53:55', 0, '2013-07-26 23:53:55', NULL, 'GENERAL', NULL, NULL, NULL, NULL, NULL, 0, 0, 0),
(18, 1, 'SI', 0, '2013-08-01 00:34:15', 0, '2013-08-01 00:34:15', NULL, 'GENERAL', NULL, NULL, NULL, NULL, NULL, 0, 0, 0),
(19, 1, 'SI', 0, '2013-08-01 00:35:45', 0, '2013-08-01 00:35:45', NULL, 'GENERAL', NULL, NULL, NULL, NULL, NULL, 0, 0, 0),
(20, 1, 'SI', 0, '2013-08-01 00:37:41', 0, '2013-08-01 00:37:41', NULL, 'GENERAL', NULL, NULL, NULL, NULL, NULL, 0, 0, 0),
(21, 1, 'SI', 0, '2013-08-01 00:39:33', 0, '2013-08-01 00:39:33', NULL, 'GENERAL', NULL, NULL, NULL, NULL, NULL, 0, 0, 0),
(22, 1, 'SI', 0, '2013-08-01 00:46:27', 0, '2013-08-01 00:46:27', NULL, 'GENERAL', NULL, NULL, NULL, NULL, NULL, 0, 0, 0),
(23, 1, 'SI', 0, '2013-08-02 20:48:53', 0, '2013-08-02 20:48:53', NULL, 'GENERAL', NULL, NULL, NULL, NULL, NULL, 0, 0, 0),
(24, 1, 'SI', 0, '2013-08-02 20:54:42', 0, '2013-08-02 20:54:42', NULL, 'GENERAL', NULL, NULL, NULL, NULL, NULL, 0, 0, 0),
(25, 1, 'SI', 0, '2013-08-02 23:43:49', 0, '2013-08-02 23:43:49', NULL, 'GENERAL', NULL, NULL, NULL, NULL, NULL, 0, 0, 0),
(26, 1, 'SI', 0, '2013-08-02 23:44:24', 0, '2013-08-02 23:44:24', NULL, 'GENERAL', NULL, NULL, NULL, NULL, NULL, 0, 0, 0),
(27, 1, 'SI', 0, '2013-08-02 23:54:22', 0, '2013-08-02 23:54:22', NULL, 'GENERAL', NULL, NULL, NULL, NULL, NULL, 0, 0, 0),
(28, 1, 'SI', 0, '2013-08-03 00:02:51', 0, '2013-08-03 00:02:51', NULL, 'GENERAL', NULL, NULL, NULL, NULL, NULL, 0, 0, 0),
(29, 1, 'SI', 0, '2013-08-03 00:03:56', 0, '2013-08-03 00:03:56', NULL, 'GENERAL', NULL, NULL, NULL, NULL, NULL, 0, 0, 0),
(30, 1, 'SI', 0, '2013-08-03 00:05:51', 0, '2013-08-03 00:05:51', NULL, 'GENERAL', NULL, NULL, NULL, NULL, NULL, 0, 0, 0),
(31, 1, 'SI', 0, '2013-08-03 00:07:58', 0, '2013-08-03 00:07:58', NULL, 'GENERAL', NULL, NULL, NULL, NULL, NULL, 0, 0, 0),
(32, 1, 'SI', 0, '2013-08-03 00:10:41', 0, '2013-08-03 00:10:41', NULL, 'GENERAL', NULL, NULL, NULL, NULL, NULL, 0, 0, 0),
(33, 1, 'SI', 0, '2013-08-03 00:15:04', 0, '2013-08-03 00:15:04', NULL, 'GENERAL', NULL, NULL, NULL, NULL, NULL, 0, 0, 0),
(34, 1, 'SI', 0, '2013-08-03 00:16:40', 0, '2013-08-03 00:16:40', NULL, 'GENERAL', NULL, NULL, NULL, NULL, NULL, 0, 0, 0),
(35, 1, 'SI', 0, '2013-08-03 00:19:40', 0, '2013-08-03 00:19:40', NULL, 'GENERAL', NULL, NULL, NULL, NULL, NULL, 0, 0, 0),
(36, 1, 'SI', 0, '2013-08-03 00:19:46', 0, '2013-08-03 00:19:46', NULL, 'GENERAL', NULL, NULL, NULL, NULL, NULL, 0, 0, 0),
(37, 1, 'SI', 0, '2013-08-03 00:20:31', 0, '2013-08-03 00:20:31', NULL, 'GENERAL', NULL, NULL, NULL, NULL, NULL, 0, 0, 0),
(38, 1, 'SI', 0, '2013-08-03 00:26:36', 0, '2013-08-03 00:26:36', NULL, 'GENERAL', NULL, NULL, NULL, NULL, NULL, 0, 0, 0),
(39, 1, 'SI', 0, '2013-08-03 00:28:06', 0, '2013-08-03 00:28:06', NULL, 'GENERAL', NULL, NULL, NULL, NULL, NULL, 0, 0, 0),
(40, 1, 'SI', 0, '2013-08-09 22:32:27', 0, '2013-08-09 22:32:27', NULL, 'GENERAL', NULL, NULL, NULL, NULL, NULL, 0, 0, 0),
(41, 1, 'SI', 0, '2013-08-21 21:56:33', 0, '2013-08-21 21:56:33', NULL, 'GENERAL', NULL, NULL, NULL, NULL, NULL, 0, 0, 0),
(42, 1, 'SI', 0, '2013-08-21 22:02:14', 0, '2013-08-21 22:02:14', NULL, 'GENERAL', NULL, NULL, NULL, NULL, NULL, 0, 0, 0),
(43, 1, 'SI', 0, '2013-08-21 22:06:27', 0, '2013-08-21 22:06:27', NULL, 'GENERAL', NULL, NULL, NULL, NULL, NULL, 0, 0, 0),
(44, 1, 'SI', 0, '2013-08-21 22:14:47', 0, '2013-08-21 22:14:47', NULL, 'GENERAL', NULL, NULL, NULL, NULL, NULL, 0, 0, 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Volcado de datos para la tabla `unidad`
--

INSERT INTO `unidad` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `nombre`, `descripcion`) VALUES
(1, 1, 'SI', 0, '2013-07-04 23:04:48', 0, '2013-07-04 23:04:48', 'PIEZA', 'PIEZA'),
(2, 2, 'SI', 0, '2013-07-05 00:59:55', 0, '2013-07-05 00:59:55', 'PIEZA', 'PIEZA'),
(3, 3, 'SI', 0, '2013-07-26 23:04:11', 0, '2013-07-26 23:04:11', 'PIEZA', 'PIEZA'),
(4, 4, 'SI', 0, '2013-07-26 23:53:55', 0, '2013-07-26 23:53:55', 'PIEZA', 'PIEZA'),
(5, 5, 'SI', 0, '2013-08-01 00:34:15', 0, '2013-08-01 00:34:15', 'PIEZA', 'PIEZA'),
(6, 6, 'SI', 0, '2013-08-01 00:35:45', 0, '2013-08-01 00:35:45', 'PIEZA', 'PIEZA'),
(7, 7, 'SI', 0, '2013-08-01 00:37:41', 0, '2013-08-01 00:37:41', 'PIEZA', 'PIEZA'),
(8, 8, 'SI', 0, '2013-08-01 00:39:33', 0, '2013-08-01 00:39:33', 'PIEZA', 'PIEZA'),
(9, 9, 'SI', 0, '2013-08-01 00:46:26', 0, '2013-08-01 00:46:26', 'PIEZA', 'PIEZA'),
(10, 10, 'SI', 0, '2013-08-01 01:24:56', 0, '2013-08-01 01:24:56', 'PIEZA', 'PIEZA'),
(11, 11, 'SI', 0, '2013-08-01 02:00:53', 0, '2013-08-01 02:00:53', 'PIEZA', 'PIEZA'),
(12, 12, 'SI', 0, '2013-08-02 20:48:53', 0, '2013-08-02 20:48:53', 'PIEZA', 'PIEZA'),
(13, 13, 'SI', 0, '2013-08-02 20:54:42', 0, '2013-08-02 20:54:42', 'PIEZA', 'PIEZA'),
(14, 14, 'SI', 0, '2013-08-02 23:43:49', 0, '2013-08-02 23:43:49', 'PIEZA', 'PIEZA'),
(15, 15, 'SI', 0, '2013-08-02 23:54:22', 0, '2013-08-02 23:54:22', 'PIEZA', 'PIEZA'),
(16, 16, 'SI', 0, '2013-08-03 00:02:51', 0, '2013-08-03 00:02:51', 'PIEZA', 'PIEZA'),
(17, 17, 'SI', 0, '2013-08-03 00:03:56', 0, '2013-08-03 00:03:56', 'PIEZA', 'PIEZA'),
(18, 18, 'SI', 0, '2013-08-03 00:05:51', 0, '2013-08-03 00:05:51', 'PIEZA', 'PIEZA'),
(19, 19, 'SI', 0, '2013-08-03 00:07:58', 0, '2013-08-03 00:07:58', 'PIEZA', 'PIEZA'),
(20, 20, 'SI', 0, '2013-08-03 00:10:40', 0, '2013-08-03 00:10:40', 'PIEZA', 'PIEZA'),
(21, 21, 'SI', 0, '2013-08-03 00:15:04', 0, '2013-08-03 00:15:04', 'PIEZA', 'PIEZA'),
(22, 22, 'SI', 0, '2013-08-03 00:16:40', 0, '2013-08-03 00:16:40', 'PIEZA', 'PIEZA'),
(23, 23, 'SI', 0, '2013-08-03 00:20:31', 0, '2013-08-03 00:20:31', 'PIEZA', 'PIEZA'),
(24, 24, 'SI', 0, '2013-08-03 00:26:36', 0, '2013-08-03 00:26:36', 'PIEZA', 'PIEZA'),
(25, 25, 'SI', 0, '2013-08-03 00:28:06', 0, '2013-08-03 00:28:06', 'PIEZA', 'PIEZA'),
(26, 26, 'SI', 0, '2013-08-03 10:56:30', 0, '2013-08-03 10:56:30', 'PIEZA', 'PIEZA'),
(27, 27, 'SI', 0, '2013-08-09 22:32:27', 0, '2013-08-09 22:32:27', 'PIEZA', 'PIEZA'),
(28, 34, 'SI', 0, '2013-08-21 22:14:47', 0, '2013-08-21 22:14:47', 'PIEZA', 'PIEZA');

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
