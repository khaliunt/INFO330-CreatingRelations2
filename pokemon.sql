.mode csv
.import pokemon.csv imported_pokemon_data

-- First Normal Form

CREATE TABLE Pokemon (
    pokemon_id INTEGER PRIMARY KEY,
    abilities TEXT,
    against_bug REAL,
    against_dark REAL,
    against_dragon REAL,
    against_electric REAL,
    against_fairy REAL,
    against_fight REAL,
    against_fire REAL,
    against_flying REAL,
    against_ghost REAL,
    against_grass REAL,
    against_ground REAL,
    against_ice REAL,
    against_normal REAL,
    against_poison REAL,
    against_psychic REAL,
    against_rock REAL,
    against_steel REAL,
    against_water REAL,
    attack INTEGER,
    base_egg_steps INTEGER,
    base_happiness INTEGER,
    base_total INTEGER,
    capture_rate TEXT,
    classfication TEXT, -- corrected column name
    defense INTEGER,
    experience_growth INTEGER,
    height_m REAL,
    hp INTEGER,
    name TEXT,
    percentage_male REAL,
    pokedex_number INTEGER,
    sp_attack INTEGER,
    sp_defense INTEGER,
    speed INTEGER,
    type1 TEXT,
    type2 TEXT,
    weight_kg REAL,
    generation INTEGER,
    is_legendary INTEGER
);

.mode csv
.import pokemon.csv imported_pokemon_data

INSERT INTO Pokemon (
    abilities, against_bug, against_dark, against_dragon, against_electric,
    against_fairy, against_fight, against_fire, against_flying, against_ghost,
    against_grass, against_ground, against_ice, against_normal, against_poison,
    against_psychic, against_rock, against_steel, against_water, attack,
    base_egg_steps, base_happiness, base_total, capture_rate, classfication, -- corrected column name
    defense, experience_growth, height_m, hp, name, percentage_male,
    pokedex_number, sp_attack, sp_defense, speed, type1, type2, weight_kg,
    generation, is_legendary
)
SELECT
    abilities, against_bug, against_dark, against_dragon, against_electric,
    against_fairy, against_fight, against_fire, against_flying, against_ghost,
    against_grass, against_ground, against_ice, against_normal, against_poison,
    against_psychic, against_rock, against_steel, against_water, attack,
    base_egg_steps, base_happiness, base_total, capture_rate, classfication, -- corrected column name
    defense, experience_growth, height_m, hp, name, percentage_male,
    pokedex_number, sp_attack, sp_defense, speed, type1, type2, weight_kg,
    generation, is_legendary
FROM imported_pokemon_data;

-- Second Normal Form

CREATE TABLE PokemonTypes (
    type_id INTEGER PRIMARY KEY,
    type_name TEXT
);

