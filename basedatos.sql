-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-04-2026 a las 16:44:13
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `basedatos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `descripcion`) VALUES
(1, 'cocina'),
(2, 'carro'),
(3, 'refrigerador'),
(4, 'lavadora'),
(5, 'laptop'),
(6, 'mouse'),
(7, 'parlante'),
(8, 'television'),
(9, 'camara'),
(10, 'horno');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `telefono` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombres`, `apellidos`, `direccion`, `telefono`) VALUES
(1, 'Maryori Cris', 'Taipe Tolentino', 'Av. Salsipuedes N°345', '929137780'),
(2, 'Luis Alberto', 'Utos Ceras', 'Av. Salsipuedes N°111', '912345678'),
(3, 'Magdalena Maria', 'Quiñonez Jimenes', 'Av. Marginal N°222', '987654321'),
(4, 'Ana Melisa', 'Arias Malpartida', 'Av. Francisco Bolognesi N°333', '978451261'),
(5, 'Miguel Jose', 'Torres Caysahuana', 'Av. La huerta N°444', '932165498'),
(6, 'Monica Sheyla', 'Meza Taipe', 'Av. La huerta N°444', '945216378'),
(7, 'Cristobal Colon', 'Chiricente Coco', 'Av. San Miguel N°555', '998545412'),
(8, 'Miguel Jose', 'Torres Caysahuana', 'Av. Colonos Fundadores N°666', '988785542'),
(9, 'Marcela Joaquín', 'Tito Tomas', 'Calles Madrigales N°777', '922148579'),
(10, 'Carlos Alvaro', 'Torres Caysahuana', 'Nueva Esperanza N°888', '911223345');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `id_detventa` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `id_venta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_venta`
--

INSERT INTO `detalle_venta` (`id_detventa`, `cantidad`, `id_producto`, `id_venta`) VALUES
(1, 20, 1, 10),
(2, 21, 2, 9),
(3, 22, 3, 8),
(4, 23, 4, 7),
(5, 24, 5, 6),
(6, 25, 6, 5),
(7, 26, 7, 4),
(8, 27, 8, 3),
(9, 28, 9, 2),
(10, 29, 10, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `precio` decimal(18,0) NOT NULL,
  `stock` int(11) NOT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `id_proveedor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `descripcion`, `precio`, `stock`, `id_categoria`, `id_proveedor`) VALUES
(1, 'aparato electronico 1', 200, 20, 10, 1),
(2, 'aparato electronico 2', 5000, 20, 9, 2),
(3, 'aparato electronico 3', 500, 20, 8, 3),
(4, 'aparato electronico 4', 1200, 20, 7, 4),
(5, 'aparato electronico 5', 2400, 20, 6, 5),
(6, 'aparato electronico 6', 65, 20, 5, 6),
(7, 'aparato electronico 7', 250, 20, 4, 7),
(8, 'aparato electronico 8', 1500, 20, 3, 8),
(9, 'aparato electronico 9', 50, 20, 2, 9),
(10, 'aparato electronico 10', 800, 20, 1, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_proveedor` int(11) NOT NULL,
  `razonsocial` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `telefono` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id_proveedor`, `razonsocial`, `direccion`, `telefono`) VALUES
(1, 'Grupo S.A 1', 'Jr. Colonos Fundadores', '911223344'),
(2, 'Grupo S.A 2', 'Av. Micaela', '923845210'),
(3, 'Grupo S.A 3', 'Calle Las Marvinas', '900145007'),
(4, 'Grupo S.A 4', 'Agusto B.Legia', '952400152'),
(5, 'Grupo S.A 5', 'Campos Las Flores', '988874574'),
(6, 'Grupo S.A 6', 'Calle Las Brisas del Sur', '966321008'),
(7, 'Grupo S.A 7', 'Las Praderas del Norte', '905442181'),
(8, 'Grupo S.A 8', 'Avenida Los Marginales', '971002450'),
(9, 'Grupo S.A 9', 'Cuadra Las nubes', '985456213'),
(10, 'Grupo S.A 10', 'Julio C.Tello', '912221445');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  `id_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id_venta`, `fecha`, `id_cliente`) VALUES
(1, '2025-08-28 16:30:24', 3),
(2, '2025-08-28 16:34:08', 1),
(3, '2025-08-28 16:35:29', 2),
(4, '2025-08-28 16:36:19', 4),
(5, '2025-08-28 16:37:02', 5),
(6, '2025-08-28 16:37:44', 6),
(7, '2025-08-28 16:38:31', 7),
(8, '2025-08-28 16:39:00', 8),
(9, '2025-08-28 16:39:32', 9),
(10, '2025-08-28 16:40:13', 10),
(11, '2025-08-29 09:37:02', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`id_detventa`),
  ADD KEY `fk_producto` (`id_producto`),
  ADD KEY `fk_venta` (`id_venta`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `fk_categoria` (`id_categoria`),
  ADD KEY `fk_proveedor` (`id_proveedor`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `fk_cliente` (`id_cliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `id_detventa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `fk_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_venta` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `fk_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
