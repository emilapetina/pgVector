CREATE EXTENSION IF NOT EXISTS vector;

CREATE TABLE IF NOT EXISTS app_metadata (
    id SERIAL PRIMARY KEY,
    key TEXT UNIQUE NOT NULL,
    value TEXT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

INSERT INTO app_metadata (key, value)
VALUES ('database_status', 'pgvector database initialized')
ON CONFLICT (key) DO UPDATE SET value = EXCLUDED.value;

CREATE TABLE IF NOT EXISTS movies (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    overview TEXT,
    release_year INT,
    genres TEXT[],
    rating NUMERIC(3, 1),
    embedding VECTOR(1536),
    created_at TIMESTAMPTZ DEFAULT NOW()
);
