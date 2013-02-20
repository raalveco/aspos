-- phpMyAdmin SQL Dump
-- version 3.5.3
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 20-02-2013 a las 04:17:22
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
  `fecha` datetime DEFAULT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  `rfc` varchar(15) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `tipo_cliente_id`, `rfc`, `nombre`, `calle`, `exterior`, `interior`, `colonia`, `localidad`, `referencia`, `municipio`, `estado`, `pais`, `cpostal`, `telefono`, `celular`, `correo`, `comentarios`, `fecha_registro_at`) VALUES
(1, 2, 'SI', 0, '2013-02-17 20:48:26', 0, '2013-02-17 20:48:26', NULL, 'SDA234234453', 'SADDS', 'ADSDSA', 'ADSAS', NULL, NULL, NULL, NULL, 'ASDDASDSA', 'CHIAPAS', 'MÉXICO', '34553', NULL, NULL, NULL, NULL, '2013-02-17 20:48:26'),
(2, 2, 'SI', 0, '2013-02-17 20:49:17', 0, '2013-02-17 20:49:17', NULL, 'XXXX000000XXX', 'OLA K ASE', 'DFFDSFDSFSD', 'SDFFD', 'SDFDS', 'SDFFSDFSD', 'FDFDSFDS', NULL, 'DFSDFSFDSFSDFDS', 'TABASCO', 'MÉXICO', '34554', '(323) 424 3243', '(432) 432 4324', 'saddasdsa@asdads.com.sd', NULL, '2013-02-17 20:49:17');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `cliente_tipo`
--

INSERT INTO `cliente_tipo` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `nombre`, `descripcion`) VALUES
(1, 2, 'SI', 2, '2013-02-13 00:00:00', 2, '2013-02-21 00:00:00', 'NORMAL', 'CLIENTE NORMAL');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `cuenta`
--

INSERT INTO `cuenta` (`id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `rfc`, `nombre`, `password`, `telefono_contacto`, `celular_contacto`, `correo_contacto`) VALUES
(2, 'SI', 1, '2013-02-17 19:41:10', 0, '2013-02-18 23:17:58', 'LIHA851024I63', 'ALEJANDRO LIZAOLA HARO', 'cec705c0caa0302af5568eff30a93e9e4695b283', '(334) 289 3474', '(329) 847 3298', 'lizaolaa@gmail.comx');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `impuesto`
--

INSERT INTO `impuesto` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `nombre`, `descripcion`, `tasa`, `tipo`) VALUES
(1, 2, 'SI', 0, '2013-02-19 00:47:54', 0, '2013-02-19 00:47:54', 'IVA', 'IMPUESTO AL VALOR AGREGADO', 16, 'TRASLADADO');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

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
(9, 'ADMIN', 'miniconos/group.png', 'Cuentas', 'SI', 1),
(10, 'CLIENTE', 'miniconos/page_white_key.png', 'Información Fiscal', 'SI', 9);

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
  `tipo_cambio` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  `precio_unitario` decimal(10,0) NOT NULL,
  `moneda_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

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
(24, 10, 'Contribuyente', 'miniconos/newspaper.png', 'configuracion/fiscal', 'contenido', 'SI', 1, '2012-11-01 00:00:00');

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
  `codigo` varchar(10) NOT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `unidad`
--

INSERT INTO `unidad` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `nombre`, `descripcion`) VALUES
(1, 2, 'SI', 0, '2013-02-19 00:47:23', 0, '2013-02-19 00:47:23', 'CAJA', 'CAJA'),
(2, 2, 'SI', 0, '2013-02-19 00:47:34', 0, '2013-02-19 00:47:35', 'PIEZA', 'PIEZA');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `avatar`, `usuario`, `password`, `nombres`, `apellidos`, `correo`) VALUES
(5, 2, 'SI', 0, '2013-02-18 23:51:21', 0, '2013-02-19 00:22:36', 'avatar_50b1a24b659fa.png', 'yu', '8ef10ade1e513b2a4b026376daa3639663f5a076', 'TUUTYA', 'UTTU', 'saddsa@sada.asd'),
(6, 2, 'SI', 0, '2013-02-18 23:52:16', 0, '2013-02-18 23:52:16', 'avatar_50b1a24b659fa.png', 'wqewqe', '6f14838dcf02aa7ddf8ca6058c0762508b647c4e', 'QEWW', 'WQEQW', NULL),
(7, 2, 'SI', 0, '2013-02-18 23:52:54', 0, '2013-02-18 23:52:54', 'avatar_50b1a24b659fa.png', 'erwrew', '30616b704635622884a6bd0118a54b0bea4f3cdf', 'WRWEREW', 'EWREWREW', 'sad@asd.aasd'),
(8, 2, 'SI', 0, '2013-02-19 00:24:02', 0, '2013-02-19 00:24:02', 'avatar_50b1a24b659fa.png', 'saddas', 'e32ae588ad9729dfaf303577fb4fd7736f090bd0', 'ADSDAS', 'SADDSA', NULL);
