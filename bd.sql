-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-06-2013 a las 07:28:47
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
(2, 'Alejandro Lizaola', 'LIHA851024I63', 'poky', 'c02505701c33eb1da48c1efad63971a741cbccf0', 'lizaolaa@gmail.com', '1ff973907159e4fa8d5e0ec0c8ab2ab8c0a8d3a3'),
(3, 'Iván Orlando Monge Marquez', 'MAMI8105098E8', 'ivyaweb', '9bccd32f1155dc0c6073cc1b81560bd3a3121ee5', 'mongenyip@gmail.com', '9bccd32f1155dc0c6073cc1b81560bd3a3121ee5');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `cbb_concepto`
--

INSERT INTO `cbb_concepto` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `cbb_id`, `cantidad`, `unidad`, `descripcion`, `precio_unitario`, `descuento`, `importe`) VALUES
(1, 6, 'SI', 0, '2013-06-24 22:43:46', NULL, '2013-06-24 22:43:46', 1, 1.0000, 'UNIDAD', 'CUCHARA', 12.0000, 0.0000, 12.0000),
(2, 6, 'SI', 0, '2013-06-24 22:43:46', NULL, '2013-06-24 22:43:46', 1, 1.0000, 'PIEZAS', 'ESPINILLERA', 150.0000, 0.0000, 150.0000),
(3, 6, 'SI', 0, '2013-06-24 22:43:46', NULL, '2013-06-24 22:43:46', 1, 1.0000, 'UNIDAD', 'RIN 17', 500.0000, 0.0000, 500.0000),
(4, 6, 'SI', 0, '2013-06-25 00:01:20', NULL, '2013-06-25 00:01:20', 2, 5.0000, 'PIEZAS', 'ESPINILLERA', 150.0000, 0.0000, 750.0000),
(5, 6, 'SI', 0, '2013-06-25 00:01:20', NULL, '2013-06-25 00:01:20', 2, 4.0000, 'UNIDAD', 'RIN 17', 500.0000, 0.0000, 2000.0000),
(6, 1, 'SI', 0, '2013-06-27 22:42:22', NULL, '2013-06-27 22:42:22', 3, 2.0000, 'PIEZA', 'MONITOR 19 PULGADAS', 1670.0000, 0.0000, 3340.0000),
(7, 1, 'SI', 0, '2013-06-27 23:11:31', NULL, '2013-06-27 23:11:31', 4, 4.0000, 'PIEZA', 'MONITOR 19 PULGADAS', 1670.0000, 0.0000, 6680.0000),
(8, 1, 'SI', 0, '2013-06-27 23:15:21', NULL, '2013-06-27 23:15:21', 5, 2.0000, 'PIEZA', 'MONITOR 19 PULGADAS', 1670.0000, 0.0000, 3340.0000);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `cbb_factura`
--

INSERT INTO `cbb_factura` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `cbb_folios_id`, `sucursal_id`, `serie`, `folio`, `fecha`, `no_aprobacion`, `forma_pago`, `subtotal`, `descuento`, `total`, `comentarios`, `status`, `motivo_cancelacion`, `pago`, `envio`) VALUES
(1, 6, 'SI', 0, '2013-06-24 22:43:46', 0, '2013-06-24 22:43:46', 1, NULL, 'A', '1', '2013-06-24', '1', 'UNA SOLA EXHIBICIï¿½N', 662.0000, 0.0000, 840.7400, NULL, 'EMITIDA', NULL, 'NO', 'NO'),
(2, 6, 'SI', 0, '2013-06-25 00:01:20', 0, '2013-06-25 00:01:20', 1, NULL, 'A', '2', '2013-06-25', '1', 'UNA SOLA EXHIBICIÓN', 2750.0000, 0.0000, 3492.5000, NULL, 'EMITIDA', NULL, 'NO', 'NO'),
(3, 1, 'SI', 0, '2013-06-27 22:42:22', 0, '2013-06-27 22:42:22', 3, NULL, 'A', '24', '2013-06-27', '324324432', 'UNA SOLA EXHIBICIÓN', 3340.0000, 0.0000, 3340.0000, NULL, 'EMITIDA', NULL, 'NO', 'NO'),
(4, 1, 'SI', 0, '2013-06-27 23:11:31', 0, '2013-06-27 23:11:31', 3, NULL, 'A', '25', '2013-06-27', '324324432', 'UNA SOLA EXHIBICIÓN', 6680.0000, 0.0000, 7748.8000, NULL, 'EMITIDA', NULL, 'NO', 'NO'),
(5, 1, 'SI', 0, '2013-06-27 23:15:21', 0, '2013-06-27 23:15:21', 3, NULL, 'A', '26', '2013-06-27', '324324432', 'UNA SOLA EXHIBICIÓN', 3340.0000, 0.0000, 3874.4000, NULL, 'EMITIDA', NULL, 'NO', 'NO');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `cbb_folio`
--

INSERT INTO `cbb_folio` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `serie`, `inicial`, `final`, `actual`, `fecha_recepcion`, `numero_aprobacion`, `tipo_documento`, `cbb`) VALUES
(1, 6, 'SI', 0, '2013-06-24 22:36:22', NULL, '2013-06-24 22:36:22', 'A', 1, 10, 3, '2013-06-24', '1', 'FACTURA', '1.jpg'),
(2, 5, 'SI', 0, '2013-06-25 00:01:50', NULL, '2013-06-25 00:01:50', 'AC', 1, 100, 23, '2013-06-25', '3242323', 'FACTURA', '2.jpg'),
(3, 1, 'SI', 0, '2013-06-27 22:36:32', NULL, '2013-06-27 22:36:32', 'A', 1, 100, 27, '2013-06-27', '324324432', 'FACTURA', '3.jpg');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `cbb_impuesto`
--