CREATE TABLE Pokemon (
    pokemon_id INTEGER PRIMARY KEY,
    abilities TEXT,
    base_egg_steps INTEGER,
    base_happiness INTEGER,
    base_total INTEGER,
    capture_rate TEXT,
    classfication TEXT, -- corrected column name
    experience_growth INTEGER,
    height_m REAL,
    hp INTEGER,
    name TEXT,
    percentage_male REAL,
    pokedex_number INTEGER,
    sp_attack INTEGER,
    sp

--Third Normal Form

CREATE TABLE PokemonTypes (
    type_id INTEGER PRIMARY KEY,
    type_name TEXT
);

CREATE TABLE Abilities (
    ability_id INTEGER PRIMARY KEY,
    ability_name TEXT
);

CREATE TABLE Pokemons (
    pokemon_id INTEGER PRIMARY KEY,
    base_egg_steps INTEGER,
    base_happiness INTEGER,
    base_total INTEGER,
    capture_rate TEXT,
    classfication TEXT,
    experience_growth INTEGER,
    height_m REAL,
    hp INTEGER,
    name TEXT,
    percentage_male REAL,
    pokedex_number INTEGER,
    sp_attack INTEGER,
    sp_defense INTEGER,
    speed INTEGER,
    defense INTEGER,
    attack INTEGER,
    weight_kg REAL,
    generation INTEGER,
    is_legendary INTEGER,
    type1_id INTEGER,
    type2_id INTEGER,
    ability1_id INTEGER,
    ability2_id INTEGER,
    ability_hidden_id INTEGER,
    FOREIGN KEY (type1_id) REFERENCES PokemonTypes (type_id),
    FOREIGN KEY (type2_id) REFERENCES PokemonTypes (type_id),
    FOREIGN KEY (ability1_id) REFERENCES Abilities (ability_id),
    FOREIGN KEY (ability2_id) REFERENCES Abilities (ability_id),
    FOREIGN KEY (ability_hidden_id) REFERENCES Abilities (ability_id)
);

-- Populate PokemonTypes table
INSERT INTO PokemonTypes (type_name)
SELECT DISTINCT type1
FROM Pokemon;

INSERT INTO PokemonTypes (type_name)
SELECT DISTINCT type2
FROM Pokemon
WHERE type2 IS NOT NULL;

-- Populate Abilities table
INSERT INTO Abilities (ability_name)
SELECT DISTINCT abilities
FROM Pokemon;

-- Update ability1_id in Pokemons table
UPDATE Pokemons
SET ability1_id = (
    SELECT ability_id
    FROM Abilities
    WHERE Abilities.ability_name = Pokemones.abilities
);

-- Update ability2_id in Pokemons table
UPDATE Pokemons
SET ability2_id = (
    SELECT ability_id
    FROM Abilities
    WHERE Abilities.ability_name = Pokemones.abilities
);

-- Update ability_hidden_id in Pokemons table
UPDATE Pokemons
SET ability_hidden_id = (
    SELECT ability_id
    FROM Abilities
    WHERE Abilities.ability_name = Pokemones.abilities
);

-- Remove columns from Pokemons table
ALTER TABLE Pokemons
    DROP COLUMN type1
    DROP COLUMN type2,
    DROP COLUMN ability1_id,
    DROP COLUMN ability2_id,
    DROP COLUMN ability_hidden_id;

-- Extra Credit

-- Adding Huskichu

INSERT INTO Pokemons (
    base_egg_steps,
    base_happiness,
    base_total,
    capture_rate,
    classfication,
    experience_growth,
    height_m,
    hp,
    name,
    percentage_male,
    pokedex_number,
    sp_attack,
    sp_defense,
    speed,
    defense,
    attack,
    weight_kg,
    generation,
    is_legendary
) VALUES (
    -- Provide the attribute values for Huskichu
    5120, -- base_egg_steps
    140, -- base_happiness
    700, -- base_total
    '45', -- capture_rate
    'Mascot Pokémon', -- classification
    1250000, -- experience_growth
    0.6, -- height_m
    120, -- hp
    'Huskichu', -- name
    NULL, -- percentage_male
    802, -- pokedex_number (Update if needed to the next available number)
    150, -- sp_attack
    120, -- sp_defense
    120, -- speed
    100, -- defense
    150, -- attack
    60, -- weight_kg
    7, -- generation
    0 -- is_legendary
);

-- Adding Cougarite

INSERT INTO Pokemons (
    base_egg_steps,
    base_happiness,
    base_total,
    capture_rate,
    classfication,
    experience_growth,
    height_m,
    hp,
    name,
    percentage_male,
    pokedex_number,
    sp_attack,
    sp_defense,
    speed,
    defense,
    attack,
    weight_kg,
    generation,
    is_legendary
) VALUES (
    -- Provide the attribute values for Cougarite
    5120, -- base_egg_steps
    70, -- base_happiness
    300, -- base_total
    '255', -- capture_rate
    'Mascot Pokémon', -- classification
    1000000, -- experience_growth
    1.2, -- height_m
    80, -- hp
    'Cougarite', -- name
    NULL, -- percentage_male
    803, -- pokedex_number (Update if needed to the next available number)
    40, -- sp_attack
    50, -- sp_defense
    30, -- speed
    40, -- defense
    30, -- attack
    70, -- weight_kg
    7, -- generation
    0 -- is_legendary
);
