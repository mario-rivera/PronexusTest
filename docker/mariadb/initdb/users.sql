CREATE TABLE users (
  id int(11) unsigned NOT NULL AUTO_INCREMENT,
  username varchar(100) NOT NULL UNIQUE,
  password varchar(255) NOT NULL,
  roles varchar(255) NOT NULL,
  PRIMARY KEY (id)
);

INSERT IGNORE INTO users(username, password, roles)
VALUES('admin', '$2y$10$3i9/lVd8UOFIJ6PAMFt8gu3/r5g0qeCJvoSlLCsvMTythye19F77a','ROLE_ADMIN');