INSERT INTO `cbb_impuesto` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `cbb_id`, `nombre`, `tasa`, `importe`, `tipo`) VALUES
(1, 6, 'SI', 0, '2013-06-24 22:43:46', 0, '2013-06-24 22:43:46', 1, 'IVA', 16, 105.92, 'TRASLADADO'),
(2, 6, 'SI', 0, '2013-06-24 22:43:46', 0, '2013-06-24 22:43:46', 1, 'IVA R', 11, 72.82, 'RETENIDO'),
(3, 6, 'SI', 0, '2013-06-25 00:01:20', 0, '2013-06-25 00:01:20', 2, 'IVA', 16, 440.00, 'TRASLADADO'),
(4, 6, 'SI', 0, '2013-06-25 00:01:20', 0, '2013-06-25 00:01:20', 2, 'IVA R', 11, 302.50, 'RETENIDO'),
(5, 1, 'SI', 0, '2013-06-27 23:11:31', 0, '2013-06-27 23:11:31', 4, 'IVA', 16, 1068.80, 'TRASLADADO'),
(6, 1, 'SI', 0, '2013-06-27 23:15:21', 0, '2013-06-27 23:15:21', 5, 'IVA', 16, 534.40, 'TRASLADADO');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `cbb_receptor`
--

INSERT INTO `cbb_receptor` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `cbb_id`, `rfc`, `nombre`, `calle`, `exterior`, `interior`, `colonia`, `localidad`, `municipio`, `estado`, `pais`, `cpostal`) VALUES
(1, 6, 'SI', 0, '2013-06-24 22:43:46', 0, '2013-06-24 22:43:46', 1, 'AAAA000000AAA', 'LETRA A', 'UNO', '1', '1', 'UNO', 'UNO', 'UNO', 'JALISCO', 'MÉXICO', '46600'),
(2, 6, 'SI', 0, '2013-06-25 00:01:20', 0, '2013-06-25 00:01:20', 2, 'AAAA000000AAA', 'LETRA A', 'UNO', '1', '1', 'UNO', 'UNO', 'UNO', 'JALISCO', 'MÉXICO', '46600'),
(3, 1, 'SI', 0, '2013-06-27 22:42:22', 0, '2013-06-27 22:42:22', 3, 'ASD070703823', 'PRUEBA DE CLIENTE', 'DOMICILIO CONOCIDO', '382', NULL, 'LA REINA', NULL, 'TALA', 'JALISCO', 'MÉXICO', '57382'),
(4, 1, 'SI', 0, '2013-06-27 23:11:31', 0, '2013-06-27 23:11:31', 4, 'ASD070703823', 'PRUEBA DE CLIENTE', 'DOMICILIO CONOCIDO', '382', NULL, 'LA REINA', NULL, 'TALA', 'JALISCO', 'MÉXICO', '57382'),
(5, 1, 'SI', 0, '2013-06-27 23:15:21', 0, '2013-06-27 23:15:21', 5, 'XAXX000000XXX', 'CLIENTE GENERICO', 'AVENIDA PATRIA', '223', NULL, 'NIÑOS HEROES', 'AMECA', 'AMECA', 'JALISCO', 'MÉXICO', '46600');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `certificado`
--

INSERT INTO `certificado` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `fecha_emision`, `fecha_vencimiento`, `numero_serie`, `clave_privada`, `archivo_key`, `archivo_cer`) VALUES
(1, 3, 'SI', 0, '2013-06-01 00:00:00', NULL, '2013-06-01 16:02:15', '2013-05-15', '2015-05-15', '2309000003202', '53453453', '2309000003202.key', '2309000003202.cer'),
(5, 3, 'SI', 0, '2013-06-01 15:48:29', NULL, '2013-06-01 15:57:16', '2013-06-01', '2015-06-01', '12300020002130120020', '12300020002130120020', '12300020002130120020.key', '12300020002130120020.cer');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `cfd_folio`
--

