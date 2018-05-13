-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 13-05-2018 a las 22:08:28
-- Versión del servidor: 10.1.30-MariaDB
-- Versión de PHP: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `crudcine`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE `evento` (
  `codevento` int(11) NOT NULL,
  `lugar` varchar(20) CHARACTER SET utf8 NOT NULL,
  `ciudad` varchar(15) CHARACTER SET utf8 NOT NULL DEFAULT 'Málaga',
  `fecpeli` date NOT NULL,
  `codpelicula` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `evento`
--

INSERT INTO `evento` (`codevento`, `lugar`, `ciudad`, `fecpeli`, `codpelicula`) VALUES
(19, 'Vialia', 'Málaga', '2018-03-25', 18),
(30, 'casa de Paco', 'Cádiz', '2018-10-10', 17),
(31, 'Cine Malagueta', 'Málaga', '2018-07-03', 27),
(32, 'Cine Rosaleda', 'Málaga', '2018-05-30', 26),
(33, 'Cine Cádiz23', 'Cádiz', '2018-05-22', 26);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peliula`
--

CREATE TABLE `peliula` (
  `codpeli` int(11) NOT NULL,
  `nompeli` varchar(40) NOT NULL,
  `despeli` text CHARACTER SET utf8
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `peliula`
--

INSERT INTO `peliula` (`codpeli`, `nompeli`, `despeli`) VALUES
(17, 'Torrente 1', 'El brazo tonto de la ley'),
(18, 'Titanic', 'Historia amorosa en un barco'),
(26, '300', 'Batalla de la Termópilas, entre Esparta, y el ejército persa'),
(27, 'La purga', 'Delincuencia extrema una vez al año (ficción - suspense)');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`codevento`),
  ADD KEY `codpelicula` (`codpelicula`);

--
-- Indices de la tabla `peliula`
--
ALTER TABLE `peliula`
  ADD PRIMARY KEY (`codpeli`),
  ADD UNIQUE KEY `nompeli` (`nompeli`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `evento`
--
ALTER TABLE `evento`
  MODIFY `codevento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `peliula`
--
ALTER TABLE `peliula`
  MODIFY `codpeli` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `evento_ibfk_1` FOREIGN KEY (`codpelicula`) REFERENCES `peliula` (`codpeli`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
