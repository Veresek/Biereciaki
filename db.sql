-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Generation Time: Lis 14, 2025 at 09:14 AM
-- Wersja serwera: 9.5.0
-- Wersja PHP: 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `pythonapp`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `addresses`
--

CREATE TABLE `addresses` (
  `id` int NOT NULL,
  `x` int NOT NULL,
  `y` int NOT NULL,
  `deleted` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Zrzut danych tabeli `addresses`
--

INSERT INTO `addresses` (`id`, `x`, `y`, `deleted`) VALUES
(1, 123, 123, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `admins`
--

CREATE TABLE `admins` (
  `id` int NOT NULL,
  `name` varchar(200) NOT NULL,
  `surname` varchar(200) NOT NULL,
  `date_of_birth` date NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone_number` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Zrzut danych tabeli `admins`
--

INSERT INTO `admins` (`id`, `name`, `surname`, `date_of_birth`, `email`, `phone_number`) VALUES
(1, 'fsdfsdfs', 'sdfsd', '2020-01-01', 'fsdfsdfsd', 123123);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `events`
--

CREATE TABLE `events` (
  `id` int NOT NULL,
  `name` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `price` float NOT NULL,
  `id_admin` int NOT NULL,
  `id_adress` int NOT NULL,
  `deleted` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Zrzut danych tabeli `events`
--

INSERT INTO `events` (`id`, `name`, `date`, `price`, `id_admin`, `id_adress`, `deleted`) VALUES
(2, 'nowyevent', '2020-01-01', 4534, 1, 1, 1),
(3, 'cos', '2020-01-01', 120, 1, 1, 0),
(4, 'spotkanie2', '2025-11-30', 44, 1, 1, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `part/event`
--

CREATE TABLE `part/event` (
  `id_part` int NOT NULL,
  `id_event` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `participants`
--

CREATE TABLE `participants` (
  `id` int NOT NULL,
  `name` varchar(200) NOT NULL,
  `surname` varchar(200) NOT NULL,
  `date_of_birth` date NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone_number` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Zrzut danych tabeli `participants`
--

INSERT INTO `participants` (`id`, `name`, `surname`, `date_of_birth`, `email`, `phone_number`) VALUES
(1, 'imie', 'naziwsko', '2020-01-01', 'cos@example.com', 123456789),
(2, 'Anna', 'Baran', '1990-01-01', 'example@exaplme.com', 987654321);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_admin` (`id_admin`),
  ADD KEY `id_adress` (`id_adress`);

--
-- Indeksy dla tabeli `part/event`
--
ALTER TABLE `part/event`
  ADD KEY `id_event` (`id_event`),
  ADD KEY `id_part` (`id_part`);

--
-- Indeksy dla tabeli `participants`
--
ALTER TABLE `participants`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `events`
--
ALTER TABLE `events`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `participants`
--
ALTER TABLE `participants`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `admins` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `events_ibfk_2` FOREIGN KEY (`id_adress`) REFERENCES `addresses` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ograniczenia dla tabeli `part/event`
--
ALTER TABLE `part/event`
  ADD CONSTRAINT `part/event_ibfk_1` FOREIGN KEY (`id_event`) REFERENCES `events` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `part/event_ibfk_2` FOREIGN KEY (`id_part`) REFERENCES `participants` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
