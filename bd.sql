-- phpMyAdmin SQL Dump
-- version 3.5.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 23, 2013 at 05:22 AM
-- Server version: 5.5.28
-- PHP Version: 5.3.18

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `aspos`
--

-- --------------------------------------------------------

--
-- Table structure for table `cbb_concepto`
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
-- Table structure for table `cbb_factura`
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
-- Table structure for table `cbb_folio`
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
-- Table structure for table `cbb_impuesto`
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
-- Table structure for table `cbb_receptor`
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
-- Table structure for table `cliente`
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cliente_tipo`
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `contribuyente`
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `contribuyente`
--

INSERT INTO `contribuyente` (`id`, `cuenta_id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `rfc`, `nombre`, `calle`, `exterior`, `interior`, `colonia`, `localidad`, `municipio`, `estado`, `pais`, `cpostal`, `telefono`, `celular`, `correo`, `nombre_comercial`, `cedula`, `logotipo`) VALUES
(1, 1, 'SI', 0, '2013-04-27 09:20:06', NULL, '2013-04-30 11:47:39', 'VECR8307073J1', 'RAMIRO ALONSO VERA CONTRERAS', 'ALEJANDRO PEÑA', '57', NULL, 'LA REINÁ', 'AMECÁ', 'AMECA', 'JALISCO', 'HOLAMÉXICO', '46600', NULL, NULL, NULL, '6KSOFT', 'VECR8307073J1.PNG', NULL),
(2, 2, 'SI', 0, '2013-04-27 09:22:27', NULL, '2013-04-27 09:22:27', 'XXXX000000XXX', 'PRUEBA DE EMPRESA X', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cuenta`
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `cuenta`
--

INSERT INTO `cuenta` (`id`, `activo`, `usuario_creacion_id`, `fecha_creacion`, `usuario_edicion_id`, `fecha_edicion`, `paquete_id`, `rfc`, `nombre`, `password`, `telefono_contacto`, `celular_contacto`, `correo_contacto`) VALUES
(1, 'SI', 0, '2013-04-27 09:20:06', NULL, '2013-04-29 15:30:24', 1, 'VECR8307073J1', 'RAMIRO ALONSO VERA CONTRERAS', '886fed01789257424228dc95fe3b5b319335ab6d', '(375) 105 0079', NULL, 'raalveco@gmail.com'),
(2, 'SI', 0, '2013-04-27 09:22:27', NULL, '2013-04-27 09:22:27', 1, 'XXXX000000XXX', 'PRUEBA DE EMPRESA X', '2f7ea749e13b1595cc6eb763da3e30ec7d3c6a7d', '(222) 222 2222', NULL, 'aasd@asdas.com');

-- --------------------------------------------------------

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
CREATE TABLE IF NOT EXISTS `departamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  `correo` varchar(100) DEFAULT 'contacto@ciberfactura.com.mx',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `departamento`
--

INSERT INTO `departamento` (`id`, `nombre`, `correo`) VALUES
(1, 'SOPORTE', 'soporte@emisionfiscal.com'),
(2, 'VENTAS', 'ventas@emisionfiscal.com'),
(3, 'PRUEBA 1', '1@CIBERFACTURA.COM.MX');

-- --------------------------------------------------------

--
-- Table structure for table `impuesto`
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `menu`
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
(10, 'CLIENTE', 'miniconos/page_white_key.png', 'Facturación', 'SI', 9),
(11, 'CLIENTE', 'miniconos/building_add.png', 'Sucursales', 'SI', 10),
(12, 'CLIENTE', 'miniconos/style_edit.png', 'Catalogos', 'SI', 11),
(13, 'ADMIN', 'miniconos/package.png', 'Paquetes', 'SI', 1),
(14, 'ADMIN', 'miniconos/newspaper.png', 'Tickets', 'SI', 3),
(15, 'ADMIN', 'miniconos/book.png', 'Departamentos', 'SI', 4);

-- --------------------------------------------------------

--
-- Table structure for table `moneda`
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `paquete`
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `paquete`
--

INSERT INTO `paquete` (`id`, `nombre`, `tipo`, `facturas_incluidas`, `costo_factura_adicional`, `usuarios`, `almacenamiento`, `soporte_online`, `soporte_chat`, `soporte_telefono`, `multiple_moneda`, `multiple_sucursal`, `costo_mensual`, `costo_anual`, `vigencia`, `activo`) VALUES
(1, 'CBB - GRATUITO', 'CBB', 5, '10.00', 1, 100, 'SI', 'NO', 'NO', 'NO', 'NO', '0.00', '0.00', '2013-12-31', 'SI');

-- --------------------------------------------------------

--
-- Table structure for table `producto`
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `producto_categoria`
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `seccion`
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=38 ;

--
-- Dumping data for table `seccion`
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
(37, 15, 'Catalogo', 'miniconos/book_open.png', 'departamentos/reporte', 'contenido', 'SI', 2, '2012-11-01 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `sucursal`
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
-- Table structure for table `ticket`
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`id`, `cuenta_id`, `usuario_id`, `admin_id`, `padre`, `admin`, `asunto`, `mensaje`, `departamento_id`, `fecha`, `respondido`, `estado`) VALUES
(1, 1, 0, '0', 0, 'NO', 'asdsadsadsdasdasf sf fds fsd dfs dfs dfs dffsd fsd fds f dsdfsdfds f dsf dsf ds fds f sd f sd f dsfds', 'adsdasdasf sf fds fsd dfs dfs dfs dffsd fsd fds f dsdfsdfds f dsf dsf ds fds f sd f sd f dsfds', 2, '0000-00-00 00:00:00', 'NO', 'OK'),
(6, 1, 0, '0', 0, 'NO', 'dsffds', 'dsfdsfds', 2, '0000-00-00 00:00:00', 'NO', 'OK'),
(7, 1, 0, '0', 0, 'NO', 'Ticket de Prueba', 'Ola k ace!!', 1, '2013-05-21 22:28:46', 'NO', 'OK');

-- --------------------------------------------------------

--
-- Table structure for table `unidad`
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
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
