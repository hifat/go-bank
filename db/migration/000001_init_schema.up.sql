CREATE TABLE accounts (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  owner VARCHAR(50) NOT NULL,
  balance BIGINT NOT NULL,
  currency VARCHAR(30) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT (now())
);

CREATE TABLE entries (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  account_id BIGINT UNSIGNED NOT NULL,
  amount INT NOT NULL COMMENT "can be negative or positive",
  created_at TIMESTAMP NOT NULL DEFAULT (now())
);

CREATE TABLE transfers (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  from_account_id BIGINT UNSIGNED NOT NULL,
  to_account_id BIGINT UNSIGNED NOT NULL,
  amount BIGINT NOT NULL COMMENT "must be positive",
  created_at TIMESTAMP NOT NULL DEFAULT (now())
);

ALTER TABLE entries ADD FOREIGN KEY (account_id) REFERENCES accounts (id);

ALTER TABLE transfers ADD FOREIGN KEY (from_account_id) REFERENCES accounts (id);

ALTER TABLE transfers ADD FOREIGN KEY (to_account_id) REFERENCES accounts (id);

CREATE INDEX index_owner ON accounts (owner);

CREATE INDEX index_account ON entries (account_id);

CREATE INDEX index_from_account_id ON transfers (from_account_id);

CREATE INDEX index_to_account_id ON transfers (to_account_id);

CREATE INDEX index_account_transfer ON transfers (from_account_id, to_account_id);
