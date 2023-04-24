.import pokemon.csv pokemon
CREATE TABLE split_abilities AS SELECT abilities, trim(value) as split_value FROM pokemon, json_each('["' || replace(abilities, ',', '","') || '"]') WHERE split_value<>'';
UPDATE split_abilities SET split_value = replace(split_value, '[', '');
UPDATE split_abilities SET split_value = replace(split_value, '''', '');
UPDATE split_abilities SET split_value = replace(split_value, ']', '');
UPDATE split_abilities SET split_value = TRIM(split_value);

CREATE temporary table temp (pokedex_number, name, abilities, against_bug, against_dark, against_dragon, against_electric, against_fairy, against_fight, against_fire, against_flying, against_ghost, against_grass, against_ground, against_ice, against_normal, against_poison, against_psychic, against_rock, against_steel, against_water, attack, base_egg_steps, base_happiness, base_total, capture_rate, classification, defense, experience_growth, height_m, hp, percentage_male, sp_attack, sp_defense, speed, type1, type2, weight_kg, generation, is_legendary);
INSERT into temp select pokedex_number, name, abilities, against_bug, against_dark, against_dragon, against_electric, against_fairy, against_fight, against_fire, against_flying, against_ghost, against_grass, against_ground, against_ice, against_normal, against_poison, against_psychic, against_rock, against_steel, against_water, attack, base_egg_steps, base_happiness, base_total, capture_rate, classfication, defense, experience_growth, height_m, hp, percentage_male, sp_attack, sp_defense, speed, type1, type2, weight_kg, generation, is_legendary from pokemon;
drop table pokemon;
CREATE table pokemon (pokedex_number, name, abilities, against_bug, against_dark, against_dragon, against_electric, against_fairy, against_fight, against_fire, against_flying, against_ghost, against_grass, against_ground, against_ice, against_normal, against_poison, against_psychic, against_rock, against_steel, against_water, attack, base_egg_steps, base_happiness, base_total, capture_rate, classification, defense, experience_growth, height_m, hp, percentage_male, sp_attack, sp_defense, speed, type1, type2, weight_kg, generation, is_legendary, PRIMARY KEY (pokedex_number));
INSERT into pokemon select pokedex_number, name, abilities, against_bug, against_dark, against_dragon, against_electric, against_fairy, against_fight, against_fire, against_flying, against_ghost, against_grass, against_ground, against_ice, against_normal, against_poison, against_psychic, against_rock, against_steel, against_water, attack, base_egg_steps, base_happiness, base_total, capture_rate, classification, defense, experience_growth, height_m, hp, percentage_male, sp_attack, sp_defense, speed, type1, type2, weight_kg, generation, is_legendary from temp;
drop table temp;

CREATE table abilities(ability_id INTEGER PRIMARY KEY, name);
INSERT into abilities(name) select distinct split_value from split_abilities;

CREATE table pokemon_abilities(pokedex_number, ability_id, foreign key(pokedex_number) references pokemon(pokedex_number), foreign key (ability_id) references abilities(ability_id));
INSERT into pokemon_abilities (pokedex_number, ability_id) select pokedex_number, ability_id from pokemon, abilities where pokemon.abilities LIKE '%' || abilities.name || '%';

ALTER table pokemon drop column abilities;
