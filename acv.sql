-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 10.1.2.122:3306
-- Tiempo de generación: 05-08-2019 a las 20:08:47
-- Versión del servidor: 10.2.24-MariaDB
-- Versión de PHP: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `u224527687_acv`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_afiliaciones`
--

CREATE TABLE `tbl_afiliaciones` (
  `id_afiliacion` int(11) NOT NULL,
  `id_plan_medicina_prepagada` int(11) NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `fecha_inicio_afiliacion` date NOT NULL,
  `fecha_fin_afiliacion` date NOT NULL,
  `estado_afiliacion` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ACTIVO',
  `fecha_registro_afiliacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion_afiliacion` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_afiliaciones_beneficios`
--

CREATE TABLE `tbl_afiliaciones_beneficios` (
  `id_afiliacion_beneficio` bigint(11) NOT NULL,
  `id_afiliacion` int(11) NOT NULL,
  `nombre_beneficio` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `cantidad_beneficio` int(11) NOT NULL,
  `usado_beneficio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_consultas`
--

CREATE TABLE `tbl_consultas` (
  `id_consulta` int(11) NOT NULL,
  `id_historia_clinica` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `anamnesis_consulta` text COLLATE utf8_unicode_ci NOT NULL,
  `peso_consulta` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `temperatura_consulta` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `frecuencia_cardiaca_consulta` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `frecuencia_respiratoria_consulta` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `examen_clinico_consulta` text COLLATE utf8_unicode_ci NOT NULL,
  `receta_medica_consulta` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado_consulta` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ACTIVO',
  `fecha_consulta` date NOT NULL,
  `fecha_registro_consulta` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion_consulta` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_historias_clinicas`
--

CREATE TABLE `tbl_historias_clinicas` (
  `id_historia_clinica` int(11) NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `estado_historia_clinica` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ACTIVO',
  `fecha_historia_clinica` date NOT NULL,
  `fecha_registro_historia_clinica` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion_historia_clinica` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_pacientes`
--

CREATE TABLE `tbl_pacientes` (
  `id_paciente` int(11) NOT NULL,
  `id_propietario` int(11) NOT NULL,
  `nombre_paciente` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `especie_paciente` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `raza_paciente` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sexo_paciente` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_nacimiento_paciente` date NOT NULL,
  `chip_paciente` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `foto_paciente` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion_paciente` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `estado_paciente` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ACTIVO',
  `fecha_registro_paciente` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion_paciente` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_planes_medicina_prepagada`
--

CREATE TABLE `tbl_planes_medicina_prepagada` (
  `id_plan_medicina_prepagada` int(11) NOT NULL,
  `nombre_plan_medicina_prepagada` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion_plan_medicina_prepagada` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado_plan_medicina_prepagada` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ACTIVO',
  `duracion_plan_medicina_prepagada` int(11) NOT NULL,
  `fecha_registro_plan_medicina_prepagada` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion_plan_medicina_prepagada` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_planes_medicina_prepagada_beneficios`
--

CREATE TABLE `tbl_planes_medicina_prepagada_beneficios` (
  `id_plan_medicina_prepagada` int(11) NOT NULL,
  `nombre_beneficio` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `cantidad_beneficio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_propietarios`
--

CREATE TABLE `tbl_propietarios` (
  `id_propietario` int(11) NOT NULL,
  `nombres_propietario` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `apellidos_propietario` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `identificacion_propietario` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'No registrado',
  `direccion_propietario` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `correo_electronico_propietario` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `estado_propietario` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ACTIVO',
  `fecha_registro_propietario` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion_propietario` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_propietarios_numeros_contacto`
--

CREATE TABLE `tbl_propietarios_numeros_contacto` (
  `id_numero_contacto` int(11) NOT NULL,
  `id_propietario` int(11) NOT NULL,
  `numero_contacto_propietario` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `estado_numero_contacto` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ACTIVO',
  `fecha_registro_numero_contacto` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion_numero_contacto` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuarios`
--

CREATE TABLE `tbl_usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombres_usuario` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `apellidos_usuario` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `correo_electronico_usuario` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `cargo_usuario` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `numero_contacto_usuario` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `usuario_usuario` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `contrasena_usuario` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `estado_usuario` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ACTIVO',
  `tipo_usuario` int(11) NOT NULL DEFAULT 2,
  `fecha_registro_usuario` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion_usuario` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_vacunas`
--

CREATE TABLE `tbl_vacunas` (
  `id_vacuna` int(11) NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `tipo_vacuna` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `medicamento_vacuna` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_vacuna` date DEFAULT NULL,
  `proxima_vacuna` date DEFAULT NULL,
  `fecha_registro_vacuna` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion_vacuna` datetime NOT NULL DEFAULT current_timestamp(),
  `estado_vacuna` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ACTIVO'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_afiliaciones`
--
ALTER TABLE `tbl_afiliaciones`
  ADD PRIMARY KEY (`id_afiliacion`);

--
-- Indices de la tabla `tbl_afiliaciones_beneficios`
--
ALTER TABLE `tbl_afiliaciones_beneficios`
  ADD PRIMARY KEY (`id_afiliacion_beneficio`);

--
-- Indices de la tabla `tbl_consultas`
--
ALTER TABLE `tbl_consultas`
  ADD PRIMARY KEY (`id_consulta`);

--
-- Indices de la tabla `tbl_historias_clinicas`
--
ALTER TABLE `tbl_historias_clinicas`
  ADD PRIMARY KEY (`id_historia_clinica`);

--
-- Indices de la tabla `tbl_pacientes`
--
ALTER TABLE `tbl_pacientes`
  ADD PRIMARY KEY (`id_paciente`);

--
-- Indices de la tabla `tbl_planes_medicina_prepagada`
--
ALTER TABLE `tbl_planes_medicina_prepagada`
  ADD PRIMARY KEY (`id_plan_medicina_prepagada`);

--
-- Indices de la tabla `tbl_propietarios`
--
ALTER TABLE `tbl_propietarios`
  ADD PRIMARY KEY (`id_propietario`);

--
-- Indices de la tabla `tbl_propietarios_numeros_contacto`
--
ALTER TABLE `tbl_propietarios_numeros_contacto`
  ADD PRIMARY KEY (`id_numero_contacto`);

--
-- Indices de la tabla `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `tbl_vacunas`
--
ALTER TABLE `tbl_vacunas`
  ADD PRIMARY KEY (`id_vacuna`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_afiliaciones`
--
ALTER TABLE `tbl_afiliaciones`
  MODIFY `id_afiliacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_afiliaciones_beneficios`
--
ALTER TABLE `tbl_afiliaciones_beneficios`
  MODIFY `id_afiliacion_beneficio` bigint(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_consultas`
--
ALTER TABLE `tbl_consultas`
  MODIFY `id_consulta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_historias_clinicas`
--
ALTER TABLE `tbl_historias_clinicas`
  MODIFY `id_historia_clinica` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_pacientes`
--
ALTER TABLE `tbl_pacientes`
  MODIFY `id_paciente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_planes_medicina_prepagada`
--
ALTER TABLE `tbl_planes_medicina_prepagada`
  MODIFY `id_plan_medicina_prepagada` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_propietarios`
--
ALTER TABLE `tbl_propietarios`
  MODIFY `id_propietario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_propietarios_numeros_contacto`
--
ALTER TABLE `tbl_propietarios_numeros_contacto`
  MODIFY `id_numero_contacto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_vacunas`
--
ALTER TABLE `tbl_vacunas`
  MODIFY `id_vacuna` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