INSERT INTO `cfd_folio` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `certificado_id`, `fecha_recepcion`, `ano_aprobacion`, `numero_aprobacion`, `serie`, `inicial`, `final`, `actual`, `tipo_documento`) VALUES
(1, 3, 'SI', 0, '2013-06-01 00:00:00', 0, '2013-06-01 00:00:00', 1, '2013-06-01', '2013', '827063', 'AX', 1, 1000, 23, 'FACTURA'),
(2, 3, 'SI', 0, '2013-06-06 22:28:54', NULL, '2013-06-06 22:31:26', 1, '0000-00-00', '2348', '23484393', 'XD', 1, 1000, 372, 'FACTURA'),
(3, 3, 'SI', 0, '2013-06-06 22:31:55', NULL, '2013-06-06 22:32:07', 5, NULL, '2373', '23738748', 'SAX', 1, 2000, 674, 'RECIBO DE HONORARIOS'),
(4, 3, 'SI', 0, '2013-06-06 22:32:39', NULL, '2013-06-06 22:36:55', 1, NULL, '2012', '2372838', 'XZ', 1, 1000, 893, 'FACTURA');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `tipo_cliente_id`, `rfc`, `nombre`, `calle`, `exterior`, `interior`, `colonia`, `localidad`, `referencia`, `municipio`, `estado`, `pais`, `cpostal`, `telefono`, `celular`, `correo`, `comentarios`, `fecha_registro_at`) VALUES
(1, 3, 'SI', 0, '2013-06-06 23:02:26', NULL, '2013-06-06 23:02:27', NULL, 'VECR8307073J1', 'RAMIRO ALONSO VERA CONTRERAS', 'ALEJANDRO PEÑA', '57', NULL, 'LA REINA', NULL, NULL, 'AMECA', 'JALISCO', 'MÉXICO', '46600', NULL, NULL, NULL, NULL, '2013-06-06 23:02:26'),
(2, 6, 'SI', 0, '2013-06-24 22:24:05', NULL, '2013-06-24 22:24:23', 1, 'AAAA000000AAA', 'LETRA A', 'UNO', '1', '1', 'UNO', 'UNO', NULL, 'UNO', 'JALISCO', 'MÉXICO', '46600', '(111) 111 1111', '(111) 111 1111', '1@uno.com', NULL, '2013-06-24 22:24:05'),
(3, 6, 'SI', 0, '2013-06-24 22:25:22', NULL, '2013-06-24 22:26:44', 3, 'BBBB000000BBB', 'LETRA B', 'DOS', '2', '2', 'DOS', 'DOS', NULL, 'DOS', 'JALISCO', 'MÉXICO', '46600', '(222) 222 2222', '(222) 222 2222', '2@dos.com', NULL, '2013-06-24 22:25:22'),
(4, 6, 'SI', 0, '2013-06-24 22:26:35', NULL, '2013-06-24 22:26:35', 1, 'CCCC000000CCC', 'LETRA C', 'TRES', '3', '3', 'TRES', 'TRES', NULL, 'TRES', 'JALISCO', 'MÉXICO', '46600', '(333) 333 3333', '(333) 333 3333', '3@tres.com', NULL, '2013-06-24 22:26:35'),
(5, 5, 'SI', 0, '2013-06-25 00:02:24', NULL, '2013-06-25 00:02:24', NULL, 'XXX000000XXX', 'CLIENTE X', 'ADASSDSA', 'ASD', NULL, NULL, NULL, NULL, 'ASDASDDSA', 'CAMPECHE', 'MÉXICO', '23432', NULL, NULL, NULL, NULL, '2013-06-25 00:02:24'),
(6, 1, 'SI', 0, '2013-06-27 22:38:07', NULL, '2013-06-27 22:38:07', 4, 'XAXX000000XXX', 'CLIENTE GENERICO', 'AVENIDA PATRIA', '223', NULL, 'NIÑOS HEROES', 'AMECA', NULL, 'AMECA', 'JALISCO', 'MÉXICO', '46600', NULL, NULL, NULL, NULL, '2013-06-27 22:38:07'),
(7, 1, 'SI', 0, '2013-06-27 22:40:19', NULL, '2013-06-27 22:40:19', NULL, 'ASD070703823', 'PRUEBA DE CLIENTE', 'DOMICILIO CONOCIDO', '382', NULL, 'LA REINA', NULL, NULL, 'TALA', 'JALISCO', 'MÉXICO', '57382', NULL, NULL, NULL, NULL, '2013-06-27 22:40:19');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `cliente_tipo`
--

INSERT INTO `cliente_tipo` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `nombre`, `descripcion`) VALUES
(1, 6, 'SI', 0, '2013-06-24 22:22:30', NULL, '2013-06-24 22:22:30', 'FRECUENTE', 'ATENCION SEMI-PREFERENCIAL'),
(2, 6, 'SI', 0, '2013-06-24 22:22:43', NULL, '2013-06-24 22:22:43', 'VIP', 'ATENCION ESPECIAL'),
(3, 6, 'SI', 0, '2013-06-24 22:22:53', NULL, '2013-06-24 22:22:53', 'NORMAL', 'ATENCION COMUN'),
(4, 1, 'SI', 0, '2013-06-27 22:37:12', NULL, '2013-06-27 22:37:12', 'NORMAL', 'CLIENTE NORMAL'),
(5, 14, 'SI', 0, '2013-06-27 23:37:00', 0, '2013-06-27 23:37:00', 'NORMAL', 'CLIENTE NORMAL'),
(6, 15, 'SI', 0, '2013-06-28 00:12:33', 0, '2013-06-28 00:12:33', 'NORMAL', 'CLIENTE NORMAL'),
(7, 16, 'SI', 0, '2013-06-28 00:19:06', 0, '2013-06-28 00:19:06', 'NORMAL', 'CLIENTE NORMAL');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `contrato`
--

INSERT INTO `contrato` (`id`, `cuenta_id`, `paquete_id`, `inicio`, `fin`, `dia_corte`, `tipo`, `activo`) VALUES
(1, 4, 1, '2013-06-24', '2013-07-24', 23, 'MENSUAL', 'SI'),
(2, 3, 1, '2013-06-24', '2013-07-24', 23, 'SEMESTRAL', 'SI'),
(3, 1, 1, '2013-06-24', '2013-07-24', 23, 'MENSUAL', 'SI'),
(4, 15, 3, '2013-06-28', '2014-06-28', 27, 'MENSUAL', 'SI'),
(5, 16, 2, '2013-06-28', '2014-06-28', 27, 'ANUAL', 'SI');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `contribuyente`
--

