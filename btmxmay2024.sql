-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-01-2024 a las 21:02:28
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `btmxmay2024`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Contadores_centros_consumo` ()   BEGIN 

	DECLARE cello INT;
    DECLARE copa INT;
    DECLARE oriente INT;
    DECLARE tomahawk INT;
    DECLARE ember INT;
    DECLARE saffron INT;
    DECLARE sands INT;
    DECLARE haab INT;
    DECLARE latin INT;
    DECLARE noche INT;
    
    SELECT SUM(numero_personas + kids) INTO cello FROM reservas_restaurante WHERE fecha_reserva = CURDATE() AND nombre_restaurante = 1;
    SELECT SUM(numero_personas + kids) INTO copa FROM reservas_restaurante WHERE fecha_reserva = CURDATE() AND nombre_restaurante = 2;
    SELECT SUM(numero_personas + kids) INTO oriente FROM reservas_restaurante WHERE fecha_reserva = CURDATE() AND nombre_restaurante = 3;
    SELECT SUM(numero_personas + kids) INTO tomahawk FROM reservas_restaurante WHERE fecha_reserva = CURDATE() AND nombre_restaurante = 4;
    SELECT SUM(numero_personas + kids) INTO ember FROM reservas_restaurante WHERE fecha_reserva = CURDATE() AND nombre_restaurante = 5;
    SELECT SUM(numero_personas + kids) INTO saffron FROM reservas_restaurante WHERE fecha_reserva = CURDATE() AND nombre_restaurante = 6;
    SELECT SUM(numero_personas + kids) INTO sands FROM reservas_restaurante WHERE fecha_reserva = CURDATE() AND nombre_restaurante = 7;
    SELECT SUM(numero_personas + kids) INTO haab FROM reservas_destinations WHERE fecha_reserva = CURDATE() AND name_destination = 1;
    SELECT SUM(numero_personas + kids) INTO latin FROM reservas_destinations WHERE fecha_reserva = CURDATE() AND name_destination = 2;
    SELECT SUM(numero_personas + kids) INTO noche FROM reservas_destinations WHERE fecha_reserva = CURDATE() AND name_destination = 3;
    
    
    SELECT cello,copa,oriente,tomahawk,ember,saffron,sands,haab,latin,noche;
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Contadores_generales` ()   BEGIN
    	DECLARE restaurantes int;
        DECLARE eventos int;
        DECLARE destinations int;
        DECLARE usuarios int;

		SELECT SUM(numero_personas + kids) INTO restaurantes FROM reservas_restaurante WHERE fecha_reserva = CURDATE();
        SELECT SUM(numero_personas + kids) INTO eventos FROM reservas_eventos WHERE fecha_reserva = CURDATE();
        SELECT SUM(numero_personas + kids) INTO destinations FROM reservas_destinations WHERE fecha_reserva = CURDATE();	
        SELECT COUNT(*) INTO usuarios FROM usuarios WHERE id_usuario;
        
        SELECT restaurantes,eventos,destinations,usuarios;
        

        
        
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Contadores_por_dias` ()   BEGIN

DECLARE restaurantes_reservas_hoy int;
DECLARE destinations_reservas_hoy int;
DECLARE eventos_reservas_hoy int;

DECLARE restaurantes_reservas_mañana int;
DECLARE destinations_reservas_mañana int;
DECLARE eventos_reservas_mañana int;

DECLARE restaurantes_reservas_pasado int;
DECLARE destinations_reservas_pasado int;
DECLARE eventos_reservas_pasado int;


SELECT SUM(numero_personas + kids) INTO restaurantes_reservas_hoy FROM reservas_restaurante WHERE fecha_reserva = CURDATE();
SELECT SUM(numero_personas + kids) INTO destinations_reservas_hoy FROM reservas_destinations WHERE fecha_reserva = CURDATE();
SELECT SUM(numero_personas + kids) INTO eventos_reservas_hoy FROM reservas_eventos WHERE fecha_reserva = CURDATE();

SELECT SUM(numero_personas + kids) INTO restaurantes_reservas_mañana FROM reservas_restaurante WHERE fecha_reserva = CURDATE() - INTERVAL -1 DAY;
SELECT SUM(numero_personas + kids) INTO destinations_reservas_mañana FROM reservas_destinations WHERE fecha_reserva = CURDATE() - INTERVAL -1 DAY;
SELECT SUM(numero_personas + kids) INTO eventos_reservas_mañana FROM reservas_eventos WHERE fecha_reserva = CURDATE() - INTERVAL -1 DAY;

SELECT SUM(numero_personas + kids) INTO restaurantes_reservas_pasado FROM reservas_restaurante WHERE fecha_reserva = CURDATE() - INTERVAL -2 DAY;
SELECT SUM(numero_personas + kids) INTO destinations_reservas_pasado FROM reservas_destinations WHERE fecha_reserva = CURDATE() - INTERVAL -2 DAY;
SELECT SUM(numero_personas + kids) INTO eventos_reservas_pasado FROM reservas_eventos WHERE fecha_reserva = CURDATE() - INTERVAL -2 DAY;

SELECT restaurantes_reservas_hoy,destinations_reservas_hoy,eventos_reservas_hoy,
	   restaurantes_reservas_mañana,destinations_reservas_mañana,eventos_reservas_mañana,
       restaurantes_reservas_pasado,destinations_reservas_pasado,eventos_reservas_pasado;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `destinations`
--

CREATE TABLE `destinations` (
  `id_destinations` int(45) NOT NULL,
  `nombre_destination` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `destinations`
--

INSERT INTO `destinations` (`id_destinations`, `nombre_destination`) VALUES
(1, 'Haab'),
(2, 'Latin BBQ'),
(3, 'Noche mexicana');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE `eventos` (
  `id_evento` int(45) NOT NULL,
  `nombre_evento` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `eventos`
--

INSERT INTO `eventos` (`id_evento`, `nombre_evento`) VALUES
(1, 'Sin evento');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas_destinations`
--

