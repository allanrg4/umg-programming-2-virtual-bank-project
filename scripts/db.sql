CREATE TABLE `users` (
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `username` VARCHAR(255) NOT NULL UNIQUE,
    `password` VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `users`
    (`username`, `password`)
VALUES
    ('admin', 'admin'),
    ('user', 'user');