INSERT INTO `contribuyente` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `rfc`, `nombre`, `calle`, `exterior`, `interior`, `colonia`, `localidad`, `municipio`, `estado`, `pais`, `cpostal`, `telefono`, `celular`, `correo`, `nombre_comercial`, `cedula`, `logotipo`) VALUES
(1, 1, 'SI', 0, '2013-04-27 09:20:06', NULL, '2013-06-27 22:53:45', 'VECR8307073J1', 'RAMIRO ALONSO VERA CONTRERAS', 'ALEJANDRO PEÑA', '57', NULL, 'LA REINA', 'AMECA', 'AMECA', 'JALISCO', 'HOLAMÉXICO', '46600', '(375) 758 3494', '(375) 768 3494', 'raalveco@gmail.com', '6KSOFT', 'VECR8307073J1.PNG', 'VECR8307073J1.PNG'),
(2, 2, 'SI', 0, '2013-04-27 09:22:27', NULL, '2013-06-24 21:12:15', 'XXXX000000XXX', 'PRUEBA DE EMPRESA X', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 3, 'SI', 0, '2013-06-01 10:28:59', NULL, '2013-06-01 13:19:46', 'AAAA000000AAA', 'CUENTA DE PRUEBA PARA CFD', 'H. COLEGIO MILITAR', '3435', '51', 'EL FORTIN', 'ZAPOPAN', 'ZAPOPAN', 'JALISCO', 'HOLAMÉXICO', '45066', NULL, NULL, NULL, NULL, 'AAAA000000AAA.JPG', 'AAAA000000AAA.PNG'),
(4, 4, 'SI', 0, '2013-06-24 20:57:56', NULL, '2013-06-24 20:57:56', 'WWWW000000WWW', 'PRUEBA DE REGISTRO DE CUENTA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 5, 'SI', 0, '2013-06-24 22:10:08', NULL, '2013-06-24 22:28:03', 'ABC000000XYZ', 'FARMACIAS ABC', 'JUAREZ', '73', '38', 'EL FORTIN', 'ZAPOPAN', 'ZAPOPAN', 'CAMPECHE', 'HOLAMÉXICO', '47382', '(333) 333 3333', '(333) 333 3333', NULL, 'FARMACIAS ABC', 'ABC000000XYZ.PNG', 'ABC000000XYZ.PNG'),
(6, 6, 'SI', 0, '2013-06-24 22:20:32', NULL, '2013-06-24 22:41:32', 'LIHA851024I63', 'LIZAOLA', 'PATRIA', '1', '1', 'PATRIA', 'PATRIA', 'PATRIA', 'BAJA CALIFORNIA SUR', 'HOLAMÉXICO', '46600', '(111) 111 1111', '(111) 111 1111', '111@gmsil.com', 'LIHA SA DE CV', 'LIHA851024I63.JPG', 'LIHA851024I63.JPG'),
(7, 7, 'SI', 0, '2013-06-25 03:07:21', NULL, '2013-06-25 03:07:21', 'MAMI8105098E8', 'IVAN ORLANDO MARQUEZ MONGENYIP', 'PRUEBA', '1539', NULL, 'PASEO DE LOS ANDES', 'MONTERREY', 'SAN NICOLAS DE LOS GARZA', 'NUEVO LEÓN', 'MÉXICO', '66444', NULL, NULL, NULL, NULL, NULL, NULL),
(8, 8, 'SI', 0, '2013-06-27 23:17:54', NULL, '2013-06-27 23:19:04', 'ABC123456XYZ', 'PRUEBA DE CUENTA', 'AMECA', '372', '87', 'BARULLO', 'AMECA', 'AMECA', 'JALISCO', 'HOLAMÉXICO', '78273', '(333) 333 3333', '(333) 333 3333', NULL, NULL, 'ABC123456XYZ.PNG', 'ABC123456XYZ.PNG'),
(9, 14, 'SI', 0, '2013-06-27 23:37:00', NULL, '2013-06-27 23:37:00', 'GGH443543RE3', 'SFSD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 15, 'SI', 0, '2013-06-28 00:12:33', NULL, '2013-06-28 00:12:33', 'JHK324234SFE', 'ERWER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 16, 'SI', 0, '2013-06-28 00:19:06', NULL, '2013-06-28 00:19:06', 'GHF4353453F4', 'SADS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
  `nombre` varchar(100) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `telefono_contacto` varchar(25) DEFAULT NULL,
  `celular_contacto` varchar(25) DEFAULT NULL,
  `correo_contacto` varchar(100) DEFAULT NULL,
  `tipo_contrato` varchar(25) DEFAULT 'ANUAL',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Volcado de datos para la tabla `cuenta`
--

INSERT INTO `cuenta` (`id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `paquete_id`, `rfc`, `nombre`, `password`, `telefono_contacto`, `celular_contacto`, `correo_contacto`, `tipo_contrato`) VALUES
(1, 'SI', 0, '2013-04-27 09:20:06', NULL, '2013-04-29 15:30:24', 1, 'VECR8307073J1', 'RAMIRO ALONSO VERA CONTRERAS', '886fed01789257424228dc95fe3b5b319335ab6d', '(375) 105 0079', NULL, 'raalveco@gmail.com', 'ANUAL'),
(2, 'SI', 0, '2013-04-27 09:22:27', NULL, '2013-06-24 21:12:15', 1, 'XXXX000000XXX', 'PRUEBA DE EMPRESA XÁ', '2f7ea749e13b1595cc6eb763da3e30ec7d3c6a7d', '(222) 222 2222', NULL, 'aasd@asdas.com', 'ANUAL'),
(3, 'SI', 0, '2013-06-01 10:28:59', NULL, '2013-06-01 10:28:59', 2, 'AAAA000000AAA', 'CUENTA DE PRUEBA PARA CFD', '886fed01789257424228dc95fe3b5b319335ab6d', '(333) 333 3333', NULL, 'raalveco@gmail.com', 'ANUAL'),
(4, 'SI', 0, '2013-06-24 20:57:56', NULL, '2013-06-24 20:57:56', 1, 'WWWW000000WWW', 'PRUEBA DE REGISTRO DE CUENTA', '5f3ef03e6de8808cb8d8b42cac51d4c8e79571fd', '(375) 567 5676', NULL, 'qq@sf.sdf', 'ANUAL'),
(5, 'SI', 0, '2013-06-24 22:10:07', NULL, '2013-06-24 22:10:08', 2, 'ABC000000XYZ', 'FARMACIAS ABC', '32c28c79550494bac4ea983d6f06b3023bbae266', '(333) 333 3333', NULL, 'raalveco@gmail.com', 'ANUAL'),
(6, 'SI', 0, '2013-06-24 22:20:32', NULL, '2013-06-24 22:20:32', 3, 'LIHA851024I63', 'LIZAOLA', '96a238faef8c001414e9487590e4a5a7989f35a1', '(111) 111 1111', NULL, 'LIZAOLAA@GMAIL.COM', 'ANUAL'),
(7, 'SI', 0, '2013-06-25 03:07:21', NULL, '2013-06-25 03:07:21', 1, 'MAMI8105098E8', 'IVAN ORLANDO MARQUEZ MONGENYIP', '9db9cb615988f38814e7a6f370f5c8071f00a2f6', '(342) 343 2453', NULL, 'mongeworld@hotmail.com', 'ANUAL'),
(8, 'SI', 0, '2013-06-27 23:17:54', NULL, '2013-06-27 23:17:54', 1, 'ABC123456XYZ', 'PRUEBA DE CUENTA', '2ffa7073ee0623e94a20d71d7f72efad614c2d57', '(333) 333 3333', NULL, 'ramiro@intagono.com', 'ANUAL'),
(9, 'SI', 0, '2013-06-27 23:24:04', 0, '2013-06-27 23:24:04', 2, 'ZZZ123456XXX', 'ZZZ', NULL, NULL, NULL, NULL, 'ANUAL'),
(10, 'SI', 0, '2013-06-27 23:26:01', 0, '2013-06-27 23:26:01', 1, 'WQE123122SDF', 'SDFSDFFD', NULL, NULL, NULL, NULL, 'ANUAL'),
(11, 'SI', 0, '2013-06-27 23:26:58', 0, '2013-06-27 23:26:58', 2, 'DFG4353457FG', 'SDFSDF', NULL, NULL, NULL, NULL, 'ANUAL'),
(12, 'SI', 0, '2013-06-27 23:29:14', 0, '2013-06-27 23:29:14', 2, 'TYU56756734F', 'FSFD', NULL, NULL, NULL, NULL, 'ANUAL'),
(13, 'SI', 0, '2013-06-27 23:30:32', 0, '2013-06-27 23:30:32', 2, 'FGH456457FGH', 'SDFS', NULL, NULL, NULL, NULL, 'ANUAL'),
(14, 'SI', 0, '2013-06-27 23:36:59', NULL, '2013-06-27 23:37:00', 2, 'GGH443543RE3', 'SFSD', '87c82a9362d9686f51cda80d5e058ebbdda81e88', '(435) 435 4354', NULL, 'fdgd@fsd.sd', 'ANUAL'),
(15, 'SI', 0, '2013-06-28 00:12:33', NULL, '2013-06-28 00:12:33', 3, 'JHK324234SFE', 'ERWER', '208eff020a4505ce41a85e4362494b634db9d18c', '(324) 324 2342', NULL, 'ewerf@fdsd.sdf', 'ANUAL'),
(16, 'SI', 0, '2013-06-28 00:19:06', NULL, '2013-06-28 00:19:06', 2, 'GHF4353453F4', 'SADS', '1ec29a1e2f041765abef05986b19a52c95574ad6', '(423) 432 4234', NULL, 'asddas@asd.sad', 'ANUAL');

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
(2, 'VENTAS', 'ventas@emisionfiscal.com'),
(3, 'PRUEBA 1', '1@CIBERFACTURA.COM.MX');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `impuesto`
--

INSERT INTO `impuesto` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `nombre`, `descripcion`, `tasa`, `tipo`) VALUES
(1, 3, 'SI', 0, '2013-06-06 23:03:41', NULL, '2013-06-06 23:03:41', 'IVA', 'IVA', 16, 'TRASLADADO'),
(2, 6, 'SI', 0, '2013-06-24 22:32:03', NULL, '2013-06-24 22:32:03', 'IVA', 'IVA', 16, 'TRASLADADO'),
(3, 6, 'SI', 0, '2013-06-24 22:32:19', NULL, '2013-06-24 22:32:19', 'IVA R', 'IVA R', 11, 'RETENIDO'),
(4, 5, 'SI', 0, '2013-06-25 00:04:12', NULL, '2013-06-25 00:04:12', 'IVA', 'IVA', 16, 'TRASLADADO'),
(5, 1, 'SI', 0, '2013-06-27 23:11:03', NULL, '2013-06-27 23:11:03', 'IVA', 'IVA', 16, 'TRASLADADO'),
(6, 14, 'SI', 0, '2013-06-27 23:37:00', 0, '2013-06-27 23:37:00', 'IVA', 'IVA', 16, 'TRASLADADO'),
(7, 15, 'SI', 0, '2013-06-28 00:12:33', 0, '2013-06-28 00:12:33', 'IVA', 'IVA', 16, 'TRASLADADO'),
(8, 16, 'SI', 0, '2013-06-28 00:19:06', 0, '2013-06-28 00:19:06', 'IVA', 'IVA', 16, 'TRASLADADO');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

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
(12, 'CLIENTE', 'miniconos/style_edit.png', 'Catalogos', 'SI', 11),
(13, 'ADMIN', 'miniconos/package.png', 'Paquetes', 'SI', 1),
(14, 'ADMIN', 'miniconos/newspaper.png', 'Tickets', 'SI', 3),
(15, 'ADMIN', 'miniconos/book.png', 'Departamentos', 'SI', 4),
(16, 'CLIENTE', 'miniconos/user.png', 'Usuarios', 'SI', 5),
(17, 'CFD', 'miniconos/page_white_key.png', 'Facturación CFD', 'SI', 8),
(18, 'CFDI', 'miniconos/page_white_key.png', 'Facturación CFDI', 'SI', 9);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `moneda`
--

INSERT INTO `moneda` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `nombre`, `descripcion`, `tipo_cambio`) VALUES
(1, 1, 'SI', 0, '2013-05-28 21:18:36', NULL, '2013-05-28 21:18:36', 'PESO', 'MXN', 1.00),
(2, 3, 'SI', 0, '2013-06-06 23:03:25', NULL, '2013-06-06 23:03:25', 'MXN', 'PESO MEXICANO', 1.00),
(3, 6, 'SI', 0, '2013-06-24 22:30:28', NULL, '2013-06-24 22:30:28', 'MEXICO', 'PESO MEXICANO', 1.00),
(4, 6, 'SI', 0, '2013-06-24 22:30:55', NULL, '2013-06-24 22:30:55', 'USA', 'MONEDA DE ESTADOS UNIDOS', 12.50),
(5, 6, 'SI', 0, '2013-06-24 22:31:15', NULL, '2013-06-24 22:31:42', 'EURO', 'MONEDA UNION EUROPEA', 17.80),
(6, 6, 'SI', 0, '2013-06-24 22:31:30', NULL, '2013-06-24 22:31:30', 'LIBRA', 'MONEDA DE UK', 22.30),
(7, 5, 'SI', 0, '2013-06-25 00:03:59', NULL, '2013-06-25 00:03:59', 'MXN', 'PESO MEXICANO', 1.00),
(8, 8, 'SI', 0, '2013-06-27 23:17:54', 0, '2013-06-27 23:17:54', 'MXN', 'PESO MEXICANO', 1.00),
(9, 11, 'SI', 0, '2013-06-27 23:26:58', 0, '2013-06-27 23:26:58', 'MXN', 'PESO MEXICANO', 1.00),
(10, 12, 'SI', 0, '2013-06-27 23:29:14', 0, '2013-06-27 23:29:14', 'MXN', 'PESO MEXICANO', 1.00),
(11, 13, 'SI', 0, '2013-06-27 23:30:32', 0, '2013-06-27 23:30:32', 'MXN', 'PESO MEXICANO', 1.00),
(12, 14, 'SI', 0, '2013-06-27 23:36:59', 0, '2013-06-27 23:36:59', 'MXN', 'PESO MEXICANO', 1.00),
(13, 15, 'SI', 0, '2013-06-28 00:12:33', 0, '2013-06-28 00:12:33', 'MXN', 'PESO MEXICANO', 1.00),
(14, 16, 'SI', 0, '2013-06-28 00:19:06', 0, '2013-06-28 00:19:06', 'MXN', 'PESO MEXICANO', 1.00);

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
(1, 'CBB - GRATUITO', 'CBB', 5, 10.00, 1, 100, 'SI', 'NO', 'NO', 'NO', 'NO', 0.00, 0.00, '2013-12-31', 'SI'),
(2, 'CBB - BASICO', 'CBB', 50, 5.00, 5, 100, 'SI', 'SI', 'SI', 'SI', 'SI', 50.00, 500.00, '2013-12-31', 'SI'),
(3, 'CBB - ILIMITADO', 'CBB', 1000, 0.50, 5, 1000, 'SI', 'SI', 'SI', 'SI', 'SI', 100.00, 1000.00, '2013-12-31', 'SI'),
(4, 'ÁÉÍÓÚ ÑÑÑ', 'CBB', NULL, 0.00, NULL, NULL, 'SI', 'NO', 'NO', 'NO', 'NO', 0.00, 0.00, '2013-12-31', 'NO');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `codigo`, `nombre`, `descripcion`, `categoria_id`, `impuesto_id`, `unidad_id`, `precio_unitario`, `moneda_id`, `cuenta_id`) VALUES
(1, 'SI', NULL, '2013-06-06 23:04:36', NULL, '2013-06-06 23:04:36', 'P2839', 'CUADERNO PROFESIONAL', 'CUADERNO PROFESIONAL', 1, NULL, 1, 38.0000, 2, 3),
(2, 'SI', NULL, '2013-06-24 22:33:32', NULL, '2013-06-24 22:33:33', '1', 'CUCHARA', 'NA', 3, NULL, 3, 12.0000, 3, 6),
(3, 'SI', NULL, '2013-06-24 22:34:02', NULL, '2013-06-24 22:34:02', '1', 'ESPINILLERA', 'FUTBOL SOCCER', 2, NULL, 4, 150.0000, 3, 6),
(4, 'SI', NULL, '2013-06-24 22:34:34', NULL, '2013-06-24 22:34:34', '1', 'RIN 17', 'AUTOS', 5, NULL, 3, 500.0000, 4, 6),
(5, 'SI', NULL, '2013-06-27 22:41:56', NULL, '2013-06-27 22:41:56', '2423', 'MONITOR 19 PULGADAS', 'MONITOR 19 PULGADAS', 8, NULL, 6, 1670.0000, 1, 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `producto_categoria`
--

INSERT INTO `producto_categoria` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `nombre`, `descripcion`) VALUES
(1, 3, 'SI', 0, '2013-06-06 23:04:10', NULL, '2013-06-06 23:04:10', 'PAPELERIA', 'PAPELERIA'),
(2, 6, 'SI', 0, '2013-06-24 22:27:50', NULL, '2013-06-24 22:27:50', 'DEPORTES', 'ARTICULOS DEPORTIVOS'),
(3, 6, 'SI', 0, '2013-06-24 22:28:02', NULL, '2013-06-24 22:28:02', 'COCINA', 'ARTICULOS DE COCINA'),
(4, 6, 'SI', 0, '2013-06-24 22:28:23', NULL, '2013-06-24 22:28:23', 'CARPITENRIA', 'ARTICULOS PARA DESARROLLO CON MADER'),
(5, 6, 'SI', 0, '2013-06-24 22:28:37', NULL, '2013-06-24 22:28:37', 'AUTOMOVILES', 'AUTOPARTES Y ACCESORIOS'),
(6, 6, 'SI', 0, '2013-06-24 22:28:58', NULL, '2013-06-24 22:28:58', 'TECNOLOGIA', 'ARTICULOS TECNOLOGICOS Y ELECTRONICOS'),
(7, 5, 'SI', 0, '2013-06-25 00:03:19', NULL, '2013-06-25 00:03:19', 'BEBIDA', 'BEBIDA'),
(8, 1, 'SI', 0, '2013-06-27 22:40:53', NULL, '2013-06-27 22:40:53', 'COMPUTACION', 'COMPUTACION'),
(9, 1, 'SI', 0, '2013-06-27 23:17:54', 0, '2013-06-27 23:17:54', 'GENERAL', 'CATEGORIA GENERAL'),
(10, 14, 'SI', 0, '2013-06-27 23:37:00', 0, '2013-06-27 23:37:00', 'GENERAL', 'CATEGORIA GENERAL'),
(11, 15, 'SI', 0, '2013-06-28 00:12:33', 0, '2013-06-28 00:12:33', 'GENERAL', 'CATEGORIA GENERAL'),
(12, 16, 'SI', 0, '2013-06-28 00:19:06', 0, '2013-06-28 00:19:06', 'GENERAL', 'CATEGORIA GENERAL');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=45 ;

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
(7, 3, 'Nuevo Producto', 'miniconos/brick.png', 'productos/registro', 'contenido', 'SI', 1, '2012-11-01 00:00:00'),
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
(19, 1, 'Tipos de Cliente', 'miniconos/folder_user.png', 'clientes/reporteTiposCliente', 'contenido', 'SI', 3, '2012-11-01 00:00:00'),
(20, 1, 'Nuevo Tipo Cliente', 'miniconos/user_add.png', 'clientes/registroTipoCliente', 'contenido', 'NO', 4, '2012-11-01 00:00:00'),
(21, 9, 'Nueva Cuenta', 'miniconos/user_add.png', 'cuentas/registro', 'contenido', 'SI', 1, '2012-11-01 00:00:00'),
(22, 9, 'Todas las Cuentas', 'miniconos/folder_user.png', 'cuentas/reporte', 'contenido', 'SI', 2, '2012-11-01 00:00:00'),
(23, 3, 'Categorías de Producto', 'miniconos/newspaper.png', 'productos/reporteProductoCategoria', 'contenido', 'SI', 3, '2012-11-01 00:00:00'),
(24, 10, 'Información Fiscal', 'miniconos/newspaper.png', 'configuracion/fiscal', 'contenido', 'SI', 1, '2012-11-01 00:00:00'),
(25, 11, 'Nueva Sucursal', 'miniconos/house.png', 'sucursales/registro', 'contenido', 'SI', 1, '2013-02-19 00:00:00'),
(26, 11, 'Sucursales', 'miniconos/house_link.png', 'sucursales/reporte', 'contenido', 'SI', 2, '2013-02-19 00:00:00'),
(27, 12, 'Unidades', 'miniconos/style_edit.png', 'unidades/reporte', 'contenido', 'SI', 1, '2013-02-19 00:00:00'),
(28, 12, 'Monedas', 'miniconos/money_dollar.png', 'monedas/reporte', 'contenido', 'SI', 2, '2013-02-19 00:00:00'),
(29, 12, 'Impuestos', 'miniconos/money.png', 'impuestos/reporte', 'contenido', 'SI', 3, '2013-02-19 00:00:00'),
(30, 10, 'Series / Folios', 'miniconos/text_list_numbers.png', 'cbb/folios', 'contenido', 'SI', 4, '2012-11-01 00:00:00'),
(31, 10, 'Todas las Facturas', 'miniconos/newspaper.png', 'cbb/reporte', 'contenido', 'SI', 3, '2012-11-01 00:00:00'),
(32, 10, 'Nueva Factura', 'miniconos/newspaper.png', 'cbb/index', 'contenido', 'SI', 1, '2012-11-01 00:00:00'),
(33, 13, 'Nuevo Paquete', 'miniconos/text_list_numbers.png', 'paquetes/registro', 'contenido', 'SI', 1, '2012-11-01 00:00:00'),
(34, 13, 'Reporte', 'miniconos/text_list_numbers.png', 'paquetes/reporte', 'contenido', 'SI', 2, '2012-11-01 00:00:00'),
(35, 14, 'Todos los Tickets', 'miniconos/newspaper.png', 'tickets/reporte', 'contenido', 'SI', 1, '2012-11-01 00:00:00'),
(36, 15, 'Nuevo Departamento', 'miniconos/book_add.png', 'departamentos/registro', 'contenido', 'SI', 1, '2012-11-01 00:00:00'),
(37, 15, 'Catalogo', 'miniconos/book_open.png', 'departamentos/reporte', 'contenido', 'SI', 2, '2012-11-01 00:00:00'),
(38, 16, 'Nuevo Usuario', 'miniconos/user_add.png', 'usuarios/registro', 'contenido', 'SI', 1, '2012-11-01 00:00:00'),
(39, 16, 'Catalogo de Usuarios', 'miniconos/text_list_numbers.png', 'usuarios/reporte', 'contenido', 'SI', 2, '2012-11-01 00:00:00'),
(40, 17, 'Nueva Factura', 'miniconos/newspaper.png', 'cfd/index', 'contenido', 'SI', 4, '2012-11-01 00:00:00'),
(41, 17, 'Todas las Facturas', 'miniconos/newspaper.png', 'cfd/reporte', 'contenido', 'SI', 5, '2012-11-01 00:00:00'),
(42, 17, 'Series / Folios', 'miniconos/text_list_numbers.png', 'cfd/folios', 'contenido', 'SI', 3, '2012-11-01 00:00:00'),
(43, 17, 'Información Fiscal', 'miniconos/newspaper.png', 'configuracion/fiscal', 'contenido', 'SI', 1, '2012-11-01 00:00:00'),
(44, 17, 'Certificados', 'miniconos/house_link.png', 'cfd/certificados', 'contenido', 'SI', 2, '2013-02-19 00:00:00');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  `departamento_id` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `respondido` varchar(2) NOT NULL DEFAULT 'NO',
  `estado` varchar(2) NOT NULL DEFAULT 'OK',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Volcado de datos para la tabla `ticket`
--

INSERT INTO `ticket` (`id`, `cuenta_id`, `usuario_id`, `admin_id`, `padre`, `admin`, `asunto`, `mensaje`, `departamento_id`, `fecha`, `respondido`, `estado`) VALUES
(1, 1, 0, '1', 0, 'NO', 'asdsadsadsdasdasf sf fds fsd dfs dfs dfs dffsd fsd fds f dsdfsdfds f dsf dsf ds fds f sd f sd f dsfds', 'adsdasdasf sf fds fsd dfs dfs dfs dffsd fsd fds f dsdfsdfds f dsf dsf ds fds f sd f sd f dsfds', 2, '0000-00-00 00:00:00', 'NO', 'KO'),
(6, 1, 0, '2', 0, 'NO', 'dsffds', 'dsfdsfds', 2, '0000-00-00 00:00:00', 'NO', 'KO'),
(7, 1, 0, '3', 0, 'NO', 'Ticket de Prueba', 'Ola k ace!!', 1, '2013-05-21 22:28:46', 'NO', 'KO'),
(8, 1, 0, '2', 7, 'SI', 'Respuesta de ADMIN', 'Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas "Letraset", las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.', 1, '2013-05-24 00:02:53', 'NO', 'KO'),
(9, 1, 0, '2', 6, 'SI', 'Respuesta de ADMIN', 'Es un hecho establecido hace demasiado tiempo que un lector se distraerá con el contenido del texto de un sitio mientras que mira su diseño. El punto de usar Lorem Ipsum es que tiene una distribución más o menos normal de las letras, al contrario de usar textos como por ejemplo "Contenido aquí, contenido aquí". Estos textos hacen parecerlo un español que se puede leer. Muchos paquetes de autoedición y editores de páginas web usan el Lorem Ipsum como su texto por defecto, y al hacer una búsqueda de "Lorem Ipsum" va a dar por resultado muchos sitios web que usan este texto si se encuentran en estado de desarrollo. Muchas versiones han evolucionado a través de los años, algunas veces por accidente, otras veces a propósito (por ejemplo insertándole humor y cosas por el estilo).', 2, '2013-05-24 00:13:26', 'NO', 'KO'),
(10, 1, 0, '2', 1, 'SI', 'Respuesta de ADMIN', 'Respuesta de Prueba... OK!!', 2, '2013-05-25 14:41:39', 'NO', 'KO'),
(11, 1, 0, NULL, 0, 'NO', 'Ticket de Prueba', 'Hola', 2, '2013-05-29 20:24:09', 'NO', 'KO'),
(12, 6, 0, NULL, 0, 'NO', 'Errores', 'Esta valiendo verga!', 1, '2013-06-24 22:47:34', 'SI', 'OK'),
(13, 6, 0, NULL, 12, 'SI', 'RE: Errores', 'Simon, estamos trabajando en los errores.', 1, '2013-06-24 22:48:09', 'SI', 'OK'),
(14, 6, 0, NULL, 13, 'NO', 'RE: RE: Errores', 'ok', 1, '2013-06-24 22:48:32', 'NO', 'OK'),
(15, 7, 0, '', 0, 'NO', 'ticket de prueba', 'mensaje de prueba k', 1, '2013-06-25 03:08:54', 'NO', 'OK');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `unidad`
--

INSERT INTO `unidad` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `nombre`, `descripcion`) VALUES
(1, 3, 'SI', 0, '2013-06-06 23:03:02', NULL, '2013-06-06 23:03:02', 'PIEZA', 'PIEZA'),
(2, 6, 'SI', 0, '2013-06-24 22:29:44', NULL, '2013-06-24 22:29:44', 'CAJA', 'CAJAS'),
(3, 6, 'SI', 0, '2013-06-24 22:29:54', NULL, '2013-06-24 22:29:54', 'UNIDAD', 'UNIDADES'),
(4, 6, 'SI', 0, '2013-06-24 22:30:12', NULL, '2013-06-24 22:30:12', 'PIEZAS', 'PAQUETES PERSONALIZADOS'),
(5, 5, 'SI', 0, '2013-06-25 00:03:42', NULL, '2013-06-25 00:03:42', 'PIEZA', 'pieza'),
(6, 1, 'SI', 0, '2013-06-27 22:41:08', NULL, '2013-06-27 22:41:08', 'PIEZA', 'PIEZA'),
(7, 14, 'SI', 0, '2013-06-27 23:37:00', 0, '2013-06-27 23:37:00', 'PIEZA', 'PIEZA'),
(8, 15, 'SI', 0, '2013-06-28 00:12:33', 0, '2013-06-28 00:12:33', 'PIEZA', 'PIEZA'),
(9, 16, 'SI', 0, '2013-06-28 00:19:06', 0, '2013-06-28 00:19:06', 'PIEZA', 'PIEZA');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `avatar`, `usuario`, `password`, `nombres`, `apellidos`, `correo`) VALUES
(1, 1, 'SI', 0, '2013-05-28 22:07:58', NULL, '2013-05-28 22:09:28', 'avatar_50b1a24b659fa.png', 'lizaolaa', 'c02505701c33eb1da48c1efad63971a741cbccf0', 'ALEJANDRO', 'LIZAOLA', 'lizaolaa@gmail.com'),
(2, 1, 'SI', 1, '2013-05-28 22:23:51', 1, '2013-05-28 22:23:51', 'avatar_50b1a24b659fa.png', 'galeno', '60a1e6fcdbf5c16dee6e61994ea40a266a6a47a1', 'RAMIRO', 'VERA', 'a@h.com'),
(3, 6, 'SI', 0, '2013-06-24 22:35:24', NULL, '2013-06-24 22:35:24', 'avatar_50b1a24b659fa.png', 'rogelio', '8a785a7b9ed08f73f91fbc3a658510b79969ef95', 'ROGELIO', 'RUIZ', 'r@r.com');