CREATE TABLE `reservas_destinations` (
  `id_reserva_D` int(45) NOT NULL,
  `name_destination` int(45) NOT NULL,
  `huesped` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `mesa` int(45) NOT NULL,
  `villa` int(45) NOT NULL,
  `propiedad` varchar(45) NOT NULL,
  `numero_personas` int(45) NOT NULL,
  `kids` int(45) NOT NULL,
  `fecha_reserva` date NOT NULL,
  `horario_reserva` time NOT NULL,
  `comentarios` varchar(1500) NOT NULL,
  `solicitante` varchar(45) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fecha_edicion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `usuario_edita` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `reservas_destinations`
--

INSERT INTO `reservas_destinations` (`id_reserva_D`, `name_destination`, `huesped`, `apellidos`, `mesa`, `villa`, `propiedad`, `numero_personas`, `kids`, `fecha_reserva`, `horario_reserva`, `comentarios`, `solicitante`, `usuario`, `fecha_creacion`, `fecha_edicion`, `usuario_edita`) VALUES
(23, 1, ' TODD ', 'GILBERT', 0, 0, 'Etereo', 16, 0, '2024-01-30', '18:00:00', '\"YPO Group”| HAAB PRIVADO| todos con alcohol|  230 USD ++ per person| 4931.20 USD. PAGADOS cargar PM9006...', 'Todd Gilbert', 'Ygomez', '2024-01-03 12:43:36', '2024-01-04 19:31:09', 'it.admin'),
(24, 1, 'John ', 'Knapp', 0, 0, 'Andaz', 4, 0, '2024-01-07', '18:00:00', 'Departing 1/8 3038187756 With alcohol No allergies or restrictions|John, Barb, Kelsey & Kaitlin Knapp||we are celebrating our twins Kaitlin & Kelsey’s birthday (Jan 4th) on this trip. ', 'Guest', 'Ygomez', '2023-11-23 15:37:36', '2024-01-04 15:51:07', ''),
(28, 1, 'Andrea ', 'Rodeschini ', 0, 0, 'BT', 2, 0, '2024-02-08', '18:00:00', '+1 914-844-7664 | With Alcohol |Allergy to Scallops ', 'Guest', 'Ygomez', '2023-11-30 15:17:47', '2024-01-04 15:51:07', ''),
(29, 1, 'Andrea ', 'Rodeschini ', 0, 0, 'BT', 2, 0, '2024-02-10', '18:00:00', '+1 914-844-7664 | With Alcohol |Allergy to Scallops ', 'Guest', 'Ygomez', '2023-11-30 15:18:06', '2024-01-04 15:51:07', ''),
(30, 1, 'Diane P. ', 'Mirowski', 0, 305, 'BT', 4, 0, '2024-01-04', '18:00:00', 'no alergias| 2 con alcohol| 2 sin alcohol|  17 & 16|  CONFIRMADOS| OK BACK UP CAVA| OK PENALIDAD', 'Guest', 'Ygomez', '2024-01-04 14:53:30', '2024-01-04 16:26:47', 'Ygomez'),
(32, 3, 'Mark', 'Ruggeri', 0, 0, 'BT', 4, 0, '2024-01-06', '19:00:00', 'NA', 'RICARDO 0312', 'Cnava', '2023-12-03 20:32:04', '2024-01-04 15:51:07', ''),
(33, 1, 'Alesa ', 'Whitehead', 0, 0, 'Andaz', 14, 0, '2024-01-11', '18:00:00', ' NO será privado, podemos agregar más huespedes|Alec Wainberg IGroom) |Alesa Whitehead (Bride) |Margarita Carulo: Allergic to shellfish|	Joseph Whitehead| Suzanne Wainberg|Stuart Wainberg|Sophie Wainberg|Ben Wainberg| Larry Wainberg: No Chicken|Joan Wainberg| Noah Horowitz o	Vikrum Vishnubhakta o	Gavin Piasky o	Natalie Piasky: Allergic to tree nuts |Departure day: Tuesday January 16th 2024 |+1 239 293 2205| todos sin alcohol, mencionan que puede que ordenen alguna copa al momento de la cena, esto se pagará directo | se les dió precio festive 190 usd pp| PAGADO 53200 MXN cargar a PM9006', 'GUest', 'Ygomez', '2023-12-12 17:20:42', '2024-01-04 15:51:07', ''),
(34, 1, 'Julian', 'Kenneth', 0, 611, 'BT', 5, 0, '2024-01-04', '18:00:00', 'Shellfish allergy| 2 adultos con alcohol| 2 adolescentes sin alcohol| 1 menor de 8 años| CONFIRMADOS| OK BACK UP CAVA| OK PENALIDAD| Special Care |', 'Rafael | 0412', 'Rmerlo', '2024-01-04 14:54:39', '2024-01-04 19:41:52', 'it.admin'),
(35, 1, 'Cicely', 'Leemhuis', 0, 0, 'BT', 4, 1, '2024-01-06', '18:00:00', ' 2 adults and three children ages 15, 13 and 8.', 'Guest', 'Ygomez', '2023-12-05 17:45:54', '2024-01-04 15:51:07', ''),
(36, 1, 'grupo RSUI (repetitivo)', 'evento en Lobby Terrace', 0, 0, 'BT', 0, 0, '2024-02-22', '18:00:00', 'Esto es un recordatorio para que el ritual se haga directo en Haab por el evento en lobby', 'Israel 11/12', 'Ygomez', '2023-12-11 14:04:12', '2024-01-04 15:51:07', ''),
(37, 1, 'Olivia', 'Nadler ', 0, 0, 'BT', 10, 0, '2024-02-03', '18:00:00', 'TBD', 'American Express concierge', 'Ygomez', '2023-12-11 14:22:51', '2024-01-04 15:51:07', ''),
(38, 1, 'Sebastian', 'Prange', 0, 0, 'BT', 2, 0, '2024-01-09', '18:00:00', 'NA', 'Carmen 12.12', 'Cnava', '2023-12-12 23:52:40', '2024-01-04 15:51:07', ''),
(39, 1, 'Jonathan ', 'Lee', 0, 0, 'RWD', 19, 0, '2024-01-19', '18:00:00', 'Haab privado| grupo  Blue Signal Incentive| Alergias: Matt Walsh – Chocolate, Avocado, Red Wine, Blue Cheese| Melissa Coleman – Vegetarian (non negotiable), and strong preference for no eggs or dairy| Gabriela Bala – Shellfish| Scot Garstang – onions, corn', 'Jimena García ', 'Ygomez', '2023-12-13 16:29:59', '2024-01-04 15:51:07', ''),
(42, 3, 'John', 'Cunat', 0, 0, 'BT', 2, 0, '2024-01-23', '19:00:00', 'NA', 'Ricardo 21-12', 'Rmartinez', '2023-12-21 22:12:44', '2024-01-04 15:51:07', ''),
(43, 1, 'Rebecca ', ' DiBlasi ', 0, 0, '0', 2, 0, '2024-01-11', '18:00:00', 'Tree nut allergy and dislike of onions |Without alcohol |267-261-3777|PREPAGADO 380 USD, cargar PM 9006', 'Guest', 'Ygomez', '2023-12-22 23:36:25', '2024-01-04 15:51:07', ''),
(44, 1, 'Nicole', 'Lambert', 0, 0, 'BT', 3, 0, '2024-01-01', '18:00:00', 'NA', 'RICARDO 22-12', 'Rmartinez', '2023-12-22 18:40:44', '2024-01-04 15:51:07', ''),
(45, 1, 'Donesh', ' Olyaie', 0, 1421, 'Andaz', 2, 0, '2024-01-04', '18:00:00', 'Check out: 06 enero.| sin alergias| sin alcohol| CONFIRMADOS| OK BACK UP CAVA| OK PENALIDAD', 'MONICA GARCIA', 'Ygomez', '2023-12-24 19:03:11', '2024-01-04 16:48:10', 'Ygomez'),
(47, 2, 'Amy', 'Finzi', 0, 621, 'BT', 7, 0, '2024-01-03', '19:00:00', 'NA', 'Samara | 26/12', 'Svite', '2024-01-03 18:26:41', '2024-01-04 15:51:07', ''),
(48, 1, 'Rosalyn', 'Hongsaranagon', 0, 0, 'BT', 2, 2, '2024-01-06', '18:00:00', 'NA', 'Samara | 28/12', 'Svite', '2023-12-28 16:50:51', '2024-01-04 15:51:07', ''),
(49, 1, 'Isabel', 'Steffensen', 0, 111, 'BT', 3, 0, '2024-01-02', '18:00:00', 'su hija alergia a pescado, todo tipo de pescado| no alcohol para los 3| CONFIRMADOS | OK BACK UP CAVA| OK PENALIDAD', 'Samara | 28/12', 'Svite', '2024-01-02 14:18:14', '2024-01-04 15:51:07', ''),
(50, 2, 'Kevin', 'Livingston', 0, 612, 'BT', 6, 0, '2024-01-03', '19:00:00', 'NA', 'Samara | 28/12', 'Svite', '2024-01-03 18:27:09', '2024-01-04 15:51:07', ''),
(51, 2, 'Luis', 'Diaz', 0, 902, 'BT', 6, 0, '2024-01-03', '19:00:00', 'NA', 'Andrea G 28-12', 'Aguzman', '2024-01-03 18:27:24', '2024-01-04 15:51:07', ''),
(53, 1, 'Liza	', 'Joseph', 0, 813, 'BT', 4, 0, '2023-12-29', '18:00:00', 'N/A', 'Eduardo', 'Ygomez', '2023-12-29 15:27:47', '2024-01-04 15:51:07', ''),
(54, 1, 'Shaw', 'Heather', 0, 907, 'BT', 5, 0, '2024-01-02', '18:00:00', 'shellfish allergy| for Mr Jim Carter| 5 con alcohol 1 sin alcohol| CONFIRMADOS| OK BACK UP CAVA| OK PENALIDAD| VILLAS 418/417/416/907', 'Ricardo 29-12', 'Rmartinez', '2024-01-02 19:18:32', '2024-01-04 15:51:07', ''),
(55, 1, 'Alexandr', 'Kalisky', 0, 935, 'BT', 2, 0, '2024-01-04', '18:00:00', 'no alergias| ambos con alcohol| CONFIRMADOS| OK BACK UP CAVA| OK PENALIDAD', 'Samara | 29/12 ', 'Svite', '2024-01-04 15:18:52', '2024-01-04 19:19:35', 'Ygomez'),
(57, 3, 'Brent', 'Bennet', 0, 0, 'BT', 2, 0, '2024-01-06', '19:00:00', 'NA ', 'Carmen 29.12', 'Cnava', '2023-12-30 03:08:38', '2024-01-04 15:51:07', ''),
(61, 1, 'Brent', 'Bennet', 0, 0, 'BT', 2, 0, '2024-01-07', '18:00:00', 'NA', 'Carmen 29.12', 'Cnava', '2023-12-30 03:12:10', '2024-01-04 15:51:07', ''),
(62, 3, 'Emilie', 'Jarvis', 0, 518, 'BT', 2, 2, '2024-01-06', '19:00:00', 'N/A', 'Guest', 'Ygomez', '2023-12-30 14:11:07', '2024-01-04 15:51:07', ''),
(65, 1, 'Daniela', 'Almeida', 0, 0, 'BT', 3, 1, '2024-01-09', '18:00:00', 'NA', 'Samara | 30/12', 'Svite', '2023-12-30 17:02:41', '2024-01-04 15:51:07', ''),
(68, 2, 'Alberto', 'Morales', 0, 408, 'BT', 3, 0, '2024-01-03', '19:00:00', 'N/A', 'Guest', 'Ygomez', '2023-12-30 18:12:28', '2024-01-04 15:51:07', ''),
(70, 1, 'Patrick ', 'Schloter', 0, 0, 'BT', 2, 0, '2024-01-07', '18:00:00', 'NA', 'Carmen 30.12', 'Cnava', '2023-12-30 21:28:24', '2024-01-04 15:51:07', ''),
(71, 1, 'Lori', 'Wrinkle', 0, 0, 'BT', 4, 0, '2024-01-07', '18:00:00', 'NA', 'RICARDO 30-12', 'Rmartinez', '2023-12-30 22:21:16', '2024-01-04 15:51:07', ''),
(73, 3, 'Joshua', 'Rosenthal', 0, 211, 'BT', 2, 1, '2024-01-06', '19:00:00', 'no comen puerco', 'Karen Rocha', 'Ygomez', '2023-12-31 14:47:37', '2024-01-04 15:51:07', ''),
(74, 1, 'Frank ', 'Gerold', 0, 307, 'FMT', 9, 0, '2024-01-03', '18:00:00', 'Mike Whalen sin alcohol Siri y Aaron Simons sí alcohol Maggie y Frank gerold si alcohol Edward Requenez si alcohol Vanessa Requenez no alcohol Cesar Fernandez y Ana Paez - 1 con alcohol 1 sin alcohol|CONFIRMADOS| OK BACK UP CAVA| OK PENALIDAD', 'Tavo Molina', 'Ygomez', '2024-01-03 16:30:43', '2024-01-04 15:51:07', ''),
(77, 2, 'Max', 'Lakhter', 0, 0, 'BT', 2, 0, '2024-01-10', '19:00:00', 'N/A', 'Rafael | 3112', 'Rmerlo', '2023-12-31 22:24:54', '2024-01-04 15:51:07', ''),
(79, 1, 'Jonathan', 'Friedman', 0, 0, 'BT', 2, 0, '2024-01-30', '18:00:00', 'N/A', 'Rafael | 3112', 'Rmerlo', '2023-12-31 23:59:47', '2024-01-04 15:51:07', ''),
(80, 1, 'Liza ', 'Weltz', 0, 0, 'BT', 2, 0, '2024-01-09', '18:00:00', 'NA', 'Carmen 31.12', 'Cnava', '2024-01-01 00:57:54', '2024-01-04 15:51:07', ''),
(82, 1, 'Bonnie', 'Smolins', 0, 0, 'BT', 6, 0, '2024-01-13', '18:00:00', 'TBD', 'Guest', 'Ygomez', '2024-01-01 15:16:27', '2024-01-04 15:51:07', ''),
(83, 1, 'Breaunna', 'Odume', 0, 0, 'BT', 5, 0, '2023-04-20', '18:00:00', 'N/A', 'Rafael | 0101', 'Rmerlo', '2024-01-01 17:58:41', '2024-01-04 15:51:07', ''),
(84, 2, 'Alejandro', 'bataller', 0, 406, 'BT', 6, 5, '2024-01-03', '19:00:00', '4 niños y un bebé, una silla alta|la Sra Bataller es vegetariana', 'Guest', 'Ygomez', '2024-01-03 19:35:09', '2024-01-04 15:51:07', ''),
(85, 3, 'Christopher', 'Murphy', 0, 0, 'BT', 4, 0, '2024-01-06', '19:00:00', 'NA', 'Ricardo 01-01', 'Rmartinez', '2024-01-01 23:38:36', '2024-01-04 15:51:07', ''),
(86, 3, 'David', 'Glickstein', 0, 0, 'BT', 2, 0, '2024-02-17', '19:00:00', 'NA', 'Carmen 01.01', 'Cnava', '2024-01-02 01:25:19', '2024-01-04 15:51:07', ''),
(87, 3, 'Ron', 'Zelingzon', 0, 0, 'BT', 4, 1, '2024-01-06', '19:00:00', 'NA', 'Samara | 02/01', 'Svite', '2024-01-02 12:56:35', '2024-01-04 15:51:07', ''),
(89, 1, 'Brian', 'Fullmer', 0, 0, 'BT', 2, 0, '2024-01-14', '18:00:00', 'NA', 'Samara | 02/01', 'Svite', '2024-01-02 14:52:29', '2024-01-04 15:51:07', ''),
(90, 1, 'Charlotte', ' cheshire ', 0, 0, 'EXT', 16, 0, '2024-04-29', '18:00:00', 'PRIVADO| NO AGENDAR MÁS HUESPEDES| With alcohol |+447891945350', 'GUEST', 'Ygomez', '2024-01-02 16:57:18', '2024-01-04 15:51:07', ''),
(91, 3, 'Katherine', 'Schatzow,', 0, 906, 'BT', 3, 3, '2024-01-06', '19:00:00', 'niños de 1 año, 3 y 6 años|Alergia a pecan nuts and walnuts de Poppy', 'Eduardo', 'Ygomez', '2024-01-02 19:07:25', '2024-01-04 15:51:07', ''),
(92, 1, 'Katherine', 'Hillebrand', 0, 0, 'BT', 6, 0, '2024-02-01', '18:00:00', 'N/A', 'Rafael | 0201', 'Rmerlo', '2024-01-03 16:42:05', '2024-01-04 15:51:07', ''),
(93, 3, 'ALexander', 'Pavincic', 0, 0, 'BT', 2, 0, '2024-01-06', '19:00:00', 'NA', 'Carmen 02.01', 'Cnava', '2024-01-02 20:43:34', '2024-01-04 15:51:07', ''),
(94, 2, 'March', 'Herbst', 0, 0, 'BT', 2, 0, '2024-01-17', '19:00:00', 'NA', 'Andrea G 02-01', 'Svite', '2024-01-03 01:35:41', '2024-01-04 15:51:07', ''),
(95, 1, 'Marc', 'Herbst', 0, 0, 'BT', 2, 0, '2024-01-20', '18:00:00', 'NA', 'Andrea G 02-01', 'Svite', '2024-01-03 01:36:34', '2024-01-04 15:51:07', ''),
(96, 3, 'Jordan', 'Snow', 0, 0, 'BT', 2, 0, '2024-01-06', '19:00:00', 'NA', 'CA', 'Cnava', '2024-01-03 12:39:13', '2024-01-04 15:51:07', ''),
(97, 1, 'Tessa', 'Sidman', 0, 0, 'BT', 2, 0, '2024-01-09', '18:00:00', 'NA', 'Carmen 03.01', 'Cnava', '2024-01-03 12:45:18', '2024-01-04 15:51:07', ''),
(98, 3, 'Tessa', 'Sidman', 0, 0, 'BT', 2, 0, '2024-01-06', '19:00:00', 'NA', 'Carmen 03.01', 'Cnava', '2024-01-03 12:50:11', '2024-01-04 15:51:07', ''),
(104, 3, 'Michael ', 'Nagle', 0, 0, 'BT', 2, 0, '2024-01-20', '19:00:00', 'NA', 'Carmen 03.01', 'Cnava', '2024-01-03 16:31:04', '2024-01-04 15:51:07', ''),
(107, 1, 'Michael ', 'Nagle', 0, 0, 'BT', 2, 0, '2024-01-21', '18:00:00', 'NA', 'Carmen 03.01', 'Cnava', '2024-01-03 16:31:25', '2024-01-04 15:51:07', ''),
(108, 2, 'Mayssoun', 'Bydon', 0, 810, 'BT', 3, 3, '2024-01-03', '19:00:00', 'Mesa aparte', 'Laura', 'Ygomez', '2024-01-03 16:36:57', '2024-01-04 15:51:07', ''),
(109, 1, ' Donna ', 'Dever', 0, 0, 'FMT', 2, 0, '2024-01-03', '18:00:00', 'con alcohol| 1 pesquetarian que también come seafood| CONFIRMADOS| OK BACK UP CAVA| OK PENALIDAD', 'gUEST', 'Ygomez', '2024-01-03 19:55:27', '2024-01-04 15:51:07', ''),
(110, 2, 'Mathieu	', 'Laine	', 0, 613, 'BT', 3, 2, '2024-01-03', '19:00:00', 'alergia al atun crudo', 'Eduardo', 'Ygomez', '2024-01-03 21:43:30', '2024-01-04 15:51:07', ''),
(111, 1, 'Mario', 'Monroy Galeazzi, ', 0, 203, 'BT', 2, 1, '2024-01-06', '18:00:00', 'no alergias| adultos sin alcohol| niño de 7 años| menor menu regular| pasta a la mantquilla (espagueti) 1 pizza de peperoni, postre brownie con helado ', 'gUEST', 'Ygomez', '2024-01-03 21:47:13', '2024-01-04 15:51:07', ''),
(112, 1, 'Rosen', 'Rudy', 0, 0, 'Bt', 16, 0, '2024-02-02', '18:00:00', 'HAAB PRIVADO 16 PXS', 'Ricardo 03-01', 'Rmartinez', '2024-01-03 22:30:19', '2024-01-04 15:51:07', ''),
(113, 3, 'Max ', 'Lakhter', 0, 0, 'BT', 2, 0, '2024-01-06', '18:00:00', 'NA', 'RICARDO 03-01', 'Rmartinez', '2024-01-04 03:46:59', '2024-01-04 15:51:07', ''),
(114, 1, 'BLOQUEADO', 'BLOQUEADO', 0, 0, 'BT', 18, 0, '2024-01-05', '18:00:00', 'BLOQUEO', 'Yasmin|Zulema', 'Ygomez', '2024-01-04 14:26:33', '2024-01-04 15:51:07', ''),
(115, 1, 'Jack', 'Prutting', 0, 0, 'BT', 2, 0, '2024-01-18', '18:00:00', 'Celebrating Honeymoon', 'Andrea G 04-01', 'Aguzman', '2024-01-04 16:56:42', '2024-01-04 16:56:42', ''),
(116, 3, 'Alejandro', 'Bataller', 0, 406, 'BT', 6, 5, '2024-01-06', '19:00:00', 'Sra no come carne', 'Abel Morales', 'Ygomez', '2024-01-04 16:57:12', '2024-01-04 18:54:39', 'Ygomez'),
(123, 1, 'Kaveh', 'Saberi', 0, 0, 'BT', 2, 0, '2024-01-16', '18:00:00', 'Mr. Saberi Birthday', 'Samara | 04/01', 'Svite', '2024-01-04 19:19:10', '2024-01-04 19:58:37', 'Svite');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas_eventos`
--

CREATE TABLE `reservas_eventos` (
  `id_reserva_E` int(45) NOT NULL,
  `name_evento` int(45) NOT NULL,
  `huesped` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `mesa` varchar(45) NOT NULL,
  `villa` int(45) NOT NULL,
  `propiedad` varchar(45) NOT NULL,
  `numero_personas` int(45) NOT NULL,
  `kids` int(45) NOT NULL,
  `fecha_reserva` date NOT NULL,
  `horario_reserva` time NOT NULL,
  `comentarios` varchar(1500) NOT NULL,
  `solicitante` varchar(45) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas_restaurante`
--

CREATE TABLE `reservas_restaurante` (
  `id_reserva_R` int(45) NOT NULL,
  `nombre_restaurante` int(45) NOT NULL,
  `huesped` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `mesa` int(45) NOT NULL,
  `villa` int(45) NOT NULL,
  `propiedad` varchar(45) NOT NULL,
  `numero_personas` int(45) NOT NULL,
  `kids` int(45) NOT NULL,
  `fecha_reserva` date NOT NULL,
  `horario_reserva` time NOT NULL,
  `comentarios` varchar(1500) NOT NULL,
  `solicitante` varchar(45) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fecha_edicion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `usuario` varchar(45) NOT NULL,
  `usuario_edita` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `reservas_restaurante`
--

INSERT INTO `reservas_restaurante` (`id_reserva_R`, `nombre_restaurante`, `huesped`, `apellidos`, `mesa`, `villa`, `propiedad`, `numero_personas`, `kids`, `fecha_reserva`, `horario_reserva`, `comentarios`, `solicitante`, `fecha_creacion`, `fecha_edicion`, `usuario`, `usuario_edita`) VALUES
(23, 1, 'Jeremy', 'Smith', 0, 0, 'BT', 4, 0, '2024-01-31', '19:00:00', 'N/A', 'KATJA | 0409', '2023-11-16 16:55:31', '2024-01-04 17:18:20', 'Gustavo_carranza', 'Gustavo_carranza'),
(25, 1, 'Andrew', 'Knieberg', 0, 705, 'BT', 2, 0, '2024-01-02', '20:00:00', 'Cassie has a seafood allergy, She dislikes chocolate covered strawberries, cannot have spinach or almonds. They prefer savory over sweet.', 'Rafael | 0811', '2024-01-02 22:01:23', '2024-01-04 15:39:44', 'Gustavo_carranza', ''),
(26, 7, 'Steven', 'Rome', 0, 918, 'BT', 6, 3, '2024-01-01', '19:00:00', 'N/A', 'Rafael | 1511', '2024-01-01 21:25:44', '2024-01-04 15:39:44', 'Gustavo_carranza', ''),
(28, 6, 'Jeremy', 'Smith', 0, 0, 'BT', 4, 0, '2024-01-29', '19:00:00', 'N/A', 'KATJA | 0409', '2023-11-16 17:09:30', '2024-01-04 15:39:44', 'Gustavo_carranza', ''),
(29, 2, 'Jeremy', 'Smith', 0, 0, 'BT', 4, 0, '2024-01-30', '19:00:00', 'N/A', 'KATJA | 0409', '2023-11-16 17:19:25', '2024-01-04 15:39:44', 'Gustavo_carranza', ''),
(31, 6, 'Patrick', 'Miller', 0, 0, 'BT', 2, 0, '2024-01-20', '18:30:00', 'Celebran su luna de miel|Contact phone number: 1-604-828-9162|solicitan mesa en deck privado por favor', 'Guest | LP0210', '2023-11-16 17:37:25', '2024-01-04 15:39:44', 'Gustavo_carranza', ''),
(32, 6, 'Urvi ', 'Patel', 0, 0, 'BT', 7, 0, '2024-01-09', '18:30:00', 'one vegan person and rest of the guests are vegetarian  ?	Contact phone number: +1 443-851-9601', 'Guest | LP0410', '2023-11-16 17:39:22', '2024-01-04 15:39:44', 'Gustavo_carranza', ''),
(33, 6, 'Alison ', 'Devore ', 0, 0, 'Andaz', 2, 0, '2024-01-01', '18:00:00', 'my son is allergic to nuts (all nuts including cashews, peanuts etc) so cooking pans must be clean for cooking his dish', 'Guest', '2023-11-16 17:47:29', '2024-01-04 15:39:44', 'Gustavo_carranza', ''),
(34, 6, 'Diane', 'Mirowski', 0, 305, 'Bt', 4, 0, '2024-01-01', '18:00:00', 'N/A', 'Samara | 07/11', '2024-01-01 21:26:09', '2024-01-04 15:39:44', 'Gustavo_carranza', ''),
(35, 6, 'Andrew', 'Knieberg', 0, 705, 'BT', 2, 0, '2024-01-01', '19:00:00', 'Cassie has a seafood allergy, She dislikes chocolate covered strawberries, cannot have spinach or almonds. They prefer savory over sweet.|Srta Lamere doesnt eat shellfish, spinach and almonds', 'Rafael | 0811', '2024-01-01 21:27:08', '2024-01-04 15:39:44', 'Gustavo_carranza', ''),
(36, 6, 'Jeffrrey', 'Stone', 0, 0, 'BT', 6, 3, '2024-01-06', '17:30:00', 'Huespedes no quisieron set menu', 'Rafael | 0811', '2023-11-16 20:06:47', '2024-01-04 15:39:44', 'Gustavo_carranza', ''),
(37, 7, 'Jeremy', 'Smith', 0, 0, 'BT', 4, 0, '2024-01-30', '19:00:00', 'N/A', 'KATJA | 0409', '2023-11-16 20:08:05', '2024-01-04 15:39:44', 'Gustavo_carranza', ''),
(38, 7, 'Brenda', 'Abuaf', 0, 112, 'BT', 7, 0, '2024-01-01', '19:00:00', 'TBD', 'Guest', '2024-01-01 21:28:37', '2024-01-04 15:39:44', 'Gustavo_carranza', ''),
(47, 1, 'Tanya', 'Farah', 0, 0, 'BT', 2, 0, '2024-01-04', '20:30:00', 'sin comentarios', 'Andrea G 17-11', '2024-01-04 16:54:14', '2024-01-04 16:56:12', 'Aguzman', 'Gustavo_carranza'),
(48, 6, 'Tanya', 'Farah', 0, 0, 'BT', 2, 0, '2024-01-05', '20:00:00', 'NA', 'Andrea G 17-11', '2023-11-17 19:10:59', '2024-01-04 15:39:44', 'Aguzman', ''),
(49, 4, 'Tanya', 'Farah', 0, 0, 'BT', 2, 0, '2024-01-06', '20:00:00', 'NA', 'Andrea G 17-11', '2023-11-17 19:11:48', '2024-01-04 17:18:49', 'Aguzman', 'Gustavo_carranza'),
(50, 1, 'Tanya', 'Farah', 0, 0, 'BT', 2, 0, '2024-01-07', '20:00:00', 'NA', 'Andrea G 17-11', '2023-11-17 19:12:36', '2024-01-04 15:39:44', 'Aguzman', ''),
(51, 4, 'Tanya', 'Farah', 0, 0, 'BT', 2, 0, '2024-01-09', '20:00:00', 'NA', 'Andrea G 17-11', '2023-11-17 19:13:40', '2024-01-04 15:39:44', 'Aguzman', ''),
(52, 6, 'Tanya', 'Farah', 0, 0, 'BT', 2, 0, '2024-01-10', '20:00:00', 'NA', 'Andrea G 17-11', '2023-11-17 19:14:24', '2024-01-04 15:39:44', 'Aguzman', ''),
(56, 5, 'Michael', 'Setton', 0, 0, 'BT', 2, 3, '2024-01-21', '17:30:00', 'NA', 'Carmen 17.11', '2023-11-17 21:03:42', '2024-01-04 15:39:44', 'Cnava', ''),
(57, 5, 'Michael', 'Setton', 0, 0, 'BT', 2, 3, '2024-01-22', '17:30:00', 'NA', 'Carmen 17.11', '2023-11-17 21:04:22', '2024-01-04 15:39:44', 'Cnava', ''),
(58, 5, 'Michael', 'Setton', 0, 0, 'BT', 2, 3, '2024-01-23', '17:30:00', 'NA', 'Carmen 17.11', '2023-11-17 21:05:01', '2024-01-04 15:39:44', 'Cnava', ''),
(59, 1, 'Austin', 'Rief', 0, 212, 'BT', 2, 0, '2024-01-02', '19:45:00', 'honeymoon |1 4102077605', 'Guest', '2024-01-02 22:00:53', '2024-01-04 15:39:44', 'Ygomez', ''),
(60, 6, 'Austin', 'Rief', 0, 0, 'BT', 2, 0, '2024-01-04', '19:45:00', 'honeymoon |1 4102077605', 'Guest', '2023-11-21 18:55:33', '2024-01-04 15:39:44', 'Ygomez', ''),
(61, 4, 'Austin', 'Rief', 0, 0, 'BT', 2, 0, '2024-01-06', '19:45:00', 'honeymoon |1 4102077605', 'Guest', '2023-11-21 18:56:08', '2024-01-04 15:39:44', 'Ygomez', ''),
(62, 6, 'Michael', 'Sales', 0, 210, 'BT', 12, 0, '2024-01-03', '19:00:00', 'Cumpleaños 14 de Ben de la family ', 'Samara | 22/11', '2024-01-03 17:42:30', '2024-01-04 15:39:44', 'Svite', ''),
(63, 2, 'Omar ', 'Maani', 0, 603, 'BT', 3, 2, '2024-01-03', '19:00:00', 'Na', 'Carmen 22.11', '2024-01-03 17:42:53', '2024-01-04 15:39:44', 'Cnava', ''),
(64, 6, 'Omar ', 'Maani', 0, 0, 'BT', 3, 2, '2024-01-04', '19:00:00', 'Na', 'Carmen 22.11', '2023-11-24 18:06:21', '2024-01-04 15:39:44', 'Cnava', ''),
(65, 4, 'Omar ', 'Maani', 0, 0, 'BT', 3, 2, '2024-01-05', '19:00:00', 'Na', 'Carmen 22.11', '2023-11-22 19:06:35', '2024-01-04 15:39:44', 'Cnava', ''),
(66, 1, 'Omar ', 'Maani', 0, 0, 'BT', 3, 2, '2024-01-06', '19:00:00', 'Na', 'Carmen 22.11', '2023-11-22 19:08:08', '2024-01-04 15:39:44', 'Cnava', ''),
(68, 6, ' TODD ', 'GILBERT', 0, 0, 'Etereo', 16, 0, '2024-01-30', '18:30:00', '\"YPO Group”. | fAMILY STYLE MENU 125 USD ++ PP| Deposit for 2787.20 USD received cargar a PM 9006|   Cancelations must be made 72 hours in advance to receive a full refund. 2.                  Cancelations made 48 hours in advance will have a 50% penalty.', 'Todd Gilbert', '2024-01-03 12:41:35', '2024-01-04 15:39:44', 'Ygomez', ''),
(71, 6, 'John ', 'Knapp', 0, 0, 'Andaz', 4, 0, '2024-01-04', '18:00:00', 'Departing 1/8 3038187756 With alcohol No allergies or restrictions|John, Barb, Kelsey & Kaitlin Knapp||we are celebrating our twins Kaitlin & Kelsey’s birthday (Jan 4th) on this trip. ', 'Guest', '2023-11-23 15:39:07', '2024-01-04 15:39:44', 'Ygomez', ''),
(72, 4, 'Diane', 'Mirowski', 0, 305, 'BT', 4, 0, '2024-01-02', '19:00:00', 'no alergias', 'Guest', '2024-01-02 22:02:29', '2024-01-04 15:39:44', 'Ygomez', ''),
(74, 7, 'Paul', 'Gilner', 0, 0, 'BT', 6, 0, '2024-02-14', '19:30:00', 'N/A', 'Guest', '2023-12-28 23:34:39', '2024-01-04 15:39:44', 'Ygomez', ''),
(75, 1, 'Paul', 'Gilner', 0, 0, 'BT', 6, 0, '2024-02-17', '19:30:00', 'N/A', 'Guest', '2023-12-28 23:36:28', '2024-01-04 15:39:44', 'Ygomez', ''),
(76, 4, 'Paul', 'Gilner', 0, 0, 'BT', 6, 0, '2024-02-16', '19:30:00', 'N/A', 'Guest', '2023-12-28 23:35:46', '2024-01-04 15:39:44', 'Ygomez', ''),
(77, 1, 'Paul', 'Gilner', 0, 0, 'BT', 6, 0, '2024-02-15', '19:30:00', 'N/A', 'Guest', '2023-12-28 23:35:14', '2024-01-04 15:39:44', 'Ygomez', ''),
(78, 4, 'Christine ', 'Barulich', 0, 0, 'BT', 4, 0, '2024-01-05', '20:00:00', 'Solicita mesa en la isla cerca del agua|415-760–0932', 'Guest', '2023-12-26 21:02:00', '2024-01-04 15:39:44', 'Ygomez', ''),
(79, 1, 'Christine ', 'Barulich', 0, 0, 'BT', 4, 0, '2024-01-06', '20:00:00', 'Solicita mesa en la isla cerca del agua|415-760–0932', 'Guest', '2023-11-27 19:18:20', '2024-01-04 15:39:44', 'Ygomez', ''),
(132, 1, 'Avital ', 'Lassow ', 0, 0, 'FMT', 6, 0, '2024-01-24', '19:00:00', 'N/A', 'Guest', '2023-11-25 21:04:06', '2024-01-04 15:39:44', 'Ygomez', ''),
(134, 5, 'Steven ', 'Novick', 0, 0, 'BT', 10, 8, '2024-01-21', '19:15:00', 'N/A', 'Rafael | 2611', '2023-11-26 15:18:31', '2024-01-04 15:39:44', 'Rmerlo', ''),
(135, 4, 'Jill', 'Fishman', 0, 0, 'BT', 3, 0, '2024-01-04', '19:00:00', 'N/A', 'Rafael | 2611', '2024-01-03 15:07:17', '2024-01-04 15:39:44', 'Rmerlo', ''),
(137, 4, 'Kyle', 'Klopcic', 0, 0, 'BT', 2, 0, '2024-01-21', '20:00:00', 'part of the New Belgium Reyes Presidents group', 'Guest', '2023-11-27 15:41:59', '2024-01-04 15:39:44', 'Ygomez', ''),
(138, 6, 'Kyle', 'Klopcic', 0, 0, 'BT', 2, 0, '2024-01-22', '19:00:00', 'part of the New Belgium Reyes Presidents group', 'Guest', '2023-11-27 15:43:58', '2024-01-04 15:39:44', 'Ygomez', ''),
(139, 1, 'Kyle', 'Klopcic', 0, 0, 'BT', 2, 0, '2024-01-23', '18:00:00', 'part of the New Belgium Reyes Presidents group', 'Guest', '2023-11-27 15:44:12', '2024-01-04 15:39:44', 'Ygomez', ''),
(140, 7, 'Gorkem	', 'Kuterdem', 0, 0, 'BT', 2, 0, '2024-02-16', '19:00:00', 'No food allergies. Contact number is +1-206-229-9282.', 'G', '2023-11-27 15:55:09', '2024-01-04 15:39:44', 'Ygomez', ''),
(141, 6, 'Frederick', 'Wilson', 0, 0, 'StRegis', 2, 0, '2024-01-04', '18:00:00', 'no allergies or dietary restrictions|+1 336 687-6036', 'Guest', '2023-11-27 16:17:33', '2024-01-04 15:39:44', 'Ygomez', ''),
(142, 6, 'Andrea ', 'Travers', 0, 0, 'BT', 2, 0, '2024-01-04', '19:30:00', '314-322-6751', 'Guest', '2023-11-27 19:12:03', '2024-01-04 15:39:44', 'Ygomez', ''),
(144, 4, 'Michelle', 'Boyers', 0, 917, 'BT', 12, 917, '2024-01-01', '19:30:00', 'we have a severe shrimp (and crab and lobster ) allergy in our group| solicita nice table outside', 'Rafael | 2711', '2024-01-01 21:36:10', '2024-01-04 15:39:44', 'Rmerlo', ''),
(146, 7, 'Debbie ', 'Otner ', 0, 0, 'Andaz', 5, 0, '2024-01-02', '18:00:00', 'Departure date: 1/3/24|9734643384', 'Guest', '2023-11-29 15:29:54', '2024-01-04 15:39:44', 'Ygomez', ''),
(147, 6, 'Nick ', 'Dowling', 0, 0, 'EXt', 6, 0, '2024-01-02', '18:00:00', ' +1 703-244-9419| pagó deposito por 6000 MXN, cargar a PM 9006', 'Guest', '2023-12-13 21:03:37', '2024-01-04 15:39:44', 'Ygomez', ''),
(148, 6, 'Dave ', 'Gilbert', 0, 0, 'Andaz', 2, 1, '2024-01-03', '18:00:00', 'Allergic to Eggplant|Check out: 05 jan', 'MONICA GARCIA', '2023-11-29 16:48:50', '2024-01-04 15:39:44', 'Ygomez', ''),
(149, 6, 'Ivan ', 'Zinn', 0, 816, 'RWD', 4, 0, '2024-01-02', '18:30:00', 'N/A', 'Rodrigo Blanco ', '2023-11-29 16:53:45', '2024-01-04 15:39:44', 'Ygomez', ''),
(150, 6, 'Arturo ', 'Carvajal', 0, 0, 'FHP', 9, 0, '2024-01-02', '20:30:00', 'PH 8| 10 % OFF OWNER| Cancelación mismo día antes de las 3pm, después de las 3pm o no show penalidad 50USD por persona', 'Ana Laguna', '2023-11-29 17:13:57', '2024-01-04 15:39:44', 'Ygomez', ''),
(151, 4, 'Arturo ', 'Carvajal', 0, 0, 'FHP', 9, 0, '2024-01-03', '20:30:00', 'PH 8| 10 % OFF OWNER| Cancelación mismo día antes de las 3pm, después de las 3pm o no show penalidad 50USD por persona', 'Ana Laguna', '2023-11-29 17:14:15', '2024-01-04 15:39:44', 'Ygomez', ''),
(152, 1, 'Arturo ', 'Carvajal', 0, 0, 'FHP', 9, 0, '2024-01-04', '20:30:00', 'PH 8| 10 % OFF OWNER| Cancelación mismo día antes de las 3pm, después de las 3pm o no show penalidad 50USD por persona', 'Ana Laguna', '2023-11-29 17:14:29', '2024-01-04 15:39:44', 'Ygomez', ''),
(153, 6, 'Marnie', 'Sperling', 0, 0, 'FMT', 8, 0, '2024-01-02', '18:00:00', '+1 847-224-7561', 'Fernanda González ', '2023-12-07 15:00:09', '2024-01-04 15:39:44', 'Ygomez', ''),
(154, 7, 'Saul', 'Kassin', 0, 0, 'BT', 20, 0, '2024-01-19', '19:00:00', 'Guests are kosher, they will be having food from an external provider, they are already aware of the 15 USD fee per person, Ms. Kassin will enter to the kitchen just to verify how the food is heated OK Chef Alfonso / Abel. One table for 20 Guests. Ok Karen Rocha (Armarla en el ajedrez con las mesas de la Latin BBQ)', 'Rafael | 2911', '2023-12-31 00:12:54', '2024-01-04 15:39:44', 'Rmerlo', ''),
(155, 6, 'Karen ', 'Williams ', 0, 0, 'FMT', 4, 0, '2024-01-02', '18:00:00', 'just a family vacation. No food restrictions | 1-216-849-461', 'Guest', '2023-11-29 18:32:57', '2024-01-04 15:39:44', 'Ygomez', ''),
(159, 6, 'Ryan', 'Terry', 0, 0, 'FMT', 6, 0, '2024-01-05', '19:00:00', 'CO el 06 de enero', 'Rodrigo Sosa', '2023-11-30 15:03:29', '2024-01-04 15:39:44', 'Ygomez', ''),
(160, 4, 'Client Forum', 'Americas 2024', 0, 0, 'BT', 15, 0, '2024-02-27', '19:00:00', 'grupo Private Client Forum Americas |cargo a la cuenta maestra|Este grupo es repetitivo, es el sexto año que nos visitan y la contato Rachael Toovey esta muy familiarizada con el hotel. ', 'Carolina Moreno', '2023-11-30 15:26:04', '2024-01-04 15:39:44', 'Ygomez', ''),
(162, 1, 'Brenda', 'Abuaf', 0, 0, 'BT', 7, 0, '2024-01-02', '19:30:00', 'N/A', 'Gguest', '2023-12-30 22:09:25', '2024-01-04 15:39:44', 'Ygomez', ''),
(163, 2, 'Dr Rebecca ', 'Barber', 0, 0, 'BT', 3, 0, '2024-01-02', '19:00:00', 'N/A', 'Guest', '2023-11-30 19:58:28', '2024-01-04 15:39:44', 'Ygomez', ''),
(164, 4, 'Dr Rebecca ', 'Barber', 0, 513, 'BT', 3, 0, '2024-01-03', '19:00:00', 'Sra. Barber is vegetarian', 'Guest', '2024-01-03 19:36:01', '2024-01-04 15:39:44', 'Ygomez', ''),
(165, 7, 'Dr Rebecca ', 'Barber', 0, 0, 'BT', 3, 0, '2024-01-04', '19:00:00', 'N/A', 'Guest', '2023-11-30 19:59:14', '2024-01-04 15:39:44', 'Ygomez', ''),
(166, 6, 'Dr Rebecca ', 'Barber', 0, 0, 'BT', 3, 0, '2024-01-05', '19:00:00', 'N/A', 'Guest', '2023-11-30 19:59:29', '2024-01-04 15:39:44', 'Ygomez', ''),
(167, 1, 'Dr Rebecca ', 'Barber', 0, 0, 'BT', 3, 0, '2024-01-06', '19:00:00', 'N/A', 'Guest', '2023-11-30 19:59:43', '2024-01-04 15:39:44', 'Ygomez', ''),
(168, 2, 'Christine', 'Anderson', 0, 0, 'BT', 10, 0, '2024-03-21', '20:00:00', 'Set Menu', 'Rafael | 3011', '2023-12-01 00:52:39', '2024-01-04 15:39:44', 'Rmerlo', ''),
(169, 6, 'Christine', 'Anderson', 0, 0, 'BT', 12, 0, '2024-03-22', '20:00:00', 'Set menu pend elegir | Request subject to availability: a special table for the group maybe with a water view', 'Rafael | 3011', '2023-12-01 00:56:53', '2024-01-04 15:39:44', 'Rmerlo', ''),
(170, 6, 'Brenda ', 'Griess', 0, 0, 'RWD', 4, 0, '2024-01-02', '18:30:00', 'honeymoon celebration!|1-402-203-4350 ', 'Guest', '2023-12-01 17:21:48', '2024-01-04 15:39:44', 'Ygomez', ''),
(171, 6, 'Tom ', 'Ewing ', 0, 0, 'BT', 6, 0, '2024-01-18', '20:00:00', 'New Belgium Brewery group ', 'Guest', '2023-12-14 14:59:47', '2024-01-04 15:39:44', 'Ygomez', ''),
(172, 4, 'Tom ', 'Ewing', 0, 0, 'BT', 6, 0, '2024-01-19', '19:30:00', 'New Belgium Brewery group ', 'Guest', '2023-12-01 19:48:03', '2024-01-04 15:39:44', 'Ygomez', ''),
(173, 1, 'Tom ', 'Ewing', 0, 0, 'BT', 6, 0, '2024-01-20', '19:30:00', 'New Belgium Brewery group ', 'Guest', '2023-12-01 19:48:16', '2024-01-04 15:39:44', 'Ygomez', ''),
(174, 2, 'Rudy ', 'Rosen', 0, 0, 'BT', 8, 0, '2024-01-31', '19:30:00', 'Son un grupo de 16  pax, se divieron en 2 horarios | Ms. Alexandra Cukier has a gluten allergy (ofrecerle opciones)', 'Carmen 01.12', '2024-01-03 22:37:03', '2024-01-04 15:39:44', 'Cnava', ''),
(175, 6, 'Rudy ', 'Rosen', 0, 0, 'BT', 16, 0, '2024-02-01', '19:30:00', 'Family style menu | Ms. Alexandra Cukier has a gluten allergy (ofrecerle opciones en este set menu)', 'Carmen 01.12', '2024-01-02 16:17:57', '2024-01-04 15:39:44', 'Cnava', ''),
(176, 2, 'Rudy ', 'Rosen', 0, 0, 'BT', 8, 0, '2024-01-31', '19:30:00', 'Son un grupo de 16  pax, se divieron en 2 horarios | Ms. Alexandra Cukier has a gluten allergy (ofrecerle opciones)', 'Carmen 01.12', '2024-01-02 16:20:21', '2024-01-04 15:39:44', 'Cnava', ''),
(177, 7, 'Rudy ', 'Rosen', 0, 0, 'BT', 8, 0, '2024-02-03', '19:30:00', 'Son un grupo de 16  pax, se divieron en 2 horarios | Ms. Alexandra Cukier has a gluten allergy (ofrecerle opciones)', 'Carmen 01.12', '2024-01-03 22:23:03', '2024-01-04 15:39:44', 'Cnava', ''),
(178, 7, 'Rudy ', 'Rosen', 0, 0, 'BT', 8, 0, '2024-02-03', '20:00:00', 'Son un grupo de 16  pax, se divieron en 2 horarios | Ms. Alexandra Cukier has a gluten allergy (ofrecerle opciones)', 'Carmen 01.12', '2024-01-03 22:23:28', '2024-01-04 15:39:44', 'Cnava', ''),
(179, 6, 'Jonathan', 'Crowley', 0, 505, 'BT', 3, 0, '2024-01-01', '18:00:00', 'NA', 'Carmen 01.12', '2024-01-01 21:36:35', '2024-01-04 15:39:44', 'Cnava', ''),
(180, 7, 'Jonathan', 'Crowley', 0, 505, 'BT', 3, 0, '2024-01-03', '18:00:00', 'NA', 'Carmen 01.12', '2024-01-03 19:36:19', '2024-01-04 15:39:44', 'Cnava', ''),
(182, 6, 'Gavin', 'Kagan', 0, 609, 'BT', 2, 0, '2024-01-03', '18:00:00', 'N/A', 'Guest', '2024-01-02 19:32:44', '2024-01-04 15:39:44', '', ''),
(183, 6, 'Gavin', 'Kagan', 0, 609, 'BT', 2, 0, '2024-01-07', '18:00:00', 'N/A', 'Guest', '2024-01-02 19:33:12', '2024-01-04 15:39:44', '', ''),
(185, 7, 'Todd ', 'Waldman', 0, 0, 'Andaz', 5, 0, '2024-01-01', '18:00:00', 'Check out: 05 ene', 'MONICA GARCIA', '2023-12-09 14:51:21', '2024-01-04 15:39:44', 'Ygomez', ''),
(186, 5, 'Alan ', 'Greenberg ', 0, 0, 'RWD', 2, 0, '2024-02-11', '20:00:00', 'Departure day: February 18, 2024|+1 (917) 848-4316', 'Myles Osorio', '2023-12-03 14:24:48', '2024-01-04 15:39:44', 'Ygomez', ''),
(187, 5, 'Alan ', 'Greenberg ', 0, 0, 'RWD', 2, 0, '2024-02-12', '20:00:00', 'Departure day: February 18, 2024|+1 (917) 848-4316', 'Myles Osorio', '2023-12-03 14:25:01', '2024-01-04 15:39:44', 'Ygomez', ''),
(188, 5, 'Alan ', 'Greenberg ', 0, 0, 'RWD', 2, 0, '2024-02-14', '20:00:00', 'Departure day: February 18, 2024|+1 (917) 848-4316', 'Myles Osorio', '2023-12-03 14:25:15', '2024-01-04 15:39:44', 'Ygomez', ''),
(189, 5, 'Alan ', 'Greenberg ', 0, 0, 'RWD', 2, 0, '2024-02-17', '18:00:00', 'Departure day: February 18, 2024|+1 (917) 848-4316| Shabbat menu |Cancellations must be done 24hrs in advance for a full charge penalty not to be imposed. The experience will be cancelled if the aforementioned conditions are not met.', 'Myles Osorio', '2023-12-29 01:07:42', '2024-01-04 15:39:44', 'Ygomez', ''),
(190, 6, 'Ryan', 'Meara', 0, 0, 'BT', 2, 0, '2024-01-06', '19:30:00', 'wedding anniversary |9144345933', 'Guest', '2023-12-03 18:29:58', '2024-01-04 15:39:44', 'Ygomez', ''),
(191, 6, 'Amanda', 'Bell', 0, 0, 'BT', 2, 0, '2024-01-20', '19:30:00', 'celebrating our 20th anniversary.| Solicitan mesa afuera by the water||704-609-6627| no alergias', 'Guest', '2023-12-03 18:34:52', '2024-01-04 15:39:44', 'Ygomez', ''),
(193, 4, 'Darren ', 'Blumberg', 0, 0, 'RWD', 9, 0, '2024-01-02', '19:30:00', 'CO 05  ENE | Cancelación mismo día después de las 3pm o no show 50 USD penalidad', 'Leticia López  ', '2023-12-03 18:48:42', '2024-01-04 15:39:44', 'Ygomez', ''),
(194, 6, 'Darren ', 'Blumberg', 0, 0, 'RWD', 9, 0, '2024-01-04', '18:30:00', 'CO 05  ENE ', 'Leticia López  ', '2023-12-03 18:46:13', '2024-01-04 15:39:44', 'Ygomez', ''),
(196, 6, 'Mark', 'Ruggeri', 0, 0, 'BT', 4, 0, '2024-01-05', '18:30:00', 'NA', 'RICARDO 0312', '2023-12-03 20:45:51', '2024-01-04 15:39:44', 'Cnava', ''),
(198, 6, 'Koji', ' Pupo', 0, 0, 'BT', 2, 0, '2024-01-21', '18:30:00', 'New Belgium Reyes Presidents group', 'Guest', '2024-01-03 13:58:44', '2024-01-04 15:39:44', 'Ygomez', ''),
(199, 4, 'Koji', ' Pupo', 0, 0, 'BT', 2, 0, '2024-02-22', '18:30:00', 'New Belgium Reyes Presidents group|425-615-5773', 'Guest', '2024-01-03 13:58:54', '2024-01-04 15:39:44', 'Ygomez', ''),
(200, 1, 'Koji', ' Pupo', 0, 0, 'BT', 2, 0, '2024-01-23', '18:30:00', 'New Belgium Reyes Presidents group|425-615-5773', 'Guest', '2024-01-03 13:59:05', '2024-01-04 15:39:44', 'Ygomez', ''),
(201, 2, 'William', 'Hult', 0, 0, 'RWD', 5, 0, '2024-01-02', '19:00:00', 'CO -06 ENE', 'Kevin Ochoa ', '2023-12-04 16:25:17', '2024-01-04 15:39:44', 'Ygomez', ''),
(202, 1, 'Russell ', 'Sachs  ', 0, 0, 'FMT', 4, 0, '2024-01-03', '20:30:00', 'Cumpleaños numero 15 de la hija de los huespedes.', 'Karen Vázquez', '2023-12-04 17:15:24', '2024-01-04 15:39:44', 'Ygomez', ''),
(203, 6, 'Leora ', 'Horn ', 0, 0, 'FMT', 8, 0, '2024-01-19', '20:00:00', 'Co 0121', 'guest', '2023-12-04 17:43:51', '2024-01-04 15:39:44', 'Ygomez', ''),
(204, 1, 'Colleen ', 'Maranges', 0, 0, 'RWD', 2, 2, '2024-01-04', '18:00:00', 'check out:? Enero 02-07|Celebration of Wedding Anniversary ', 'Giovanna  ?? ', '2023-12-05 21:45:56', '2024-01-04 15:39:44', 'Ygomez', ''),
(205, 6, 'Colleen ', 'Maranges', 0, 0, 'RWD', 2, 2, '2024-01-04', '18:00:00', 'check out:? Enero 02-07|Celebration of Wedding Anniversary ', 'Giovanna  ?? ', '2023-12-05 21:45:37', '2024-01-04 15:39:44', 'Ygomez', ''),
(207, 6, 'Anthony', 'Camarata', 0, 0, 'Bt', 2, 0, '2024-02-04', '18:00:00', '10-year anniversary|615-418-6885', 'Guest', '2023-12-04 19:09:33', '2024-01-04 15:39:44', 'Ygomez', ''),
(208, 6, 'Lynn', 'King', 0, 606, 'BT', 9, 0, '2024-01-02', '19:30:00', 'Ms. Jessica Rozen is celiac', 'Carmen 04.12', '2024-01-02 22:10:15', '2024-01-04 15:39:44', 'Dalmazan', ''),
(209, 6, 'Tania', 'Reed', 0, 0, 'FHP', 4, 0, '2024-01-07', '19:30:00', 'SIN descuento NO alergias NO celebraciones', 'Ana Laguna', '2023-12-04 19:19:23', '2024-01-04 15:39:44', 'Ygomez', ''),
(213, 1, 'Yukio', 'sonoda', 0, 204, 'BT', 3, 0, '2024-01-02', '19:15:00', 'My soon Hiro has peanut allergy // No lamb or deer', 'Carmen 05.12', '2024-01-02 21:56:20', '2024-01-04 15:39:44', 'Cnava', ''),
(214, 6, 'Yukio', 'Sonoda', 0, 204, 'BT', 3, 0, '2024-01-04', '20:00:00', 'My soon Hiro has peanut allergy // No lamb or deer', 'Carmen 05.12', '2024-01-03 17:27:15', '2024-01-04 18:17:27', 'Cnava', 'Ygomez'),
(215, 7, 'Yukio', 'sonoda', 0, 0, 'BT', 3, 0, '2024-01-05', '19:30:00', 'My soon Hiro has peanut allergy // No lamb or deer', 'Carmen 05.12', '2024-01-03 17:27:53', '2024-01-04 15:39:44', 'Cnava', ''),
(217, 1, 'Yukio', 'sonoda', 0, 0, 'BT', 3, 0, '2024-01-06', '19:30:00', 'My soon Hiro has peanut allergy // No lamb or deer', 'Carmen 05.12', '2024-01-01 18:31:06', '2024-01-04 15:39:44', 'Cnava', ''),
(218, 4, 'Eduardo ', 'Alanis', 0, 3612, 'Andaz', 16, 0, '2024-01-01', '18:00:00', 'Sin alergias y celebran el aniversario de los Señores Noriega|TOMAHAWK  Family Style     120 USD ++ por persona   Todos los precios están sujetos al 16% de IVA y al 18% de cargo por servicio.| Cancelación sin penalidad un día antes Cancelación mismo día antes de las 3pm 50% penalidad Cancelación mismo día después de las 3 o no show, full charge.', 'Paco', '2024-01-01 15:43:51', '2024-01-04 15:39:44', 'Ygomez', ''),
(220, 6, 'Nicole', 'Wesselmann', 0, 304, 'BT', 4, 0, '2024-01-01', '19:30:00', 'N/A', 'Guest', '2024-01-01 21:37:08', '2024-01-04 15:39:44', 'Ygomez', ''),
(221, 7, 'Nicole', 'Wesselmann', 0, 0, 'BT', 4, 0, '2024-01-06', '19:30:00', 'N/A', 'Guest', '2023-12-13 15:30:09', '2024-01-04 15:39:44', 'Ygomez', ''),
(224, 1, 'Cicely', 'Leemhuis', 0, 301, 'BT', 4, 1, '2024-01-03', '18:00:00', '2 adults and three children ages 15, 13 and 8', 'Guest', '2024-01-03 19:36:45', '2024-01-04 15:39:44', 'Ygomez', ''),
(225, 7, 'Cicely', 'Leemhuis', 0, 0, 'BT', 4, 1, '2024-01-05', '18:30:00', '2 adults and three children ages 15, 13 and 8', 'Guest', '2023-12-05 17:53:42', '2024-01-04 15:39:44', 'Ygomez', ''),
(226, 4, 'Cicely', 'Leemhuis', 0, 0, 'BT', 4, 1, '2024-01-07', '18:30:00', '2 adults and three children ages 15, 13 and 8', 'Guest', '2023-12-05 17:54:00', '2024-01-04 15:39:44', 'Ygomez', ''),
(227, 6, 'Margaret ', 'Thomas', 0, 0, 'BT', 4, 0, '2024-12-08', '19:30:00', 'TBD', 'Guest', '2023-12-05 18:17:23', '2024-01-04 15:39:44', 'Ygomez', ''),
(228, 4, 'Sandra', 'Lin', 0, 0, 'BT', 2, 0, '2024-01-11', '18:30:00', 'N/A', 'Rafael | 0512', '2023-12-05 18:26:52', '2024-01-04 15:39:44', 'Rmerlo', ''),
(229, 6, 'Sandra', 'Lin', 0, 0, 'BT', 2, 0, '2024-01-13', '18:30:00', 'N/A', 'Rafael | 0512', '2023-12-05 18:28:41', '2024-01-04 15:39:44', 'Rmerlo', ''),
(230, 4, 'Stephanie ', 'Wuenschel ', 0, 0, 'BT', 2, 0, '2024-01-21', '20:30:00', 'New Belgium group', 'Guest', '2023-12-05 21:26:19', '2024-01-04 15:39:44', 'Ygomez', ''),
(231, 6, 'Stephanie ', 'Wuenschel ', 0, 0, 'BT', 2, 0, '2024-01-22', '18:00:00', 'New Belgium Brewery group ', 'Guest', '2023-12-05 21:26:55', '2024-01-04 15:39:44', 'Ygomez', ''),
(232, 4, 'Stephanie ', 'Wuenschel ', 0, 0, 'BT', 2, 0, '2024-01-23', '18:00:00', 'New Belgium Brewery group ', 'Guest', '2023-12-05 21:27:11', '2024-01-04 15:39:44', 'Ygomez', ''),
(233, 5, 'Steven', 'Novick', 0, 0, 'BT', 10, 8, '2024-01-22', '19:15:00', 'NA', 'Samara | 05/12', '2023-12-05 22:16:30', '2024-01-04 15:39:44', 'Dalmazan', ''),
(234, 1, 'Tushar', 'Shekhawat', 0, 912, 'BT', 4, 0, '2024-01-01', '19:30:00', 'NA', 'Samara | 05/12', '2024-01-01 21:38:26', '2024-01-04 15:39:44', 'Dalmazan', ''),
(235, 4, 'Tushar', 'Shekhawat', 0, 912, 'BT', 4, 0, '2024-01-02', '20:00:00', 'NA', 'Samara | 05/12', '2024-01-02 22:05:04', '2024-01-04 15:39:44', 'Dalmazan', ''),
(236, 1, 'Travis', 'Betters', 0, 901, 'BT', 2, 2, '2024-01-01', '19:00:00', 'NA', 'Carmen 06.12', '2024-01-01 21:38:55', '2024-01-04 15:39:44', 'Cnava', ''),
(237, 6, 'Liza', 'Joseph', 0, 813, 'BT', 4, 0, '2024-01-01', '19:30:00', 'NA', 'Samara | 06/12', '2024-01-01 21:43:21', '2024-01-04 15:39:44', 'Svite', ''),
(238, 4, 'JoDean ', 'Nicolette', 0, 0, 'Andaz', 7, 0, '2024-01-08', '18:00:00', 'Our reservation is under the name Fritz for three rooms at the Andaz Jan 7-Jan 12.|1-707-292-2474', 'GUest', '2023-12-07 14:58:30', '2024-01-04 15:39:44', 'Ygomez', ''),
(239, 6, 'Meeta ', 'Jain', 0, 1431, 'Andaz', 8, 0, '2024-01-04', '19:30:00', '2 people in the group of 8 have nut allergies (no peanuts, almonds, cashews, pistachios, walnuts, etc) and one person is vegetarian - no meat or fish. |773-931-7037|Allergies for our group include peanuts, egg and tree nuts (cashews, almonds, pistachios, walnuts, etc). ', 'Guest', '2023-12-08 17:10:20', '2024-01-04 18:37:46', 'Ygomez', 'Ygomez'),
(240, 6, 'Navdeep ', 'Tangri ', 0, 0, 'FMT', 8, 2, '2024-01-07', '18:30:00', 'Cancelations same day after 3pm or no show have a 50 USD fee per person|2 niños under 5', 'Guest', '2023-12-29 01:56:57', '2024-01-04 15:39:44', 'Ygomez', ''),
(241, 6, 'Brian ', 'Hassan', 0, 0, 'FMT', 6, 0, '2024-01-04', '20:00:00', 'CO 06 Jan|Solicitan mesa by the water outside', 'Guest', '2023-12-09 16:39:19', '2024-01-04 15:39:44', 'Ygomez', ''),
(242, 2, 'Cicely', 'Leemhuis', 0, 0, 'BT', 4, 1, '2024-01-04', '19:30:00', '2 adults and three children ages 15, 13 and 8', 'Guest', '2024-01-03 21:34:55', '2024-01-04 15:39:44', 'Ygomez', ''),
(244, 1, 'Shail', 'Shah', 0, 0, 'BT', 2, 0, '2024-01-12', '18:30:00', 'Celebrating 10th Anniversary. Request outside table for this special occasion', 'Andrea G 08-12', '2023-12-16 22:04:21', '2024-01-04 15:39:44', 'Dalmazan', ''),
(245, 6, 'Shail', 'Shah', 0, 0, 'BT', 2, 0, '2024-01-13', '17:30:00', 'Request table outside. Celebrating 10th Anniversary', 'Andrea G 08-12', '2023-12-09 17:19:05', '2024-01-04 15:39:44', 'Dalmazan', ''),
(246, 7, 'Laura', 'Martin', 0, 0, 'BT', 2, 0, '2024-01-01', '19:00:00', 'NA', 'Andrea G 08-12', '2023-12-08 21:33:53', '2024-01-04 15:39:44', 'Dalmazan', ''),
(247, 4, 'Karen ', 'Wiegel', 0, 0, 'BT', 2, 0, '2024-01-15', '19:00:00', 'NA', 'Samara | 09/12', '2023-12-27 19:15:40', '2024-01-04 15:39:44', 'Svite', ''),
(248, 1, 'Karen', 'Wiegel', 0, 0, 'BT', 2, 0, '2024-01-13', '19:00:00', 'NA', 'Samara | 09/12', '2023-12-27 19:14:51', '2024-01-04 15:39:44', 'Svite', ''),
(249, 6, 'Karen', 'Wiegel', 0, 0, 'BT', 2, 0, '2024-01-16', '19:00:00', 'NA', 'Samara | 09/12', '2023-12-27 19:16:27', '2024-01-04 15:39:44', 'Svite', ''),
(250, 6, 'Christopher ', 'Carter', 0, 0, 'RWD', 4, 0, '2024-01-18', '18:30:00', 'Celebration of guests 40th birthday (Courtney’s birthday is August 17, and Mr. Carter’s birthday is February 29.) and 13th Wedding Anniverdary WD: Jan 08th', 'Giovana', '2023-12-09 22:49:30', '2024-01-04 15:39:44', 'Ygomez', ''),
(251, 1, 'Donald', 'Greenwald', 0, 0, 'RWD', 3, 0, '2024-01-06', '19:30:00', 'check out:? Enero 08', 'Giovanna ', '2023-12-16 17:04:19', '2024-01-04 15:39:44', 'Ygomez', ''),
(252, 6, 'Courtney', 'Schilling', 0, 0, 'FMT', 5, 0, '2024-01-04', '18:30:00', 'Contacto +1 713 305 2361|es una agente de viajes, viene mañana a site inspection| full show', 'Fernanda González ', '2023-12-14 17:17:26', '2024-01-04 17:32:40', 'Ygomez', 'Ygomez'),
(253, 6, 'Jonathon ', 'Kaufman', 0, 0, 'RWD', 4, 0, '2024-01-05', '18:30:00', 'check out:? enero 07', 'Giovanna ', '2023-12-09 22:55:08', '2024-01-04 15:39:44', 'Ygomez', ''),
(254, 6, 'Kristen ', 'Gillock  ', 0, 0, 'RWD', 2, 0, '2024-01-07', '18:30:00', 'No gluten for Mrs. Gillock|?Celebration of the guests birthdays Mrs.Gillock on Jan 13th and Mr. Gillock on Jan 30th||check out:? Enero 11', 'Giovanna', '2023-12-09 23:01:05', '2024-01-04 15:39:44', 'Ygomez', ''),
(255, 6, 'Aanand ', 'Patel', 0, 205, 'FMT', 6, 3, '2024-01-03', '17:30:00', 'Solicitudes: 2 periqueras Celebraciones: 70 cumpleaños del papá  Alergias: Ninguna| Solicitan un pastel con vela en cortesía', 'Alejandra Gonzalez', '2024-01-03 20:04:42', '2024-01-04 15:39:44', 'Ygomez', ''),
(256, 6, 'Michael', 'Dennis', 0, 922, 'BT', 8, 1, '2024-01-13', '19:00:00', 'Mesa en la isla, traen una bebé', 'Jazmin 10/12', '2023-12-12 19:02:53', '2024-01-04 15:39:44', 'Ygomez', ''),
(257, 5, 'Michael', 'Setton', 0, 0, 'BT', 2, 3, '2024-01-17', '17:30:00', 'N/A', 'Rafael | 1012', '2023-12-10 15:54:17', '2024-01-04 15:39:44', 'Rmerlo', ''),
(259, 1, 'Jennifer', 'Newman', 0, 801, 'BT', 4, 0, '2024-01-01', '19:30:00', 'NA', 'Andrea G 10-12', '2024-01-01 21:50:41', '2024-01-04 15:39:44', 'Dalmazan', ''),
(260, 6, 'Olivia', 'Nadler ', 0, 0, 'BT', 10, 0, '2024-02-02', '19:00:00', 'Family style ', 'American Express concierge', '2023-12-11 14:21:32', '2024-01-04 15:39:44', 'Ygomez', ''),
(261, 4, 'Staff ', 'RSUI', 0, 0, 'BT', 24, 0, '2024-02-21', '18:30:00', 'Family Style', 'Vicente Diaz', '2023-12-11 15:22:22', '2024-01-04 15:39:44', 'Ygomez', ''),
(266, 5, 'Bernard', 'Fox', 0, 0, 'BT', 7, 0, '2024-01-06', '12:30:00', 'N/A', 'Rafael | 1112', '2023-12-29 19:15:57', '2024-01-04 15:39:44', 'Rmerlo', ''),
(267, 1, 'Macey ', 'Davis', 0, 0, 'FMT', 4, 0, '2024-01-04', '18:30:00', '214-543-8007', 'guest', '2023-12-12 14:40:18', '2024-01-04 15:39:44', 'Ygomez', ''),
(268, 6, 'Chris ', 'Kenney', 0, 0, 'Andaz', 6, 0, '2024-01-27', '20:00:00', '857-256-4869|CO 0129', 'Guest', '2023-12-11 17:29:52', '2024-01-04 15:39:44', 'Ygomez', ''),
(269, 6, 'Lauren', 'Ridenhour', 0, 0, 'BT', 2, 0, '2024-01-26', '19:00:00', 'N/A', 'Guest', '2023-12-11 17:32:05', '2024-01-04 15:39:44', 'Ygomez', ''),
(270, 6, 'Scott ', 'Clawson', 0, 0, 'RWD', 8, 1, '2024-01-03', '18:00:00', 'Check out: 4 de enero 2023', 'Irene Vazquez ', '2023-12-20 17:02:11', '2024-01-04 15:39:44', 'Ygomez', ''),
(271, 6, 'Baltazar ', 'Reséndez', 0, 111, 'FHP', 8, 0, '2024-01-02', '21:00:00', 'Sin alergias ni celebraciones  Sin descuento', 'Saraí Villarino', '2023-12-12 18:05:42', '2024-01-04 15:39:44', 'Ygomez', ''),
(272, 6, 'Matthew', 'Shatz', 0, 0, 'Andaz', 4, 0, '2024-01-03', '20:00:00', 'CHECK OUT: 06/01/2024 ', 'Xochil Contreras', '2023-12-29 23:50:50', '2024-01-04 15:39:44', 'Ygomez', ''),
(273, 6, 'Tracy ', 'Noren', 0, 0, 'FMT', 4, 0, '2024-01-04', '18:00:00', 'No comen cilantro|+1 312 401 5110 ó +1 773 620 3475 ó tracynoren1@gmail.com', 'Fernanda González ', '2023-12-16 17:06:42', '2024-01-04 15:39:44', 'Ygomez', ''),
(274, 1, 'Tracy ', 'Noren', 0, 0, 'FMT', 4, 0, '2024-01-05', '19:00:00', 'No comen cilantro|+1 312 401 5110 ó +1 773 620 3475 ó tracynoren1@gmail.com', 'Fernanda González ', '2023-12-11 17:56:30', '2024-01-04 15:39:44', 'Ygomez', ''),
(275, 5, 'Joseph ', 'Berkowitz', 0, 0, 'FMT', 8, 0, '2024-01-17', '19:00:00', 'tamara.drazin@hmhn.org', 'Guest', '2023-12-11 17:58:35', '2024-01-04 15:39:44', 'Ygomez', ''),
(277, 6, 'Amy ', 'Fischer', 0, 0, 'FMT', 10, 0, '2024-01-20', '18:30:00', 'Alergias o Restricciones: Shellfish, gluten free and soy free|Celebran el cumpleaños no. 50 de Amy|1 315 304 2115 ó amysfischer123@gmail.com|Family style menu 120 USD + +pp|All prices are subject to 16% VAT and 18% service charge   Cancellations must be done 48hrs in advance for a full charge penalty not to be imposed.  Cancellations done 24hrs in advance will pay penalty of 50% of the total price.  The experience will be cancelled if the aforementioned conditions are not met. ', 'Fernanda G', '2023-12-14 20:54:38', '2024-01-04 15:39:44', 'Ygomez', ''),
(278, 1, 'James ', 'Ziegler', 0, 0, 'BT', 2, 0, '2024-01-06', '19:30:00', 'NA', 'Carmen 12.12', '2023-12-13 01:23:08', '2024-01-04 15:39:44', 'Cnava', ''),
(279, 4, 'James ', 'Ziegler', 0, 0, 'BT', 2, 0, '2024-01-07', '19:30:00', 'NA', 'Carmen 12.12', '2023-12-15 14:37:01', '2024-01-04 15:39:44', 'Cnava', ''),
(280, 7, 'James ', 'Ziegler', 0, 0, 'BT', 2, 0, '2024-01-08', '19:30:00', 'NA', 'Carmen 12.12', '2023-12-13 01:25:13', '2024-01-04 15:39:44', 'Cnava', ''),
(281, 6, 'James ', 'Ziegler', 0, 0, 'BT', 2, 0, '2024-12-09', '19:30:00', 'NA', 'Carmen 12.12', '2023-12-13 01:26:31', '2024-01-04 15:39:44', 'Cnava', ''),
(282, 1, 'Jeremy', 'Baileys ', 0, 0, 'BT', 2, 0, '2024-01-12', '18:00:00', 'Aniversary', 'Ricardo 13.12', '2023-12-13 13:07:13', '2024-01-04 15:39:44', 'Rmartinez', ''),
(283, 6, 'Jeremy', 'Baileys ', 0, 0, 'BT', 2, 0, '0000-00-00', '18:00:00', 'Aniversary', 'Ricardo 13.12', '2023-12-13 13:08:44', '2024-01-04 15:39:44', 'Rmartinez', ''),
(284, 1, 'Harold	', 'Hope', 0, 0, 'BT', 8, 0, '2024-01-05', '19:30:00', 'Nancy Hope, age 11) is celiac so eats gluten-free.', 'Rafa Merlo |1911', '2023-12-21 18:33:09', '2024-01-04 15:39:44', 'Ygomez', ''),
(285, 1, 'Jonh	', 'Robbins	', 0, 0, 'BT', 4, 1, '2024-01-04', '17:45:00', 'N/A', 'Rafael | 1110	', '2023-12-13 15:38:26', '2024-01-04 15:39:44', 'Ygomez', ''),
(286, 4, 'Harold', 'Hope', 0, 0, 'BT', 10, 0, '2024-01-04', '19:30:00', 'Nancy Hope, age 11) is celiac so eats gluten-free.', 'Rafael | 1911', '2023-12-26 00:10:07', '2024-01-04 15:39:44', 'Ygomez', ''),
(287, 7, 'BODA', 'Brittany & Ankeet ', 0, 0, 'BT', 100, 0, '2024-02-02', '18:00:00', 'RESTAURANTE BLOQUEADO POR BODA', 'TANIA GARCIA 13/12', '2023-12-13 22:23:20', '2024-01-04 15:39:44', 'Ygomez', ''),
(288, 6, 'Lindsay', 'Barrett ', 0, 0, 'RWD', 2, 0, '2024-01-05', '18:00:00', 'check out:??07 enero ', ' Brenda ', '2023-12-14 14:40:50', '2024-01-04 15:39:44', 'Ygomez', ''),
(289, 6, 'Jonathan', 'Lubow', 0, 0, 'Andaz', 4, 0, '2024-01-14', '19:00:00', 'CO: 01/17/2024', ' Izamar Soto', '2023-12-20 14:21:32', '2024-01-04 15:39:44', 'Ygomez', ''),
(290, 5, 'Stuart', ' Boyarsky', 0, 0, 'Andaz', 4, 0, '2024-01-21', '19:00:00', 'Check out: 25 Enero ', ' MONICA GARCIA', '2023-12-14 14:43:59', '2024-01-04 15:39:44', 'Ygomez', ''),
(291, 5, 'Stuart', ' Boyarsky', 0, 0, 'Andaz', 4, 0, '2024-01-22', '19:00:00', 'Check out: 25 Enero ', ' MONICA GARCIA', '2023-12-14 14:44:15', '2024-01-04 15:39:44', 'Ygomez', ''),
(292, 5, 'Alfred ', 'Chehebar', 0, 0, 'GrandHyat', 6, 0, '2024-01-22', '20:30:00', 'Alfred Chehebar |+1 917 348 8600|ac@geniuspack.com', 'Alfred Chehebar', '2023-12-21 01:58:31', '2024-01-04 15:39:44', 'Ygomez', ''),
(293, 6, 'Edward ', 'Esses', 0, 0, 'RWD', 2, 0, '2024-01-08', '20:00:00', 'check out:? Jan 10thGiovanna ', 'Giovanna ', '2023-12-14 17:32:05', '2024-01-04 15:39:44', 'Ygomez', ''),
(294, 6, 'Jonathan ', 'Sollender', 0, 0, 'FMT', 3, 0, '2024-01-02', '19:00:00', 'sin celebraciones ni alergias|salen el 5 de Enero.', 'Gabriela Castañeda ', '2024-01-02 19:15:40', '2024-01-04 15:39:44', 'Ygomez', ''),
(295, 7, 'Michael', 'Epstein', 0, 904, 'BT', 2, 0, '2024-01-01', '19:00:00', 'N/A', 'Guest', '2024-01-01 21:51:13', '2024-01-04 15:39:44', 'Ygomez', ''),
(296, 6, 'Michael', 'Epstein', 0, 904, 'BT', 2, 0, '2024-01-02', '19:00:00', 'N/A', 'Guest', '2024-01-02 22:10:41', '2024-01-04 15:39:44', 'Ygomez', ''),
(297, 6, 'Louis', 'Mataracco', 0, 0, 'FMT', 2, 0, '2024-01-24', '19:45:00', 'N/A', 'Guest', '2023-12-14 15:11:04', '2024-01-04 15:39:44', 'Ygomez', ''),
(298, 1, 'Jim ', 'Suss', 0, 0, 'Andaz', 2, 0, '2024-01-04', '18:00:00', 'CO: 08/01 ', 'Francisco Gómez ', '2023-12-14 15:14:54', '2024-01-04 15:39:44', 'Ygomez', ''),
(299, 4, 'Jim ', 'Suss', 0, 0, 'Andaz', 3, 0, '2024-01-06', '18:00:00', 'CO: 08/01 ', 'Francisco Gómez ', '2023-12-14 15:15:15', '2024-01-04 15:39:44', 'Ygomez', ''),
(300, 6, 'Josh ', 'Hausman', 0, 0, 'RWD', 2, 2, '2024-01-05', '20:00:00', ' check out: 08 Enero  ', 'Anaju', '2023-12-14 15:20:11', '2024-01-04 15:39:44', 'Ygomez', ''),
(301, 6, 'Denise ', 'Pepp', 0, 0, 'FMT', 3, 0, '2024-01-05', '18:00:00', 'd Pepp <denisepepp@gmail.com>', 'Guest', '2023-12-14 15:22:15', '2024-01-04 15:39:44', 'Ygomez', ''),
(302, 1, 'Alex ', 'Schroeder  ', 0, 0, 'FMT', 4, 0, '2024-01-03', '19:30:00', '2 children, ages 9, 7|+1-248-760-8320', 'Guest', '2023-12-14 17:22:25', '2024-01-04 15:39:44', 'Ygomez', ''),
(303, 6, 'Bryan ', 'Ulrich', 0, 0, 'Andaz', 2, 0, '2024-01-04', '18:30:00', 'Departure day: Jan 7th|One of us is vegetarian|773-495-3611', 'Guest', '2023-12-14 15:40:28', '2024-01-04 15:39:44', 'Ygomez', ''),
(304, 6, 'Liz ', 'Squillante', 0, 0, 'Andaz', 3, 0, '2024-01-06', '19:30:00', 'Check out: 07 Enero', 'MONICA GARCIA', '2023-12-14 15:53:29', '2024-01-04 15:39:44', 'Ygomez', ''),
(305, 1, 'Greg ', 'Cohen', 0, 0, 'FMT', 4, 0, '2024-01-04', '19:30:00', 'Pendiente confirmar el family style', 'Karen Vázquez', '2023-12-23 01:46:30', '2024-01-04 15:39:44', 'Ygomez', ''),
(306, 6, 'Katie ', 'Wescott ', 0, 0, 'BT', 2, 0, '2024-01-21', '18:45:00', 'New Belgium', 'Guest', '2023-12-14 16:20:46', '2024-01-04 15:39:44', 'Ygomez', ''),
(307, 1, 'Katie ', 'Wescott ', 0, 0, 'BT', 2, 0, '2024-01-22', '19:00:00', 'New Belgium', 'Guest', '2023-12-14 16:21:03', '2024-01-04 15:39:44', 'Ygomez', ''),
(308, 4, 'Katie ', 'Wescott ', 0, 0, 'BT', 2, 0, '2024-01-23', '19:00:00', 'New Belgium', 'Guest', '2023-12-14 16:21:25', '2024-01-04 15:39:44', 'Ygomez', ''),
(310, 7, 'Kevin ', 'Pivnik', 0, 11112, 'FHP', 2, 3, '2024-01-03', '18:30:00', 'CO: 6/ENE/24Alejandro Lemus', 'Alejandro Lemus', '2023-12-14 16:49:51', '2024-01-04 15:39:44', 'Ygomez', ''),
(311, 6, 'Cristine', 'Barulich', 0, 0, 'BT', 4, 0, '2024-01-02', '20:00:00', 'Solicita mesa en la isla cerca del agua|415-760–0932', 'Guest', '2023-12-26 21:00:50', '2024-01-04 15:39:44', 'Ygomez', ''),
(312, 6, 'Avery ', 'Claire Prasher', 0, 0, 'FMT', 2, 0, '2024-01-13', '19:30:00', 'Departure date: 1/15/2024', 'Guest', '2023-12-14 17:30:52', '2024-01-04 15:39:44', 'Ygomez', ''),
(313, 7, 'Harold', 'Clark', 0, 0, 'BT', 2, 0, '2024-01-12', '19:00:00', 'NA', 'Samara | 14/12', '2023-12-15 01:31:24', '2024-01-04 15:39:44', 'Svite', ''),
(314, 1, 'Harold', 'Clark', 0, 0, 'BT', 2, 0, '2024-01-13', '19:30:00', 'NA', 'Samara | 14/12', '2023-12-15 01:32:10', '2024-01-04 15:39:44', 'Svite', ''),
(315, 6, 'Harold', 'Clark', 0, 0, 'BT', 2, 0, '2024-01-15', '19:30:00', 'NA', 'Samara | 14/12', '2023-12-15 01:33:02', '2024-01-04 15:39:44', 'Svite', ''),
(316, 4, 'Harold', 'Clark', 0, 0, 'BT', 2, 0, '2024-01-16', '19:30:00', 'NA', 'Samara | 14/12|', '2023-12-15 01:33:42', '2024-01-04 15:39:44', 'Svite', ''),
(317, 1, 'Randy', 'Deutsch', 0, 0, 'BT', 4, 0, '2024-01-23', '19:00:00', 'NA', 'Carmen 15.12', '2023-12-15 14:38:53', '2024-01-04 15:39:44', 'Cnava', ''),
(318, 6, 'Randy', 'Deutsch', 0, 0, 'BT', 4, 0, '2024-01-24', '19:00:00', 'NA', 'Carmen 15.12', '2023-12-15 14:41:16', '2024-01-04 15:39:44', 'Cnava', ''),
(319, 6, 'Marc ', 'Roman', 0, 809, 'RWD', 2, 0, '2024-01-01', '20:45:00', 'Sin alergias, celebrando Año Nuevo', 'ANTONIO HERNANDEZ', '2023-12-15 16:22:18', '2024-01-04 15:39:44', 'Ygomez', ''),
(320, 5, 'Bernard', 'Fox', 0, 0, 'BT', 2, 0, '2024-01-04', '20:00:00', 'NA', 'Carmen 15.12', '2023-12-15 16:57:03', '2024-01-04 15:39:44', 'Cnava', ''),
(321, 6, 'Chang ', 'Fu', 0, 0, 'Andaz', 2, 0, '2024-01-01', '17:30:00', '415.205.3046', 'Guest', '2023-12-15 17:22:34', '2024-01-04 15:39:44', 'Ygomez', ''),
(322, 1, 'Johana', 'Sarria', 0, 940, 'BT', 12, 0, '2024-01-02', '20:00:00', 'NA', 'Andrea G 15-12', '2024-01-02 22:01:42', '2024-01-04 15:39:44', 'Dalmazan', ''),
(323, 6, 'Mark ', 'Lewis  ', 0, 0, 'RWD', 6, 0, '2024-01-25', '19:30:00', 'check out: 28 Enero 2024  ', 'Anaju ', '2023-12-16 15:26:39', '2024-01-04 15:39:44', 'Ygomez', ''),
(324, 4, 'Mark ', 'Lewis  ', 0, 0, 'RWD', 6, 0, '2024-01-26', '19:30:00', 'check out: 28 Enero 2024  ', 'Anaju ', '2023-12-16 15:27:09', '2024-01-04 15:39:44', 'Ygomez', ''),
(325, 6, 'Hilary ', 'Wirtz ', 0, 0, 'BT', 2, 0, '2024-01-27', '19:00:00', 'N/A', 'Guest', '2023-12-16 15:28:39', '2024-01-04 15:39:44', 'Ygomez', ''),
(326, 6, 'Sarah', 'Swenson', 0, 0, 'BT', 2, 0, '2024-01-26', '18:00:00', 'TBD', 'Guest', '2023-12-16 15:40:29', '2024-01-04 15:39:44', 'Ygomez', ''),
(327, 1, 'Sarah', 'Swenson', 0, 0, 'BT', 2, 0, '2024-01-27', '18:00:00', 'TBD', 'Guest', '2023-12-16 15:40:54', '2024-01-04 15:39:44', 'Ygomez', ''),
(330, 6, 'Elizabeth', 'Currin', 0, 0, 'BT', 4, 0, '2024-02-08', '19:00:00', 'TBD', 'Guest', '2023-12-16 15:45:27', '2024-01-04 15:39:44', 'Ygomez', ''),
(331, 6, 'David ', 'Atkins', 0, 0, 'FHP', 4, 0, '2024-01-04', '20:30:00', 'N/A', 'Miguel Cerro', '2023-12-20 15:59:57', '2024-01-04 15:39:44', 'Ygomez', ''),
(332, 6, 'Eicher', 'Eicher', 0, 0, 'BT', 2, 0, '2024-01-21', '18:45:00', 'N/A', 'Gu', '2023-12-16 15:53:50', '2024-01-04 15:39:44', 'Ygomez', ''),
(333, 4, 'Darren', 'Eicher', 0, 0, 'BT', 2, 0, '2024-04-22', '18:45:00', 'N/A', 'Gu', '2023-12-16 15:54:31', '2024-01-04 15:39:44', 'Ygomez', ''),
(334, 1, 'Darren', 'Eicher', 0, 0, 'BT', 2, 0, '2024-01-23', '18:45:00', 'N/A', 'Gu', '2023-12-16 16:01:29', '2024-01-04 15:39:44', 'Ygomez', ''),
(336, 7, 'Svetlana ', 'Chiporukha ', 0, 0, 'BT', 5, 0, '2024-01-11', '19:00:00', 'N/A', 'Guest', '2023-12-16 18:24:57', '2024-01-04 15:39:44', 'Ygomez', ''),
(337, 6, 'Svetlana ', 'Chiporukha ', 0, 0, 'BT', 5, 0, '2024-01-12', '19:00:00', 'N/A', 'Guest', '2023-12-16 18:25:17', '2024-01-04 15:39:44', 'Ygomez', ''),
(338, 1, 'Svetlana ', 'Chiporukha ', 0, 0, 'BT', 5, 0, '2024-01-14', '19:00:00', 'N/A', 'Guest', '2023-12-16 18:25:39', '2024-01-04 15:39:44', 'Ygomez', ''),
(339, 4, 'Hanna', 'Mcconnaha', 0, 0, 'BT', 2, 0, '2024-01-11', '18:00:00', 'NA', 'Carmen 16.12', '2023-12-16 19:58:21', '2024-01-04 15:39:44', 'Cnava', ''),
(340, 1, 'Hanna', 'Mcconnaha', 0, 0, 'BT', 2, 0, '2024-01-12', '18:00:00', 'NA', 'Carmen 16.12', '2023-12-16 20:00:03', '2024-01-04 15:39:44', 'Cnava', ''),
(341, 7, 'Cassey ', 'Carey', 0, 0, 'BT', 4, 0, '2024-01-02', '18:00:00', 'NA', 'Samara | 16/12', '2023-12-16 20:30:46', '2024-01-04 15:39:44', 'Svite', ''),
(342, 6, 'Cassey', 'Carey', 0, 0, 'BT', 4, 0, '2024-12-03', '18:15:00', 'NA', 'Samara | 16/12', '2023-12-16 22:07:56', '2024-01-04 15:39:44', 'Svite', ''),
(343, 5, 'Jonathan', 'Rothstein ', 0, 0, 'BT', 2, 0, '2024-01-04', '19:30:00', 'N/A', 'Rafael | 1712', '2023-12-17 19:08:54', '2024-01-04 15:39:44', 'Rmerlo', ''),
(344, 6, 'Jonathan', 'Rothstein', 0, 0, 'BT', 2, 0, '2024-01-05', '19:30:00', 'N/A', 'Rafael | 1712', '2023-12-17 19:10:10', '2024-01-04 15:39:44', 'Rmerlo', ''),
(345, 7, 'John', 'Cunat', 0, 0, 'BT', 2, 0, '2024-01-17', '19:00:00', 'NA', 'Ricardo 17.12', '2023-12-17 19:17:04', '2024-01-04 15:39:44', 'Rmartinez', ''),
(346, 1, 'John', 'Cunat', 0, 0, 'BT', 2, 0, '2024-01-19', '19:00:00', 'NA', 'Ricardo 17.12', '2023-12-21 22:05:26', '2024-01-04 15:39:44', 'Rmartinez', ''),
(347, 6, 'John', 'Cunat', 0, 0, 'BT', 2, 0, '2024-01-21', '19:00:00', 'NA', 'Ricardo 17.12', '2023-12-17 19:19:00', '2024-01-04 15:39:44', 'Rmartinez', ''),
(350, 6, 'Pallavi', 'Atluri', 0, 936, 'BT', 3, 0, '2024-01-01', '19:00:00', 'N/A', 'Rafael | 1812', '2024-01-01 21:54:37', '2024-01-04 15:39:44', 'Rmerlo', ''),
(351, 6, 'Lolin', 'Palazuelos', 0, 607, 'BT', 4, 2, '2024-01-01', '18:00:00', 'NA', 'Samara | 19/12', '2024-01-01 21:56:37', '2024-01-04 15:39:44', 'Svite', ''),
(352, 2, 'Keith', 'Derman', 0, 618, 'BT', 5, 0, '2024-01-01', '19:30:00', 'N/A', 'Rafael | 1912', '2024-01-01 21:55:08', '2024-01-04 15:39:44', 'Rmerlo', ''),
(353, 4, 'Keith', 'Derman', 0, 618, 'BT', 5, 0, '2024-01-02', '19:30:00', 'N/A', 'Rafael | 1912', '2024-01-02 22:03:06', '2024-01-04 15:39:44', 'Rmerlo', ''),
(354, 6, 'Keith', 'Evan', 0, 809, 'BT', 5, 0, '2024-01-04', '19:00:00', 'N/A', 'Rafael | 1912', '2023-12-19 18:25:35', '2024-01-04 19:22:48', 'Rmerlo', 'Ygomez'),
(355, 1, 'Keith', 'Derman', 0, 626, 'BT', 5, 0, '2024-01-03', '19:30:00', 'N/A', 'Rafael | 1912', '2024-01-03 19:37:07', '2024-01-04 15:39:44', 'Rmerlo', ''),
(359, 6, 'Alexandra', 'Papalexoupolu', 0, 0, 'BT', 7, 0, '2024-01-05', '20:30:00', 'N/A| +30 694 426 2180', 'Guest', '2024-01-03 19:31:39', '2024-01-04 15:39:44', '', ''),
(360, 5, 'Daniel', 'Serouya', 0, 0, 'BT', 6, 0, '2024-01-21', '19:00:00', 'N/A', 'Rafael | 1912', '2023-12-19 23:34:58', '2024-01-04 15:39:44', 'Rmerlo', ''),
(361, 5, 'Julie', 'Garcia', 0, 0, 'BT', 6, 0, '2024-01-17', '19:00:00', 'N/A', 'Rafael | 1912', '2023-12-19 23:43:05', '2024-01-04 15:39:44', 'Rmerlo', ''),
(362, 7, 'Nadav', 'Barash', 0, 212, 'BT', 4, 0, '2024-01-01', '17:30:00', 'Include a baby high chair - note that the baby is allergic to sesame', 'Andrea G 19-12', '2024-01-01 21:37:59', '2024-01-04 15:39:44', 'Dalmazan', ''),
(363, 6, 'Julie', 'Garcia', 0, 0, 'BT', 6, 0, '2024-01-18', '19:00:00', 'N/A', 'Rafael | 1912', '2023-12-20 00:49:47', '2024-01-04 15:39:44', 'Rmerlo', ''),
(364, 1, 'Julie', 'Garcia', 0, 0, 'BT', 6, 0, '2024-01-20', '19:00:00', 'N/A', 'Rafael | 1912', '2023-12-20 00:50:57', '2024-01-04 15:39:44', 'Rmerlo', ''),
(366, 4, 'Peter', 'Frandina', 0, 0, 'BT', 6, 0, '2024-01-02', '19:00:00', 'NA', 'Samara | 20/12', '2023-12-20 14:10:09', '2024-01-04 15:39:44', 'Svite', ''),
(367, 6, 'Maheen ', 'Cleaver', 0, 0, 'RWD', 4, 0, '2024-01-13', '19:15:00', 'N/A', 'GUest', '2023-12-20 14:17:55', '2024-01-04 15:39:44', 'Ygomez', ''),
(368, 6, 'Guillem ', 'Martinez', 0, 0, 'FMT', 4, 0, '2024-02-02', '21:30:00', 'N/A', 'GUest', '2023-12-20 14:27:15', '2024-01-04 15:39:44', 'Ygomez', ''),
(369, 6, 'David ', 'Landes ', 0, 0, 'FHP', 5, 0, '2024-01-08', '19:30:00', 'Check out: 11 enero 2024|no descuento', 'Irene Vázquez ', '2023-12-20 14:48:12', '2024-01-04 15:39:44', 'Ygomez', ''),
(370, 7, 'David ', 'Landes ', 0, 0, 'FHP', 5, 0, '2024-01-10', '19:30:00', 'Check out: 11 enero 2024|no descuento', 'Irene Vázquez ', '2023-12-20 14:48:34', '2024-01-04 15:39:44', 'Ygomez', ''),
(371, 4, 'Dean ', 'Blechman', 0, 0, 'RWD', 5, 0, '2024-01-25', '20:15:00', 'check out:? Enero 30', 'Giovanna', '2023-12-20 14:50:37', '2024-01-04 15:39:44', 'Ygomez', ''),
(372, 6, 'Dean ', 'Blechman', 0, 0, 'RWD', 5, 0, '2024-01-27', '20:15:00', 'check out:? Enero 30', 'Giovanna', '2023-12-20 14:50:56', '2024-01-04 15:39:44', 'Ygomez', ''),
(373, 1, 'Dean ', 'Blechman', 0, 0, 'RWD', 5, 0, '2024-01-28', '20:15:00', 'check out:? Enero 30', 'Giovanna', '2023-12-20 14:51:24', '2024-01-04 15:39:44', 'Ygomez', ''),
(375, 6, 'Melissa ', 'Mansur ', 0, 517, 'RWD', 2, 2, '2024-01-02', '17:30:00', 'los niños tienen 6 y 10 añitos de edad|Haciendo CO el 6 de Enero.', 'Lili Vazquez ', '2024-01-02 18:55:45', '2024-01-04 15:39:44', 'Ygomez', ''),
(376, 1, 'Gavin ', 'kagan', 0, 609, 'BT', 2, 2, '2024-01-02', '18:00:00', 'N/A', 'Guest', '2024-01-02 19:32:33', '2024-01-04 15:39:44', 'Ygomez', ''),
(377, 1, 'Gavin ', 'kagan', 0, 609, 'BT', 2, 2, '2024-01-06', '18:00:00', 'N/A', 'Guest', '2024-01-02 19:32:58', '2024-01-04 15:39:44', 'Ygomez', ''),
(378, 6, 'Chris ', 'Ellingson', 0, 0, 'RWD', 2, 0, '2024-01-05', '18:30:00', 'Celebation of Mrs. Ellingson birthday, DOB: January 1st| CO 12 Enero', 'Denisse Martinez ', '2023-12-20 15:56:41', '2024-01-04 15:39:44', 'Ygomez', ''),
(379, 1, 'Chris ', 'Ellingson', 0, 0, 'RWD', 2, 0, '2024-01-10', '19:00:00', 'Celebation of Mrs. Ellingson birthday, DOB: January 1st| CO 12 Enero', 'Denisse Martinez ', '2023-12-20 15:57:18', '2024-01-04 15:39:44', 'Ygomez', ''),
(380, 7, 'Rachel ', 'Kadosh ', 0, 0, 'FMT', 2, 0, '2024-01-10', '19:00:00', '744 176 5599', 'Daniel González ', '2023-12-28 23:41:58', '2024-01-04 15:39:44', 'Ygomez', ''),
(381, 6, 'Nicholas ', 'Sheridan', 0, 0, 'BT', 13, 0, '2024-01-25', '19:30:00', 'Wife 40th birthday (Jennifer)|860-604-8424| Family style menu| solicitan mesa en en deck con bonita vista|  Cancellations must be done 48hrs in advance for a full charge penalty not to be imposed.  Cancellations done 24hrs in advance will pay penalty of 50% of the total price.  The experience will be cancelled if the aforementioned conditions are not met. ', 'guest', '2023-12-29 01:25:29', '2024-01-04 15:39:44', 'Ygomez', ''),
(383, 1, 'Joan ', 'Schwiep', 0, 0, 'BT', 2, 0, '2024-01-18', '20:00:00', 'New Belgium group ', 'Guest', '2023-12-21 00:10:41', '2024-01-04 15:39:44', 'Ygomez', ''),
(384, 6, 'Joan ', 'Schwiep', 0, 0, 'BT', 2, 0, '2024-01-19', '20:00:00', 'New Belgium group ', 'Guest', '2023-12-21 00:11:06', '2024-01-04 15:39:44', 'Ygomez', ''),
(385, 4, 'Joan ', 'Schwiep', 0, 0, 'BT', 2, 0, '2024-01-20', '20:00:00', 'New Belgium group ', 'Guest', '2023-12-21 00:18:29', '2024-01-04 15:39:44', 'Ygomez', ''),
(386, 6, 'Matthew ', 'Seidler', 0, 0, 'Etereo', 2, 0, '2024-01-09', '19:00:00', 'N/A', 'ABDHER TRUJILLO ', '2023-12-21 00:33:42', '2024-01-04 15:39:44', 'Ygomez', ''),
(387, 6, 'Duffie', 'Virgil', 0, 0, 'FMT', 4, 0, '2024-01-02', '19:30:00', '4699992500', 'Jess Martinezs ', '2023-12-21 01:08:38', '2024-01-04 15:39:44', 'Ygomez', ''),
(388, 6, 'Jeannie ', 'LaChance ', 0, 0, 'FMT', 3, 0, '2024-01-12', '19:30:00', 'N/A', 'GUest', '2023-12-21 01:17:29', '2024-01-04 15:39:44', 'Ygomez', ''),
(389, 6, 'Eric ', 'Edmonds', 0, 0, 'Andaz', 4, 0, '2024-01-05', '20:30:00', 'Check out: 08 ene', 'MONICA GARCIA', '2023-12-21 01:19:00', '2024-01-04 15:39:44', 'Ygomez', ''),
(390, 6, 'Usha ', 'Schmit', 0, 0, 'Andaz', 5, 0, '2024-01-02', '17:30:00', 'Check out: 06 enero', 'MONICA GARCIA', '2023-12-21 01:20:36', '2024-01-04 15:39:44', 'Ygomez', ''),
(392, 6, 'Jeremy ', 'Kennedy', 0, 0, 'Andaz', 4, 0, '2024-01-12', '18:30:00', 'Check out: 16 enero', 'MONICA GARCIA', '2023-12-21 01:26:06', '2024-01-04 15:39:44', 'Ygomez', ''),
(393, 6, 'Reagan ', 'Saig', 0, 0, 'RWD', 2, 0, '2024-01-04', '19:00:00', 'Check out 6 de Enero  Sin alergias o Celebraciones', 'Carlos Avalos ', '2023-12-21 01:31:10', '2024-01-04 15:39:44', 'Ygomez', ''),
(394, 6, 'Curtis', ' Bush', 0, 0, 'RWD', 2, 0, '2024-01-08', '19:00:00', 'check out:? jan 09', 'Giovanna  ?? ', '2023-12-21 01:32:55', '2024-01-04 15:39:44', 'Ygomez', ''),
(395, 6, 'Chris ', 'Johnson', 0, 0, 'BT', 2, 0, '2024-01-13', '19:00:00', '9132361818|30th birthday', 'Guest', '2023-12-21 01:34:29', '2024-01-04 15:39:44', 'Ygomez', ''),
(396, 7, ' Susan', 'Cohen', 0, 0, 'BT', 8, 4, '2024-02-18', '18:00:00', 'N/A', 'Guest', '2023-12-21 01:40:23', '2024-01-04 15:39:44', 'Ygomez', '');
INSERT INTO `reservas_restaurante` (`id_reserva_R`, `nombre_restaurante`, `huesped`, `apellidos`, `mesa`, `villa`, `propiedad`, `numero_personas`, `kids`, `fecha_reserva`, `horario_reserva`, `comentarios`, `solicitante`, `fecha_creacion`, `fecha_edicion`, `usuario`, `usuario_edita`) VALUES
(397, 1, ' Susan', 'Cohen', 0, 0, 'BT', 8, 4, '2024-02-20', '18:00:00', 'N/A', 'Guest', '2023-12-21 01:41:04', '2024-01-04 15:39:44', 'Ygomez', ''),
(398, 6, ' Susan', 'Cohen', 0, 0, 'BT', 8, 0, '2024-02-21', '18:30:00', 'Solicitó Reservas Tal Cohen', 'Guest', '2024-01-03 14:09:26', '2024-01-04 15:39:44', 'Ygomez', ''),
(399, 6, 'Ben ', 'Hubbell-Engler', 0, 0, 'Andaz', 2, 0, '2024-01-04', '17:30:00', 'Check out: 06 enero', 'MONICA GARCIA', '2023-12-21 01:50:24', '2024-01-04 15:39:44', 'Ygomez', ''),
(400, 5, 'Sharon ', 'Loeffler', 0, 0, 'FMT', 13, 0, '2024-01-25', '17:30:00', 'Cancelación mismo día o no show 50USD por persona| a la carta', 'Cory Orchin', '2023-12-21 01:52:47', '2024-01-04 15:39:44', 'Ygomez', ''),
(401, 5, 'Daniel', 'Serouya', 0, 0, 'BT', 6, 0, '2024-01-24', '19:00:00', 'N/A', 'Rafael | 2012', '2023-12-21 04:16:02', '2024-01-04 15:39:44', 'Rmerlo', ''),
(402, 6, 'Harold ', 'Hope', 0, 625, 'BT', 4, 0, '2024-01-01', '19:45:00', 'one of our party is a child (age 11) who is celiac and gluten free', 'Carmen 21.12', '2024-01-01 21:56:18', '2024-01-04 15:39:44', 'Cnava', ''),
(403, 7, 'Harold', 'Hope', 0, 0, 'BT', 8, 1, '2024-10-30', '19:30:00', 'one of our party is a child (age 11) who is celiac and gluten free', 'Carmen 21.12', '2023-12-21 18:28:44', '2024-01-04 15:39:44', 'Cnava', ''),
(406, 4, 'Nicole', 'Lambert', 0, 805, 'BT', 2, 1, '2024-01-03', '19:00:00', 'NA', 'RICARDO 22-12', '2024-01-03 19:38:39', '2024-01-04 15:39:44', 'Rmartinez', ''),
(408, 6, 'Zack ', 'Kavanaugh', 0, 0, 'BT', 2, 0, '2024-01-21', '19:30:00', 'New Belgium group ', 'Guest', '2023-12-23 01:12:40', '2024-01-04 15:39:44', 'Ygomez', ''),
(409, 1, 'Zack ', 'Kavanaugh', 0, 0, 'BT', 2, 0, '2024-04-22', '19:30:00', 'New Belgium group ', 'Guest', '2023-12-23 01:13:05', '2024-01-04 15:39:44', 'Ygomez', ''),
(412, 4, 'Saman', 'Ghahremani', 0, 0, 'FMT', 4, 3, '2024-01-02', '20:30:00', ' Salida 06/ENE-2024|Con credito Sin Alergias ni Celebraciones ', 'Alejandro Lemus', '2023-12-26 15:50:41', '2024-01-04 15:39:44', 'Ygomez', ''),
(413, 1, 'Saman', 'Ghahremani', 0, 0, 'FMT', 4, 3, '2024-01-03', '20:30:00', ' Salida 06/ENE-2024|Con credito Sin Alergias ni Celebraciones ', 'Alejandro Lemus', '2023-12-26 15:58:27', '2024-01-04 15:39:44', 'Ygomez', ''),
(414, 6, 'Patrick', ' Gilfillan', 0, 0, 'Andaz', 2, 1, '2024-02-05', '18:30:00', '1-312-206-6320|	Departure day: Feb 9th, 2024', 'Guest', '2023-12-23 01:25:17', '2024-01-04 15:39:44', 'Ygomez', ''),
(415, 7, 'Serena ', 'Rakhlin', 0, 0, 'Andaz', 6, 0, '2024-01-04', '18:00:00', 'Check out: 05 enero', 'MONICA GARCIA', '2023-12-23 01:27:32', '2024-01-04 15:39:44', 'Ygomez', ''),
(416, 6, 'Chad ', 'Rebhun  ', 0, 0, 'RWD', 2, 0, '2024-01-29', '19:30:00', 'check out:? Enero 31', ' Giovanna ', '2023-12-23 01:31:37', '2024-01-04 15:39:44', 'Ygomez', ''),
(417, 4, 'Andrew J.', ' Hensen', 0, 0, 'FMT', 4, 0, '2024-12-02', '20:30:00', 'son has a shellfish allergy | ajhensen@gmail.com| CO 09-01', 'Edgar Benavides ', '2023-12-23 01:39:46', '2024-01-04 15:39:44', 'Ygomez', ''),
(418, 6, 'Andrew J.', ' Hensen', 0, 0, 'FMT', 7, 0, '2024-01-06', '19:00:00', 'son has a shellfish allergy | ajhensen@gmail.com| CO 09-01', 'Edgar Benavides ', '2023-12-23 01:40:40', '2024-01-04 15:39:44', 'Ygomez', ''),
(419, 6, 'Henry ', 'Ryall Smith', 0, 0, 'Andaz', 2, 0, '2024-01-10', '20:00:00', 'We prefer the smaller glass dining room over the water if possible.|202-531-6400', 'Guest', '2023-12-23 01:43:56', '2024-01-04 15:39:44', 'Ygomez', ''),
(420, 6, 'Victoria ', 'Gutowski ', 0, 0, 'Andaz', 2, 0, '2024-01-06', '18:00:00', 'N/A', 'GUest', '2023-12-23 01:48:41', '2024-01-04 15:39:44', 'Ygomez', ''),
(421, 6, 'Clare ', 'Catania', 0, 0, 'Andaz', 2, 0, '2024-01-16', '19:30:00', 'Check out: 17 enero', 'MONICA GARCIA', '2023-12-28 23:23:08', '2024-01-04 15:39:44', 'Ygomez', ''),
(423, 6, 'Roman ', 'Brzezinski', 0, 0, 'RWD', 4, 0, '2024-01-02', '20:45:00', 'CO 04 DIC ', ' Leticia López  ', '2023-12-23 02:07:04', '2024-01-04 15:39:44', 'Ygomez', ''),
(424, 7, 'Ryan', 'Peters', 0, 934, 'BT', 2, 0, '2024-01-01', '19:00:00', 'N/A', 'Rafael | 2212', '2024-01-01 21:57:16', '2024-01-04 15:39:44', 'Rmerlo', ''),
(425, 6, 'Ryan', 'Peters', 0, 938, 'BT', 2, 0, '2024-01-02', '19:00:00', 'n/a', 'Rafael | 2212', '2024-01-02 22:11:20', '2024-01-04 15:39:44', 'Rmerlo', ''),
(426, 1, 'Ryan', 'Peters', 0, 934, 'BT', 2, 0, '2024-01-03', '19:00:00', 'N/A', 'Rafael | 2212', '2024-01-03 19:37:32', '2024-01-04 15:39:44', 'Rmerlo', ''),
(428, 4, 'Elizabeth', 'John', 0, 0, 'BT', 5, 0, '2024-12-01', '19:15:00', 'NA', 'Samara | 23/12', '2023-12-23 17:55:15', '2024-01-04 15:39:44', 'Svite', ''),
(429, 5, 'Daniel ', 'Levy ', 0, 0, 'RWD', 2, 3, '2024-01-22', '18:30:00', '3 children  (19 meses, 6 & 5 years old )|No meat & shellfish|check out:  25 Enero', 'Susana   ', '2023-12-23 22:32:39', '2024-01-04 15:39:44', 'Ygomez', ''),
(430, 5, 'Daniel ', 'Levy ', 0, 0, 'RWD', 2, 3, '2024-01-24', '18:30:00', '3 children  (19 meses, 6 & 5 years old )|No meat & shellfish|check out:  25 Enero', 'Susana   ', '2023-12-23 22:33:20', '2024-01-04 15:39:44', 'Ygomez', ''),
(431, 6, 'Stephen ', 'Banker', 0, 0, 'Andaz', 3, 0, '2024-01-03', '18:30:00', 'Check out: 05 enero', 'MONICA GARCIA', '2023-12-23 22:52:02', '2024-01-04 15:39:44', 'Ygomez', ''),
(432, 6, 'Lisa ', 'Neidhardt ', 0, 11021, 'FHP', 5, 0, '2024-01-04', '18:00:00', 'Celebraran el cumpleaños de Lisa|Hacen check out el 07 de Enero', 'Rodrigo Sosa', '2023-12-23 22:59:26', '2024-01-04 15:39:44', 'Ygomez', ''),
(434, 6, 'Rob ', 'Gleeson ', 0, 0, 'RWD', 4, 0, '2024-12-20', '19:00:00', 'N/A', 'Anaju ', '2023-12-23 23:03:22', '2024-01-04 15:39:44', 'Ygomez', ''),
(435, 4, 'Jordan ', 'Mazzetta', 0, 0, 'RWD', 2, 2, '2024-01-03', '19:30:00', 'Jordan & Melissa Mazzetta|check out:  06 Enero|(9 & 11 Años) ', 'Susana palacios  ', '2024-01-03 18:12:51', '2024-01-04 15:39:44', 'Ygomez', ''),
(436, 7, 'John', 'Harrobin', 0, 612, 'BT', 6, 0, '2024-01-01', '18:15:00', 'NA', 'Ricardo 23.12', '2023-12-31 15:19:51', '2024-01-04 15:39:44', 'Rmartinez', ''),
(437, 7, 'Elizabeth', 'john', 0, 623, 'BT', 5, 0, '2024-01-01', '19:15:00', 'NA', 'Ricardo 23.12', '2024-01-01 22:02:33', '2024-01-04 15:39:44', 'Rmartinez', ''),
(438, 4, 'Miguel ', 'Mireles', 0, 0, 'Andaz', 4, 0, '2024-01-13', '18:00:00', '210.365.1839| CO 14/01', 'Guest', '2023-12-24 13:53:32', '2024-01-04 15:39:44', 'Ygomez', ''),
(439, 6, 'Miguel ', 'Mireles', 0, 0, 'Andaz', 4, 0, '2024-01-11', '19:00:00', '210.365.1839| CO 14/01', 'Guest', '2023-12-24 13:55:16', '2024-01-04 15:39:44', 'Ygomez', ''),
(440, 6, 'Anneliese ', 'Pfeil ', 0, 0, 'Ext', 5, 0, '2024-01-02', '18:00:00', 'Solicitan algo más tarde que se les informe| m. (917) 756-9283', 'Guest', '2023-12-24 15:46:22', '2024-01-04 15:39:44', 'Ygomez', ''),
(442, 1, 'Chris ', 'Ward', 0, 0, 'FMT', 8, 0, '2024-01-05', '18:00:00', 'CO 01-06', 'Guest', '2023-12-24 16:21:41', '2024-01-04 15:39:44', 'Ygomez', ''),
(443, 7, 'Philip ', 'Mezey', 0, 0, 'BT', 6, 1, '2024-01-14', '18:00:00', '1 bebé|(510) 301-4478|we do not eat any pork or shellfish products at all.', 'Guest', '2023-12-24 16:27:42', '2024-01-04 15:39:44', 'Ygomez', ''),
(444, 6, 'Philip ', 'Mezey', 0, 0, 'BT', 6, 0, '2024-01-18', '18:00:00', '1 bebé|(510) 301-4478', 'Guest', '2023-12-24 16:28:16', '2024-01-04 15:39:44', 'Ygomez', ''),
(445, 6, 'Keshani ', 'Arman', 0, 0, 'Andaz', 2, 0, '2024-01-02', '20:30:00', 'Babymoon| +12162627452| Request outdoor table by water if possible|Out:  07/01/2024', 'Xochil Contreras', '2023-12-24 16:42:33', '2024-01-04 15:39:44', 'Ygomez', ''),
(446, 1, 'Keshani ', 'Arman', 0, 0, 'Andaz', 2, 0, '2024-01-05', '20:30:00', 'Babymoon| +12162627452| Request outdoor table by water if possible|Out:  07/01/2024', 'Xochil Contreras', '2023-12-24 16:43:08', '2024-01-04 15:39:44', 'Ygomez', ''),
(448, 6, 'Carl ', 'Williford', 0, 0, 'FHP', 4, 0, '2024-01-20', '18:30:00', 'January 22 departure Wife birthday  No allergies USA 832-859-8945', 'Guest', '2023-12-24 16:49:17', '2024-01-04 15:39:44', 'Ygomez', ''),
(449, 6, 'Robert ', 'Hirsh,', 0, 0, 'Andaz', 2, 2, '2024-01-02', '18:15:00', 'CO: 03/01 ', 'Francisco Gómez ', '2023-12-24 16:51:55', '2024-01-04 15:39:44', 'Ygomez', ''),
(450, 6, 'David ', 'Posen', 0, 0, 'Edition', 5, 0, '2024-01-02', '17:30:00', 'N/A', 'VANESSA GUARNEROS', '2023-12-24 17:24:54', '2024-01-04 15:39:44', 'Ygomez', ''),
(451, 4, 'Jay', 'Park', 0, 0, 'BT', 6, 0, '2024-01-08', '19:00:00', 'NA', 'Ricardo 24-12', '2023-12-30 20:05:32', '2024-01-04 15:39:44', 'Rmartinez', ''),
(452, 2, 'Jay', 'Park', 0, 0, 'BT', 6, 0, '2024-01-08', '19:00:00', 'NA', 'Ricardo 24-12', '2023-12-24 21:44:48', '2024-01-04 15:39:44', 'Rmartinez', ''),
(454, 7, 'Anton', 'Pribylov, ', 0, 510, 'BT', 2, 1, '2024-01-01', '18:45:00', ' El menor, Sr. Alex Pribylov, does not drink a lot of milk. Mom said he drinks but not too much.', 'Mariana', '2024-01-01 20:47:35', '2024-01-04 15:39:44', 'Ygomez', ''),
(455, 1, 'Gannon', 'McCaffery', 0, 517, 'BT', 4, 0, '2024-01-01', '18:30:00', 'NA', 'Samara | 25/12|', '2024-01-01 22:02:49', '2024-01-04 15:39:44', 'Svite', ''),
(456, 6, 'Robert ', 'Nelsen', 0, 0, 'RWD', 4, 0, '2024-01-02', '18:30:00', '206-427-7048', 'Jack Bartholet', '2023-12-25 16:11:12', '2024-01-04 15:39:44', 'Ygomez', ''),
(457, 6, 'Lyon, ', 'Damon', 0, 607, 'FMT', 6, 0, '2024-01-01', '21:00:00', 'N/A', 'Annette Monteverde ', '2024-01-01 19:30:31', '2024-01-04 15:39:44', 'Ygomez', ''),
(458, 6, 'Jessica ', 'Korenblatt ', 0, 0, 'Andaz', 2, 0, '2024-01-02', '18:00:00', '914-629-6297', 'Guest', '2023-12-25 17:33:12', '2024-01-04 15:39:44', 'Ygomez', ''),
(459, 6, 'Sylvia', ' Smith', 0, 0, 'Ext', 11, 0, '2024-01-11', '19:00:00', 'Recibimos deposito de 15000 MXN cargar a PM 9006| pendiente confirmar Menú', 'Marisol Ledesma', '2023-12-25 17:35:15', '2024-01-04 18:43:43', 'Ygomez', 'Ygomez'),
(460, 7, 'George ', 'Lalich ', 0, 0, 'RWD', 5, 0, '2024-01-04', '18:30:00', 'check out:  8 de enero ', 'Ashly Gómez ', '2024-01-02 22:24:22', '2024-01-04 15:39:44', 'Ygomez', ''),
(461, 6, 'Yang', 'Zhang', 0, 0, 'BT', 5, 0, '2024-01-05', '18:00:00', 'N/A', 'Rafael | 2512', '2023-12-25 22:31:21', '2024-01-04 15:39:44', 'Rmerlo', ''),
(462, 5, 'Naftali', 'Silberberg', 0, 0, 'BT', 2, 3, '2024-01-25', '17:30:00', 'NA', 'Carmen 25.12', '2023-12-25 22:50:12', '2024-01-04 15:39:44', 'Cnava', ''),
(463, 5, 'Naftali', 'Silberberg', 0, 0, 'BT', 2, 3, '2024-01-26', '20:00:00', 'NA', 'Carmen 25.12', '2023-12-25 22:51:15', '2024-01-04 15:39:44', 'Cnava', ''),
(464, 5, 'Naftali', 'Silberberg', 0, 0, 'BT', 2, 3, '2024-01-27', '11:00:00', 'NA', 'Carmen 25.12', '2023-12-25 22:52:21', '2024-01-04 15:39:44', 'Cnava', ''),
(465, 5, 'Naftali', 'Silberberg', 0, 0, 'BT', 2, 3, '2024-01-28', '18:30:00', 'NA', 'Carmen 25.12', '2023-12-25 22:53:21', '2024-01-04 15:39:44', 'Cnava', ''),
(466, 6, 'Cassey ', 'Zhang', 0, 0, 'BT', 2, 2, '2024-01-05', '18:00:00', 'Celebran cumpleaños', 'Carmen 25.12', '2023-12-26 03:30:28', '2024-01-04 15:39:44', 'Cnava', ''),
(467, 1, 'Cassey', 'Carey', 0, 701, 'BT', 2, 1, '2024-01-01', '18:15:00', 'NA', 'Samara | 26/12', '2024-01-01 21:57:47', '2024-01-04 15:39:44', 'Svite', ''),
(468, 7, 'Kirstin', 'Petrullo', 0, 106, 'BT', 2, 0, '2024-01-01', '19:30:00', 'NA', 'Samara | 26/12', '2024-01-01 22:03:13', '2024-01-04 15:39:44', 'Svite', ''),
(469, 6, 'Kristin', 'Petrullo', 0, 106, 'BT', 3, 0, '2024-01-03', '21:00:00', 'Menor alergica a mariscos y frutos secos excepto cacahuate', 'Samara | 26/12', '2024-01-03 19:38:01', '2024-01-04 15:39:44', 'Svite', ''),
(470, 1, 'Kristin', 'Petrullo', 0, 106, 'BT', 3, 0, '2024-01-04', '21:00:00', 'NA', 'Samara | 26/12', '2023-12-26 16:04:33', '2024-01-04 19:53:02', 'Svite', 'Ygomez'),
(471, 1, 'Amy', 'Finzi', 0, 621, 'BT', 7, 0, '2024-01-02', '19:30:00', 'NA', 'Samara | 26/12', '2024-01-02 21:56:51', '2024-01-04 15:39:44', 'Svite', ''),
(472, 4, 'Amy', 'Finzi', 0, 0, 'BT', 7, 0, '2024-01-04', '19:45:00', 'NA', 'Samara | 26/12', '2023-12-26 16:50:46', '2024-01-04 15:39:44', 'Svite', ''),
(473, 6, 'Amy', 'Finzi', 0, 0, 'BT', 7, 0, '2024-01-05', '19:30:00', 'NA', 'Samara | 26/12', '2023-12-26 16:52:08', '2024-01-04 15:39:44', 'Svite', ''),
(474, 7, 'Cheryl', 'Davin', 0, 0, 'BT', 2, 0, '2024-01-05', '20:00:00', 'NA', 'Samara | 26/12', '2023-12-26 19:01:12', '2024-01-04 15:39:44', 'Svite', ''),
(475, 7, 'Cheryl', 'Davin', 0, 0, 'BT', 4, 0, '2024-01-06', '19:00:00', 'NA', 'Samara | 26/12', '2023-12-26 19:11:34', '2024-01-04 15:39:44', 'Svite', ''),
(476, 6, 'Cheryl', 'Davin', 0, 0, 'BT', 4, 0, '2024-01-07', '19:00:00', 'NA', 'Samara | 26/12', '2023-12-26 19:12:35', '2024-01-04 15:39:44', 'Svite', ''),
(477, 1, 'Cheryl', 'Davin', 0, 0, 'BT', 4, 0, '2024-01-08', '19:00:00', 'NA', 'Samara | 26/12', '2023-12-26 19:13:53', '2024-01-04 15:39:44', 'Svite', ''),
(478, 7, 'Cheryl', 'Davin', 0, 0, 'BT', 4, 0, '2024-01-09', '19:00:00', 'NA', 'Samara | 26/12', '2023-12-26 19:14:51', '2024-01-04 15:39:44', 'Svite', ''),
(479, 6, 'Cheryl', 'Davin', 0, 0, 'BT', 4, 0, '2024-01-10', '19:00:00', 'NA', 'Samara | 26/12', '2023-12-26 19:15:50', '2024-01-04 15:39:44', 'Svite', ''),
(480, 1, 'VALERIE', 'DILLON', 0, 502, 'BT', 2, 0, '2024-01-01', '19:15:00', 'NA ', 'GABY', '2024-01-01 17:05:35', '2024-01-04 15:39:44', 'Ygomez', ''),
(482, 5, 'Rachel', 'Fox', 0, 0, 'BT', 2, 0, '2024-01-04', '18:00:00', 'N/A', 'Rafael | 2612', '2023-12-26 22:26:47', '2024-01-04 15:39:44', 'Rmerlo', ''),
(483, 1, 'Alison', 'Sunberg', 0, 0, 'BT', 7, 0, '2024-01-24', '19:00:00', 'N/A', 'Rafael | 2612', '2023-12-26 22:51:10', '2024-01-04 15:39:44', 'Rmerlo', ''),
(484, 1, 'James', 'Lally', 0, 614, 'BT', 4, 0, '2024-01-01', '18:00:00', 'NA', 'Carmen 26.12', '2024-01-01 22:03:41', '2024-01-04 15:39:44', 'Svite', ''),
(485, 6, 'Alison', 'Sunberg', 0, 0, 'BT', 7, 0, '2024-01-25', '19:00:00', 'N/A', 'Rafael | 2612', '2023-12-26 22:53:23', '2024-01-04 15:39:44', 'Rmerlo', ''),
(486, 4, 'James', 'Lally', 0, 614, 'BT', 4, 0, '2024-01-03', '18:00:00', 'NA', 'Carmen 26.12', '2024-01-03 19:38:58', '2024-01-04 15:39:44', 'Svite', ''),
(487, 7, 'Alison', 'Sundberg', 0, 0, 'BT', 7, 0, '2024-01-27', '19:00:00', 'N/A', 'Rafael | 2612', '2023-12-26 22:54:49', '2024-01-04 15:39:44', 'Rmerlo', ''),
(488, 1, 'James', 'Lally', 0, 0, 'BT', 4, 0, '2024-01-05', '18:00:00', 'NA', 'Carmen 26.12', '2023-12-26 22:55:19', '2024-01-04 15:39:44', 'Svite', ''),
(489, 1, 'Yusuf', 'Qureshi', 0, 0, 'BT', 2, 0, '2024-01-06', '19:00:00', 'No pork, no alcohol', 'Rafael | 2612', '2023-12-26 23:19:12', '2024-01-04 15:39:44', 'Rmerlo', ''),
(490, 7, 'Yusuf', 'Qureshi', 0, 0, 'BT', 2, 0, '2024-01-09', '18:00:00', 'No pork, no alcohol', 'Rafael | 2612', '2023-12-26 23:21:06', '2024-01-04 15:39:44', 'Rmerlo', ''),
(491, 6, 'Yusuf', 'Qureshi', 0, 0, 'BT', 2, 0, '2024-01-08', '18:00:00', 'No pork, no alcohol', 'Rafael | 2612', '2023-12-26 23:26:31', '2024-01-04 15:39:44', 'Rmerlo', ''),
(492, 5, 'Avi', 'Mally', 0, 0, 'BT', 4, 0, '2024-01-18', '19:00:00', 'NA', 'Carmen 26.12', '2023-12-27 00:25:25', '2024-01-04 15:39:44', 'Svite', ''),
(493, 5, 'Avi', 'Mally', 0, 0, 'BT', 4, 0, '2024-01-19', '20:00:00', 'NA', 'Carmen 26.12', '2023-12-27 00:28:56', '2024-01-04 15:39:44', 'Svite', ''),
(494, 5, 'Avi', 'Mally', 0, 0, 'BT', 4, 0, '2024-01-20', '19:00:00', 'NA', 'Carmen 26.12', '2023-12-27 00:30:14', '2024-01-04 15:39:44', 'Cnava', ''),
(495, 5, 'Avi', 'Mally', 0, 0, 'BT', 4, 0, '2024-01-21', '19:00:00', 'NA', 'Carmen 26.12', '2023-12-27 00:31:28', '2024-01-04 15:39:44', 'Cnava', ''),
(496, 5, 'Avi', 'Mally', 0, 0, 'BT', 4, 0, '2024-01-22', '19:00:00', 'NA', 'Carmen 26.12', '2023-12-27 00:34:15', '2024-01-04 15:39:44', 'Cnava', ''),
(497, 5, 'Avi', 'Mally', 0, 0, 'BT', 4, 0, '2024-01-23', '19:00:00', 'NA', 'Carmen 26.12', '2023-12-27 00:35:13', '2024-01-04 15:39:44', 'Cnava', ''),
(498, 5, 'Avi', 'Mally', 0, 0, 'BT', 4, 0, '2024-01-24', '19:00:00', 'NA', 'Carmen 26.12', '2023-12-27 00:36:17', '2024-01-04 15:39:44', 'Cnava', ''),
(499, 5, 'Avi', 'Mally', 0, 0, 'BT', 4, 0, '2024-12-20', '11:30:00', 'NA', 'Carmen 26.12', '2023-12-27 00:44:00', '2024-01-04 15:39:44', 'Cnava', ''),
(500, 1, 'Edward', 'Sledge Iv, ', 0, 605, 'BT', 5, 0, '2024-01-01', '19:30:00', 'N/A', 'Guest', '2023-12-27 15:57:42', '2024-01-04 15:39:44', 'Ygomez', ''),
(501, 1, 'Olivia', 'Nadler', 0, 0, 'BT', 9, 0, '2024-02-01', '19:00:00', '1 Shellfish allergy | Ms. Nadler', 'Rafael | 2712', '2023-12-27 17:08:11', '2024-01-04 15:39:44', 'Rmerlo', ''),
(502, 1, 'Kenneth', 'Julian', 0, 0, 'BT', 5, 0, '2024-01-02', '19:00:00', 'NA', 'Carmen 27.12', '2023-12-27 18:57:57', '2024-01-04 15:39:44', 'Cnava', ''),
(503, 7, 'Yukio', 'Sonoda', 0, 0, 'Andaz', 3, 0, '2024-01-01', '19:30:00', 'Allergies: Peanuts', 'Andrea G 27-12', '2023-12-27 19:02:27', '2024-01-04 15:39:44', 'Dalmazan', ''),
(504, 7, 'Pallavi', 'Atluri', 0, 0, 'BT', 3, 0, '2024-01-04', '19:00:00', 'NA', 'Carmen 27.12', '2023-12-27 19:48:44', '2024-01-04 15:39:44', 'Cnava', ''),
(505, 5, 'Marcus ', 'Mizrachi', 0, 0, 'BT', 2, 0, '2024-01-07', '19:00:00', 'NA', 'Carmen 27.12', '2023-12-31 01:57:37', '2024-01-04 15:39:44', 'Cnava', ''),
(506, 5, 'Marcus ', 'Mizrachi', 0, 0, 'BT', 2, 0, '2024-01-06', '19:00:00', 'NA', 'Carmen 27.12', '2023-12-27 20:25:36', '2024-01-04 15:39:44', 'Cnava', ''),
(507, 5, 'Marcus ', 'Mizrachi', 0, 0, 'BT', 2, 0, '2024-01-06', '19:00:00', 'NA', 'Carmen 27.12', '2023-12-27 20:27:06', '2024-01-04 15:39:44', 'Cnava', ''),
(508, 6, 'Sherry Kelishadi', 'Kelishadi', 0, 200, 'BT', 12, 0, '2024-01-01', '20:00:00', 'a la carta| huésped con queja porque se le solicitó preorden de entradas', 'Paola 0101', '2024-01-01 20:40:10', '2024-01-04 15:39:44', 'Rmartinez', ''),
(509, 2, 'Kelishadi', 'Sherry', 0, 0, 'BT', 4, 0, '2024-01-02', '19:00:00', 'NA', 'Ricardo 27-12', '2023-12-27 20:43:37', '2024-01-04 15:39:44', 'Rmartinez', ''),
(511, 6, 'George ', 'Lalich ', 0, 0, 'RWD', 5, 0, '2024-01-06', '18:30:00', 'check out:  8 de enero ', 'Ashly Gómez ', '2024-01-02 22:25:22', '2024-01-04 15:39:44', 'Ygomez', ''),
(512, 6, 'David ', 'Dattels', 0, 0, 'RWD', 2, 4, '2024-01-07', '18:30:00', '(6, 8, 10 y 12 años)|check out:  8 de enero ', 'Ashly Gómez ', '2024-01-02 19:57:01', '2024-01-04 15:39:44', 'Ygomez', ''),
(513, 6, 'Chad ', 'O Shell ', 0, 0, 'RWD', 6, 0, '2024-01-09', '19:30:00', 'Wedding anniversary Mr. & Mrs. O Shell  |check out:  10 enero ', 'Ashly Gómez ', '2023-12-28 15:05:03', '2024-01-04 15:39:44', 'Ygomez', ''),
(514, 1, 'Elizabeth', 'Currin', 0, 0, 'BT', 4, 0, '2024-02-07', '19:30:00', 'N/AGuest', 'Guest', '2023-12-28 15:07:24', '2024-01-04 15:39:44', 'Ygomez', ''),
(515, 6, 'Shelby ', 'Pushchak', 0, 0, 'Andaz', 4, 0, '2024-01-15', '18:00:00', 'Check out: 17 ene|we aren’t celebrating anything. I can be reached at 1-303-489-2958. ', 'Monica', '2024-01-02 17:48:48', '2024-01-04 15:39:44', 'Ygomez', ''),
(516, 4, 'Marco', 'Tucci', 0, 522, 'BT', 4, 0, '2024-01-01', '19:30:00', 'Solicitan mesa afuera', 'GUest', '2024-01-01 16:15:41', '2024-01-04 15:39:44', 'Ygomez', ''),
(517, 6, 'Rosalyn', 'Hongsaranagon', 0, 0, 'BT', 2, 2, '2024-01-04', '19:00:00', 'NA', 'Samara | 28/12', '2023-12-28 16:44:24', '2024-01-04 15:39:44', 'Svite', ''),
(518, 7, 'Yanina', ' Miguel', 0, 804, 'BT', 10, 0, '2024-01-01', '20:00:00', '25 % OFF F&B', 'Livia', '2023-12-28 16:46:03', '2024-01-04 15:39:44', 'Ygomez', ''),
(519, 2, 'Rosalyn ', 'Hongsaranagon', 0, 0, 'BT', 2, 2, '2024-01-05', '18:30:00', 'NA', 'Samara | 28/12', '2023-12-28 16:46:21', '2024-01-04 15:39:44', 'Svite', ''),
(520, 4, 'Yanina', ' Miguel', 0, 804, 'BT', 5, 0, '2024-01-02', '20:00:00', '25 % OFF F&B', 'Livia', '2024-01-02 21:12:43', '2024-01-04 15:39:44', 'Ygomez', ''),
(521, 6, 'Isabel', 'Steffensen', 0, 111, 'BT', 3, 0, '2024-01-01', '18:30:00', 'Solicita mesa afuera', 'Samara | 28/12', '2024-01-01 15:57:34', '2024-01-04 15:39:44', 'Svite', ''),
(522, 1, 'Isabel', 'Steffensen', 0, 0, 'BT', 3, 0, '2024-01-05', '18:30:00', 'Solicita mesa afuera', 'Samara | 28/12', '2024-01-01 15:57:50', '2024-01-04 15:39:44', 'Svite', ''),
(523, 2, 'Alexandre ', 'Abuleac', 0, 504, 'BT', 5, 3, '2024-01-02', '20:30:00', 'N/A', 'Seidee', '2023-12-28 17:36:25', '2024-01-04 15:39:44', 'Ygomez', ''),
(524, 4, 'Kevin', 'Levingston', 0, 0, 'BT', 6, 0, '2024-01-02', '18:30:00', 'NA', 'Samara | 28/12', '2023-12-28 19:00:18', '2024-01-04 15:39:44', 'Svite', ''),
(525, 6, 'Kevin', 'Livingston', 0, 612, 'BT', 6, 0, '2024-01-04', '18:30:00', 'NA', 'Samara | 28/12', '2023-12-28 19:05:04', '2024-01-04 19:32:18', 'Svite', 'Ygomez'),
(526, 1, 'Anne', 'Arora', 0, 0, 'BT', 5, 0, '2024-01-04', '19:00:00', 'NA', 'Andrea G 28-12', '2023-12-28 19:08:52', '2024-01-04 15:39:44', 'Aguzman', ''),
(528, 6, 'Anne', 'Arora', 0, 0, 'BT', 5, 0, '2024-01-05', '19:00:00', 'NA', 'Andrea G 28-12', '2023-12-28 19:58:38', '2024-01-04 15:39:44', 'Aguzman', ''),
(530, 7, 'Shelly', 'Marchetti', 0, 407, 'BT', 7, 0, '2024-01-03', '18:15:00', 'NA', 'Ricardo 28.12', '2024-01-03 21:57:07', '2024-01-04 15:39:44', 'Rmartinez', ''),
(531, 6, 'Shelly', 'Marchetti', 0, 407, 'BT', 7, 0, '2024-01-04', '18:15:00', 'NA', 'Ricardo 28.12', '2024-01-02 21:37:00', '2024-01-04 15:39:44', 'Rmartinez', ''),
(532, 6, 'Hsinchia', ' Hsu', 0, 0, 'Andaz', 2, 2, '2024-01-06', '18:00:00', '5 and 8 years old', 'Guest', '2023-12-28 22:16:11', '2024-01-04 15:39:44', 'Ygomez', ''),
(533, 4, ' Paul', 'Kuzel', 0, 0, 'FMT', 4, 3, '2024-10-02', '18:00:00', 'Salen el 4 de enero', 'Fernanda Salgado', '2023-12-28 22:34:40', '2024-01-04 15:39:44', 'Ygomez', ''),
(534, 1, ' Paul', 'Kuzel', 0, 0, 'FMT', 4, 3, '2024-01-03', '18:00:00', 'Salen el 4 de enero', 'Fernanda Salgado', '2023-12-28 22:35:36', '2024-01-04 15:39:44', 'Ygomez', ''),
(535, 6, 'Tracy', 'Brala', 0, 0, 'BT', 4, 0, '2024-01-04', '19:15:00', 'NA', 'Ricardo 28.12', '2023-12-28 22:43:21', '2024-01-04 15:39:44', 'Rmartinez', ''),
(536, 6, 'Blair', 'Peterson', 0, 0, 'BT', 6, 0, '2024-01-18', '20:00:00', 'N/A', 'Guest', '2023-12-28 23:06:09', '2024-01-04 15:39:44', 'Ygomez', ''),
(537, 1, 'Jordan ', 'Mazzetta', 0, 0, 'RWD', 2, 2, '2024-01-04', '20:15:00', 'Jordan & Melissa Mazzetta|check out:  06 Enero|(9 & 11 Años) ', 'Susana palacios  ', '2024-01-03 18:13:05', '2024-01-04 15:39:44', 'Ygomez', ''),
(538, 6, 'Ravi ', 'Vanmali', 0, 0, 'StRegis', 3, 0, '2024-01-03', '17:30:00', ' 678-472-1990| Special celebrations: new job', 'Guest', '2023-12-29 18:08:30', '2024-01-04 15:39:44', 'Ygomez', ''),
(539, 6, 'Kent ', 'Hathaway', 0, 0, 'FMT', 2, 0, '2024-01-03', '18:30:00', 'Aniversario|Celebrating our anniversary Contact:  001-763-227-6861', 'Guest', '2024-01-02 16:03:10', '2024-01-04 15:39:44', 'Ygomez', ''),
(540, 1, 'Elizabeth ', 'dekanich ', 0, 310, 'BT', 5, 0, '2024-01-04', '20:00:00', 'N/A', 'Livia', '2023-12-29 00:10:45', '2024-01-04 15:39:44', 'Ygomez', ''),
(541, 6, 'Elizabeth ', 'dekanich ', 0, 310, 'BT', 5, 0, '2024-01-06', '20:00:00', 'N/A', 'Livia', '2023-12-29 00:11:56', '2024-01-04 15:39:44', 'Ygomez', ''),
(542, 6, 'Eva', ' Rebullida', 0, 0, 'Hilton Tulum', 2, 0, '2024-01-06', '17:30:00', 'Birthday and Baby Moon |: 832-640-994', 'Guest', '2023-12-29 00:34:08', '2024-01-04 15:39:44', 'Ygomez', ''),
(543, 1, 'John Blalock', 'Blalock', 0, 0, 'BT', 2, 0, '2024-01-22', '18:30:00', 'NA', 'Ricardo 28.12', '2023-12-29 00:34:40', '2024-01-04 15:39:44', 'Rmartinez', ''),
(544, 2, 'John', ' Blalock', 0, 0, 'BT', 2, 0, '2024-01-23', '18:30:00', 'NA', 'Ricardo 28.12', '2023-12-29 00:36:07', '2024-01-04 15:39:44', 'Rmartinez', ''),
(545, 6, 'Gregory', 'Block, ', 0, 0, 'FMT', 4, 0, '2024-01-04', '20:45:00', 'N/A', 'Fernanda González ', '2023-12-29 00:38:08', '2024-01-04 15:39:44', 'Ygomez', ''),
(546, 4, 'John', 'Blalock', 0, 0, 'BT', 2, 0, '2024-01-23', '18:30:00', 'NA', 'Ricardo 28.12', '2023-12-29 00:39:01', '2024-01-04 15:39:44', 'Rmartinez', ''),
(547, 2, 'Luis', 'Diaz', 0, 0, 'BT', 6, 0, '2024-01-02', '19:30:00', 'NA', 'Andrea G 28-12', '2023-12-29 00:44:11', '2024-01-04 15:39:44', 'Aguzman', ''),
(548, 6, 'Nawshaba ', 'Siddiquee ', 0, 0, 'ETEREO', 5, 0, '2024-01-02', '17:30:00', 'No pork or alcohol|Husband Birthday |217-766-2799', 'Guest', '2023-12-29 00:44:33', '2024-01-04 15:39:44', 'Ygomez', ''),
(549, 6, 'John', 'Blalock', 0, 0, 'BT', 2, 0, '2024-01-25', '18:30:00', 'NA', 'Ricardo 28.12', '2023-12-29 00:45:25', '2024-01-04 15:39:44', 'Rmartinez', ''),
(550, 6, 'Amy ', 'Wilson', 0, 0, 'Andaz', 4, 0, '2024-01-03', '17:30:00', 'Cumpleanos', 'Moni', '2023-12-29 00:47:21', '2024-01-04 15:39:44', 'Ygomez', ''),
(551, 6, 'Suchit ', 'Majmudar', 0, 0, 'Andaz', 4, 0, '2024-01-05', '17:30:00', 'Check out: 06 ene', 'MONICA GARCIA', '2023-12-29 00:48:51', '2024-01-04 15:39:44', 'Ygomez', ''),
(552, 4, 'Luis', 'Diaz', 0, 0, 'BT', 6, 0, '2024-01-04', '19:00:00', 'NA', 'Andrea G 28-12', '2023-12-29 00:49:32', '2024-01-04 15:39:44', 'Aguzman', ''),
(553, 6, 'Jessica', ' Greenwald', 0, 0, 'FMT', 3, 0, '2024-01-02', '18:45:00', '1-402-770-5371', 'Guest', '2023-12-29 00:53:13', '2024-01-04 15:39:44', 'Ygomez', ''),
(554, 6, 'Luis', 'Diaz', 0, 0, 'BT', 6, 0, '2024-01-05', '19:15:00', 'NA', 'Andrea G 28-12', '2023-12-29 00:53:22', '2024-01-04 15:39:44', 'Aguzman', ''),
(555, 7, 'Luis', 'Diaz', 0, 0, 'BT', 6, 0, '2024-01-06', '19:00:00', 'NA', 'Andrea G 28-12', '2023-12-29 00:55:49', '2024-01-04 15:39:44', 'Aguzman', ''),
(557, 1, 'Meghan ', 'Brescia', 0, 0, 'RWD', 2, 0, '2024-01-07', '19:00:00', 'Mrs. Brescia is pregnant.|check out:?? 11 de enero', ' Brenda Mejia ', '2023-12-29 00:58:10', '2024-01-04 15:39:44', 'Ygomez', ''),
(558, 7, 'Meghan ', 'Brescia', 0, 0, 'RWD', 2, 0, '2024-01-09', '19:00:00', 'Mrs. Brescia is pregnant.|check out:?? 11 de enero', ' Brenda Mejia ', '2023-12-29 00:59:04', '2024-01-04 15:39:44', 'Ygomez', ''),
(559, 6, 'Curtis ', 'Schreiber', 0, 0, 'FHP', 7, 0, '2024-01-07', '20:00:00', 'Co 10 Enero 2024', 'Mónica Cervantes', '2023-12-29 01:01:03', '2024-01-04 15:39:44', 'Ygomez', ''),
(560, 4, 'Matthew', ' Kline ', 0, 0, 'TBD', 6, 0, '2024-01-07', '19:30:00', 'Cumpleaños del Sr Kline', 'GUest', '2023-12-29 01:03:20', '2024-01-04 15:39:44', 'Ygomez', ''),
(561, 6, 'Jennifer ', 'Schmit', 0, 0, 'Andaz', 5, 0, '2024-01-02', '17:00:00', 'Check out: 03 enero', 'MONICA GARCIA', '2023-12-29 01:06:15', '2024-01-04 15:39:44', 'Ygomez', ''),
(564, 6, 'Casey ', 'Wenzel? ', 0, 0, 'RWD', 2, 2, '2024-01-06', '18:00:00', '(Cole 8yo & Dylan 6yo)|check out:?? 7 enero', 'Brenda', '2023-12-29 01:39:11', '2024-01-04 15:39:44', 'Ygomez', ''),
(565, 6, ' Érica ', 'Roberts', 0, 0, 'FMT', 4, 0, '2024-01-08', '20:00:00', '744 176 5599', 'Daniel González ', '2023-12-29 01:43:54', '2024-01-04 15:39:44', 'Ygomez', ''),
(566, 4, 'Martin', 'Zeldin', 0, 932, 'BT', 2, 0, '2024-01-01', '18:15:00', 'Srita es Vegetariana| Sr. No consume mucho sodio| ', 'Rafael | 2812', '2024-01-01 21:46:39', '2024-01-04 15:39:44', 'Rmerlo', ''),
(567, 6, 'Sybil', 'Eng', 0, 938, 'BT', 2, 0, '2024-01-02', '19:00:00', 'NA', 'Sammara | 29/12', '2024-01-02 22:11:03', '2024-01-04 15:39:44', 'Svite', ''),
(568, 4, 'DJ ', 'Weisbrod', 0, 622, 'BT', 4, 0, '2024-01-01', '19:45:00', 'N/A', 'Livia', '2023-12-29 15:29:16', '2024-01-04 15:39:44', 'Ygomez', ''),
(569, 6, 'DJ ', 'Weisbrod', 0, 622, 'BT', 4, 0, '2024-01-02', '19:45:00', 'N/A', 'Livia', '2023-12-29 15:30:17', '2024-01-04 15:39:44', 'Ygomez', ''),
(571, 4, 'Alexandre', 'Kalisky', 0, 935, 'BT', 2, 0, '2024-01-02', '20:00:00', 'NA', 'Samara | 29/12 ', '2024-01-02 22:04:22', '2024-01-04 15:39:44', 'Svite', ''),
(572, 1, 'Alexandre', 'Kalisky', 0, 935, 'BT', 2, 0, '2024-01-03', '19:30:00', 'NA', 'Samara | 29/12 ', '2024-01-03 19:38:18', '2024-01-04 15:39:44', 'Svite', ''),
(579, 6, 'Peter ', 'Gailliot, ', 0, 604, 'BT', 2, 4, '2024-01-01', '18:00:00', 'N/A', 'Ana', '2023-12-29 16:42:51', '2024-01-04 15:39:44', '', ''),
(580, 7, 'Alexandre', 'Kalisky', 0, 0, 'BT', 2, 0, '2024-01-05', '19:30:00', 'NA', 'Samara | 29/12 ', '2023-12-29 16:45:16', '2024-01-04 15:39:44', 'Svite', ''),
(581, 6, 'Alexandre', 'Kalisky', 0, 0, 'BT', 2, 0, '2024-01-06', '19:30:00', 'NA', 'Samara | 29/12 ', '2023-12-29 16:46:34', '2024-01-04 15:39:44', 'Svite', ''),
(582, 2, 'Alexandre', 'Kalisky', 0, 0, 'BT', 2, 0, '2024-01-07', '19:30:00', 'NA', 'Samara | 29/12 ', '2023-12-29 16:47:49', '2024-01-04 15:39:44', 'Svite', ''),
(583, 4, 'Alexandre', 'Kalisky', 0, 0, 'BT', 2, 0, '2024-01-08', '19:30:00', 'NA', 'Samara | 29/12 ', '2023-12-29 16:49:14', '2024-01-04 15:39:44', 'Svite', ''),
(584, 6, 'Shawn', 'Heather', 0, 907, 'BT', 6, 0, '2024-01-03', '18:15:00', 'Festejan cumpleaños| Solicitan mesa en la isla', 'Ricardo 29-12', '2024-01-03 14:21:45', '2024-01-04 15:39:44', 'Rmartinez', ''),
(585, 6, 'Charlotte Samantha', ' Colton', 0, 609, 'BT', 3, 0, '2024-01-01', '18:00:00', 'N/A', 'Gaby Relo', '2023-12-29 17:10:05', '2024-01-04 15:39:44', 'Ygomez', ''),
(586, 6, 'Maria', 'Ramirez,', 0, 413, 'BT', 8, 2, '2024-01-01', '19:00:00', 'N/A', 'Guest', '2023-12-29 18:35:40', '2024-01-04 15:39:44', 'Ygomez', ''),
(587, 7, 'Maria', 'Ramirez,', 0, 413, 'BT', 8, 2, '2024-01-02', '18:30:00', 'N/A', 'Guest', '2023-12-29 18:36:31', '2024-01-04 15:39:44', 'Ygomez', ''),
(589, 1, 'Joel', 'Lopes', 0, 1511, 'ANdaz', 2, 0, '2024-01-02', '20:30:00', 'N/A', 'Luz Malpica', '2023-12-29 19:14:20', '2024-01-04 15:39:44', 'Ygomez', ''),
(590, 2, 'Meredith ', 'Burns', 0, 628, 'BT', 4, 4, '2024-01-01', '18:00:00', 'Sra Burns alergia a nueces', 'Octavio', '2023-12-30 14:56:33', '2024-01-04 15:39:44', 'Ygomez', ''),
(591, 1, 'Meredith ', 'Burns', 0, 628, 'BT', 4, 4, '2024-01-03', '18:00:00', 'Sra Burns alergia a nueces', 'Octavio', '2023-12-29 20:05:56', '2024-01-04 15:39:44', 'Ygomez', ''),
(592, 7, 'Meredith ', 'Burns', 0, 628, 'BT', 4, 0, '2024-01-02', '19:00:00', 'Sra Burns alergia a nueces', 'Octavio', '2023-12-29 20:07:03', '2024-01-04 15:39:44', 'Ygomez', ''),
(593, 6, 'John', 'Condas', 0, 0, 'BT', 6, 0, '2024-01-06', '19:00:00', 'NA', 'Andrea G 29-12', '2023-12-29 20:34:26', '2024-01-04 15:39:44', 'Aguzman', ''),
(594, 4, 'Nicole	', 'Lambert', 0, 805, 'BT', 2, 1, '2024-01-01', '19:00:00', 'N/A', 'Marcos', '2023-12-29 20:36:04', '2024-01-04 15:39:44', 'Ygomez', ''),
(595, 1, 'John', 'Condas', 0, 0, 'BT', 6, 0, '2024-01-08', '19:30:00', 'NA', 'Andrea G 29-12', '2023-12-29 20:37:23', '2024-01-04 15:39:44', 'Aguzman', ''),
(596, 7, 'Joshua', 'Rosenthal', 0, 523, 'BT', 2, 1, '2024-01-01', '19:30:00', 'No comen puerco', 'Guest', '2023-12-31 16:03:35', '2024-01-04 15:39:44', 'Ygomez', ''),
(597, 1, 'Joshua', 'Rosenthal', 0, 523, 'BT', 2, 1, '2024-01-02', '19:30:00', 'No comen puerco', 'Guest', '2023-12-31 16:04:11', '2024-01-04 15:39:44', 'Ygomez', ''),
(598, 1, 'Joshua', 'Rosenthal', 0, 523, 'BT', 2, 1, '2024-01-04', '19:30:00', 'No comen puerco', 'Guest', '2023-12-31 16:04:59', '2024-01-04 15:39:44', 'Ygomez', ''),
(599, 4, 'Joshua', 'Rosenthal', 0, 523, 'BT', 2, 1, '2024-01-05', '19:30:00', 'No comen puerco', 'Guest', '2023-12-31 16:05:20', '2024-01-04 15:39:44', 'Ygomez', ''),
(603, 1, 'Rachael', 'Greenberg', 0, 0, 'BT', 2, 0, '2024-03-03', '19:00:00', 'Honeymoon ', 'Ricardo 29-12', '2023-12-30 18:15:24', '2024-01-04 15:39:44', '', ''),
(630, 1, 'Shelly ', 'Marchetti', 0, 407, 'BT', 7, 0, '2024-01-02', '19:00:00', 'NA', 'Ricardo 28.12', '2024-01-02 21:37:11', '2024-01-04 15:39:44', 'Cnava', ''),
(631, 2, 'Shelly', 'Marchetti', 0, 407, 'BT', 7, 0, '2024-01-02', '19:00:00', 'NA', 'Carmen 29.12', '2024-01-02 21:37:23', '2024-01-04 15:39:44', 'Cnava', ''),
(633, 1, 'Shelly', 'Marchetti', 0, 407, 'BT', 7, 0, '2024-01-05', '19:00:00', 'NA', 'Carmen 29.12', '2024-01-02 21:37:34', '2024-01-04 15:39:44', 'Cnava', ''),
(634, 6, 'Todd ', 'Figler   ', 0, 0, 'RWD', 6, 0, '2024-01-14', '19:30:00', '( Amanda and Brian Tolber + Jeff and Cam Saltzman)|', 'Susana  Palacios', '2023-12-29 23:32:49', '2024-01-04 15:39:44', 'Ygomez', ''),
(635, 1, 'Catherine ', 'Galin  ', 0, 0, 'RWD', 2, 0, '2024-01-08', '18:30:00', 'check out:? Jan 10', '?? Giovanna', '2023-12-29 23:36:49', '2024-01-04 15:39:44', 'Ygomez', ''),
(636, 6, 'Scott ', 'Robertson ', 0, 0, 'RWD', 2, 0, '2024-01-07', '18:00:00', 'No Shellfish, soy and onion|check out:  9 de enero ', 'AShly', '2023-12-29 23:39:13', '2024-01-04 15:39:44', 'Ygomez', ''),
(637, 6, 'Oriana', 'Vogel', 0, 0, 'FMT', 2, 0, '2024-01-09', '18:30:00', 'Alergias N/A | Celebraciones N/A ', 'Annette Monteverde ', '2023-12-29 23:41:39', '2024-01-04 15:39:44', 'Ygomez', ''),
(638, 1, 'Gary ', 'Veloric', 0, 0, 'RWD', 4, 0, '2024-01-08', '19:30:00', 'check out:   11 enero 2024', 'Ashly Gómez ', '2023-12-29 23:45:20', '2024-01-04 15:39:44', 'Ygomez', ''),
(639, 6, 'ASHLY ', 'SCHUMACHER', 0, 0, 'RWD', 2, 3, '2024-01-04', '17:30:00', 'Mrs. Ashley is allergic to shrimp, crab and lobster.|check out:  07 Enero ', 'Susana   Palacios ', '2023-12-29 23:47:39', '2024-01-04 15:39:44', 'Ygomez', ''),
(640, 6, 'Dan ', 'Moss ', 0, 0, 'RWD', 2, 1, '2024-01-04', '17:30:00', 'N/A', 'Ramon', '2023-12-29 23:52:36', '2024-01-04 15:39:44', 'Ygomez', ''),
(641, 5, 'Moshe ', 'Lieberman', 0, 0, 'EXT', 2, 0, '2024-01-02', '18:30:00', 'TBD', 'GUest', '2023-12-29 23:57:40', '2024-01-04 15:39:44', 'Ygomez', ''),
(642, 6, 'Richard ', 'Dubrovsky', 0, 0, 'RWD', 7, 0, '2024-01-08', '20:15:00', 'Check out : 11/01/2024', 'Carol Maguiña ', '2023-12-30 00:01:11', '2024-01-04 15:39:44', 'Ygomez', ''),
(643, 6, 'Julia ', 'Schwarz', 0, 0, 'Ext', 3, 0, '2024-01-06', '18:15:00', 'clebran un cumpleaños', 'Rodrigo Sosa', '2023-12-30 00:09:05', '2024-01-04 15:39:44', 'Ygomez', ''),
(651, 1, 'Hilary', ' Susskind  ', 0, 0, 'RWD', 3, 0, '2024-01-30', '19:30:00', 'check out:? Feb 01', 'Giovanna', '2024-01-03 12:12:45', '2024-01-04 15:39:44', 'Ygomez', ''),
(652, 6, 'Kisha ', 'Reid', 0, 0, 'Andaz', 2, 0, '2024-01-04', '17:30:00', 'Check out: 05 enero', 'MONICA GARCIA', '2023-12-30 00:40:01', '2024-01-04 15:39:44', 'Ygomez', ''),
(653, 5, 'Cindy ', 'Ludwig', 0, 0, 'Andaz', 3, 0, '2024-01-04', '20:30:00', 'Check out: 08 enero', 'Monica', '2023-12-30 00:42:13', '2024-01-04 15:39:44', 'Ygomez', ''),
(654, 6, 'Brent', 'Bennet', 0, 0, 'BT', 2, 0, '2024-01-05', '18:30:00', 'NA', 'Carmen 29.12', '2023-12-30 03:05:03', '2024-01-04 15:39:44', 'Cnava', ''),
(655, 4, 'Brent', 'Bennet', 0, 0, 'BT', 2, 0, '2024-01-08', '18:15:00', 'NA', 'Carmen 29.12', '2023-12-30 03:16:48', '2024-01-04 15:39:44', 'Cnava', ''),
(656, 1, 'Christopher ', 'Burks', 0, 0, 'BT', 2, 0, '2024-01-05', '18:30:00', 'NA', 'Carmen 29.12', '2023-12-30 03:49:06', '2024-01-04 15:39:44', 'Cnava', ''),
(657, 6, 'Christopher ', 'Burks', 0, 0, 'BT', 2, 0, '2024-01-06', '18:15:00', 'NA', 'Carmen 29.12', '2023-12-30 21:03:53', '2024-01-04 15:39:44', 'Cnava', ''),
(659, 6, 'Raymond', 'Musalo', 0, 0, 'Andaz', 2, 0, '2024-01-05', '18:15:00', 'Check out: 06 ene', ' MONICA GARCIA', '2023-12-30 14:04:41', '2024-01-04 15:39:44', 'Ygomez', ''),
(660, 7, 'Diane ', 'Phuong-Viet Mirowski', 0, 305, 'BT', 4, 0, '2024-01-03', '19:30:00', 'N/A', 'Gaby Relo', '2023-12-30 14:26:00', '2024-01-04 15:39:44', 'Ygomez', ''),
(661, 6, 'Mccaffery', 'Gannon ', 0, 517, 'BT', 2, 2, '2024-01-01', '18:30:00', 'N/A', 'Israel Camargo', '2023-12-30 14:39:09', '2024-01-04 15:39:44', 'Ygomez', ''),
(664, 7, 'Linda	', 'Petrie', 0, 516, 'BT', 3, 0, '2024-01-01', '19:00:00', 'N/A', 'GUest', '2023-12-30 15:03:47', '2024-01-04 15:39:44', 'Ygomez', ''),
(665, 6, 'Linda	', 'Petrie', 0, 516, 'BT', 3, 0, '2024-01-02', '19:00:00', 'N/A', 'GUest', '2024-01-02 14:10:47', '2024-01-04 15:39:44', 'Ygomez', ''),
(668, 7, 'David', 'Karolinski', 0, 605, 'BT', 5, 5, '2024-01-02', '18:00:00', 'NA', 'Samara | 30/12', '2024-01-02 21:54:47', '2024-01-04 15:39:44', 'Svite', ''),
(669, 4, 'David', 'Karolinski', 0, 605, 'BT', 5, 3, '2024-01-03', '19:00:00', 'NA', 'Samara | 30/12', '2024-01-03 19:39:23', '2024-01-04 15:39:44', 'Svite', ''),
(670, 6, 'David', 'Karolinski', 0, 0, 'BT', 4, 0, '2024-01-04', '20:00:00', 'NA', 'Samara | 30/12', '2023-12-30 15:38:35', '2024-01-04 15:39:44', 'Svite', ''),
(671, 1, 'David', 'Karolinski', 0, 0, 'BT', 6, 5, '2024-01-05', '18:00:00', 'NA', 'Samara | 30/12', '2023-12-30 15:41:42', '2024-01-04 15:39:44', 'Svite', ''),
(672, 7, 'David', 'Karolinski', 0, 0, 'BT', 5, 3, '2024-01-06', '19:00:00', 'NA', 'Samara | 30/12', '2023-12-30 15:43:31', '2024-01-04 15:39:44', 'Svite', ''),
(676, 1, 'Casey ', 'Wenzel', 0, 0, 'RWD', 2, 2, '2024-01-04', '17:30:00', 'check out: 7 enero', 'Brenda', '2023-12-31 17:25:54', '2024-01-04 15:39:44', 'Ygomez', ''),
(678, 4, 'William ', 'Reiss', 0, 0, 'Andaz', 2, 0, '2024-01-03', '18:30:00', 'Check out: 06 ene', 'MONICA GARCIA', '2023-12-30 16:32:56', '2024-01-04 15:39:44', 'Ygomez', ''),
(679, 6, 'Daniela', 'Almeida', 0, 0, 'BT', 3, 1, '2024-01-06', '21:00:00', 'NA', 'Samara | 30/12', '2023-12-30 17:01:13', '2024-01-04 15:39:44', 'Svite', ''),
(680, 1, 'Daniela', 'Almeida', 0, 0, 'BT', 3, 1, '2024-01-07', '21:00:00', 'NA', 'Samara | 30/12', '2023-12-30 17:01:48', '2024-01-04 15:39:44', 'Svite', ''),
(681, 1, 'Alberto', 'Morales', 0, 408, 'BT', 3, 0, '2024-01-01', '19:45:00', 'N/A', 'Guest', '2024-01-01 21:31:43', '2024-01-04 15:39:44', 'Ygomez', ''),
(682, 4, 'Alberto', 'Morales', 0, 408, 'BT', 3, 0, '2024-01-02', '19:30:00', 'N/A', 'Guest', '2024-01-02 17:34:56', '2024-01-04 15:39:44', 'Ygomez', ''),
(683, 7, 'Alberto', 'Morales', 0, 408, 'BT', 3, 0, '2024-01-04', '19:30:00', 'N/A', 'Guest', '2024-01-02 17:35:13', '2024-01-04 15:39:44', 'Ygomez', ''),
(684, 6, 'Alberto', 'Morales', 0, 408, 'BT', 3, 0, '2024-01-05', '19:30:00', 'N/A', 'Guest', '2024-01-02 17:35:29', '2024-01-04 15:39:44', 'Ygomez', ''),
(685, 2, 'Rachael', 'Greenberg', 0, 0, 'BT', 2, 0, '2024-03-04', '18:30:00', 'Honeymoon ', 'Ricardo 30-12', '2023-12-30 18:19:30', '2024-01-04 15:39:44', 'Rmartinez', ''),
(686, 1, ' Martin', 'Soto Machuca,', 0, 103, 'BT', 2, 0, '2024-01-01', '19:15:00', 'N/A', 'GUest', '2023-12-30 18:37:58', '2024-01-04 15:39:44', 'Ygomez', ''),
(687, 6, 'Barbara', 'Leparulo', 0, 0, 'BT', 2, 0, '2024-01-05', '20:00:00', 'NA', 'Samara | 30/12', '2023-12-30 18:38:27', '2024-01-04 15:39:44', 'Svite', ''),
(688, 6, ' Martin', 'Soto Machuca,', 0, 103, 'BT', 2, 0, '2024-01-02', '18:30:00', 'Soto Machuca, ', 'GUest', '2024-01-02 21:04:29', '2024-01-04 15:39:44', 'Ygomez', ''),
(689, 1, 'Barbara', 'Leparulo', 0, 0, 'BT', 2, 0, '2024-01-06', '20:00:00', 'NA', 'Samara | 30/12', '2023-12-30 18:39:01', '2024-01-04 15:39:44', 'Svite', ''),
(690, 2, 'Rebecca', 'Richter', 0, 0, 'BT', 2, 0, '2024-03-26', '19:00:00', 'Honeymoon ', 'Ricardo 30-12', '2023-12-30 19:20:32', '2024-01-04 15:39:44', 'Rmartinez', ''),
(691, 4, 'Rebecca', 'Richter', 0, 0, 'BT', 2, 0, '2024-03-27', '19:00:00', 'Honeymoon ', 'Ricardo 30-12', '2023-12-30 19:20:52', '2024-01-04 15:39:44', 'Rmartinez', ''),
(692, 6, 'Rebecca', 'Richter', 0, 0, 'BT', 2, 0, '2024-03-28', '19:00:00', 'Honeymoon ', 'Ricardo 30-12', '2023-12-30 19:21:06', '2024-01-04 15:39:44', 'Rmartinez', ''),
(693, 1, 'Rebecca', 'Richter', 0, 0, 'BT', 2, 0, '2024-03-29', '19:00:00', 'Honeymoon ', 'Ricardo 30-12', '2023-12-30 19:21:24', '2024-01-04 15:39:44', 'Rmartinez', ''),
(695, 6, 'Amanda', 'Mabie', 0, 0, 'BT', 7, 0, '2024-01-13', '19:30:00', 'N/A', 'Rafael | 3012', '2023-12-30 18:48:59', '2024-01-04 15:39:44', 'Rmerlo', ''),
(698, 4, 'Charlotte Samantha', ' Colton', 0, 609, 'BT', 3, 0, '2024-01-02', '18:00:00', 'N/A', 'Seidee', '2023-12-30 18:56:16', '2024-01-04 15:39:44', 'Ygomez', ''),
(699, 1, 'Charlotte Samantha', ' Colton', 0, 609, 'BT', 3, 0, '2024-01-03', '18:00:00', 'N/A', 'Seidee', '2023-12-30 18:56:29', '2024-01-04 15:39:44', 'Ygomez', ''),
(700, 7, 'Charlotte Samantha', ' Colton', 0, 609, 'BT', 3, 0, '2024-01-04', '18:00:00', 'N/A', 'Seidee', '2023-12-30 18:56:43', '2024-01-04 15:39:44', 'Ygomez', ''),
(701, 1, 'Mark ', 'Ruggeri', 0, 306, 'BT', 4, 0, '2024-01-01', '19:00:00', 'alergia a lacteos, huevo y crustaceos', 'Jose', '2023-12-31 16:49:37', '2024-01-04 15:39:44', 'Ygomez', ''),
(703, 6, 'Patrick', 'Schloter', 0, 0, 'Bt', 2, 0, '2024-01-06', '19:30:00', 'NA', 'Carmen 30.12', '2023-12-30 20:48:17', '2024-01-04 15:39:44', 'Cnava', ''),
(704, 6, 'David ', 'Roth', 0, 0, 'BT', 4, 0, '2024-01-06', '18:30:00', 'NA', 'Carmen 30.12', '2023-12-30 21:16:53', '2024-01-04 15:39:44', 'Cnava', ''),
(705, 1, 'Cornell', 'wright ', 0, 0, 'BT', 2, 3, '2024-01-01', '19:15:00', 'NA', 'RICARDO 30-12', '2023-12-30 21:46:53', '2024-01-04 15:39:44', 'Rmartinez', ''),
(707, 6, 'Lori', 'Wrinkle', 0, 0, 'BT', 4, 0, '2024-01-06', '20:00:00', 'NA', 'RICARDO 30-12', '2023-12-30 22:27:14', '2024-01-04 15:39:44', 'Rmartinez', ''),
(710, 7, 'Krista', 'Bacchieri', 0, 0, 'BT', 2, 0, '2024-01-07', '19:00:00', 'NA', 'Carmen 30.12', '2023-12-31 03:41:34', '2024-01-04 15:39:44', 'Cnava', ''),
(711, 1, 'Krista', 'Bacchieri', 0, 0, 'BT', 2, 0, '2024-01-10', '19:00:00', 'NA', 'Carmen 30.12', '2023-12-31 03:44:13', '2024-01-04 15:39:44', 'Cnava', ''),
(712, 6, 'Krista', 'Bacchieri', 0, 0, 'BT', 2, 0, '2024-01-11', '19:00:00', 'NA', 'Carmen 30.12', '2023-12-31 03:45:06', '2024-01-04 15:39:44', 'Cnava', ''),
(713, 6, 'Mathieu', 'Laine', 0, 613, 'BT', 2, 0, '2024-01-01', '19:30:00', 'Sra alergia al atun', 'GUest', '2023-12-31 14:29:18', '2024-01-04 15:39:44', 'Ygomez', ''),
(714, 1, 'Mathieu', 'Laine', 0, 613, 'BT', 5, 0, '2024-01-02', '19:30:00', 'Sra alergia al atun', 'GUest', '2024-01-01 20:21:29', '2024-01-04 15:39:44', 'Ygomez', ''),
(715, 2, 'Mathieu', 'Laine', 0, 613, 'BT', 2, 0, '2024-01-05', '19:30:00', 'Sra alergia al atun', 'GUest', '2023-12-31 14:31:09', '2024-01-04 15:39:44', 'Ygomez', ''),
(716, 1, 'Atluri', 'Pallavi', 0, 936, 'BT', 2, 1, '2024-01-03', '19:00:00', 'SCG', 'Sonia', '2024-01-03 14:07:44', '2024-01-04 15:39:44', 'Ygomez', ''),
(717, 1, 'Michael', 'Sales', 0, 210, 'BT', 12, 0, '2024-01-02', '19:30:00', 'pendiente preorden', 'Paola', '2023-12-31 14:55:51', '2024-01-04 15:39:44', 'Ygomez', ''),
(718, 6, 'Francisco', 'Garza ', 0, 0, 'Ext', 4, 0, '2024-01-01', '21:30:00', '+52 55 4533 9615', 'Luz Mal', '2023-12-31 14:59:57', '2024-01-04 15:39:44', 'Ygomez', ''),
(719, 7, 'George', 'Wang', 0, 207, 'BT', 2, 3, '2024-01-01', '18:00:00', 'N/A', 'Regina', '2023-12-31 15:08:28', '2024-01-04 15:39:44', 'Ygomez', ''),
(720, 1, 'George', 'Wang', 0, 207, 'BT', 2, 3, '2024-01-02', '20:00:00', 'paquete come closer', 'Regina', '2023-12-31 20:56:58', '2024-01-04 15:39:44', 'Ygomez', ''),
(721, 6, 'Daniel', 'Sabau', 0, 525, 'BT', 2, 0, '2024-01-01', '20:00:00', 'No alergias', 'Guest', '2023-12-31 15:20:19', '2024-01-04 15:39:44', 'Ygomez', ''),
(722, 1, 'Daniel', 'Sabau', 0, 525, 'BT', 2, 0, '2024-01-02', '20:00:00', 'No alergias', 'Guest', '2023-12-31 15:20:34', '2024-01-04 15:39:44', 'Ygomez', ''),
(723, 1, 'Daniel', 'Sabau', 0, 525, 'BT', 2, 0, '2024-01-03', '20:30:00', 'No alergias', 'Guest', '2024-01-03 17:09:09', '2024-01-04 15:39:44', 'Ygomez', ''),
(724, 7, 'Kunal', 'Gulati', 0, 401, 'BT', 2, 0, '2024-01-01', '18:30:00', 'traen un bebé en carreola', 'GUest', '2023-12-31 15:56:38', '2024-01-04 15:39:44', 'Ygomez', ''),
(725, 6, 'Kunal', 'Gulati', 0, 401, 'BT', 2, 0, '2024-01-02', '18:30:00', 'traen un bebé en carreola', 'GUest', '2023-12-31 15:57:05', '2024-01-04 15:39:44', 'Ygomez', ''),
(726, 4, 'Kevin ', 'Willens', 0, 801, 'FHP', 6, 0, '2024-01-01', '20:30:00', 'N/A', 'Guest', '2023-12-31 16:38:14', '2024-01-04 15:39:44', 'Ygomez', ''),
(727, 6, 'Carolina', 'Moreno', 0, 0, 'POWERSITE', 10, 0, '2024-01-12', '18:00:00', 'grupo de Wedding planners de “The National Society of Black Wedding and Event Professionals” y vienen a conocer el hotel y después se quedarán a cenar con Lizbeth y conmigo.  ', 'Caro Moreno', '2023-12-31 17:23:15', '2024-01-04 15:39:44', 'Ygomez', ''),
(728, 6, 'Yusuf', 'Qureshi', 0, 0, 'BT', 2, 0, '2024-01-10', '18:00:00', 'No pork, no alcohol', 'Rafael | 3112', '2023-12-31 17:35:10', '2024-01-04 15:39:44', 'Rmerlo', ''),
(729, 7, 'Collin ', 'Cox ', 0, 502, 'RWD', 5, 0, '2024-01-01', '18:30:00', 'N/A', 'Concierge', '2023-12-31 17:37:01', '2024-01-04 15:39:44', 'Ygomez', ''),
(731, 6, 'Andrew ', 'Sprogis', 0, 0, 'RWD', 4, 4, '2024-01-02', '17:45:00', 'Tendrán crédito abierto No cuentan con alergias ni celebraciones. ', 'William Luca ', '2023-12-31 19:31:48', '2024-01-04 15:39:44', 'Ygomez', ''),
(732, 6, 'Chris ', 'Mcdonald', 0, 1014, 'Andaz', 5, 0, '2024-01-02', '21:00:00', 'no alergias', 'GUest', '2023-12-31 19:42:02', '2024-01-04 15:39:44', 'Ygomez', ''),
(734, 1, 'Emilie ', 'Jarvis', 0, 518, 'BT', 2, 2, '2024-01-01', '18:45:00', 'Jarvis is allergic to Lobster and mollusk', 'Fa', '2023-12-31 20:31:15', '2024-01-04 15:39:44', 'Ygomez', ''),
(735, 6, 'Laurie ', 'Weisman ', 0, 0, 'RWD', 4, 0, '2024-01-05', '18:00:00', 'N/A', 'Jenny Main', '2023-12-31 20:34:28', '2024-01-04 15:39:44', 'Ygomez', ''),
(736, 6, 'Pavia ', 'Rosati', 0, 0, 'Ext', 2, 0, '2024-01-08', '18:00:00', 'es un medio que conoció el jefe en cannes viene a conocer el restaurante|Es CEO y journalist de F A T H O M  |  @FathomWaytoGo ', 'Mariana Melo', '2023-12-31 20:36:15', '2024-01-04 15:39:44', 'Ygomez', ''),
(737, 6, 'Max', 'Lakther', 0, 0, 'BT', 2, 0, '2024-01-07', '19:00:00', 'N/A', 'Rafael ', '2023-12-31 20:41:47', '2024-01-04 15:39:44', 'Rmerlo', ''),
(738, 1, 'Max', 'Lakhter', 0, 0, 'BT', 2, 0, '2024-01-08', '19:00:00', 'N/A', 'Rafael | 3112', '2023-12-31 20:42:55', '2024-01-04 15:39:44', 'Rmerlo', ''),
(739, 7, 'Max', 'Lakther', 0, 0, 'BT', 2, 0, '2024-01-09', '19:00:00', 'N/A', 'Rafael | 3112', '2023-12-31 20:44:32', '2024-01-04 15:39:44', 'Rmerlo', ''),
(740, 1, 'Martha', 'Correa', 0, 926, 'BT', 8, 2, '2024-01-01', '21:00:00', 'dos sillas altas', 'GUest', '2023-12-31 20:51:26', '2024-01-04 15:39:44', 'Ygomez', ''),
(744, 6, 'Larry ', 'Serota,', 0, 708, 'BT', 2, 2, '2024-01-01', '18:45:00', 'ver alergias', 'Jose', '2023-12-31 21:25:50', '2024-01-04 15:39:44', 'Ygomez', ''),
(745, 1, 'Chloe ', 'Domont ', 0, 419, 'BT', 2, 0, '2024-01-01', '18:30:00', 'Alergias: Garlic, Apple, Soy, And Dairy free ', 'Ivan', '2024-01-01 19:27:37', '2024-01-04 15:39:44', 'Ygomez', ''),
(746, 7, 'Jordann ', 'Rabb', 0, 0, 'BT', 2, 0, '2024-01-09', '19:00:00', 'NA', 'Ricardo 31.12', '2023-12-31 21:46:21', '2024-01-04 15:39:44', 'Rmartinez', ''),
(747, 6, 'Jordann ', 'Rabb', 0, 0, 'BT', 2, 0, '2024-01-12', '19:00:00', 'NA', 'Ricardo 31.12', '2023-12-31 21:54:06', '2024-01-04 15:39:44', 'Rmartinez', ''),
(748, 1, 'Jordann ', 'Rabb', 0, 0, 'Bt', 2, 0, '2024-01-15', '19:00:00', 'NA', 'Ricardo 31.12', '2023-12-31 21:57:55', '2024-01-04 15:39:44', 'Rmartinez', ''),
(749, 6, 'Pilar ', 'Paris', 0, 0, 'BT', 5, 0, '2024-01-20', '20:00:00', 'NA', 'Carmen 31.12', '2023-12-31 22:02:42', '2024-01-04 15:39:44', 'Cnava', ''),
(750, 7, ' Sean', 'Mc Gill', 0, 203, 'BT', 6, 0, '2024-01-01', '19:45:00', 'N/A', 'GUest', '2023-12-31 22:15:05', '2024-01-04 15:39:44', 'Ygomez', ''),
(751, 6, 'Max', 'Lakhter', 0, 0, 'BT', 2, 0, '2024-01-07', '20:00:00', 'N/A', 'Rafael | 3112', '2023-12-31 22:21:41', '2024-01-04 15:39:44', 'Rmerlo', ''),
(753, 6, 'Jonathan', 'Friedman', 0, 0, 'BT', 4, 0, '2024-01-29', '19:00:00', 'Mr. Friedmans Birthday', 'Rafael | 3112', '2024-01-01 00:01:02', '2024-01-04 15:39:44', 'Rmerlo', ''),
(754, 6, 'Lauren', 'McCourt', 0, 0, 'BT', 2, 0, '2024-01-25', '20:00:00', 'NA', 'Carmen 31.12', '2024-01-01 00:48:22', '2024-01-04 15:39:44', 'Cnava', ''),
(755, 6, 'Tan', 'Yuqian ', 0, 0, 'BT', 2, 0, '2024-01-09', '20:00:00', 'NA', 'Ricardo 31.12', '2024-01-01 01:15:27', '2024-01-04 15:39:44', 'Rmartinez', ''),
(756, 7, 'Jonathan', 'Crowley', 0, 505, 'BT', 2, 1, '2024-01-02', '18:00:00', 'N/A', 'GUest', '2024-01-01 14:26:14', '2024-01-04 15:39:44', 'Ygomez', ''),
(757, 6, 'Mayssoun', 'Bydon', 0, 810, 'BT', 3, 3, '2024-01-01', '20:00:00', 'Cumpleaños de la Sra Bydon', 'Lau', '2024-01-01 20:55:07', '2024-01-04 15:39:44', 'Ygomez', ''),
(758, 4, 'Patrick ', 'Sweetman', 0, 516, 'RWD', 8, 0, '2024-01-01', '20:30:00', 'No celebraciones No restricciones  CO 3 Enero', 'Marimar', '2024-01-01 14:32:52', '2024-01-04 15:39:44', 'Ygomez', ''),
(761, 6, 'Jorge ', 'Posada', 0, 822, 'RWD', 3, 0, '2024-01-01', '20:45:00', 'OWNER', 'MONSERRAT ', '2024-01-01 14:58:32', '2024-01-04 15:39:44', 'Ygomez', ''),
(762, 6, 'Eric ', 'Chou', 0, 0, 'Andaz', 2, 2, '2024-01-06', '18:15:00', 'Check out: 08 enero', 'MONICA GARCIA', '2024-01-01 15:09:15', '2024-01-04 15:39:44', 'Ygomez', ''),
(763, 6, 'George ', 'Kasten', 0, 0, 'FHP', 6, 0, '2024-01-06', '20:30:00', 'Check out 07 de enero No comentan alergias', ' Rodrigo Sosa', '2024-01-01 15:10:43', '2024-01-04 15:39:44', 'Ygomez', ''),
(764, 7, 'Bonnie ', 'smolins', 0, 0, 'BT', 6, 0, '2024-01-11', '19:00:00', 'TBD', 'Guest', '2024-01-01 15:19:29', '2024-01-04 15:39:44', 'Ygomez', ''),
(765, 1, 'Bonnie ', 'smolins', 0, 0, 'BT', 6, 0, '2024-01-14', '19:30:00', 'TBD', 'Guest', '2024-01-01 15:19:43', '2024-01-04 15:39:44', 'Ygomez', ''),
(766, 4, 'Bonnie ', 'smolins', 0, 0, 'BT', 6, 0, '2024-01-15', '19:30:00', 'TBD', 'Guest', '2024-01-01 15:19:56', '2024-01-04 15:39:44', 'Ygomez', ''),
(767, 6, 'Bonnie ', 'smolins', 0, 0, 'BT', 6, 0, '2024-01-12', '19:30:00', 'TBD', 'Guest', '2024-01-01 15:20:13', '2024-01-04 15:39:44', 'Ygomez', ''),
(768, 7, 'David ', 'Chan', 0, 0, 'BT', 2, 1, '2024-01-05', '18:00:00', '8472245097| highchair ', 'Guest', '2024-01-01 15:31:11', '2024-01-04 15:39:44', 'Ygomez', ''),
(769, 6, 'David ', 'Chan', 0, 0, 'BT', 2, 1, '2024-01-06', '18:00:00', '8472245097| highchair ', 'Guest', '2024-01-01 15:31:22', '2024-01-04 15:39:44', 'Ygomez', ''),
(770, 6, 'Rhonda', 'Crichlow', 0, 921, 'BT', 2, 0, '2024-01-01', '19:15:00', 'N/A', 'Eduardo', '2024-01-01 15:35:33', '2024-01-04 15:39:44', 'Ygomez', ''),
(771, 6, 'Sona ', 'Gajjar ', 0, 0, 'FMT', 2, 2, '2024-01-05', '20:00:00', 'Solicitan mesa afuera|3 out of 4 guests are vegetarians|416-414-1178', 'GUest', '2024-01-01 15:41:07', '2024-01-04 15:39:44', 'Ygomez', ''),
(773, 6, 'Felipe', 'Chico', 0, 0, 'BT', 8, 0, '2024-01-01', '20:45:00', 'Top VIP', 'Karen Rocha', '2024-01-01 16:05:56', '2024-01-04 15:39:44', 'Ygomez', ''),
(774, 7, 'Marcus', ' Greg', 0, 514, 'RWD', 4, 0, '2024-01-01', '19:30:00', 'Salen el 3 enero Alergia a las Nueces', 'Frank', '2024-01-01 16:15:05', '2024-01-04 15:39:44', 'Ygomez', ''),
(775, 4, ' Patrick ', 'Boldischar ', 0, 2611, 'Andaz', 2, 2, '2024-01-01', '18:30:00', 'Out. 03/01', 'Denisse', '2024-01-01 16:17:40', '2024-01-04 15:39:44', 'Ygomez', ''),
(776, 4, 'Tamas', 'Foldi', 0, 209, 'BT', 2, 2, '2024-01-01', '19:30:00', 'N/A', 'Guest', '2024-01-01 16:25:40', '2024-01-04 15:39:44', 'Ygomez', '');
INSERT INTO `reservas_restaurante` (`id_reserva_R`, `nombre_restaurante`, `huesped`, `apellidos`, `mesa`, `villa`, `propiedad`, `numero_personas`, `kids`, `fecha_reserva`, `horario_reserva`, `comentarios`, `solicitante`, `fecha_creacion`, `fecha_edicion`, `usuario`, `usuario_edita`) VALUES
(777, 1, 'Tamas', 'Foldi', 0, 209, 'BT', 2, 2, '2024-01-02', '19:15:00', 'N/A', 'Guest', '2024-01-01 16:26:22', '2024-01-04 15:39:44', 'Ygomez', ''),
(778, 6, 'Michael ', 'Boothby ', 0, 202, 'FHP', 6, 0, '2024-01-01', '21:00:00', 'N/A', 'Daniel Gonzalez', '2024-01-01 16:52:30', '2024-01-04 15:39:44', 'Ygomez', ''),
(779, 7, 'Nina', 'Djordjevic ', 0, 935, 'BT', 6, 0, '2024-01-01', '20:00:00', 'N/A', 'Sonia', '2024-01-01 16:53:04', '2024-01-04 15:39:44', 'Ygomez', ''),
(780, 7, 'Andrea', 'Lietz', 0, 508, 'BT', 4, 0, '2024-01-01', '20:00:00', 'Mr. Lietz is allergic to nuts and Ms. Lara Lietz is vegetarian.', 'Guest', '2024-01-01 17:13:30', '2024-01-04 15:39:44', 'Ygomez', ''),
(781, 1, 'James ', 'Stahle ', 0, 803, 'RWD', 3, 0, '2024-01-02', '20:30:00', 'Check out 4 en Sin alergias o Celebraciones', 'Carlos', '2024-01-01 17:04:33', '2024-01-04 15:39:44', 'Ygomez', ''),
(782, 6, 'Francis ', 'Facchini ', 0, 244, 'FMT', 4, 0, '2024-01-01', '21:00:00', '+1 (312) 498-4564', 'Irene Vázquez', '2024-01-01 17:11:32', '2024-01-04 15:39:44', 'Ygomez', ''),
(784, 7, ' Melanie ', 'Whelan', 0, 707, 'BT', 8, 0, '2024-01-01', '18:30:00', 'Sr alergia a carne y lacteos', 'GUest', '2024-01-01 17:33:18', '2024-01-04 15:39:44', 'Ygomez', ''),
(785, 4, 'Viacheslav', 'Petryshche', 0, 911, 'BT', 3, 0, '2024-01-01', '19:00:00', 'N/A', 'GUest', '2024-01-01 17:51:26', '2024-01-04 15:39:44', 'Ygomez', ''),
(789, 6, 'Rajiv ', 'Dua', 0, 523, 'BT', 2, 0, '2024-01-01', '17:30:00', 'N/A ', 'Seidee', '2024-01-01 19:09:19', '2024-01-04 15:39:44', 'Ygomez', ''),
(790, 2, 'Michael', 'Sales', 0, 210, 'BT', 12, 0, '2024-01-01', '18:30:00', 'N/A', 'Paola', '2024-01-01 19:12:24', '2024-01-04 15:39:44', 'Ygomez', ''),
(791, 4, 'Tulio', 'Silva ', 0, 2412, 'Andaz', 4, 0, '2024-01-01', '17:30:00', 'Out. 02/01/2024', 'Xochil Contreras', '2024-01-01 19:21:14', '2024-01-04 15:39:44', 'Ygomez', ''),
(792, 1, 'Alejandro', 'Bataller', 0, 406, 'BT', 4, 2, '2024-01-01', '19:45:00', 'N/A', 'Ivan', '2024-01-01 19:39:39', '2024-01-04 15:39:44', 'Ygomez', ''),
(794, 4, 'Stefan', 'Kutko', 0, 205, 'BT', 2, 2, '2024-01-01', '18:00:00', 'Niños Dorian Age 6 year old Shields Age 3 year old', 'Alin', '2024-01-01 19:28:42', '2024-01-04 15:39:44', 'Ygomez', ''),
(795, 4, 'Jorge', 'Martínez', 0, 3621, 'Andaz', 5, 0, '2024-01-01', '20:45:00', 'CO 03/01 No alergias ni celeb', 'Paco', '2024-01-01 19:34:58', '2024-01-04 15:39:44', 'Ygomez', ''),
(796, 6, 'Everardo', 'Hegewisch', 0, 927, 'BT', 2, 0, '2024-01-01', '20:30:00', 'mesa accesible tiene silla de ruedas', 'Emmanuel', '2024-01-01 19:38:36', '2024-01-04 15:39:44', 'Ygomez', ''),
(797, 6, 'Imran', 'Syed', 0, 103, 'BT', 2, 0, '2024-01-03', '19:30:00', 'No pork', 'Rafael | 0101', '2024-01-03 20:24:46', '2024-01-04 15:39:44', 'Rmerlo', ''),
(798, 6, 'Chanda ', 'Rajib', 0, 511, 'RWD', 4, 0, '2024-01-01', '18:00:00', 'Salida el 3 enero  Sin alergias ni celebraciones ', 'Frank', '2024-01-01 19:49:43', '2024-01-04 15:39:44', 'Ygomez', ''),
(799, 6, 'Timothy ', 'Lindgren ', 0, 830, 'FMT', 4, 0, '2024-01-01', '21:30:00', 'Alergias o Restricciones: Scallops and mussels', 'Raquel de la Rosa', '2024-01-01 19:50:49', '2024-01-04 15:39:44', 'Ygomez', ''),
(800, 6, 'Imran', 'Syed', 0, 0, 'BT', 2, 0, '2024-01-06', '19:45:00', 'No pork', 'Rafael | 0101', '2024-01-01 19:51:01', '2024-01-04 15:39:44', 'Rmerlo', ''),
(801, 1, 'Ihmran', 'Syed', 0, 0, 'BT', 2, 0, '2024-01-04', '20:00:00', 'No pork ', 'Rafael | 0101', '2024-01-01 19:52:07', '2024-01-04 15:39:44', 'Rmerlo', ''),
(802, 7, 'Alen', 'Liu', 0, 0, 'FMT', 7, 0, '2024-01-01', '18:00:00', 'No alergias|', 'Alin', '2024-01-01 19:53:07', '2024-01-04 15:39:44', 'Ygomez', ''),
(803, 1, 'John', 'Holth ', 0, 923, 'BT', 2, 3, '2024-01-01', '18:00:00', 'N/A', 'Sonia', '2024-01-01 19:54:25', '2024-01-04 15:39:44', 'Ygomez', ''),
(804, 4, 'Raul', 'Costa ', 0, 414, 'BT', 2, 1, '2024-01-01', '19:00:00', 'N/A', 'Eduardo', '2024-01-01 20:02:26', '2024-01-04 15:39:44', 'Ygomez', ''),
(805, 6, 'Alen', 'Liu', 0, 0, 'FMT', 7, 0, '2024-01-02', '17:30:00', 'alergia a nueces 1 pax', 'Guest', '2024-01-01 20:07:17', '2024-01-04 15:39:44', 'Ygomez', ''),
(806, 6, 'Paul ', 'Weinreb', 0, 0, 'BT', 2, 0, '2024-01-09', '18:30:00', 'NA', 'Carmen 01.01', '2024-01-01 20:14:06', '2024-01-04 15:39:44', 'Cnava', ''),
(807, 1, 'Dave ', 'Paul ', 0, 814, 'RWD', 9, 2, '2024-01-01', '18:00:00', 'Pre orden de entradas: 2 Instálate Cello 1 Carpaccio  2 Fritto Misto', 'Carlos Avalos', '2024-01-01 21:44:11', '2024-01-04 15:39:44', 'Ygomez', ''),
(808, 6, 'Liza', 'Joseph', 0, 813, 'BT', 4, 0, '2024-01-02', '19:00:00', 'Mesa en la isla| OK Abel Morales', 'Eduardo', '2024-01-02 19:38:18', '2024-01-04 15:39:44', 'Ygomez', ''),
(809, 4, ' Stéphanie', 'Amrhein', 0, 410, 'BT', 4, 0, '2024-01-01', '20:00:00', 'N/A', 'GUest', '2024-01-01 20:46:12', '2024-01-04 15:39:44', 'Ygomez', ''),
(810, 6, 'Nocolas ', 'gonzalez', 0, 217, 'FMT', 2, 1, '2024-01-01', '20:30:00', 'Sin alergias ni restricciones', 'Fernanda S', '2024-01-01 20:50:52', '2024-01-04 15:39:44', 'Ygomez', ''),
(811, 6, 'Anastasia', 'Kounytsina ', 0, 2232, 'Andaz', 4, 0, '2024-01-01', '21:00:00', 'CO el 7 de enero', 'Tere', '2024-01-01 20:57:30', '2024-01-04 15:39:44', 'Ygomez', ''),
(813, 1, 'Gretchen', 'Setrum', 0, 906, 'BT', 4, 0, '2024-01-01', '20:30:00', '906-908', 'Eduardo', '2024-01-01 20:59:45', '2024-01-04 15:39:44', 'Ygomez', ''),
(814, 4, 'Silvya ', 'Aguilera', 0, 520, 'BT', 2, 0, '2024-01-01', '21:30:00', 'N/A', 'GUest', '2024-01-01 21:03:01', '2024-01-04 15:39:44', 'Ygomez', ''),
(816, 6, 'Rachael', 'Bushey', 0, 621, 'BT', 4, 4, '2024-01-01', '19:30:00', 'N/A', 'Karen Rocha', '2024-01-01 21:20:41', '2024-01-04 15:39:44', 'Ygomez', ''),
(817, 1, 'Gegory  ', 'Nataf', 0, 2213, 'Andaz', 5, 0, '2024-01-01', '21:00:00', 'Out. 05/01/2024', 'Tere', '2024-01-01 21:22:37', '2024-01-04 15:39:44', 'Ygomez', ''),
(818, 2, 'Ripan', 'Chaudhary', 0, 913, 'BT', 2, 2, '2024-01-01', '20:00:00', 'N/A', 'Emmanuel', '2024-01-01 21:23:31', '2024-01-04 15:39:44', 'Ygomez', ''),
(819, 6, 'Erzan', ' Ahmet', 0, 0, 'Edition', 4, 0, '2024-01-01', '21:30:00', 'N/A', 'Vanessa', '2024-01-01 21:27:38', '2024-01-04 15:39:44', 'Ygomez', ''),
(820, 7, 'Amy ', 'Busch', 0, 704, 'BT', 2, 0, '2024-01-02', '19:30:00', 'N/A', 'Regina', '2024-01-01 21:47:13', '2024-01-04 15:39:44', 'Ygomez', ''),
(821, 7, 'Amy ', 'Busch', 0, 704, 'BT', 2, 0, '2024-01-03', '19:30:00', 'N/A', 'Regina', '2024-01-01 21:47:43', '2024-01-04 15:39:44', 'Ygomez', ''),
(822, 6, 'Juan', 'Benavides', 0, 629, 'BT', 8, 0, '2024-01-01', '21:15:00', 'sin descuento', 'Guest', '2024-01-01 21:54:10', '2024-01-04 15:39:44', 'Ygomez', ''),
(823, 6, 'Alejandro', 'Bataller', 0, 406, 'BT', 6, 5, '2024-01-02', '20:00:00', 'una silla alta| no alergias|  niños y un bebé', 'GUest', '2024-01-01 22:06:51', '2024-01-04 15:39:44', 'Ygomez', ''),
(825, 5, 'Max', 'Lakhter', 0, 0, 'BT', 2, 0, '2024-01-12', '19:00:00', 'NA', 'Carmen 01.01', '2024-01-01 22:22:49', '2024-01-04 15:39:44', 'Cnava', ''),
(826, 6, 'Steven ', 'Holden', 0, 503, 'BT', 2, 0, '2024-01-02', '20:15:00', 'NA', 'Carmen 01.01', '2024-01-02 22:11:39', '2024-01-04 15:39:44', 'Cnava', ''),
(829, 1, 'Steven', 'Holden', 0, 0, 'BT', 2, 0, '2024-01-06', '20:00:00', 'NA', 'Carmen 01.01', '2024-01-01 23:03:34', '2024-01-04 15:39:44', 'Cnava', ''),
(830, 2, 'Margarett', 'Thomas', 0, 0, 'BT', 4, 0, '2024-01-09', '19:30:00', 'NA', 'Carmen 01.01', '2024-01-01 23:27:27', '2024-01-04 15:39:44', 'Cnava', ''),
(831, 6, 'Peter', 'Ritten', 0, 0, 'BT', 3, 0, '2024-03-08', '19:30:00', 'N/A', 'Rafael | 0101', '2024-01-01 23:39:31', '2024-01-04 15:39:44', 'Rmerlo', ''),
(832, 6, 'Tia', 'Albright', 0, 0, 'BT', 2, 0, '2024-01-08', '20:00:00', '12 Wedding Anniversary', 'Rafael | 0101', '2024-01-02 00:02:25', '2024-01-04 15:39:44', 'Rmerlo', ''),
(833, 5, 'Eli', 'Fineston', 0, 0, 'BT', 4, 0, '2024-01-21', '18:30:00', 'NA', 'Ricardo 01-01', '2024-01-02 01:05:32', '2024-01-04 15:39:44', 'Rmartinez', ''),
(836, 5, 'Eli', 'Fineston', 0, 0, 'BT', 4, 0, '2024-01-22', '18:30:00', 'NA', 'Ricardo 01-01', '2024-01-02 01:07:20', '2024-01-04 15:39:44', 'Rmartinez', ''),
(837, 6, 'David', 'Glickstein', 0, 0, 'BT', 2, 0, '2024-02-13', '18:30:00', 'NA', 'Carmen 01.01', '2024-01-02 01:34:10', '2024-01-04 15:39:44', 'Cnava', ''),
(838, 4, 'David', 'Glickstein', 0, 0, 'BT', 2, 2, '2024-02-15', '19:00:00', 'NA', 'Carmen 01.01', '2024-01-02 01:35:08', '2024-01-04 15:39:44', 'Cnava', ''),
(840, 6, 'francisco ', 'Martin', 0, 629, 'BT', 6, 0, '2024-01-02', '20:45:00', 'Solicitan mesa en el deck', 'Ricardo 01.01', '2024-01-02 22:12:09', '2024-01-04 15:39:44', 'Rmartinez', ''),
(841, 5, 'Anaelle', 'Bohbot', 0, 0, 'BT', 2, 1, '2024-01-05', '19:00:00', 'NA', 'Samara | 02/01', '2024-01-02 12:53:50', '2024-01-04 15:39:44', 'Svite', ''),
(842, 5, 'Ron', 'Zeligzon', 0, 0, 'BT', 4, 1, '2024-01-06', '13:00:00', 'Lunch kosher', 'Samara | 02/01', '2024-01-02 12:55:47', '2024-01-04 15:39:44', 'Svite', ''),
(843, 7, 'Andrea', 'Lietz', 0, 507, 'BT', 4, 0, '2024-01-02', '20:00:00', 'uno de ellos es vegetariano ', 'Alin', '2024-01-02 14:21:59', '2024-01-04 15:39:44', 'Ygomez', ''),
(844, 7, 'Marina', 'Klyuyeva', 0, 309, 'BT', 13, 0, '2024-01-02', '19:30:00', 'N/A', 'Gabriela', '2024-01-02 14:24:02', '2024-01-04 15:39:44', 'Ygomez', ''),
(845, 7, 'Chloe ', 'Domont ', 0, 419, 'BT', 2, 0, '2024-01-03', '19:00:00', 'Alergias: Garlic, Apple, Soy, And Dairy free', 'Ivan', '2024-01-02 14:25:17', '2024-01-04 15:39:44', 'Ygomez', ''),
(846, 7, 'Brian', 'Fullmer', 0, 0, 'BT', 2, 0, '2024-01-14', '18:00:00', 'Backup dinner', 'Samara | 02/01', '2024-01-02 14:43:50', '2024-01-04 15:39:44', 'Svite', ''),
(847, 4, 'Brian', 'Fullmer', 0, 0, 'BT', 2, 0, '2024-01-15', '20:00:00', 'NA', 'Samara | 02/01', '2024-01-02 14:44:28', '2024-01-04 15:39:44', 'Svite', ''),
(848, 7, 'Brian', 'fullmer', 0, 0, 'BT', 2, 0, '2024-01-16', '18:00:00', 'NA', 'Samara | 02/01', '2024-01-02 14:45:06', '2024-01-04 15:39:44', 'Svite', ''),
(849, 1, 'Brian', 'Fullmer', 0, 0, 'BT', 2, 0, '2024-01-17', '19:00:00', 'NA', 'Samara | 02/01', '2024-01-02 14:45:46', '2024-01-04 15:39:44', 'Svite', ''),
(850, 4, 'Brian', 'Fullmer', 0, 0, 'BT', 2, 0, '2024-01-18', '19:00:00', 'NA', 'Samara | 02/01', '2024-01-02 14:46:18', '2024-01-04 15:39:44', 'Svite', ''),
(851, 6, 'Brian', 'Fullmer', 0, 0, 'BT', 2, 0, '2024-01-19', '19:00:00', 'NA', 'Samara | 02/01', '2024-01-02 14:46:55', '2024-01-04 15:39:44', 'Svite', ''),
(852, 1, 'Brian', 'Fullmer', 0, 0, 'BT', 2, 0, '2024-01-20', '19:00:00', 'NA', 'Samara | 02/01', '2024-01-02 14:47:29', '2024-01-04 15:39:44', 'Svite', ''),
(853, 7, 'Brian', 'Fullmer', 0, 0, 'BT', 2, 0, '2024-01-21', '19:00:00', 'NA', 'Samara | 02/01', '2024-01-02 14:47:53', '2024-01-04 15:39:44', 'Svite', ''),
(854, 7, 'Gannon', 'Mccaffery', 0, 517, 'BT', 2, 2, '2024-01-02', '18:30:00', 'N/A', 'Guest', '2024-01-02 14:57:13', '2024-01-04 15:39:44', 'Ygomez', ''),
(855, 6, 'Natalie ', 'Perkin ', 0, 825, 'FMT', 2, 0, '2024-01-02', '20:30:00', 'Celebran cumpleaños de Natalia e igual su honeymoon   Salen el 5 de enero ', 'Monica', '2024-01-02 15:02:09', '2024-01-04 15:39:44', 'Ygomez', ''),
(856, 6, 'Matthew ', 'Vlasic', 0, 528, 'RWD', 7, 4, '2024-01-02', '17:00:00', 'No quieren set menú  2 mesas separadas ', 'Alma', '2024-01-02 15:04:19', '2024-01-04 15:39:44', 'Ygomez', ''),
(857, 6, 'Carlos', 'Rosado Gonzalez  ', 0, 1011, 'Andaz', 2, 0, '2024-01-02', '21:00:00', ' out. 3 de enero', 'Xochil Contreras', '2024-01-02 15:06:30', '2024-01-04 15:39:44', 'Ygomez', ''),
(858, 5, 'Greg', 'Nataf, ', 0, 2214, 'Andaz', 5, 0, '2024-01-02', '20:00:00', 'out 05/01/2023 gregnataf@hotmail.com', 'Xochil Contreras', '2024-01-02 15:07:36', '2024-01-04 15:39:44', 'Ygomez', ''),
(859, 6, 'Carlo', 'Dollero ', 0, 2212, 'Andaz', 3, 0, '2024-01-02', '21:15:00', 'out. 5 de enero', 'Xochil Contreras', '2024-01-02 15:09:37', '2024-01-04 15:39:44', 'Ygomez', ''),
(861, 6, 'Julie', 'Greenholtz', 0, 0, 'FMT', 8, 0, '2024-01-02', '21:30:00', ' +1 917 880 7302', 'Fernanda González', '2024-01-02 15:13:56', '2024-01-04 15:39:44', 'Ygomez', ''),
(862, 6, 'Tianyuan', 'Zheng', 0, 0, 'BT', 2, 0, '2024-01-05', '19:15:00', 'N/A', 'Rafael | 0201', '2024-01-02 15:15:30', '2024-01-04 15:39:44', 'Rmerlo', ''),
(863, 6, 'Rajiv ', 'Dua', 0, 523, 'BT', 2, 0, '2024-01-02', '17:00:00', 'N/a', 'Seidee', '2024-01-02 15:18:47', '2024-01-04 15:39:44', 'Ygomez', ''),
(864, 6, 'David ', 'Richmond', 0, 0, 'Andaz', 2, 2, '2024-01-04', '17:00:00', ' Check out: 08 ene', 'Monica', '2024-01-02 15:20:11', '2024-01-04 15:39:44', 'Ygomez', ''),
(865, 4, 'Nicolas ', 'Gonzales', 0, 217, 'FMT', 3, 0, '2024-01-02', '20:45:00', '9931174957', 'Wendy Martínez', '2024-01-02 15:21:50', '2024-01-04 15:39:44', 'Ygomez', ''),
(866, 6, 'Catherine ', 'Tornabene', 0, 0, 'RWD', 4, 0, '2024-01-04', '17:30:00', 'check out:?? 6 enero', '?Giovanna', '2024-01-02 15:24:28', '2024-01-04 15:39:44', 'Ygomez', ''),
(867, 6, 'Jane ', 'Freud', 0, 0, 'FMT', 8, 0, '2024-01-04', '20:45:00', '847-525-1385', 'Guest', '2024-01-02 15:25:39', '2024-01-04 15:39:44', 'Ygomez', ''),
(868, 1, 'Marco', 'Tucci', 0, 522, 'BT', 4, 0, '2024-01-02', '20:15:00', 'N/A', 'Guest', '2024-01-02 15:38:16', '2024-01-04 15:39:44', 'Ygomez', ''),
(869, 4, 'Jane ', 'Gonnerman', 0, 0, 'BT', 6, 0, '2024-01-17', '19:00:00', 'one vegetarian and one pescatarian', 'Rafael | 0201', '2024-01-02 16:10:43', '2024-01-04 15:39:44', 'Rmerlo', ''),
(870, 6, 'Jane ', 'Gonnerman', 0, 0, 'BT', 6, 0, '2024-01-18', '19:00:00', 'one vegetarian and one pescatarian', 'Rafael | 0201', '2024-01-02 16:10:55', '2024-01-04 15:39:44', 'Rmerlo', ''),
(871, 7, 'Jane', 'Gonnerman', 0, 0, 'BT', 6, 0, '0204-01-20', '19:00:00', 'one vegetarian and one pescatarian', 'Rafael | 0201', '2024-01-02 16:11:11', '2024-01-04 15:39:44', 'Rmerlo', ''),
(872, 2, 'Jill', 'Fishman', 0, 0, 'BT', 2, 1, '2024-01-02', '19:30:00', 'NA', 'Samara | 02/01', '2024-01-02 15:54:11', '2024-01-04 15:39:44', 'Svite', ''),
(873, 6, 'Suzannah', ' Allard', 0, 317, 'RWD', 5, 0, '2024-01-02', '20:30:00', 'el día viernes y no se les sentó debido a que el restaurante estaba saturado y por la lluvia.', 'Alberto Leon', '2024-01-02 15:56:29', '2024-01-04 15:39:44', 'Ygomez', ''),
(874, 7, 'Cornell ', 'Wright', 0, 619, 'BT', 13, 0, '2024-01-02', '19:00:00', 'menciona que tienen muchas alergias y no quiere hacer preorden |Alergias o notas: Peanuts- Lácteos & 2 vegetarianos', 'Fabiola', '2024-01-02 16:22:15', '2024-01-04 15:39:44', 'Ygomez', ''),
(875, 1, 'Leslie', 'Marshall', 0, 553, 'FMT', 2, 0, '2024-01-02', '21:00:00', '+44 749 631 7344', 'Fernanda González ', '2024-01-02 16:18:50', '2024-01-04 15:39:44', 'Ygomez', ''),
(876, 7, 'Michelle ', 'Boyers', 0, 917, 'BT', 13, 0, '2024-01-02', '19:30:00', 'Una persona alergia a shellfish, camaron, langosta severa', 'Karen Rocha', '2024-01-02 21:53:46', '2024-01-04 15:39:44', 'Ygomez', ''),
(877, 6, 'Gabriel', 'Ortiz,', 0, 924, 'BT', 2, 0, '2024-01-02', '21:30:00', 'N/A', 'Marcos', '2024-01-02 16:28:19', '2024-01-04 15:39:44', 'Ygomez', ''),
(878, 1, 'Melanie', 'Whelan', 0, 707, 'BT', 8, 0, '2024-01-02', '19:00:00', '30% off Wellbeing cuisines and beverages ', 'Ivan', '2024-01-02 16:29:35', '2024-01-04 15:39:44', 'Ygomez', ''),
(879, 1, 'Jorge ', 'Martínez', 0, 3621, 'Andaz', 5, 0, '2024-01-02', '17:00:00', 'N/A', 'Guest', '2024-01-02 16:38:43', '2024-01-04 15:39:44', 'Ygomez', ''),
(880, 6, 'Kohli', 'Rohit ', 0, 0, 'FMT', 2, 0, '2024-01-05', '20:45:00', '+1-617-610-5372', 'Guest', '2024-01-02 16:52:42', '2024-01-04 15:39:44', 'Ygomez', ''),
(881, 1, 'Heena ', 'Birbal Jain', 0, 2331, 'Andaz', 2, 2, '2024-01-05', '18:30:00', 'no res, no puerco', 'Guest', '2024-01-02 17:01:40', '2024-01-04 15:39:44', 'Ygomez', ''),
(882, 6, 'Heena', 'Birbal', 0, 2331, 'Andaz', 2, 2, '2024-01-04', '18:15:00', 'no res, no puerco', 'guest', '2024-01-02 17:02:48', '2024-01-04 15:39:44', 'Ygomez', ''),
(884, 7, 'Harold ', 'Hope Iii', 0, 624, 'BT', 5, 0, '2024-01-03', '18:30:00', 'solo son los menores como de 15, 14 y 12 años, los papás van a cenar en rosewood', 'Gabriela', '2024-01-02 17:15:19', '2024-01-04 15:39:44', 'Ygomez', ''),
(885, 1, 'Sean Joseph', 'Mc Gill ', 0, 628, 'BT', 6, 0, '2024-01-02', '20:30:00', 'N/A', 'Alin', '2024-01-02 17:54:30', '2024-01-04 15:39:44', 'Ygomez', ''),
(886, 7, 'Hasan', 'Afkari', 0, 807, 'BT', 6, 0, '2024-01-02', '18:00:00', 'N/A', 'Emmanuel', '2024-01-02 17:17:40', '2024-01-04 15:39:44', 'Ygomez', ''),
(887, 6, 'Mauricio', 'Saenz, ', 0, 302, 'BT', 5, 0, '2024-01-04', '20:00:00', 'cumpleaños del Sr | Solicita mesa en terraza', 'GUest', '2024-01-03 18:24:59', '2024-01-04 15:39:44', 'Ygomez', ''),
(888, 6, 'Lily', 'Lee', 0, 0, 'TBD', 2, 0, '2024-01-04', '18:45:00', '(904) 338-4006', 'Guest', '2024-01-02 17:31:18', '2024-01-04 15:39:44', 'Ygomez', ''),
(889, 6, 'Daniel ', 'Bergin', 0, 0, 'Andaz', 5, 0, '2024-01-03', '20:30:00', 'Check out: 07 enero', 'MONICA GARCIA', '2024-01-02 17:32:55', '2024-01-04 15:39:44', 'Ygomez', ''),
(890, 6, 'Samuel', ' Beloff', 0, 0, 'Andaz', 2, 0, '2024-01-05', '20:45:00', 'Check out: 07 enero', 'MONICA GARCIA', '2024-01-02 17:46:33', '2024-01-04 15:39:44', 'Ygomez', ''),
(891, 6, 'Jeff ', 'Wojnicz', 0, 0, 'FMT', 5, 0, '2024-01-03', '18:00:00', 'We have one shellfish allergy Phone: 612-387-2100', 'Guest', '2024-01-02 17:44:22', '2024-01-04 15:39:44', 'Ygomez', ''),
(892, 5, 'Noam', 'Green ', 0, 0, 'Andaz', 2, 0, '2024-01-12', '18:15:00', 'Noam and Rebecca Green |cancelación mismo día o no show full charge| kosher. No dairy. |14th anniversary|2157762330 ', 'Guest', '2024-01-02 17:51:43', '2024-01-04 15:39:44', 'Ygomez', ''),
(893, 6, 'Sean Joseph', 'Mc Gill', 0, 628, 'BT', 6, 0, '2024-01-03', '20:00:00', 'N/A', 'GUest', '2024-01-02 17:53:18', '2024-01-04 15:39:44', 'Ygomez', ''),
(894, 2, 'Sean Joseph', 'Mc Gill,', 0, 628, 'BT', 6, 0, '2024-01-04', '20:00:00', 'N/A', 'GUest', '2024-01-02 17:54:03', '2024-01-04 15:39:44', 'Ygomez', ''),
(895, 6, ' Sean Joseph', 'Mc Gill', 0, 628, 'BT', 6, 0, '2024-01-05', '20:00:00', 'N/A', 'GUest', '2024-01-02 17:55:05', '2024-01-04 15:39:44', 'Ygomez', ''),
(896, 6, 'Miguel', 'Gonzalez', 0, 0, 'Ext', 5, 0, '2024-01-03', '17:45:00', 'no alergias| celebran cumpleaños| 3331915799', 'GUest', '2024-01-02 18:07:20', '2024-01-04 15:39:44', 'Ygomez', ''),
(897, 4, 'Carla', 'Zakhem Hassan, ', 0, 415, 'BT', 2, 0, '0202-01-02', '20:15:00', 'N/A', 'Jose', '2024-01-02 18:08:56', '2024-01-04 15:39:44', 'Ygomez', ''),
(899, 6, 'Tsai', 'Wan yu', 0, 0, 'BT', 2, 0, '2024-01-04', '20:30:00', 'NA', 'Carmen 02.01', '2024-01-02 18:13:26', '2024-01-04 15:39:44', 'Cnava', ''),
(900, 7, 'Patrick ', 'Boldischar', 0, 2611, 'Andaz', 2, 2, '2024-01-02', '17:00:00', 'CO 3/enero|Sin alergias', 'Denisse', '2024-01-02 18:17:34', '2024-01-04 15:39:44', 'Ygomez', ''),
(902, 6, 'Rachel', 'Kwok', 0, 0, 'BT', 2, 0, '2024-01-08', '18:00:00', 'NA', 'Carmen 02.01', '2024-01-02 18:26:44', '2024-01-04 15:39:44', 'Cnava', ''),
(903, 7, ' Steven', 'Friend', 0, 929, 'BT', 3, 0, '2024-01-02', '18:45:00', 'N/A', 'Emmanuel', '2024-01-02 18:35:27', '2024-01-04 15:39:44', 'Ygomez', ''),
(904, 6, 'Adolfo ', 'Rodríguez', 0, 1622, 'Andaz', 2, 2, '2024-01-02', '21:45:00', 'Solicita mesa al pie de la laguna| sra alergia a camaron|2 niños (5 y 6 años)', 'Guest', '2024-01-02 19:02:05', '2024-01-04 15:39:44', 'Ygomez', ''),
(905, 6, 'Jason ', 'Duckworth ', 0, 0, 'RWD', 4, 0, '2024-01-05', '18:45:00', 'check out:  6 de enero', 'Ashly Gómez ', '2024-01-02 18:49:37', '2024-01-04 15:39:44', 'Ygomez', ''),
(907, 7, 'Nicole', 'Lambert', 0, 805, 'BT', 2, 1, '2024-01-02', '19:15:00', 'N/A', 'Eduardo', '2024-01-02 19:01:05', '2024-01-04 15:39:44', 'Ygomez', ''),
(908, 1, 'Katherine', 'Schatzow,', 0, 906, 'BT', 3, 3, '2024-01-02', '18:30:00', 'niños de 1 año, 3 y 6 años|Alergia a pecan nuts and walnuts de Poppy', 'Eduardo', '2024-01-02 19:05:29', '2024-01-04 15:39:44', 'Ygomez', ''),
(909, 6, 'Katherine', 'Schatzow,', 0, 906, 'BT', 3, 3, '2024-01-03', '18:00:00', 'niños de 1 año, 3 y 6 años|Alergia a pecan nuts and walnuts de Poppy', 'Eduardo', '2024-01-02 19:06:06', '2024-01-04 15:39:44', 'Ygomez', ''),
(910, 4, 'Katherine', 'Schatzow,', 0, 906, 'BT', 3, 3, '2024-01-04', '18:00:00', 'niños de 1 año, 3 y 6 años|Alergia a pecan nuts and walnuts de Poppy', 'Eduardo', '2024-01-02 19:06:39', '2024-01-04 15:39:44', 'Ygomez', ''),
(911, 7, 'Katherine', 'Schatzow,', 0, 906, 'BT', 3, 3, '2024-01-05', '18:00:00', 'niños de 1 año, 3 y 6 años|Alergia a pecan nuts and walnuts de Poppy', 'Eduardo', '2024-01-02 19:07:00', '2024-01-04 15:39:44', 'Ygomez', ''),
(912, 4, 'Rhonda', 'Crichlow', 0, 921, 'BT', 2, 0, '2024-01-02', '18:30:00', 'N/A', 'Marcos', '2024-01-02 19:13:29', '2024-01-04 15:39:44', 'Ygomez', ''),
(913, 6, 'Martha', 'Valtierra', 0, 0, 'Velas', 2, 0, '2024-01-03', '20:30:00', '1 pax vegana| 5543902771', 'Guest', '2024-01-02 19:21:04', '2024-01-04 15:39:44', 'Ygomez', ''),
(914, 7, 'Martha', 'Valtierra', 0, 0, 'Velas', 2, 0, '2024-01-02', '20:30:00', '1 persona vegana | mesa con bonita vista', 'Guest', '2024-01-02 19:23:03', '2024-01-04 15:39:44', 'Ygomez', ''),
(915, 4, 'Krista', 'Bacchieri', 0, 0, 'BT', 2, 0, '2024-01-09', '19:00:00', 'NA', 'CArme', '2024-01-02 19:36:38', '2024-01-04 15:39:44', 'Cnava', ''),
(920, 7, ' Larry', 'Serota', 0, 708, 'BT', 4, 0, '2024-01-02', '19:30:00', 'Alergias: Tengo alergia al kiwi y al mango y mi marido come sin gluten y sin lácteos (preferencia no alergia)', 'Juan', '2024-01-02 21:03:14', '2024-01-04 15:39:44', 'Ygomez', ''),
(922, 1, 'David', 'Mizrachi', 0, 0, 'BT', 2, 0, '2024-01-11', '19:00:00', 'COME CLOSER PACKEGE', 'Carmen ', '2024-01-02 20:36:59', '2024-01-04 15:39:44', 'Cnava', ''),
(923, 5, 'David', 'Mizrachi', 0, 0, 'BT', 2, 0, '2024-01-10', '19:00:00', 'NA', 'Carmen ', '2024-01-02 20:23:23', '2024-01-04 15:39:44', 'Cnava', ''),
(924, 6, 'David', 'Mizrachi', 0, 0, 'BT', 2, 0, '2024-01-09', '19:30:00', 'NA', 'Carmen ', '2024-01-02 20:24:29', '2024-01-04 15:39:44', 'Cnava', ''),
(925, 1, 'JAmes', 'Pug', 0, 0, 'BT', 2, 0, '2024-01-10', '18:00:00', 'NA', 'Carmen 02.01', '2024-01-02 20:39:31', '2024-01-04 15:39:44', 'Cnava', ''),
(926, 1, 'JAmes', 'Pug', 0, 0, 'BT', 2, 0, '2024-01-12', '18:15:00', 'NA', 'Carmen 02.01', '2024-01-02 20:40:09', '2024-01-04 15:39:44', 'Cnava', ''),
(927, 7, 'Javier ', 'Cañedo Gonzalez', 0, 826, 'FMT', 3, 0, '2024-01-02', '17:30:00', 'Sra embarazada no mariscos', 'Gena', '2024-01-02 20:41:18', '2024-01-04 15:39:44', 'Ygomez', ''),
(928, 4, 'Adriana ', 'Martino', 0, 811, 'FMT', 8, 0, '2024-01-02', '21:00:00', '+1 (917) 748-4364', 'Alejandro Lemus', '2024-01-02 20:47:17', '2024-01-04 15:39:44', 'Ygomez', ''),
(929, 1, 'giorgio', 'Dalla Volta ', 0, 931, 'BT', 2, 0, '2024-01-02', '21:00:00', 'el alergia a la naranja  Huésped italiano ojo | Solicita mesa afuera', 'Gena Alvarado', '2024-01-02 21:01:45', '2024-01-04 15:39:44', 'Ygomez', ''),
(930, 7, 'Martin', 'Zeldin', 0, 932, 'BT', 2, 0, '2024-01-02', '18:30:00', 'N/A', 'Gena Alvarado', '2024-01-02 21:00:48', '2024-01-04 15:39:44', 'Ygomez', ''),
(931, 6, ' David ', 'schanbel', 0, 930, 'BT', 2, 0, '2024-01-02', '20:15:00', 'N/A', 'Gena', '2024-01-02 21:01:22', '2024-01-04 15:39:44', 'Ygomez', ''),
(932, 1, 'Midhat ', 'Serbagi ', 0, 4214, 'FMT', 7, 0, '2024-01-03', '17:30:00', '+1 917 225 9867 ', 'Octavio Buenfil ', '2024-01-02 21:13:48', '2024-01-04 15:39:44', 'Ygomez', ''),
(933, 4, 'Thomas ', 'Pradd', 0, 615, 'RWD', 9, 0, '2024-01-03', '18:30:00', 'No celebraciones Emma es gluten free Tienen crédito CO 5 Enero', 'Marimar', '2024-01-02 21:15:10', '2024-01-04 15:39:44', 'Ygomez', ''),
(934, 7, ' Joachim', 'Drees,', 0, 920, 'BT', 2, 0, '2024-01-02', '19:45:00', 'N/A', 'Marcos', '2024-01-02 21:23:08', '2024-01-04 15:39:44', 'Ygomez', ''),
(935, 7, 'Beryl', 'Medina', 0, 510, 'BT', 5, 0, '2024-01-02', '20:15:00', '20% OFF', 'Carmen 02.01', '2024-01-02 21:55:40', '2024-01-04 15:39:44', 'Cnava', ''),
(936, 1, 'Beryl', 'Medina', 0, 509, 'BT', 5, 0, '2024-01-04', '19:00:00', 'Solicita mesa en terraza', 'Carmen 02.01', '2024-01-03 18:43:58', '2024-01-04 17:41:10', 'Cnava', 'Ygomez'),
(937, 6, 'Beryl', 'Medina', 0, 510, 'BT', 5, 0, '2024-01-03', '19:30:00', '20% off in F&B', 'Carmen 02.01', '2024-01-03 20:25:27', '2024-01-04 15:39:44', 'Cnava', ''),
(938, 7, 'Von ', 'Rosenthal', 0, 506, 'BT', 2, 0, '2024-01-02', '20:30:00', 'Sra alergia a pimientos', 'Regina', '2024-01-02 21:32:27', '2024-01-04 15:39:44', 'Ygomez', ''),
(939, 5, 'Anshel', 'Friedman', 0, 411, 'BT', 2, 0, '2024-01-02', '19:30:00', 'N/A', 'Fabiola', '2024-01-02 21:33:13', '2024-01-04 15:39:44', 'Ygomez', ''),
(940, 4, 'Matthew', 'Medland', 0, 108, 'BT', 2, 0, '2024-01-02', '19:45:00', 'no alergias', 'Guest', '2024-01-02 21:39:28', '2024-01-04 15:39:44', 'Ygomez', ''),
(941, 1, 'Raúl', 'Costa ', 0, 414, 'BT', 2, 1, '2024-01-02', '20:15:00', 'N/A', 'Sonia', '2024-01-02 21:44:35', '2024-01-04 15:39:44', 'Ygomez', ''),
(942, 6, 'James', 'Lally, ', 0, 614, 'BT', 4, 0, '2024-01-02', '18:00:00', 'MESA EN CASITA', 'Fabi', '2024-01-02 21:47:08', '2024-01-04 15:39:44', 'Ygomez', ''),
(943, 5, 'Yosef', 'Lanzkron', 0, 0, 'BT', 6, 0, '2024-01-22', '17:30:00', 'NA', 'Carmen 02.01', '2024-01-02 23:13:23', '2024-01-04 15:39:44', 'Cnava', ''),
(944, 6, 'Debra ', 'Meyrowitz ', 0, 0, 'FMT', 8, 0, '2024-01-12', '20:00:00', 'husbands birthday|My husband and one other guest have a shell fish allergy and one has an egg allergy My best contact number is 1-516-353-4696', 'Guest', '2024-01-02 21:51:42', '2024-01-04 15:39:44', 'Ygomez', ''),
(945, 5, 'Yose', 'Lanzkron', 0, 0, 'BT', 6, 0, '2024-01-23', '18:00:00', 'NA', 'Carmen 02.01', '2024-01-02 23:13:43', '2024-01-04 15:39:44', 'Cnava', ''),
(946, 7, 'Giorgio', 'Dalla Volta, ', 0, 931, 'BT', 2, 0, '2024-01-03', '21:00:00', 'Solicita mesa lo más cerca de la arena', 'Guest', '2024-01-02 22:21:21', '2024-01-04 15:39:44', 'Ygomez', ''),
(947, 4, 'Giorgio', 'Dalla Volta, ', 0, 931, 'BT', 2, 0, '2024-01-04', '21:00:00', 'Solicita mesa afuera', 'GUest', '2024-01-02 22:21:50', '2024-01-04 15:39:44', 'Ygomez', ''),
(948, 6, 'Olga', 'Butenko', 0, 501, 'BT', 1, 2, '2024-01-03', '18:15:00', '13/12', 'Guest', '2024-01-02 22:35:46', '2024-01-04 15:39:44', 'Ygomez', ''),
(949, 4, 'Olga', 'Butenko', 0, 501, 'BT', 3, 0, '2024-01-04', '18:15:00', '12/13 años', 'Guest', '2024-01-02 22:36:28', '2024-01-04 15:39:44', 'Ygomez', ''),
(950, 1, ' Olga', 'Butenko', 0, 501, 'BT', 1, 2, '2024-01-05', '18:15:00', '12/13 años', 'GUest', '2024-01-02 22:36:52', '2024-01-04 15:39:44', 'Ygomez', ''),
(951, 6, 'Shlomo', 'Shemesh ', 0, 0, 'BT', 2, 0, '2024-01-10', '20:00:00', 'Kosher guests ', 'Rafael | 0201', '2024-01-02 22:42:52', '2024-01-04 15:39:44', 'Rmerlo', ''),
(952, 6, 'Erik', 'Andersen', 0, 0, 'BT', 2, 0, '2024-02-12', '18:00:00', 'NA', 'Carmen 02.01', '2024-01-02 23:10:08', '2024-01-04 15:39:44', 'Cnava', ''),
(953, 1, 'Erik', 'Andersen', 0, 0, 'BT', 2, 0, '2024-02-15', '19:00:00', 'NA', 'Carmen 02.01', '2024-01-02 23:10:49', '2024-01-04 15:39:44', 'Cnava', ''),
(954, 6, 'Joseph ', 'Goodwin', 0, 208, 'BT', 2, 0, '2024-01-03', '19:15:00', 'NA', 'Carmen 02.01', '2024-01-03 20:26:12', '2024-01-04 15:39:44', 'Cnava', ''),
(955, 1, 'Louis', 'Mariotti', 0, 0, 'BT', 2, 0, '2024-01-24', '20:00:00', 'Na', 'Carmen 02.01', '2024-01-03 00:22:07', '2024-01-04 15:39:44', 'Cnava', ''),
(956, 6, 'Louis', 'Mariotti', 0, 0, 'BT', 2, 0, '2024-12-26', '20:00:00', 'NA', 'Carmen 02.01', '2024-01-03 00:23:00', '2024-01-04 15:39:44', 'Cnava', ''),
(957, 1, 'Louis', 'Mariotti', 0, 0, 'BT', 2, 0, '2024-01-27', '20:00:00', 'NA', 'Carmen 02.01', '2024-01-03 00:23:29', '2024-01-04 15:39:44', 'Cnava', ''),
(958, 6, 'Marc', 'Herbst', 0, 0, 'BT', 2, 0, '2024-01-16', '20:00:00', 'NA', 'Andrea G 02-01', '2024-01-03 01:33:18', '2024-01-04 15:39:44', 'Svite', ''),
(959, 1, 'Marc', 'Herbst', 0, 0, 'BT', 2, 0, '2024-01-19', '19:30:00', 'NA', 'Andrea G 02-01', '2024-01-03 01:34:36', '2024-01-04 15:39:44', 'Svite', ''),
(960, 1, 'Kevin', 'Willens', 0, 0, 'BT', 6, 0, '2024-01-04', '20:00:00', 'NA', 'Andrea G 02-01', '2024-01-03 03:50:53', '2024-01-04 15:39:44', 'Svite', ''),
(961, 1, 'Cindy ', 'Ludwig', 0, 0, 'Andaz', 3, 0, '2024-01-06', '20:30:00', 'Check out: 08 enero', 'MONICA GARCIA', '2024-01-03 12:02:21', '2024-01-04 15:39:44', 'Ygomez', ''),
(962, 6, 'Cameron', ' Howell ', 0, 0, 'BT', 2, 0, '2024-01-08', '19:45:00', 'Anniversary|Husband is vegan |901.409.6793', 'Guest', '2024-01-03 12:05:55', '2024-01-04 15:39:44', 'Ygomez', ''),
(963, 1, 'Cameron', 'Howell', 0, 0, 'BT', 2, 0, '2024-01-10', '19:30:00', 'Husband is vegan |901.409.6793', 'guest', '2024-01-03 12:07:26', '2024-01-04 15:39:44', 'Ygomez', ''),
(964, 4, 'Michael ', 'Goldfarb', 0, 0, 'RWD', 2, 1, '2024-01-04', '18:30:00', 'check out: 06 enero   ', 'Anaju ', '2024-01-03 12:09:29', '2024-01-04 15:39:44', 'Ygomez', ''),
(965, 7, ' Érica ', 'Roberts', 0, 0, 'FMT', 4, 0, '2024-01-09', '20:00:00', '744 176 5599', 'Daniel González ', '2024-01-03 12:10:38', '2024-01-04 15:39:44', 'Ygomez', ''),
(966, 6, 'Claire ', 'Ching', 0, 0, 'Andaz', 6, 0, '2024-01-05', '20:30:00', 'Check out: 08 ene', 'MONICA GARCIA', '2024-01-03 12:14:18', '2024-01-04 15:39:44', 'Ygomez', ''),
(967, 6, 'Andrea ', 'Thoreson  ', 0, 0, 'RWD', 5, 0, '2024-01-06', '18:30:00', 'check out:? Jan 11', 'Giovanna ', '2024-01-03 12:16:20', '2024-01-04 15:39:44', 'Ygomez', ''),
(968, 6, 'Jay ', 'Biderman', 0, 0, 'EXT', 2, 0, '2024-01-03', '19:00:00', 'N/A', 'GUest', '2024-01-03 12:30:00', '2024-01-04 15:39:44', 'Ygomez', ''),
(969, 4, 'Carina ', 'Jones ', 0, 0, 'Andaz', 2, 0, '2024-01-03', '20:00:00', 'N/A', 'GUest', '2024-01-03 12:32:57', '2024-01-04 15:39:44', 'Ygomez', ''),
(971, 6, 'Jordan', 'Snow', 0, 0, 'BT', 2, 0, '2024-01-07', '20:15:00', 'NA', 'Carmen 03.01', '2024-01-03 12:38:26', '2024-01-04 15:39:44', 'Cnava', ''),
(972, 6, 'Tessa', 'Sidman', 0, 0, 'BT', 2, 0, '2024-01-04', '19:15:00', 'NA', 'Carmen 03.01', '2024-01-03 12:49:31', '2024-01-04 15:39:44', 'Cnava', ''),
(974, 6, 'Jason ', 'Eichenholz ', 0, 0, 'RWD', 2, 0, '2024-01-04', '20:45:00', 'Kosher Style,  no pork or shellfish and no mixing dairy and meat.|check out:? Jan 06', 'Giovanna ', '2024-01-03 12:50:36', '2024-01-04 15:39:44', 'Ygomez', ''),
(975, 6, 'Jonathan', 'Pucker, ', 0, 1112, 'ANdaz', 4, 0, '2024-01-06', '18:15:00', 'CO: 07/01/2024', 'Izamar', '2024-01-03 12:58:44', '2024-01-04 19:48:52', 'Ygomez', 'Ygomez'),
(978, 6, 'Lisa', ' Zlotnikoff', 0, 0, 'ETEREO', 2, 0, '2024-01-11', '19:30:00', 'N/A', 'Aracely Barragan', '2024-01-03 13:27:22', '2024-01-04 15:39:44', 'Ygomez', ''),
(979, 6, 'Lisa ', 'Zlotnikoff', 0, 0, 'ETEREO', 2, 0, '2024-01-11', '19:30:00', 'N/A', 'Aracely Barragan', '2024-01-03 13:28:07', '2024-01-04 15:39:44', 'Ygomez', ''),
(981, 6, 'Katherine ', 'Hines', 0, 0, 'BT', 2, 0, '2024-01-23', '18:30:00', 'New Belgium Distributor group Jan 21-23', 'Guest', '2024-01-03 13:34:29', '2024-01-04 15:39:44', 'Ygomez', ''),
(982, 4, 'Bubba ', 'Speed', 0, 0, 'BT', 2, 0, '2024-01-18', '20:00:00', 'New Belgium group ', 'Guest', '2024-01-03 13:42:42', '2024-01-04 15:39:44', 'Ygomez', ''),
(984, 6, 'David', 'Santoriello', 0, 0, 'BT', 2, 0, '2024-01-20', '19:00:00', 'NA', 'Carmen 03.01', '2024-01-03 13:43:21', '2024-01-04 15:39:44', 'Cnava', ''),
(985, 6, 'Bubba', 'Speed', 0, 0, 'BT', 2, 0, '2024-01-19', '19:00:00', 'New Belgium group ', 'Guest', '2024-01-03 13:43:52', '2024-01-04 15:39:44', 'Ygomez', ''),
(987, 1, 'Bubba', 'Speed', 0, 0, 'BT', 2, 0, '2024-01-20', '19:00:00', 'New Belgium group ', 'Guest', '2024-01-03 13:44:21', '2024-01-04 15:39:44', 'Ygomez', ''),
(988, 6, 'Bubba', 'Speed', 0, 0, 'BT', 2, 0, '2024-01-21', '19:00:00', 'New Belgium group ', 'GUest', '2024-01-03 13:45:16', '2024-01-04 15:39:44', 'Ygomez', ''),
(989, 4, 'Bubba ', 'Speed', 0, 0, 'BT', 2, 0, '2024-01-22', '19:00:00', 'New Belgium group ', 'GUest', '2024-01-03 13:45:52', '2024-01-04 15:39:44', 'Ygomez', ''),
(990, 1, 'Bubba', 'Speed', 0, 0, 'BT', 2, 0, '2024-01-23', '19:00:00', 'New Belgium group ', 'Guest', '2024-01-03 13:46:15', '2024-01-04 15:39:44', 'Ygomez', ''),
(991, 6, 'Kunal ', 'Patel   ? ', 0, 0, 'RWD', 2, 0, '2024-01-22', '19:00:00', 'check out:? Jan 24', 'Giovanna ', '2024-01-03 14:01:12', '2024-01-04 15:39:44', 'Ygomez', ''),
(992, 1, 'Kunal  ? ', 'Patel  ', 0, 0, 'RWD', 2, 2, '2024-01-21', '18:15:00', 'check out:? Jan 24?? ', 'Giovanna ', '2024-01-03 14:01:41', '2024-01-04 15:39:44', 'Ygomez', ''),
(993, 6, 'Breck ', 'Winokur', 0, 0, 'FMT', 2, 0, '2024-01-15', '20:00:00', 'N/A', 'GUest', '2024-01-03 14:03:21', '2024-01-04 15:39:44', 'Ygomez', ''),
(994, 1, 'Aly ', 'Reich ', 0, 0, 'RWD', 2, 0, '2024-01-12', '20:00:00', 'check out:  16 de enero ', 'Ashly Gómez', '2024-01-03 14:05:11', '2024-01-04 15:39:44', 'Ygomez', ''),
(995, 6, 'James ', 'Pomroy', 0, 0, 'Viceroy', 3, 0, '2024-01-03', '18:30:00', 'N/A', 'Edgar', '2024-01-03 14:18:03', '2024-01-04 15:39:44', 'Ygomez', ''),
(996, 6, 'Joachim', 'Dress ', 0, 920, 'BT', 2, 0, '2024-01-03', '20:00:00', 'Srita Drees no come queso de cabra', 'Sonia Romero', '2024-01-03 14:22:23', '2024-01-04 15:39:44', 'Ygomez', ''),
(997, 4, ' Josh', 'Reznik', 0, 801, 'BT', 4, 0, '2024-01-03', '19:30:00', 'N/A', 'Rene', '2024-01-03 14:23:00', '2024-01-04 15:39:44', 'Ygomez', ''),
(998, 6, 'Josh', 'Reznik,', 0, 801, 'BT', 4, 0, '2024-01-04', '19:30:00', 'N/A', 'Rene garcia', '2024-01-03 14:23:57', '2024-01-04 15:39:44', 'Ygomez', ''),
(999, 6, 'Adam', 'Bentkover', 0, 525, 'BT', 4, 3, '2024-01-04', '19:15:00', 'V525/806 bentkover/colton', 'Regina', '2024-01-03 14:27:58', '2024-01-04 15:39:44', 'Ygomez', ''),
(1000, 6, 'Eric', 'Bernstein', 0, 0, 'RWD', 2, 0, '2024-01-03', '20:15:00', 'N/A', 'Gaby', '2024-01-03 14:30:24', '2024-01-04 15:39:44', 'Ygomez', ''),
(1001, 7, 'Jason', ' Zakia', 0, 525, 'RWD', 2, 2, '2024-01-03', '18:15:00', ' CO 6ENE', 'Kevin', '2024-01-03 14:31:35', '2024-01-04 15:39:44', 'Ygomez', ''),
(1002, 6, 'Carla', 'Zakhem Hassan', 0, 415, 'BT', 2, 0, '2024-01-04', '19:30:00', 'N/A', 'Jose', '2024-01-03 14:33:06', '2024-01-04 15:39:44', 'Ygomez', ''),
(1003, 6, ' Andrew', 'Rochstein ', 0, 610, 'FMT', 3, 0, '2024-01-03', '17:30:00', '1 pax vegetariano', 'Raquel de la Rosa', '2024-01-03 14:35:58', '2024-01-04 15:39:44', 'Ygomez', ''),
(1004, 6, 'Leslie', 'Marshall', 0, 553, 'FMT', 2, 0, '2024-01-03', '19:30:00', ' +44 749 631 7344', 'Fernanda G', '2024-01-03 14:39:01', '2024-01-04 15:39:44', 'Ygomez', ''),
(1005, 6, 'Jacinta', 'Carral ', 0, 632, 'BT', 3, 0, '2024-01-03', '17:30:00', '1 pax Intolerancia a la lactosa', 'Raquel de la Rosa', '2024-01-03 14:41:01', '2024-01-04 15:39:44', 'Ygomez', ''),
(1006, 6, 'Murali ', 'Bathina', 0, 2411, 'Andaz', 2, 0, '2024-01-03', '17:00:00', 'N/A', 'GUest', '2024-01-03 14:43:51', '2024-01-04 15:39:44', 'Ygomez', ''),
(1007, 6, 'Chang', 'Park', 0, 0, 'BT', 6, 0, '2024-01-03', '17:45:00', 'N/A', 'Rafael | 0301', '2024-01-03 14:42:21', '2024-01-04 15:39:44', 'Rmerlo', ''),
(1008, 6, 'Sonia', 'Dhaliwal', 0, 225, 'FMT', 3, 0, '2024-01-03', '20:15:00', '+1 609 216 4116', 'Fernanda G', '2024-01-03 14:48:32', '2024-01-04 15:39:44', 'Ygomez', ''),
(1009, 1, 'Meeta', 'Sinnapan ', 0, 1331, 'Andaz', 4, 0, '2024-01-03', '20:15:00', 'ree nut allergies and one person vegetarian Credito abierto Tel 9981169964', 'Beatriz', '2024-01-03 14:50:06', '2024-01-04 15:39:44', 'Ygomez', ''),
(1010, 6, 'Gregory', 'Nataf ', 0, 2213, 'Andaz', 5, 0, '2024-01-03', '20:45:00', 'CO 5 de enero', 'Tere', '2024-01-03 14:51:07', '2024-01-04 15:39:44', 'Ygomez', ''),
(1011, 6, 'Jacob', 'Edelman ', 0, 1831, 'Andaz', 2, 0, '2024-01-03', '17:00:00', 'CO 05', 'Tere', '2024-01-03 14:51:59', '2024-01-04 15:39:44', 'Ygomez', ''),
(1012, 6, 'Bobby', 'Kumm ', 0, 1824, 'Andaz', 2, 2, '2024-01-03', '17:00:00', 'CO el 7', 'Tere', '2024-01-03 14:53:11', '2024-01-04 15:39:44', 'Ygomez', ''),
(1013, 6, 'Rodrigo', 'Perez Perez ', 0, 1514, 'Andaz', 2, 0, '2024-01-03', '21:00:00', 'CO el 4 de enero', 'Tere', '2024-01-03 14:54:00', '2024-01-04 15:39:44', 'Ygomez', ''),
(1014, 6, 'Kevin', 'Korondi', 0, 709, 'FMT', 6, 0, '2024-01-03', '20:15:00', '+1 215 262 8858', ' Fernanda G', '2024-01-03 14:54:59', '2024-01-04 15:39:44', 'Ygomez', ''),
(1015, 6, ' Jonathan ', 'Spier', 0, 209, 'FMT', 3, 0, '2024-01-03', '17:30:00', ' +1 6504685296', 'Wendy Martínez ', '2024-01-03 14:56:44', '2024-01-04 15:39:44', 'Ygomez', ''),
(1016, 1, 'Sara ', 'Cherney ', 0, 801, 'FMT', 4, 0, '2024-01-03', '18:30:00', '7441765599', 'Daniel González ', '2024-01-03 14:57:41', '2024-01-04 15:39:44', 'Ygomez', ''),
(1017, 6, 'Holly ', 'Parker ', 0, 809, 'RWD', 2, 0, '2024-01-03', '20:30:00', 'N/A', 'Rod', '2024-01-03 18:09:27', '2024-01-04 15:39:44', 'Ygomez', ''),
(1018, 6, 'amanda', 'Comair ', 0, 407, 'RWD', 4, 0, '2024-01-03', '21:00:00', 'CO 0501', 'Alma', '2024-01-03 15:00:19', '2024-01-04 15:39:44', 'Ygomez', ''),
(1019, 6, 'Ellen ', 'Polkes ', 0, 424, 'RWD', 4, 0, '2024-01-03', '20:30:00', 'N/A', 'Carrera', '2024-01-03 15:01:06', '2024-01-04 15:39:44', 'Ygomez', ''),
(1020, 6, 'Sarah', ' Gibson', 0, 0, 'ETEREO', 2, 0, '2024-01-03', '20:15:00', 'David Bday today', 'Ricardo', '2024-01-03 15:02:07', '2024-01-04 15:39:44', 'Ygomez', ''),
(1021, 6, 'Jill	', 'Fishman', 0, 607, 'BT', 3, 0, '2024-01-03', '19:15:00', 'Eli is allergic to tree nuts and sesame.', 'GUest', '2024-01-03 20:26:43', '2024-01-04 15:39:44', 'Ygomez', ''),
(1022, 1, 'Marc', 'Buhofer ', 0, 425, 'RWD', 2, 0, '2024-01-03', '18:30:00', 'Con crédito  Sin celebraciones | El Sr Buhofer no come mariscos ????', 'Gabriel', '2024-01-03 15:08:20', '2024-01-04 15:39:44', 'Ygomez', ''),
(1023, 6, 'Melanie ', 'Whelan', 0, 707, 'BT', 8, 0, '2024-01-03', '19:00:00', 'N/A', 'Ivan', '2024-01-03 15:11:47', '2024-01-04 15:39:44', 'Ygomez', ''),
(1024, 4, 'Andrea ', 'Pivnic', 0, 11132, 'FHP', 5, 0, '2024-01-03', '18:00:00', '(renta)|1 (917) 592-3039|CO: 6/ENE', 'Alejandro Lemus', '2024-01-03 15:20:30', '2024-01-04 15:39:44', 'Ygomez', ''),
(1025, 1, 'Nicolas ', 'Legault', 0, 0, 'Andaz', 2, 0, '2024-01-03', '20:00:00', 'N/A', 'Diana', '2024-01-03 15:24:10', '2024-01-04 15:39:44', 'Ygomez', ''),
(1026, 1, 'Martha', 'Zozaya', 0, 529, 'FMT', 4, 0, '2024-01-03', '20:45:00', '8180296504', 'Annette Monteverde', '2024-01-03 15:32:07', '2024-01-04 15:39:44', 'Ygomez', ''),
(1027, 1, 'Ahmed ', 'Syed', 0, 1633, 'Andaz', 2, 0, '2024-01-03', '20:45:00', 'CO el 6', 'Tere', '2024-01-03 15:33:03', '2024-01-04 15:39:44', 'Ygomez', ''),
(1028, 6, 'Mario ', 'Monroy Galeazzi, ', 0, 203, 'BT', 2, 1, '2024-01-05', '19:45:00', 'N/A', 'Guest', '2024-01-03 15:41:27', '2024-01-04 15:39:44', 'Ygomez', ''),
(1029, 1, ' Mario ', 'Monroy Galeazzi,', 0, 203, 'BT', 2, 1, '2024-01-03', '20:00:00', 'N/A', 'Guest', '2024-01-03 15:43:18', '2024-01-04 15:39:44', 'Ygomez', ''),
(1030, 6, ' Yvonne', 'Fritz', 0, 915, 'BT', 4, 0, '2024-01-03', '19:30:00', 'Solicita mesa en casita', 'Eduardo', '2024-01-03 15:46:58', '2024-01-04 15:39:44', 'Ygomez', ''),
(1031, 4, 'Caleb ', 'Creswell', 0, 0, 'BT', 2, 0, '2024-02-05', '18:30:00', 'N/A', 'Rafael | 0301', '2024-01-03 15:57:44', '2024-01-04 15:39:44', 'Rmerlo', ''),
(1032, 7, 'Caleb', 'Creswell', 0, 0, 'BT', 2, 0, '2024-02-06', '18:30:00', 'N/A', 'Rafael | 0301', '2024-01-03 16:06:18', '2024-01-04 15:39:44', 'Rmerlo', ''),
(1033, 1, 'Caleb', 'Creswell', 0, 0, 'BT', 2, 0, '2024-02-08', '18:30:00', 'N/A', 'Rafael | 0301', '2024-01-03 16:07:08', '2024-01-04 15:39:44', 'Rmerlo', ''),
(1034, 4, 'Michael ', 'Nagle', 0, 0, 'BT', 2, 0, '2024-01-19', '19:00:00', 'NA', 'Carmen 03.01', '2024-01-03 16:29:46', '2024-01-04 15:39:44', 'Cnava', ''),
(1035, 6, 'Caleb', 'Creswell', 0, 0, 'BT', 2, 0, '2024-01-09', '18:30:00', 'N/A', 'Rafael | 0301', '2024-01-03 16:16:10', '2024-01-04 15:39:44', 'Rmerlo', ''),
(1036, 6, 'HETA ', 'Selvakumar', 0, 4409, 'FMT', 4, 0, '2024-01-03', '20:45:00', 'solicita que se le informe si hay dispo más temprano', 'GUest', '2024-01-03 16:20:44', '2024-01-04 15:39:44', 'Ygomez', ''),
(1037, 6, 'Michael ', 'Nagel', 0, 0, 'BT', 2, 0, '2024-01-22', '18:30:00', 'NA', 'Carmen 03.01', '2024-01-03 16:30:15', '2024-01-04 15:39:44', 'Cnava', ''),
(1038, 1, ' Carl', 'Zakhem Hassan,', 0, 415, 'BT', 2, 0, '2024-01-05', '19:30:00', 'N/A', 'Jose', '2024-01-03 16:27:22', '2024-01-04 15:39:44', 'Ygomez', ''),
(1039, 6, 'Maryan', 'Akbari', 0, 0, 'Externos', 7, 0, '2024-01-14', '18:30:00', 'celebran un matrimonio| 1 persona menta alergia| 1 alrgia al mango and cashews, 1 pax alergia a huevo y lactes| 6178160589', 'GUest', '2024-01-03 16:33:31', '2024-01-04 15:39:44', 'Ygomez', ''),
(1040, 1, 'Larry', 'Serota', 0, 708, 'BT', 2, 2, '2024-01-03', '18:30:00', 'Sra alérgica a kiwi y mango y señor alergia a lácteos y gluten free', 'Juan', '2024-01-03 16:45:59', '2024-01-04 15:39:44', 'Ygomez', ''),
(1041, 7, 'Keith', 'Derman, ', 0, 626, 'BT', 2, 3, '2024-01-05', '19:00:00', 'N/A', 'GUest', '2024-01-03 16:54:08', '2024-01-04 15:39:44', 'Ygomez', ''),
(1043, 1, 'Erika', 'Amaral ', 0, 1122, 'Andaz', 4, 0, '2024-01-03', '21:00:00', 'CO 6 de Enero', 'Tere', '2024-01-03 17:05:13', '2024-01-04 15:39:44', 'Ygomez', ''),
(1044, 6, 'Emilie', 'Jarvis', 0, 518, 'BT', 2, 0, '2024-01-03', '18:45:00', 'solicitan mesa cerca del agua', 'Seidee', '2024-01-03 17:06:44', '2024-01-04 15:39:44', 'Ygomez', ''),
(1045, 6, 'KEVIN ', 'FRITZHAND ', 0, 0, 'Edition', 3, 0, '2024-01-04', '21:30:00', 'Sin alergias', 'Francisco', '2024-01-03 17:30:05', '2024-01-04 15:39:44', 'Ygomez', ''),
(1046, 6, 'Von', ' Rosenthal', 0, 506, 'BT', 2, 0, '2024-01-03', '20:30:00', 'N/A', 'Alin', '2024-01-03 17:32:41', '2024-01-04 15:39:44', 'Ygomez', ''),
(1047, 6, ' Charlotte ', 'Colton,', 0, 806, 'BT', 3, 0, '2024-01-05', '18:15:00', 'N/A', 'Seidee', '2024-01-03 17:35:33', '2024-01-04 15:39:44', 'Ygomez', ''),
(1048, 4, 'Charlotte', 'Colton, ', 0, 806, 'BT', 3, 0, '2024-01-06', '18:00:00', 'N/A', 'Seidee', '2024-01-03 17:36:22', '2024-01-04 15:39:44', 'Ygomez', ''),
(1049, 4, 'James Koken ', 'Placio, ', 0, 1423, 'Andaz', 4, 0, '2024-01-03', '20:30:00', 'CHECK OUT:  7/01/2023', 'Tere', '2024-01-03 17:37:18', '2024-01-04 15:39:44', 'Ygomez', ''),
(1050, 1, 'Paul ', 'Goldner ', 0, 0, 'Royal haciendas', 2, 0, '2024-01-03', '21:00:00', 'N/A', 'Margarito Chan', '2024-01-03 17:41:58', '2024-01-04 15:39:44', 'Ygomez', ''),
(1051, 7, 'Carla', 'Zakhem Hassan, ', 0, 415, 'BT', 2, 0, '2024-01-03', '19:30:00', 'N/A', 'Jose', '2024-01-03 17:44:58', '2024-01-04 15:39:44', 'Ygomez', ''),
(1052, 6, 'Kristin ', 'Johnson ', 0, 4406, 'FMT', 4, 0, '2024-01-03', '20:15:00', 'N/A', 'GUest', '2024-01-03 18:05:20', '2024-01-04 15:39:44', 'Ygomez', ''),
(1053, 6, 'Tianyuan', 'Zheng', 0, 706, 'BT', 2, 0, '2024-01-04', '19:45:00', 'N/A', 'GUest', '2024-01-03 18:07:27', '2024-01-04 15:39:44', 'Ygomez', ''),
(1054, 1, 'Tianyuan', 'Zheng', 0, 706, 'BT', 2, 0, '2024-01-03', '19:15:00', 'N/A', 'GUest', '2024-01-03 18:08:08', '2024-01-04 15:39:44', 'Ygomez', ''),
(1055, 1, 'Abhishek', 'Patel', 0, 925, 'BT', 2, 0, '2024-01-03', '20:15:00', 'Mrs Thakkar, Meghna is vegetarian| celebran luna de miel| solicitan mesa en terraza', 'Marcos', '2024-01-03 18:28:26', '2024-01-04 15:39:44', 'Ygomez', ''),
(1056, 6, 'Brittany', ' Zelwin', 0, 717, 'FMT', 4, 0, '2024-01-06', '20:30:00', 'menciona que los van cambiar de habitación', 'GUest', '2024-01-03 18:17:06', '2024-01-04 15:39:44', 'Ygomez', ''),
(1057, 7, 'Erin ', 'Bzymek', 0, 0, 'Andaz', 8, 0, '2024-01-11', '19:30:00', 'Check out: 15 enero', 'MONICA GARCIA', '2024-01-03 18:20:05', '2024-01-04 15:39:44', 'Ygomez', ''),
(1058, 7, 'Pedro Enrique ', 'Haces', 0, 612, 'FMT', 14, 0, '2024-01-04', '20:30:00', 'no alergias| family style menu| 110 USD + tax por persona| cancelación antes de las 3pm, después de las 3pm penalidad  50%', 'Guest', '2024-01-03 18:38:25', '2024-01-04 17:47:58', 'Ygomez', 'Ygomez'),
(1059, 4, 'Elizabeth', 'Hinckley', 0, 924, 'BT', 2, 0, '2024-01-03', '19:30:00', 'N/A', 'Alin', '2024-01-03 18:25:50', '2024-01-04 15:39:44', 'Ygomez', ''),
(1060, 7, 'Ihmran	', 'Syed', 0, 103, 'BT', 2, 0, '2024-01-05', '20:00:00', 'no puerco', 'Guest', '2024-01-03 18:32:10', '2024-01-04 15:39:44', 'Ygomez', ''),
(1061, 6, 'Albrecht, ', 'Wesley', 0, 109, 'BT', 2, 0, '2024-01-04', '19:00:00', 'N/A', 'Gabriela', '2024-01-03 18:48:15', '2024-01-04 15:39:44', 'Ygomez', ''),
(1064, 7, 'Mark	', 'Ruggeri', 0, 0, 'BT', 4, 0, '2024-01-03', '18:30:00', 'N/A', 'Alin', '2024-01-03 18:56:05', '2024-01-04 15:39:44', 'Ygomez', ''),
(1065, 1, 'Brittany ', 'Zelwin', 0, 717, 'FMT', 4, 0, '2024-01-04', '20:30:00', 'N/A', 'GUest', '2024-01-03 18:58:04', '2024-01-04 15:39:44', 'Ygomez', ''),
(1066, 4, 'Alexandra', 'Papalexopoulou, ', 0, 606, 'BT', 7, 0, '2024-01-03', '20:30:00', 'N/A', 'GUest', '2024-01-03 19:32:12', '2024-01-04 15:39:44', 'Ygomez', ''),
(1067, 1, 'Alexandra', 'Papalexopoulou', 0, 606, 'BT', 7, 0, '2024-01-04', '21:00:00', 'N/A', 'Guest', '2024-01-03 19:32:57', '2024-01-04 15:39:44', 'Ygomez', ''),
(1068, 4, 'Olesya', 'Gorbunova', 0, 803, 'BT', 6, 7, '2024-01-03', '18:00:00', ' niño nuts allergy // 1 niña fish allergy|Solicitan 2 mesas al exterior una para los 7 menores y una para los adultos', 'Emmanuel', '2024-01-03 19:34:30', '2024-01-04 15:39:44', 'Ygomez', ''),
(1069, 1, 'Heather', 'Griffin', 0, 623, 'FMT', 6, 0, '2024-01-04', '18:30:00', '214-564-2696', 'Guest', '2024-01-03 19:46:26', '2024-01-04 15:39:44', 'Ygomez', ''),
(1070, 1, 'Sebastian ', 'Ortega', 0, 2512, 'Andaz', 4, 0, '2024-01-03', '21:00:00', 'No alergias', 'Guest', '2024-01-03 19:49:20', '2024-01-04 15:39:44', 'Ygomez', ''),
(1071, 1, 'Martin', 'Verschuere', 0, 813, 'BT', 6, 0, '2024-01-03', '19:00:00', 'N/A', 'Sonia', '2024-01-03 20:06:37', '2024-01-04 15:39:44', 'Ygomez', ''),
(1072, 2, ' Cornell', 'Wright', 0, 619, 'BT', 5, 0, '2024-01-03', '19:30:00', '1 dairy allergies ', 'Eduardo', '2024-01-03 20:10:01', '2024-01-04 15:39:44', 'Ygomez', ''),
(1073, 4, 'Miguel', 'Galarza Torres', 0, 1714, 'Andaz', 2, 0, '2024-01-03', '17:15:00', 'no alergias', 'Olga', '2024-01-03 20:11:54', '2024-01-04 15:39:44', 'Ygomez', ''),
(1074, 4, 'Martin', 'Verschuere', 0, 813, 'BT', 6, 0, '2024-01-04', '19:00:00', 'N/A', 'Sonia', '2024-01-03 20:15:31', '2024-01-04 15:39:44', 'Ygomez', ''),
(1075, 6, 'Katie ', 'Miller', 0, 0, 'Viceroy', 2, 0, '2024-01-04', '17:00:00', 'Alergias: el señor es gluten free. La señora esta embarazada', 'Concierge', '2024-01-03 20:21:12', '2024-01-04 15:39:44', 'Ygomez', ''),
(1076, 1, 'Justin ', 'Mcgarry', 0, 2223, 'Andaz', 4, 0, '2024-01-04', '17:30:00', 'Departing Jan 6 Celebrations: new job  No allergies (512)635-3465', 'Guest', '2024-01-03 20:43:24', '2024-01-04 15:39:44', 'Ygomez', ''),
(1077, 6, 'Katherine', 'Yaphe', 0, 608, 'BT', 4, 0, '2024-01-03', '19:45:00', 'N/A', 'Paulina', '2024-01-03 20:51:09', '2024-01-04 15:39:44', 'Ygomez', ''),
(1078, 6, 'Mauricio ', 'Osorio', 0, 212, 'FMT', 2, 0, '2024-01-03', '17:00:00', 'no alergias', 'Guest', '2024-01-03 20:52:33', '2024-01-04 15:39:44', 'Ygomez', ''),
(1079, 7, ' Ross', 'Radusky', 0, 3212, 'Andaz', 4, 2, '2024-01-03', '18:00:00', 'Su esposa y mamá del Sr. Ross son Gluten Free y toda la familia es pescetarians. We eat fish, dairy etc. but we don’t eat meat/chicken or shellfish. ', 'Izamar', '2024-01-03 21:02:44', '2024-01-04 15:39:44', 'Ygomez', ''),
(1080, 6, 'Jason', 'Altman ', 0, 802, 'BT', 4, 3, '2024-01-03', '19:45:00', 'N/A', 'Sonia', '2024-01-03 21:03:43', '2024-01-04 15:39:44', 'Ygomez', ''),
(1081, 6, 'Kelly', 'Bensemhou', 0, 0, 'TB', 8, 0, '2024-01-05', '21:00:00', 'NA', 'Samara | 03/01', '2024-01-03 21:03:44', '2024-01-04 15:39:44', 'Svite', ''),
(1082, 6, 'Kelly', 'Bensemhou', 0, 0, 'BT', 8, 0, '2024-01-08', '21:00:00', 'NA', 'Samara | 03/01', '2024-01-03 21:04:13', '2024-01-04 15:39:44', 'Svite', ''),
(1083, 6, 'Brittany ', 'Mc Vaugh', 0, 307, 'BT', 2, 0, '2024-01-03', '18:15:00', 'Owners| Full Show', 'Stefano', '2024-01-03 21:18:04', '2024-01-04 15:39:44', 'Ygomez', ''),
(1087, 6, 'fAM', 'Marchetti', 0, 407, 'BT', 3, 0, '2024-01-04', '18:00:00', 'N/A', 'Fabi', '2024-01-03 21:53:21', '2024-01-04 15:39:44', 'Ygomez', ''),
(1088, 6, 'Paola ', 'Pedrignani ', 0, 0, 'Ext', 3, 0, '2024-01-04', '21:00:00', '-9176508030', 'GUest', '2024-01-03 21:50:36', '2024-01-04 15:39:44', 'Ygomez', ''),
(1089, 6, 'Felipe', 'Vallejo', 0, 0, 'BT', 4, 0, '2024-01-09', '20:00:00', 'Mesa cerca del Muelle, sujeto a disponibilidad', 'Rafael | 0301', '2024-01-04 00:01:04', '2024-01-04 15:39:44', 'Rmerlo', ''),
(1090, 6, 'Maureen ', 'Sweeney', 0, 0, 'BT', 4, 0, '2024-01-13', '18:30:00', 'NA', 'RICARDO 03-01', '2024-01-04 01:07:43', '2024-01-04 15:39:44', 'Rmartinez', ''),
(1091, 1, 'Maureen ', 'Sweeney', 0, 0, 'BT', 4, 0, '2024-01-14', '18:30:00', 'NA', 'RICARDO 03-01', '2024-01-04 01:08:44', '2024-01-04 15:39:44', 'Rmartinez', ''),
(1092, 7, 'Michael', 'Madison', 0, 0, 'BT', 2, 0, '2024-01-13', '19:00:00', 'NA', 'Samara | 03/01', '2024-01-04 01:52:01', '2024-01-04 15:39:44', 'Svite', ''),
(1093, 6, 'Michael', 'Madison', 0, 0, 'BT', 2, 0, '2024-01-14', '18:00:00', 'NA', 'Samara | 03/01', '2024-01-04 01:52:29', '2024-01-04 15:39:44', 'Svite', ''),
(1094, 1, 'Michael', 'Madison', 0, 0, 'BT', 2, 0, '2024-01-16', '18:00:00', 'NA', 'Samara | 03/01', '2024-01-04 01:53:09', '2024-01-04 15:39:44', 'Svite', ''),
(1095, 4, 'Michael', 'Madison', 0, 0, 'BT', 2, 0, '2024-01-17', '18:00:00', 'NA', 'Samara | 03/01', '2024-01-04 01:53:42', '2024-01-04 15:39:44', 'Svite', ''),
(1096, 6, 'Michael', 'Madison', 0, 0, 'BT', 2, 0, '2024-01-19', '18:00:00', 'NA', 'Samara | 03/01', '2024-01-04 01:54:13', '2024-01-04 15:39:44', 'Svite', ''),
(1099, 1, 'Alexander', 'Pavincic', 0, 0, 'BT', 2, 0, '2024-01-07', '19:30:00', 'NA', 'RICARDO 03-01', '2024-01-04 02:45:54', '2024-01-04 15:39:44', 'Rmartinez', ''),
(1100, 2, 'Alexander', 'Pavincic', 0, 0, 'BT', 2, 0, '2024-01-08', '19:30:00', 'NA', 'RICARDO 03-01', '2024-01-04 02:47:02', '2024-01-04 15:39:44', 'Rmartinez', ''),
(1101, 6, ' Habib', 'MURTAZA', 0, 324, 'FMT', 4, 0, '2024-01-05', '18:30:00', 'N/A', 'Jazmin', '2024-01-04 14:20:00', '2024-01-04 15:39:44', 'Ygomez', ''),
(1102, 1, 'Diana ', 'Gracia Pons', 0, 107, 'BT', 3, 0, '2024-01-04', '20:45:00', 'N/A', 'Mariana', '2024-01-04 14:25:02', '2024-01-04 15:39:44', 'Ygomez', ''),
(1103, 1, 'James Koken ', 'Plació ', 0, 1424, 'Andaz', 4, 0, '2024-01-04', '20:30:00', 'N/A', 'Marisol', '2024-01-04 14:28:12', '2024-01-04 15:39:44', 'Ygomez', '');
INSERT INTO `reservas_restaurante` (`id_reserva_R`, `nombre_restaurante`, `huesped`, `apellidos`, `mesa`, `villa`, `propiedad`, `numero_personas`, `kids`, `fecha_reserva`, `horario_reserva`, `comentarios`, `solicitante`, `fecha_creacion`, `fecha_edicion`, `usuario`, `usuario_edita`) VALUES
(1104, 1, 'Jason ', 'Eichenholz', 0, 211, 'RWD', 2, 0, '2024-01-05', '19:30:00', 'no comen puerco| Solicitan mesa en deck', 'Marisol', '2024-01-04 14:29:11', '2024-01-04 15:39:44', 'Ygomez', ''),
(1105, 6, 'Jason', 'Rosenbaum', 0, 0, 'BT', 2, 0, '2024-01-09', '20:00:00', 'Celebrating honeymoon', 'Andrea G 04-01', '2024-01-04 14:56:01', '2024-01-04 15:39:44', 'Aguzman', ''),
(1106, 4, 'Emilie ', 'Jarvis,', 0, 518, 'BT', 2, 2, '2024-01-04', '19:15:00', 'Jarvis is allergic to Lobster and mollusk', 'Seidee', '2024-01-04 14:56:57', '2024-01-04 15:39:44', 'Ygomez', ''),
(1107, 7, 'Jason', 'Rosenbaum', 0, 0, 'BT', 2, 0, '2024-01-10', '20:00:00', 'Celebrating honeymoon', 'Andrea G 04-01', '2024-01-04 14:57:27', '2024-01-04 15:39:44', 'Aguzman', ''),
(1108, 1, 'Sean ', 'Greenberg', 0, 814, 'RWD', 4, 0, '2024-01-05', '20:00:00', 'No celebraciones  No alergias', 'Ambar', '2024-01-04 14:57:52', '2024-01-04 15:39:44', 'Ygomez', ''),
(1110, 6, 'Christopher ', 'Ward', 0, 309, 'FMT', 8, 0, '2024-01-06', '18:00:00', 'N/A', 'Guest', '2024-01-04 15:05:35', '2024-01-04 15:39:44', 'Ygomez', ''),
(1111, 1, 'Anastassia', 'Kounitsyna', 0, 2023, 'Andaz', 4, 0, '2024-01-04', '21:30:00', 'CHECK OUT:  7/04/2024', 'Bernardino Hidalgo', '2024-01-04 15:17:56', '2024-01-04 15:39:44', 'Ygomez', ''),
(1112, 1, 'Matthew ', 'Medland', 0, 108, 'BT', 2, 0, '2024-01-04', '19:00:00', 'N/A', 'ivon', '2024-01-04 15:19:38', '2024-01-04 15:39:44', 'Ygomez', ''),
(1114, 1, 'Joachim', 'Drees', 0, 920, 'BT', 2, 0, '2024-01-04', '20:00:00', 'Mrs. Drees can´t eat cheese| GIR por retraso de mesa en Saffron, asignar mesa de inmediato', 'Karen Rocha', '2024-01-04 15:32:20', '2024-01-04 15:39:44', 'Ygomez', ''),
(1116, 7, 'Chang ', 'Park', 0, 618, 'BT', 4, 2, '2024-01-04', '19:00:00', 'alex is allergic to eggs and peanuts', 'Jose', '2024-01-04 15:43:01', '2024-01-04 17:49:16', 'Ygomez', 'Ygomez'),
(1117, 5, 'Yossi', 'Notik', 0, 0, 'BT', 2, 0, '2024-01-06', '11:30:00', 'Lunch kosher', 'Samara | 04/01', '2024-01-04 15:47:51', '2024-01-04 15:47:51', 'Svite', ''),
(1118, 7, 'BEATRIZ', ' Perez Tapia', 0, 819, 'FMT', 2, 0, '2024-01-04', '20:00:00', 'CO el sabado 06', 'Rodrigo', '2024-01-04 15:54:05', '2024-01-04 15:54:05', 'Ygomez', ''),
(1119, 6, 'KEVIN A. ', 'SFORZA', 0, 0, 'TBD', 2, 0, '2024-02-14', '19:00:00', 'TBD', 'GUest', '2024-01-04 16:19:35', '2024-01-04 16:19:35', 'Ygomez', ''),
(1120, 2, 'Salvatore', 'Giovine', 0, 0, 'BT', 2, 2, '2024-01-08', '19:30:00', 'NA', 'Samara | 04/01', '2024-01-04 16:21:13', '2024-01-04 16:21:13', 'Svite', ''),
(1121, 4, 'Joe', 'Moosa', 0, 0, 'RWD', 2, 0, '2024-01-30', '07:00:00', 'check out: 03 Febrero', 'Susana  Palacios', '2024-01-04 16:21:30', '2024-01-04 16:21:30', 'Ygomez', ''),
(1122, 1, 'Joe', 'Moosa', 0, 0, 'RWD', 2, 0, '2024-02-01', '19:00:00', 'check out: 03 Febrero', 'Susana  Palacios', '2024-01-04 16:21:44', '2024-01-04 16:21:44', 'Ygomez', ''),
(1123, 7, 'Sylvia', 'Huszar Mueller, ', 0, 923, 'BT', 4, 0, '2024-01-04', '18:00:00', 'alergia al anis| traen silla de ruedas| solicita mesa 13', 'Marcos', '2024-01-04 16:23:37', '2024-01-04 16:33:17', 'Ygomez', 'Ygomez'),
(1124, 1, 'Salvatore', 'Giovine', 0, 0, 'BT', 2, 2, '2024-01-10', '19:00:00', 'NA', 'Samara | 04/01', '2024-01-04 16:23:38', '2024-01-04 16:23:38', 'Svite', ''),
(1125, 7, 'Salvatore', 'Giovine', 0, 0, 'BT', 2, 2, '2024-01-12', '19:00:00', 'NA', 'Samara | 04/01', '2024-01-04 16:24:49', '2024-01-04 16:24:49', 'Svite', ''),
(1126, 6, 'Salvatore', 'Giovine', 0, 0, 'BT', 2, 2, '2024-01-13', '19:00:00', 'NA', 'Samara | 04/01', '2024-01-04 16:25:21', '2024-01-04 16:25:21', 'Svite', ''),
(1127, 7, 'michael ', 'dunfee, ', 0, 1631, 'Andaz', 3, 0, '2024-01-04', '18:00:00', 'CHECK OUT: 5/01/2024 |*CREDITO:*si  ', 'Bernardino Hidalgo', '2024-01-04 16:27:56', '2024-01-04 16:27:56', 'Ygomez', ''),
(1128, 4, 'saman ', 'Ghahremani ', 0, 909, 'FMT', 4, 0, '2024-01-04', '20:00:00', '+1 (403) 397-7708', 'Alejandro Lemus', '2024-01-04 16:32:32', '2024-01-04 16:32:32', 'Ygomez', ''),
(1129, 6, 'Khajavi', 'Kamyar ', 0, 200, 'RWD', 2, 0, '2024-01-05', '20:30:00', 'N/A', 'Israel Camargo', '2024-01-04 16:34:07', '2024-01-04 17:58:48', 'Ygomez', 'Ygomez'),
(1130, 1, 'Eric', ' Dixon', 0, 0, 'BT', 2, 0, '2024-01-21', '19:00:00', 'N/A', 'Guest', '2024-01-04 16:34:48', '2024-01-04 16:34:48', 'Ygomez', ''),
(1131, 4, 'Eric', ' Dixon', 0, 0, 'BT', 2, 0, '2024-01-23', '19:00:00', 'N/A', 'Guest', '2024-01-04 16:35:01', '2024-01-04 16:35:01', 'Ygomez', ''),
(1132, 6, 'Phillip', 'Charal ', 0, 0, 'RWD', 2, 0, '2024-01-22', '19:30:00', ' & Mrs. Elizabeth |check out:  25 Enero', 'Susana   Palacios', '2024-01-04 16:39:52', '2024-01-04 16:39:52', 'Ygomez', ''),
(1133, 6, 'Clifford ', 'Thompson ', 0, 0, 'RWD', 2, 0, '2024-01-22', '18:30:00', 'Fecha de check out:  24 de enero |  Mrs. Thompson is dairy and gluten free.', 'Ashly Gómez ', '2024-01-04 16:41:04', '2024-01-04 16:41:04', 'Ygomez', ''),
(1134, 6, 'Marienne ', 'Treadway', 0, 0, 'RWD', 2, 0, '2024-01-26', '19:00:00', 'check out:   27 enero 2024', 'Anaju ', '2024-01-04 16:43:38', '2024-01-04 16:43:38', 'Ygomez', ''),
(1135, 7, ' Alexander ', 'Krulic', 0, 1524, 'aNDAZ', 4, 0, '2024-01-04', '18:15:00', 'CHECK OUT:  6/01/2024', 'Bernardino Hidalgo', '2024-01-04 16:50:34', '2024-01-04 16:50:34', 'Ygomez', ''),
(1136, 6, 'Jack', 'Prutting', 0, 0, 'BT', 2, 0, '2024-01-13', '20:00:00', 'Celebrating Honeymoon', 'Andrea G 04-01', '2024-01-04 16:52:32', '2024-01-04 16:52:32', 'Aguzman', ''),
(1137, 1, 'Simon ', 'Frisch', 0, 2113, 'Andaz', 2, 2, '2024-01-04', '18:00:00', 'N/A', 'Abigail ', '2024-01-04 16:52:35', '2024-01-04 16:52:35', 'Ygomez', ''),
(1138, 4, 'Grace', 'Kim', 0, 524, 'BT', 2, 0, '2024-01-06', '20:00:00', 'N/a', 'Guest', '2024-01-04 17:08:28', '2024-01-04 17:08:28', 'Ygomez', ''),
(1139, 7, 'Martin', 'Verschuere', 0, 813, 'BT', 6, 0, '2024-01-05', '19:00:00', 'N/A', 'Eduardo', '2024-01-04 17:09:19', '2024-01-04 17:10:00', 'Ygomez', 'Ygomez'),
(1140, 7, ' Javier ', 'Pradere ', 0, 11131, 'FHP', 7, 0, '2024-01-04', '20:30:00', 'CO - 07/enero No comentan alergias', 'Rodrigo', '2024-01-04 17:10:46', '2024-01-04 17:10:46', 'Ygomez', ''),
(1141, 7, 'Rebecc', 'Greenbaum-Goodhart, ', 0, 3012, 'Andaz', 2, 1, '2024-01-04', '17:30:00', 'CHECK OUT:  6/01/2024', 'Bernardino Hidalgo', '2024-01-04 17:16:41', '2024-01-04 17:16:41', 'Ygomez', ''),
(1142, 6, 'Emma', 'Shulman', 0, 0, 'BT', 2, 0, '2024-01-09', '19:30:00', 'NA', 'Samara | 04/01', '2024-01-04 17:17:36', '2024-01-04 17:17:36', 'Svite', ''),
(1145, 6, 'John ', 'Pellettiere, ', 0, 512, 'BT', 2, 0, '2024-01-07', '21:00:00', 'cumpleaños de la srita', 'GUest', '2024-01-04 17:34:31', '2024-01-04 17:34:31', 'Ygomez', ''),
(1146, 7, 'Andrew', 'Hamelsky', 0, 0, 'BT', 2, 0, '2024-02-04', '19:00:00', 'N/A', 'Rafael | 0401', '2024-01-04 17:36:59', '2024-01-04 17:36:59', 'Rmerlo', ''),
(1147, 1, 'Andrew ', 'Hamelsky', 0, 0, 'BT', 2, 0, '2024-02-05', '19:30:00', 'N/A', 'Rafael | 0401', '2024-01-04 17:39:08', '2024-01-04 17:39:08', 'Rmerlo', ''),
(1148, 6, 'Andrew', 'Hamelsky', 0, 0, 'BT', 2, 0, '2024-02-06', '19:00:00', 'N/A', 'Rafael | 0401', '2024-01-04 17:40:24', '2024-01-04 17:45:06', 'Rmerlo', 'Rmerlo'),
(1149, 2, 'Andrew', 'Hamelsky', 0, 0, 'BT', 2, 0, '2024-02-07', '19:30:00', 'N/A', 'Rafael | 0401', '2024-01-04 17:40:59', '2024-01-04 17:40:59', 'Rmerlo', ''),
(1150, 4, 'Andrew ', 'Hamelsky', 0, 0, 'BT', 2, 0, '2024-02-08', '19:30:00', 'N/A', 'Rafael | 0401', '2024-01-04 17:41:52', '2024-01-04 17:41:52', 'Rmerlo', ''),
(1151, 7, 'Andrew ', 'Hamelsky', 0, 0, 'BT', 2, 0, '2024-02-09', '19:30:00', 'N/A', 'Rafael | 0401', '2024-01-04 17:42:32', '2024-01-04 17:42:32', 'Rmerlo', ''),
(1152, 7, 'Chang', 'Park', 0, 618, 'BT', 4, 2, '2024-01-05', '18:00:00', 'My son is allergic to eggs and peanuts', 'Gaby Relo', '2024-01-04 17:49:45', '2024-01-04 17:51:37', 'Ygomez', 'Ygomez'),
(1153, 4, 'Larry ', 'Serota', 0, 708, 'BT', 2, 2, '2024-01-05', '18:30:00', 'señora alergia a mango y kiwi y el señor no lácteos y gluten free', 'Juan', '2024-01-04 17:53:24', '2024-01-04 18:17:53', 'Ygomez', 'Ygomez'),
(1154, 6, 'James', 'Lally', 0, 614, 'BT', 4, 0, '2024-01-04', '18:30:00', 'N/A', 'Fabi', '2024-01-04 17:54:37', '2024-01-04 18:35:30', 'Ygomez', 'Ygomez'),
(1155, 7, ' Aahmed', ' Syed ', 0, 1633, 'Andaz', 2, 0, '2024-01-04', '17:30:00', 'No pork ', 'Bernardino Hidalgo', '2024-01-04 17:55:29', '2024-01-04 17:56:04', 'Ygomez', 'Ygomez'),
(1156, 6, 'Stefan Ignatius ', 'Kutko', 0, 205, 'BT', 2, 0, '2024-01-04', '18:15:00', 'N/A', 'Gaby Relo', '2024-01-04 18:07:31', '2024-01-04 18:07:31', 'Ygomez', ''),
(1157, 5, 'Morris ', 'Dweck', 0, 602, 'RWD', 2, 0, '2024-01-04', '20:00:00', 'C. Out: 11 de Enero', 'Johana', '2024-01-04 18:08:15', '2024-01-04 18:08:15', 'Ygomez', ''),
(1158, 5, 'Joshua', 'Chafetz', 0, 0, 'BT', 2, 0, '2024-01-08', '19:30:00', 'no alergias| solicitan mesa afuera', 'Gues', '2024-01-04 18:16:34', '2024-01-04 18:16:34', 'Ygomez', ''),
(1159, 1, ' Rhonda', 'Crichlow', 0, 921, 'BT', 4, 0, '2024-01-04', '18:00:00', 'N/A ', 'Marcos by phone', '2024-01-04 18:20:24', '2024-01-04 18:20:24', 'Ygomez', ''),
(1160, 4, 'Daniela  ', 'Sanchez ', 0, 1324, 'Andaz', 2, 0, '2024-01-04', '20:30:00', 'CHECK OUT:  5/01/2024', 'Bernardino Hidalgo', '2024-01-04 18:24:11', '2024-01-04 18:24:11', 'Ygomez', ''),
(1161, 7, 'Barrie', 'Bloom', 0, 3512, 'ANdaz', 2, 2, '2024-01-05', '18:30:00', 'CO: 08/01', 'Izamar', '2024-01-04 18:24:52', '2024-01-04 18:24:52', 'Ygomez', ''),
(1162, 6, 'Eric', 'Melnick', 0, 0, 'BT', 2, 0, '2024-01-06', '19:30:00', 'Mr. Melnick Birthday ', 'Rafael | 0401', '2024-01-04 18:30:47', '2024-01-04 18:30:47', 'Rmerlo', ''),
(1163, 4, 'Joseph ', 'Goodwin, ', 0, 208, 'BT', 2, 0, '2024-01-04', '18:30:00', 'N/A', 'Gabriela', '2024-01-04 18:40:39', '2024-01-04 18:40:39', 'Ygomez', ''),
(1164, 1, 'Eric', 'Melnick', 0, 0, 'BT', 2, 0, '2024-01-09', '19:30:00', 'N/A', 'Rafael | 0401', '2024-01-04 18:44:26', '2024-01-04 18:44:26', 'Rmerlo', ''),
(1165, 4, 'Eric', 'Melnick', 0, 0, 'BT', 2, 0, '2024-01-09', '19:30:00', 'N/A', 'Rafael | 0401', '2024-01-04 18:47:03', '2024-01-04 18:47:03', 'Rmerlo', ''),
(1166, 4, 'Brian', 'Meyer', 0, 502, 'FMT', 4, 0, '2024-01-04', '18:00:00', '+1 773 209 1988', 'Fernanda G', '2024-01-04 18:48:03', '2024-01-04 18:48:03', 'Ygomez', ''),
(1167, 4, 'Eric', 'Melnick', 0, 0, 'BT', 2, 0, '2024-01-10', '19:30:00', 'N/A', 'Rafael | 0401', '2024-01-04 18:48:33', '2024-01-04 18:48:33', 'Rmerlo', ''),
(1169, 7, 'Melanie  ', 'Whelan ', 0, 707, 'BT', 8, 0, '2024-01-04', '19:00:00', 'Quieren sushi|Mr.Whelan is vegetarian  ', 'Ivan', '2024-01-04 19:23:33', '2024-01-04 19:23:47', 'Ygomez', 'Ygomez'),
(1170, 6, 'Luis', 'Rivera Crespo, ', 0, 511, 'BT', 2, 0, '2024-01-04', '21:00:00', 'N/A', 'Cielo', '2024-01-04 19:24:36', '2024-01-04 19:24:36', 'Ygomez', ''),
(1171, 4, 'ADAM', 'KUBRYK ', 0, 1531, 'Andaz', 4, 0, '2024-01-04', '18:00:00', 'CO 06 enero', 'Beatriz ', '2024-01-04 19:25:32', '2024-01-04 19:25:32', 'Ygomez', ''),
(1172, 2, 'Stefan Ignatius ', 'Kutko', 0, 205, 'BT', 4, 0, '2024-01-05', '17:30:00', 'NO alergias', 'Gaby Relo', '2024-01-04 19:27:55', '2024-01-04 19:27:55', 'Ygomez', ''),
(1173, 6, 'Gabriel ', 'Candelas ', 0, 0, 'Ciudad Mayakoba', 4, 0, '2024-01-05', '20:45:00', 'Director Ciudad Mayakoba', 'Nora Salinas', '2024-01-04 19:34:44', '2024-01-04 19:34:44', 'Ygomez', ''),
(1174, 6, 'Maritza', 'Coppel, ', 0, 311, 'BT', 2, 0, '2024-01-04', '21:00:00', 'N/A', 'Seidee', '2024-01-04 19:36:36', '2024-01-04 19:36:36', 'Ygomez', ''),
(1175, 5, 'MD', 'Lee, ', 0, 914, 'BT', 3, 0, '2024-01-04', '18:00:00', 'N/A', 'Eduardo', '2024-01-04 19:37:23', '2024-01-04 19:37:23', 'Ygomez', ''),
(1176, 4, 'Helmi', 'Hani', 0, 201, 'BT', 2, 0, '2024-01-04', '20:30:00', 'Solicita mesa cerca de la laguna| Solo están una noche', 'GUest', '2024-01-04 19:48:06', '2024-01-04 19:48:06', 'Ygomez', ''),
(1177, 1, 'Federico ', 'Arisi Rota, ', 0, 1512, 'Andaz', 3, 0, '2024-01-05', '17:30:00', 'N/A', 'Guest', '2024-01-04 19:58:34', '2024-01-04 19:58:34', 'Ygomez', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restaurantes`
--

CREATE TABLE `restaurantes` (
  `id_restaurante` int(45) NOT NULL,
  `nombre_restaurant` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `restaurantes`
--

INSERT INTO `restaurantes` (`id_restaurante`, `nombre_restaurant`) VALUES
(1, 'Cello'),
(2, 'Copa'),
(3, 'Oriente'),
(4, 'Tomahawk'),
(5, 'Ember'),
(6, 'Saffron'),
(7, 'Sands');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(45) NOT NULL,
  `nombre_rol` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre_rol`) VALUES
(1, 'Administrador'),
(2, 'Recepcionista'),
(3, 'Consultor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `clave` varchar(255) NOT NULL,
  `telefono` bigint(100) NOT NULL,
  `rol_usuario` int(45) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellidos`, `correo`, `usuario`, `clave`, `telefono`, `rol_usuario`, `fecha_creacion`) VALUES
(25, 'IT', 'Sistemas', 'Gustavo_carranza1999@outlook.com', 'it.admin', '18bcb9fcdffaa26b057d58f043b791d06751db4462d6becd0d7cb0655be4e39eca4c2757239496864bab756940e55df243ca105d64cdc81a637bba119373238a', 5525127928, 1, '2024-01-04 17:37:19'),
(30, 'Andrea', 'Guzman Pacheco ', 'Andrea.gpach@outlook.com', 'Aguzman', '1b61cbbc5d5fb64124899fc9e32f01ee8cfd4aa13af6dc7c6211271c458e1d3fe804ea4ac6dc1d0f7cf793d7a120c334879fe8c6c8fd2fd39b13e13f5f9f3201', 5585313917, 2, '2023-11-16 16:27:59'),
(31, 'Samara', 'Vite Sanchez', 'Samara.vite.04@gmail.com', 'Svite', '835eddb196b021d7ca378addcf6a879f60e6e17b09fe4f36589fe0483851d2c2e8e1f66493a3f597e4149d6860152b5b90551aeef057ae2205e8398ca1103663', 9983850726, 2, '2023-11-16 16:30:56'),
(32, 'Rafael', 'Merlo', 'Rafaelmr72@gmail.com', 'Rmerlo', '7fa97a56a86a653c335e5c39174be90ef683c908dea3e74cd3a24643241e703e412f5a596e8d2cc4b3eaf1c3b53b5469ff8615c5cad0a305dc6a856a3f52a83a', 9841503192, 2, '2023-11-16 16:31:55'),
(33, 'Yasmin', 'Gomez', 'Yasmin@gmail.com', 'Ygomez', '65404099089cef4ca9e09d325a6da27967fbd5d3e7fff175a4d3afcd43aff46c1e25e309d7794d3d08b5e021ae4d3ea2eee94ed28568d331a5525b8efec6e217', 44992211554, 2, '2023-11-17 12:51:35'),
(34, 'Carmen', 'Nava', 'FREQLES@hotmail.com', 'Cnava', '091fe8720a865294787912d1898c2881dd3e8baf78618e84e7345062f77950d2d89993c312781a7c313c78c3f0b5d634d2c8196dc4ca8dbdf24b705b16f0ac1b', 9841446562, 2, '2023-11-17 15:51:42'),
(35, 'Ricardo', 'Martinez Flores', 'RicardoM@gmail.com', 'Rmartinez', 'f0b50acf477eed61a154919ea520bd5ae34667b30ded5218903f4d62ab0015af32e20351332c975b2df9d46c0b3d2082b999c28abd18b506fbbab417f47e80da', 132456789, 2, '2023-12-07 16:43:46'),
(38, 'Jaquelin', 'Capilla', 'correo@correo.com', 'JCapilla', 'd2dc31a7b23a24db4e8bc2fb5347a65f8fc156e3f8bcbe19b46040cfae31a3a6a0963cf32d76d437512d4b85ab1c36c85456f1dab78a0fc286397f06ddef5f40', 123456789, 0, '2024-01-01 20:37:11'),
(39, 'Jaquelin', 'Capilla', 'correo@correo.com', 'JRosas', '001b08463a9bf081d0e3471ef1abd84a07cf113fc183a5924b0d0825ee5d1a5b0403f9ea34a47d15b75f3037e5eca89e6ce3da6d067ce850c08fb71ebcd2c2ff', 123456789, 2, '2024-01-01 20:43:40'),
(40, 'General de A Y B ', 'General de A Y B ', 'correo@correo.com', 'FBservice', 'fcd303429206508ee43368801b4a433a9a587ca084a4d3c50bf82cf18646fa823c03821063c6a0a2687af4616eac3d38635cb804fab2b2761884ebdc2a3a7222', 55215457454, 3, '2024-01-03 12:18:05'),
(41, 'Hostes', 'Hostes', 'hostes@hostes.com', 'Hostes', '1b7674d696d2e744234f55de60193c90ddc9d92a622efad1d954ba2bc7e7f4eeba78eaccf62d135f7850409fc6b21b606213134a2d4a5a60e772bb088b39c408', 5535273627, 3, '2024-01-02 20:29:20'),
(42, 'Jazmin ', 'Granados', 'correo@correo.com', 'Jgranados', 'ca3f707a54a431a9aafb8686338ff3418bc66b936338b58c28e92b79f1a66e0e225de37216fec9b9ebf4c913c544d081120bf6bc65291ac39a2e5b1ccabc0451', 55121546454, 2, '2024-01-03 21:12:32');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `destinations`
--
ALTER TABLE `destinations`
  ADD PRIMARY KEY (`id_destinations`);

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id_evento`);

--
-- Indices de la tabla `reservas_destinations`
--
ALTER TABLE `reservas_destinations`
  ADD PRIMARY KEY (`id_reserva_D`),
  ADD KEY `id_destination` (`name_destination`);

--
-- Indices de la tabla `reservas_eventos`
--
ALTER TABLE `reservas_eventos`
  ADD PRIMARY KEY (`id_reserva_E`),
  ADD KEY `id_evento` (`name_evento`);

--
-- Indices de la tabla `reservas_restaurante`
--
ALTER TABLE `reservas_restaurante`
  ADD PRIMARY KEY (`id_reserva_R`),
  ADD KEY `nombre_restaurante` (`nombre_restaurante`);

--
-- Indices de la tabla `restaurantes`
--
ALTER TABLE `restaurantes`
  ADD PRIMARY KEY (`id_restaurante`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `usuarios_ibfk_1` (`rol_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `destinations`
--
ALTER TABLE `destinations`
  MODIFY `id_destinations` int(45) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id_evento` int(45) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `reservas_destinations`
--
ALTER TABLE `reservas_destinations`
  MODIFY `id_reserva_D` int(45) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT de la tabla `reservas_eventos`
--
ALTER TABLE `reservas_eventos`
  MODIFY `id_reserva_E` int(45) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `reservas_restaurante`
--
ALTER TABLE `reservas_restaurante`
  MODIFY `id_reserva_R` int(45) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1178;

--
-- AUTO_INCREMENT de la tabla `restaurantes`
--
ALTER TABLE `restaurantes`
  MODIFY `id_restaurante` int(45) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(45) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(45) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `reservas_destinations`
--
ALTER TABLE `reservas_destinations`
  ADD CONSTRAINT `reservas_destinations_ibfk_1` FOREIGN KEY (`name_destination`) REFERENCES `destinations` (`id_destinations`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reservas_eventos`
--
ALTER TABLE `reservas_eventos`
  ADD CONSTRAINT `reservas_eventos_ibfk_1` FOREIGN KEY (`name_evento`) REFERENCES `eventos` (`id_evento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reservas_restaurante`
--
ALTER TABLE `reservas_restaurante`
  ADD CONSTRAINT `reservas_restaurante_ibfk_1` FOREIGN KEY (`nombre_restaurante`) REFERENCES `restaurantes` (`id_restaurante`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
