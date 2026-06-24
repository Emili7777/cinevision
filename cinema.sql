-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Giu 24, 2026 alle 13:37
-- Versione del server: 12.3.2-MariaDB
-- Versione PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cinema`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `acquisto`
--

CREATE TABLE `acquisto` (
  `id_acquisto` int(11) NOT NULL,
  `prezzo_biglietto` decimal(5,2) NOT NULL,
  `metodo_pagamento` varchar(30) NOT NULL,
  `id_biglietto` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `acquisto`
--

INSERT INTO `acquisto` (`id_acquisto`, `prezzo_biglietto`, `metodo_pagamento`, `id_biglietto`, `id_cliente`) VALUES
(1, 5.60, 'Carta di credito', 1, 1),
(2, 5.60, 'PayPal', 2, 1),
(3, 8.00, 'Carta di debito', 3, 2),
(4, 8.00, 'Carta di credito', 4, 2),
(5, 5.60, 'PayPal', 5, 3),
(6, 5.60, 'Carta di credito', 6, 3),
(7, 8.00, 'Carta di debito', 7, 4),
(8, 8.00, 'PayPal', 8, 4),
(9, 8.00, 'Carta di credito', 9, 5),
(10, 8.00, 'Carta di debito', 10, 5),
(11, 5.60, 'Carta di debito', 11, 1),
(12, 8.00, 'PayPal', 12, 4),
(13, 5.60, 'PayPal', 13, 1),
(14, 5.60, 'Carta di credito', 14, 1),
(15, 8.00, 'Carta di debito', 15, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 3, 'add_permission'),
(6, 'Can change permission', 3, 'change_permission'),
(7, 'Can delete permission', 3, 'delete_permission'),
(8, 'Can view permission', 3, 'view_permission'),
(9, 'Can add group', 2, 'add_group'),
(10, 'Can change group', 2, 'change_group'),
(11, 'Can delete group', 2, 'delete_group'),
(12, 'Can view group', 2, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add cliente', 9, 'add_cliente'),
(26, 'Can change cliente', 9, 'change_cliente'),
(27, 'Can delete cliente', 9, 'delete_cliente'),
(28, 'Can view cliente', 9, 'view_cliente'),
(29, 'Can add film', 10, 'add_film'),
(30, 'Can change film', 10, 'change_film'),
(31, 'Can delete film', 10, 'delete_film'),
(32, 'Can view film', 10, 'view_film'),
(33, 'Can add operatore', 12, 'add_operatore'),
(34, 'Can change operatore', 12, 'change_operatore'),
(35, 'Can delete operatore', 12, 'delete_operatore'),
(36, 'Can view operatore', 12, 'view_operatore'),
(37, 'Can add posto', 13, 'add_posto'),
(38, 'Can change posto', 13, 'change_posto'),
(39, 'Can delete posto', 13, 'delete_posto'),
(40, 'Can view posto', 13, 'view_posto'),
(41, 'Can add sala', 15, 'add_sala'),
(42, 'Can change sala', 15, 'change_sala'),
(43, 'Can delete sala', 15, 'delete_sala'),
(44, 'Can view sala', 15, 'view_sala'),
(45, 'Can add biglietto', 8, 'add_biglietto'),
(46, 'Can change biglietto', 8, 'change_biglietto'),
(47, 'Can delete biglietto', 8, 'delete_biglietto'),
(48, 'Can view biglietto', 8, 'view_biglietto'),
(49, 'Can add acquisto', 7, 'add_acquisto'),
(50, 'Can change acquisto', 7, 'change_acquisto'),
(51, 'Can delete acquisto', 7, 'delete_acquisto'),
(52, 'Can view acquisto', 7, 'view_acquisto'),
(53, 'Can add spettacolo', 16, 'add_spettacolo'),
(54, 'Can change spettacolo', 16, 'change_spettacolo'),
(55, 'Can delete spettacolo', 16, 'delete_spettacolo'),
(56, 'Can view spettacolo', 16, 'view_spettacolo'),
(57, 'Can add gestione', 11, 'add_gestione'),
(58, 'Can change gestione', 11, 'change_gestione'),
(59, 'Can delete gestione', 11, 'delete_gestione'),
(60, 'Can view gestione', 11, 'view_gestione'),
(61, 'Can add recensione', 14, 'add_recensione'),
(62, 'Can change recensione', 14, 'change_recensione'),
(63, 'Can delete recensione', 14, 'delete_recensione'),
(64, 'Can view recensione', 14, 'view_recensione');

-- --------------------------------------------------------

--
-- Struttura della tabella `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `biglietto`
--

