CREATE TABLE accounts (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  user_id VARCHAR(30) NOT NULL,
  balance BIGINT,
  currency VARCHAR(30),
  created_at TIMESTAMP DEFAULT (now())
);

CREATE TABLE entries (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  account_id INT UNSIGNED NOT NULL,
  amount INT NOT NULL,
  created_at TIMESTAMP DEFAULT (now())
);

CREATE TABLE transfers (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  from_account_id bigint NOT NULL,
  to_account_id bigint NOT NULL,
  amount bigint NOT NULL,
  created_at TIMESTAMP DEFAULT (now())
);

-- ALTER TABLE entries ADD FOREIGN KEY (account_id) REFERENCES accounts (id);

-- ALTER TABLE transfers ADD FOREIGN KEY (from_account_id) REFERENCES accounts (id);

-- ALTER TABLE transfers ADD FOREIGN KEY (to_account_id) REFERENCES accounts (id);

-- CREATE INDEX ON accounts (user_id);

-- CREATE INDEX ON entries (account_id);

-- CREATE INDEX ON transfers (from_account_id);

-- CREATE INDEX ON transfers (to_account_id);

-- CREATE INDEX ON transfers (from_account_id, to_account_id);

-- COMMENT ON COLUMN "entries"."amount" IS 'can be negative or positive';

-- COMMENT ON COLUMN "transfers"."amount" IS 'must be positive';