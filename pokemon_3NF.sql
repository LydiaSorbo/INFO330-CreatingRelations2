CREATE table against_type(attacking_type_id, defending_type_id, effectiveness NUMERIC, primary key (attacking_type_id, defending_type_id), foreign key(attacking_type_id) references types(type_id), foreign key(defending_type_id) references types(type_id));
INSERT into against_type (attacking_type_id, defending_type_id, effectiveness) select t1.type_id, t2.type_id, 1.0 from types t1 cross join types t2;

UPDATE against_type AS at
SET effectiveness = CAST(p.against_grass AS NUMERIC)
FROM pokemon_types AS p
WHERE defending_type_id = type_id
AND attacking_type_id = (SELECT type_id FROM types WHERE name = 'grass')
AND pokedex_number = p.pokedex_number
AND (
    SELECT COUNT(*) FROM pokemon_types
    WHERE pokedex_number = p.pokedex_number
) = 1;

UPDATE against_type AS at
SET effectiveness = CAST(p.against_fire AS NUMERIC)
FROM pokemon_types AS p
WHERE defending_type_id = type_id
AND attacking_type_id = (SELECT type_id FROM types WHERE name = 'fire')
AND pokedex_number = p.pokedex_number
AND (
    SELECT COUNT(*) FROM pokemon_types
    WHERE pokedex_number = p.pokedex_number
) = 1;

UPDATE against_type AS at
SET effectiveness = CAST(p.against_water AS NUMERIC)
FROM pokemon_types AS p
WHERE defending_type_id = type_id
AND attacking_type_id = (SELECT type_id FROM types WHERE name = 'water')
AND pokedex_number = p.pokedex_number
AND (
    SELECT COUNT(*) FROM pokemon_types
    WHERE pokedex_number = p.pokedex_number
) = 1;

UPDATE against_type AS at
SET effectiveness = CAST(p.against_bug AS NUMERIC)
FROM pokemon_types AS p
WHERE defending_type_id = type_id
AND attacking_type_id = (SELECT type_id FROM types WHERE name = 'bug')
AND pokedex_number = p.pokedex_number
AND (
    SELECT COUNT(*) FROM pokemon_types
    WHERE pokedex_number = p.pokedex_number
) = 1;

UPDATE against_type AS at
SET effectiveness = CAST(p.against_normal AS NUMERIC)
FROM pokemon_types AS p
WHERE defending_type_id = type_id
AND attacking_type_id = (SELECT type_id FROM types WHERE name = 'normal')
AND pokedex_number = p.pokedex_number
AND (
    SELECT COUNT(*) FROM pokemon_types
    WHERE pokedex_number = p.pokedex_number
) = 1;

UPDATE against_type AS at
SET effectiveness = CAST(p.against_poison AS NUMERIC)
FROM pokemon_types AS p
WHERE defending_type_id = type_id
AND attacking_type_id = (SELECT type_id FROM types WHERE name = 'poison')
AND pokedex_number = p.pokedex_number
AND (
    SELECT COUNT(*) FROM pokemon_types
    WHERE pokedex_number = p.pokedex_number
) = 1;

UPDATE against_type AS at
SET effectiveness = CAST(p.against_electric AS NUMERIC)
FROM pokemon_types AS p
WHERE defending_type_id = type_id
AND attacking_type_id = (SELECT type_id FROM types WHERE name = 'electric')
AND pokedex_number = p.pokedex_number
AND (
    SELECT COUNT(*) FROM pokemon_types
    WHERE pokedex_number = p.pokedex_number
) = 1;

UPDATE against_type AS at
SET effectiveness = CAST(p.against_ground AS NUMERIC)
FROM pokemon_types AS p
WHERE defending_type_id = type_id
AND attacking_type_id = (SELECT type_id FROM types WHERE name = 'ground')
AND pokedex_number = p.pokedex_number
AND (
    SELECT COUNT(*) FROM pokemon_types
    WHERE pokedex_number = p.pokedex_number
) = 1;

UPDATE against_type AS at
SET effectiveness = CAST(p.against_fairy AS NUMERIC)
FROM pokemon_types AS p
WHERE defending_type_id = type_id
AND attacking_type_id = (SELECT type_id FROM types WHERE name = 'fairy')
AND pokedex_number = p.pokedex_number
AND (
    SELECT COUNT(*) FROM pokemon_types
    WHERE pokedex_number = p.pokedex_number
) = 1;