CREATE TABLE `biglietto` (
  `id_biglietto` int(11) NOT NULL,
  `data_acquisto` date NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_posto` int(11) NOT NULL,
  `id_spettacolo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `biglietto`
--

INSERT INTO `biglietto` (`id_biglietto`, `data_acquisto`, `id_cliente`, `id_posto`, `id_spettacolo`) VALUES
(1, '2026-06-20', 1, 1, 1),
(2, '2026-06-20', 1, 26, 3),
(3, '2026-06-21', 2, 2, 2),
(4, '2026-06-21', 2, 6, 5),
(5, '2026-06-21', 3, 51, 4),
(6, '2026-06-21', 3, 31, 6),
(7, '2026-06-22', 4, 52, 7),
(8, '2026-06-22', 4, 7, 8),
(9, '2026-06-22', 5, 27, 9),
(10, '2026-06-22', 5, 8, 5),
(11, '2026-06-22', 1, 32, 6),
(12, '2026-06-22', 4, 28, 10),
(13, '2026-06-23', 1, 63, 11),
(14, '2026-06-24', 1, 2, 1),
(15, '2026-06-24', 2, 44, 14);

-- --------------------------------------------------------

--
-- Struttura della tabella `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(255) NOT NULL,
  `premium` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nome`, `cognome`, `email`, `password`, `premium`) VALUES
