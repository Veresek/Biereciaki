CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT PRIMARY KEY (`id`),
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE `users` ADD PRIMARY KEY (`id`);