UPDATE against_type AS at
SET effectiveness = CAST(p.against_fight AS NUMERIC)
FROM pokemon_types AS p
WHERE defending_type_id = type_id
AND attacking_type_id = (SELECT type_id FROM types WHERE name = 'fighting')
AND pokedex_number = p.pokedex_number
AND (
    SELECT COUNT(*) FROM pokemon_types
    WHERE pokedex_number = p.pokedex_number
) = 1;

UPDATE against_type AS at
SET effectiveness = CAST(p.against_psychic AS NUMERIC)
FROM pokemon_types AS p
WHERE defending_type_id = type_id
AND attacking_type_id = (SELECT type_id FROM types WHERE name = 'psychic')
AND pokedex_number = p.pokedex_number
AND (
    SELECT COUNT(*) FROM pokemon_types
    WHERE pokedex_number = p.pokedex_number
) = 1;

UPDATE against_type AS at
SET effectiveness = CAST(p.against_rock AS NUMERIC)
FROM pokemon_types AS p
WHERE defending_type_id = type_id
AND attacking_type_id = (SELECT type_id FROM types WHERE name = 'rock')
AND pokedex_number = p.pokedex_number
AND (
    SELECT COUNT(*) FROM pokemon_types
    WHERE pokedex_number = p.pokedex_number
) = 1;

UPDATE against_type AS at
SET effectiveness = CAST(p.against_ghost AS NUMERIC)
FROM pokemon_types AS p
WHERE defending_type_id = type_id
AND attacking_type_id = (SELECT type_id FROM types WHERE name = 'ghost')
AND pokedex_number = p.pokedex_number
AND (
    SELECT COUNT(*) FROM pokemon_types
    WHERE pokedex_number = p.pokedex_number
) = 1;

UPDATE against_type AS at
SET effectiveness = CAST(p.against_ice AS NUMERIC)
FROM pokemon_types AS p
WHERE defending_type_id = type_id
AND attacking_type_id = (SELECT type_id FROM types WHERE name = 'ice')
AND pokedex_number = p.pokedex_number
AND (
    SELECT COUNT(*) FROM pokemon_types
    WHERE pokedex_number = p.pokedex_number
) = 1;

UPDATE against_type AS at
SET effectiveness = CAST(p.against_dragon AS NUMERIC)
FROM pokemon_types AS p
WHERE defending_type_id = type_id
AND attacking_type_id = (SELECT type_id FROM types WHERE name = 'dragon')
AND pokedex_number = p.pokedex_number
AND (
    SELECT COUNT(*) FROM pokemon_types
    WHERE pokedex_number = p.pokedex_number
) = 1;

UPDATE against_type AS at
SET effectiveness = CAST(p.against_dark AS NUMERIC)
FROM pokemon_types AS p
WHERE defending_type_id = type_id
AND attacking_type_id = (SELECT type_id FROM types WHERE name = 'dark')
AND pokedex_number = p.pokedex_number
AND (
    SELECT COUNT(*) FROM pokemon_types
    WHERE pokedex_number = p.pokedex_number
) = 1;

UPDATE against_type AS at
SET effectiveness = CAST(p.against_steel AS NUMERIC)
FROM pokemon_types AS p
WHERE defending_type_id = type_id
AND attacking_type_id = (SELECT type_id FROM types WHERE name = 'steel')
AND pokedex_number = p.pokedex_number
AND (
    SELECT COUNT(*) FROM pokemon_types
    WHERE pokedex_number = p.pokedex_number
) = 1;

UPDATE against_type AS at
SET effectiveness = CAST(p.against_flying AS NUMERIC)
FROM pokemon_types AS p
WHERE defending_type_id = type_id
AND attacking_type_id = (SELECT type_id FROM types WHERE name = 'flying')
AND pokedex_number = p.pokedex_number
AND (
    SELECT COUNT(*) FROM pokemon_types
    WHERE pokedex_number = p.pokedex_number
) = 1;

alter table pokemon_types drop column against_grass;
alter table pokemon_types drop column against_fire;
alter table pokemon_types drop column against_water;
alter table pokemon_types drop column against_bug;
alter table pokemon_types drop column against_normal;
alter table pokemon_types drop column against_poison;
alter table pokemon_types drop column against_electric;
alter table pokemon_types drop column against_ground;
alter table pokemon_types drop column against_fairy;
alter table pokemon_types drop column against_fight;
alter table pokemon_types drop column against_psychic;
alter table pokemon_types drop column against_rock;
alter table pokemon_types drop column against_ghost;
alter table pokemon_types drop column against_ice;
alter table pokemon_types drop column against_dragon;
alter table pokemon_types drop column against_dark;
alter table pokemon_types drop column against_steel;
alter table pokemon_types drop column against_flying;