(1, 'Mario', 'Rossi', 'mario.rossi@email.com', 'pbkdf2_sha256$1200000$IinDZoG4k11uuwYWk8zgxv$OzQf98pCf84JSHQugESj38nq/jnmH5Bo9aIp/ZaGovM=', 1),
(2, 'Giulia', 'Bianchi', 'giulia.bianchi@email.com', 'pbkdf2_sha256$1200000$IinDZoG4k11uuwYWk8zgxv$OzQf98pCf84JSHQugESj38nq/jnmH5Bo9aIp/ZaGovM=', 0),
(3, 'Luca', 'Verdi', 'luca.verdi@email.com', 'pbkdf2_sha256$1200000$IinDZoG4k11uuwYWk8zgxv$OzQf98pCf84JSHQugESj38nq/jnmH5Bo9aIp/ZaGovM=', 1),
(4, 'Sara', 'Neri', 'sara.neri@email.com', 'pbkdf2_sha256$1200000$IinDZoG4k11uuwYWk8zgxv$OzQf98pCf84JSHQugESj38nq/jnmH5Bo9aIp/ZaGovM=', 0),
(5, 'Alessandro', 'Romano', 'alessandro.romano@email.com', 'pbkdf2_sha256$1200000$IinDZoG4k11uuwYWk8zgxv$OzQf98pCf84JSHQugESj38nq/jnmH5Bo9aIp/ZaGovM=', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'group'),
(3, 'auth', 'permission'),
(4, 'auth', 'user'),
(7, 'cinema', 'acquisto'),
(8, 'cinema', 'biglietto'),
(9, 'cinema', 'cliente'),
(10, 'cinema', 'film'),
(11, 'cinema', 'gestione'),
(12, 'cinema', 'operatore'),
(13, 'cinema', 'posto'),
(14, 'cinema', 'recensione'),
(15, 'cinema', 'sala'),
(16, 'cinema', 'spettacolo'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Struttura della tabella `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2026-06-22 17:32:05.738457'),
(2, 'auth', '0001_initial', '2026-06-22 17:32:05.917478'),
(3, 'admin', '0001_initial', '2026-06-22 17:32:05.958735'),
(4, 'admin', '0002_logentry_remove_auto_add', '2026-06-22 17:32:05.964489'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2026-06-22 17:32:05.969818'),
(6, 'contenttypes', '0002_remove_content_type_name', '2026-06-22 17:32:06.014127'),
(7, 'auth', '0002_alter_permission_name_max_length', '2026-06-22 17:32:06.035199'),
(8, 'auth', '0003_alter_user_email_max_length', '2026-06-22 17:32:06.050112'),
(9, 'auth', '0004_alter_user_username_opts', '2026-06-22 17:32:06.060231'),
(10, 'auth', '0005_alter_user_last_login_null', '2026-06-22 17:32:06.084284'),
(11, 'auth', '0006_require_contenttypes_0002', '2026-06-22 17:32:06.086383'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2026-06-22 17:32:06.094526'),
(13, 'auth', '0008_alter_user_username_max_length', '2026-06-22 17:32:06.110562'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2026-06-22 17:32:06.128146'),
(15, 'auth', '0010_alter_group_name_max_length', '2026-06-22 17:32:06.144716'),
(16, 'auth', '0011_update_proxy_permissions', '2026-06-22 17:32:06.152905'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2026-06-22 17:32:06.168710'),
(18, 'cinema', '0001_initial', '2026-06-22 17:32:06.501226'),
(19, 'sessions', '0001_initial', '2026-06-22 17:32:06.521433');

-- --------------------------------------------------------

--
-- Struttura della tabella `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `film`
--

CREATE TABLE `film` (
  `id_film` int(11) NOT NULL,
  `titolo` varchar(100) NOT NULL,
  `genere` varchar(50) NOT NULL,
  `durata` int(11) NOT NULL,
  `anno_uscita` int(11) NOT NULL,
  `regista` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `film`
--

INSERT INTO `film` (`id_film`, `titolo`, `genere`, `durata`, `anno_uscita`, `regista`) VALUES
(1, 'Backrooms', 'Horror/Mistero', 95, 2025, 'Kane Parsons'),
(2, 'Michael', 'Biografico/Musicale', 140, 2025, 'Antoine Fuqua'),
(3, 'Il ragazzo e l\'airone', 'Animazione/Fantasy', 124, 2023, 'Hayao Miyazaki'),
(4, 'Povere creature', 'Drammatico/Fantastico', 141, 2023, 'Yorgos Lanthimos');

-- --------------------------------------------------------

--
-- Struttura della tabella `gestione`
--

CREATE TABLE `gestione` (
  `id_gestione` int(11) NOT NULL,
  `id_operatore` int(11) NOT NULL,
  `id_spettacolo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `gestione`
--

INSERT INTO `gestione` (`id_gestione`, `id_operatore`, `id_spettacolo`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 2, 4),
(5, 3, 5),
(6, 1, 6),
(7, 3, 7),
(8, 2, 8),
(9, 1, 9),
(10, 2, 10),
(11, 1, 11),
(12, 3, 12);

-- --------------------------------------------------------

--
-- Struttura della tabella `operatore`
--

CREATE TABLE `operatore` (
  `id_operatore` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(255) NOT NULL,
  `tipo_di_contratto` varchar(50) NOT NULL,
  `data_assunzione` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `operatore`
--

INSERT INTO `operatore` (`id_operatore`, `nome`, `cognome`, `email`, `password`, `tipo_di_contratto`, `data_assunzione`) VALUES
(1, 'Andrea', 'Ferrari', 'andrea.ferrari@cinevision.com', 'pbkdf2_sha256$1200000$jOl3SCpLtZQMts2dITHLHK$rSRw/3zOwWFHB0eA20b+YamlvR0X3p9vSxkosNFRoJE=', 'Tempo indeterminato', '2022-09-15'),
(2, 'Martina', 'Costa', 'martina.costa@cinevision.com', 'pbkdf2_sha256$1200000$jOl3SCpLtZQMts2dITHLHK$rSRw/3zOwWFHB0eA20b+YamlvR0X3p9vSxkosNFRoJE=', 'Part-time', '2023-03-01'),
(3, 'Davide', 'Moretti', 'davide.moretti@cinevision.com', 'pbkdf2_sha256$1200000$jOl3SCpLtZQMts2dITHLHK$rSRw/3zOwWFHB0eA20b+YamlvR0X3p9vSxkosNFRoJE=', 'Tempo determinato', '2024-01-20');

-- --------------------------------------------------------

--
-- Struttura della tabella `posto`
--

CREATE TABLE `posto` (
  `id_posto` int(11) NOT NULL,
  `fila` varchar(5) NOT NULL,
  `numero` int(11) NOT NULL,
  `id_sala` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `posto`
--

INSERT INTO `posto` (`id_posto`, `fila`, `numero`, `id_sala`) VALUES
(1, 'A', 1, 1),
(2, 'A', 2, 1),
(3, 'A', 3, 1),
(4, 'A', 4, 1),
(5, 'A', 5, 1),
(6, 'B', 1, 1),
(7, 'B', 2, 1),
(8, 'B', 3, 1),
(9, 'B', 4, 1),
(10, 'B', 5, 1),
(11, 'C', 1, 1),
(12, 'C', 2, 1),
(13, 'C', 3, 1),
(14, 'C', 4, 1),
(15, 'C', 5, 1),
(16, 'D', 1, 1),
(17, 'D', 2, 1),
(18, 'D', 3, 1),
(19, 'D', 4, 1),
(20, 'D', 5, 1),
(21, 'E', 1, 1),
(22, 'E', 2, 1),
(23, 'E', 3, 1),
(24, 'E', 4, 1),
(25, 'E', 5, 1),
(26, 'A', 1, 2),
(27, 'A', 2, 2),
(28, 'A', 3, 2),
(29, 'A', 4, 2),
(30, 'A', 5, 2),
(31, 'B', 1, 2),
(32, 'B', 2, 2),
(33, 'B', 3, 2),
(34, 'B', 4, 2),
(35, 'B', 5, 2),
(36, 'C', 1, 2),
(37, 'C', 2, 2),
(38, 'C', 3, 2),
(39, 'C', 4, 2),
(40, 'C', 5, 2),
(41, 'D', 1, 2),
(42, 'D', 2, 2),
(43, 'D', 3, 2),
(44, 'D', 4, 2),
(45, 'D', 5, 2),
(46, 'E', 1, 2),
(47, 'E', 2, 2),
(48, 'E', 3, 2),
(49, 'E', 4, 2),
(50, 'E', 5, 2),
(51, 'A', 1, 3),
(52, 'A', 2, 3),
(53, 'A', 3, 3),
(54, 'A', 4, 3),
(55, 'A', 5, 3),
(56, 'B', 1, 3),
(57, 'B', 2, 3),
(58, 'B', 3, 3),
(59, 'B', 4, 3),
(60, 'B', 5, 3),
(61, 'C', 1, 3),
(62, 'C', 2, 3),
(63, 'C', 3, 3),
(64, 'C', 4, 3),
(65, 'C', 5, 3),
(66, 'D', 1, 3),
(67, 'D', 2, 3),
(68, 'D', 3, 3),
(69, 'D', 4, 3),
(70, 'D', 5, 3),
(71, 'E', 1, 3),
(72, 'E', 2, 3),
(73, 'E', 3, 3),
(74, 'E', 4, 3),
(75, 'E', 5, 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `recensione`
--

CREATE TABLE `recensione` (
  `id_recensione` int(11) NOT NULL,
  `valutazione` int(11) NOT NULL,
  `descrizione` longtext NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_film` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `recensione`
--

INSERT INTO `recensione` (`id_recensione`, `valutazione`, `descrizione`, `id_cliente`, `id_film`) VALUES
(1, 5, 'Atmosfera inquietante e misteriosa, perfetto per chi ama l’horror psicologico.', 1, 1),
(2, 4, 'Film coinvolgente, molto interessante dal punto di vista musicale e biografico.', 1, 2),
(3, 4, 'Backrooms riesce a creare tensione con pochi elementi ma ben gestiti.', 2, 1),
(4, 5, 'Film originale, visivamente bellissimo e con una protagonista memorabile.', 2, 4),
(5, 5, 'Animazione splendida e storia poetica, piena di significati.', 3, 3),
(6, 4, 'Buon ritmo e interpretazioni convincenti, soprattutto nelle scene musicali.', 3, 2),
(7, 4, 'Molto bello e delicato, anche se in alcuni momenti è complesso da seguire.', 4, 3),
(8, 5, 'Povere creature è strano, elegante e molto diverso dai soliti film.', 4, 4),
(9, 3, 'Idea interessante e atmosfera riuscita, ma avrei preferito più spiegazioni.', 5, 1),
(10, 4, 'Film particolare e ben girato, con una forte identità visiva.', 5, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `sala`
--

CREATE TABLE `sala` (
  `id_sala` int(11) NOT NULL,
  `nome_sala` varchar(50) NOT NULL,
  `capienza` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `sala`
--

INSERT INTO `sala` (`id_sala`, `nome_sala`, `capienza`) VALUES
(1, 'Sala 1', 25),
(2, 'Sala 2', 25),
(3, 'Sala 3', 25);

-- --------------------------------------------------------

--
-- Struttura della tabella `spettacolo`
--

CREATE TABLE `spettacolo` (
  `id_spettacolo` int(11) NOT NULL,
  `data_spettacolo` date NOT NULL,
  `ora_inizio` time(6) NOT NULL,
  `id_film` int(11) NOT NULL,
  `id_operatore` int(11) DEFAULT NULL,
  `id_sala` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `spettacolo`
--

INSERT INTO `spettacolo` (`id_spettacolo`, `data_spettacolo`, `ora_inizio`, `id_film`, `id_operatore`, `id_sala`) VALUES
(1, '2026-06-19', '18:00:00.000000', 1, 1, 1),
(2, '2026-06-25', '21:00:00.000000', 1, 1, 1),
(3, '2026-06-26', '18:30:00.000000', 2, 2, 2),
(4, '2026-06-24', '15:00:00.000000', 3, 1, 1),
(5, '2026-06-24', '11:00:00.000000', 4, 1, 3),
(6, '2026-06-24', '21:15:00.000000', 2, 1, 3),
(7, '2026-06-30', '16:30:00.000000', 3, 1, 3),
(8, '2026-07-01', '22:30:00.000000', 4, 1, 1),
(9, '2026-06-24', '19:45:00.000000', 1, 1, 2),
(10, '2026-07-03', '22:00:00.000000', 2, 1, 2),
(11, '2026-07-04', '18:00:00.000000', 3, 1, 3),
(12, '2026-07-05', '20:30:00.000000', 4, 3, 1),
(13, '2026-07-24', '21:00:00.000000', 1, 1, 3),
(14, '2026-06-24', '15:00:00.000000', 3, 1, 2),
(15, '2026-06-24', '20:20:00.000000', 2, 1, 1),
(23, '2026-06-24', '18:00:00.000000', 1, 1, 1),
(24, '2026-07-11', '20:05:00.000000', 2, NULL, 1),
(25, '2026-07-13', '15:00:00.000000', 3, 1, 1),
(26, '2026-06-24', '17:00:00.000000', 4, 1, 3),
(27, '2026-07-14', '18:30:00.000000', 4, 1, 2);

--
-- Trigger `spettacolo`
--
DELIMITER $$
CREATE TRIGGER `controllo_spettacolo_insert` BEFORE INSERT ON `spettacolo` FOR EACH ROW BEGIN
    IF NEW.data_spettacolo < CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Non puoi modificare uno spettacolo inserendo una data precedente a oggi';
	END IF;
	IF NEW.data_spettacolo < CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Non puoi inserire uno \t spettacolo con data precedente a oggi';
	END IF;
    IF EXISTS (
        SELECT 1
        FROM spettacolo s
        JOIN film f_esistente ON s.id_film = f_esistente.id_film
        JOIN film f_nuovo ON f_nuovo.id_film = NEW.id_film
        WHERE s.id_sala = NEW.id_sala
        AND s.data_spettacolo = NEW.data_spettacolo
        AND TIMESTAMP(NEW.data_spettacolo, NEW.ora_inizio) <
            DATE_ADD(
                TIMESTAMP(s.data_spettacolo, s.ora_inizio),
                INTERVAL (f_esistente.durata + 30) MINUTE
            )
        AND TIMESTAMP(s.data_spettacolo, s.ora_inizio) <
            DATE_ADD(
                TIMESTAMP(NEW.data_spettacolo, NEW.ora_inizio),
                INTERVAL (f_nuovo.durata + 30) MINUTE
            )
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Sala occupata: lo spettacolo si sovrappone a un altro film';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `controllo_spettacolo_update` BEFORE UPDATE ON `spettacolo` FOR EACH ROW BEGIN
    IF NEW.data_spettacolo < CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Non puoi modificare uno spettacolo inserendo una data precedente a oggi';
    END IF;
    IF EXISTS (
        SELECT 1
        FROM spettacolo s
        JOIN film f_esistente ON s.id_film = f_esistente.id_film
        JOIN film f_nuovo ON f_nuovo.id_film = NEW.id_film
        WHERE s.id_sala = NEW.id_sala
        AND s.data_spettacolo = NEW.data_spettacolo
        AND s.id_spettacolo <> OLD.id_spettacolo
        AND TIMESTAMP(NEW.data_spettacolo, NEW.ora_inizio) <
            DATE_ADD(
                TIMESTAMP(s.data_spettacolo, s.ora_inizio),
                INTERVAL (f_esistente.durata + 30) MINUTE
            )
        AND TIMESTAMP(s.data_spettacolo, s.ora_inizio) <
            DATE_ADD(
                TIMESTAMP(NEW.data_spettacolo, NEW.ora_inizio),
                INTERVAL (f_nuovo.durata + 30) MINUTE
            )
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Sala occupata: lo spettacolo si sovrappone a un altro film';
    END IF;
END
$$
DELIMITER ;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `acquisto`
--
ALTER TABLE `acquisto`
  ADD PRIMARY KEY (`id_acquisto`),
  ADD UNIQUE KEY `id_biglietto` (`id_biglietto`),
  ADD KEY `Acquisto_id_cliente_f49ef166_fk_Cliente_id_cliente` (`id_cliente`);

--
-- Indici per le tabelle `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indici per le tabelle `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indici per le tabelle `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indici per le tabelle `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indici per le tabelle `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indici per le tabelle `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indici per le tabelle `biglietto`
--
ALTER TABLE `biglietto`
  ADD PRIMARY KEY (`id_biglietto`),
  ADD KEY `Biglietto_id_spettacolo_d3831307_fk_Spettacolo_id_spettacolo` (`id_spettacolo`),
  ADD KEY `Biglietto_id_cliente_9f6246d2_fk_Cliente_id_cliente` (`id_cliente`),
  ADD KEY `Biglietto_id_posto_fd1bbc89_fk_Posto_id_posto` (`id_posto`);

--
-- Indici per le tabelle `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indici per le tabelle `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indici per le tabelle `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indici per le tabelle `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indici per le tabelle `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id_film`);

--
-- Indici per le tabelle `gestione`
--
ALTER TABLE `gestione`
  ADD PRIMARY KEY (`id_gestione`),
  ADD KEY `Gestione_id_operatore_9c4795cc_fk_Operatore_id_operatore` (`id_operatore`),
  ADD KEY `Gestione_id_spettacolo_7b669836_fk_Spettacolo_id_spettacolo` (`id_spettacolo`);

--
-- Indici per le tabelle `operatore`
--
ALTER TABLE `operatore`
  ADD PRIMARY KEY (`id_operatore`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indici per le tabelle `posto`
--
ALTER TABLE `posto`
  ADD PRIMARY KEY (`id_posto`),
  ADD KEY `Posto_id_sala_a87f2146_fk_Sala_id_sala` (`id_sala`);

--
-- Indici per le tabelle `recensione`
--
ALTER TABLE `recensione`
  ADD PRIMARY KEY (`id_recensione`),
  ADD UNIQUE KEY `Recensione_id_cliente_id_film_71585eac_uniq` (`id_cliente`,`id_film`),
  ADD KEY `Recensione_id_film_29540cb9_fk_Film_id_film` (`id_film`);

--
-- Indici per le tabelle `sala`
--
ALTER TABLE `sala`
  ADD PRIMARY KEY (`id_sala`);

--
-- Indici per le tabelle `spettacolo`
--
ALTER TABLE `spettacolo`
  ADD PRIMARY KEY (`id_spettacolo`),
  ADD KEY `Spettacolo_id_film_0da933cc_fk_Film_id_film` (`id_film`),
  ADD KEY `Spettacolo_id_operatore_18e43edf_fk_Operatore_id_operatore` (`id_operatore`),
  ADD KEY `Spettacolo_id_sala_f5d1b6d5_fk_Sala_id_sala` (`id_sala`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `acquisto`
--
ALTER TABLE `acquisto`
  MODIFY `id_acquisto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT per la tabella `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT per la tabella `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `biglietto`
--
ALTER TABLE `biglietto`
  MODIFY `id_biglietto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT per la tabella `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT per la tabella `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT per la tabella `film`
--
ALTER TABLE `film`
  MODIFY `id_film` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `gestione`
--
ALTER TABLE `gestione`
  MODIFY `id_gestione` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT per la tabella `operatore`
--
ALTER TABLE `operatore`
  MODIFY `id_operatore` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `posto`
--
ALTER TABLE `posto`
  MODIFY `id_posto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT per la tabella `recensione`
--
ALTER TABLE `recensione`
  MODIFY `id_recensione` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `sala`
--
ALTER TABLE `sala`
  MODIFY `id_sala` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `spettacolo`
--
ALTER TABLE `spettacolo`
  MODIFY `id_spettacolo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `acquisto`
--
ALTER TABLE `acquisto`
  ADD CONSTRAINT `Acquisto_id_biglietto_7dfa3f21_fk_Biglietto_id_biglietto` FOREIGN KEY (`id_biglietto`) REFERENCES `biglietto` (`id_biglietto`),
  ADD CONSTRAINT `Acquisto_id_cliente_f49ef166_fk_Cliente_id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);

--
-- Limiti per la tabella `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Limiti per la tabella `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Limiti per la tabella `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Limiti per la tabella `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Limiti per la tabella `biglietto`
--
ALTER TABLE `biglietto`
  ADD CONSTRAINT `Biglietto_id_cliente_9f6246d2_fk_Cliente_id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `Biglietto_id_posto_fd1bbc89_fk_Posto_id_posto` FOREIGN KEY (`id_posto`) REFERENCES `posto` (`id_posto`),
  ADD CONSTRAINT `Biglietto_id_spettacolo_d3831307_fk_Spettacolo_id_spettacolo` FOREIGN KEY (`id_spettacolo`) REFERENCES `spettacolo` (`id_spettacolo`);

--
-- Limiti per la tabella `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Limiti per la tabella `gestione`
--
ALTER TABLE `gestione`
  ADD CONSTRAINT `Gestione_id_operatore_9c4795cc_fk_Operatore_id_operatore` FOREIGN KEY (`id_operatore`) REFERENCES `operatore` (`id_operatore`),
  ADD CONSTRAINT `Gestione_id_spettacolo_7b669836_fk_Spettacolo_id_spettacolo` FOREIGN KEY (`id_spettacolo`) REFERENCES `spettacolo` (`id_spettacolo`);

--
-- Limiti per la tabella `posto`
--
ALTER TABLE `posto`
  ADD CONSTRAINT `Posto_id_sala_a87f2146_fk_Sala_id_sala` FOREIGN KEY (`id_sala`) REFERENCES `sala` (`id_sala`);

--
-- Limiti per la tabella `recensione`
--
ALTER TABLE `recensione`
  ADD CONSTRAINT `Recensione_id_cliente_e5e617c2_fk_Cliente_id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `Recensione_id_film_29540cb9_fk_Film_id_film` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`);

--
-- Limiti per la tabella `spettacolo`
--
ALTER TABLE `spettacolo`
  ADD CONSTRAINT `Spettacolo_id_film_0da933cc_fk_Film_id_film` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`),
  ADD CONSTRAINT `Spettacolo_id_operatore_18e43edf_fk_Operatore_id_operatore` FOREIGN KEY (`id_operatore`) REFERENCES `operatore` (`id_operatore`),
  ADD CONSTRAINT `Spettacolo_id_sala_f5d1b6d5_fk_Sala_id_sala` FOREIGN KEY (`id_sala`) REFERENCES `sala` (`id_sala`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
