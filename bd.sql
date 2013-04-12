-- phpMyAdmin SQL Dump
-- version 3.5.3
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 12-04-2013 a las 03:59:45
-- Versión del servidor: 5.5.28
-- Versión de PHP: 5.3.18

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de datos: `aspos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cbb_concepto`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cbb_factura`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cbb_folio`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cbb_impuesto`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cbb_receptor`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente_tipo`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contribuyente`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  `paquete_id` int(11) NOT NULL,
  `rfc` varchar(13) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `telefono_contacto` varchar(25) DEFAULT NULL,
  `celular_contacto` varchar(25) DEFAULT NULL,
  `correo_contacto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `impuesto`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `moneda`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paquete`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_categoria`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;
