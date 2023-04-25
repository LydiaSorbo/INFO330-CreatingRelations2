.mode csv
.import pokemon.csv pokemon

CREATE TABLE split_abilities AS SELECT abilities, trim(value) as split_value FROM pokemon, json_each('["' || replace(abilities, ',', '","') || '"]') WHERE split_value<>'';
UPDATE split_abilities SET split_value = replace(split_value, '[', '');
UPDATE split_abilities SET split_value = replace(split_value, '''', '');
UPDATE split_abilities SET split_value = replace(split_value, ']', '');
UPDATE split_abilities SET split_value = TRIM(split_value);

create table temp_abilities(ability);
insert into temp_abilities(ability) select distinct split_value from split_abilities;             

create temporary table temp(pokedex_number, name, against_bug, against_dark, against_dragon, against_electric, against_fairy, against_fight, against_fire, against_flying, against_ghost, against_grass, against_ground, against_ice, against_normal, against_poison, against_psychic, against_rock, against_steel, against_water, attack, base_egg_steps, base_happiness, base_total, capture_rate, classification, defense, experience_growth, height_m, hp, percentage_male, sp_attack, sp_defense, speed, type1, type2, weight_kg, generation, is_legendary, ability);

insert into temp(pokedex_number, name, against_bug, against_dark, against_dragon, against_electric, against_fairy, against_fight, against_fire, against_flying, against_ghost, against_grass, against_ground, against_ice, against_normal, against_poison, against_psychic, against_rock, against_steel, against_water, attack, base_egg_steps, base_happiness, base_total, capture_rate, classification, defense, experience_growth, height_m, hp, percentage_male, sp_attack, sp_defense, speed, type1, type2, weight_kg, generation, is_legendary, ability) select pokedex_number, name, against_bug, against_dark, against_dragon, against_electric, against_fairy, against_fight, against_fire, against_flying, against_ghost, against_grass, against_ground, against_ice, against_normal, against_poison, against_psychic, against_rock, against_steel, against_water, attack, base_egg_steps, base_happiness, base_total, capture_rate, classfication, defense, experience_growth, height_m, hp, percentage_male, sp_attack, sp_defense, speed, type1, type2, weight_kg, generation, is_legendary, ability from pokemon, temp_abilities where pokemon.abilities LIKE '%' || temp_abilities.ability || '%';

drop table pokemon;

CREATE table pokemon (pokedex_number, name, against_bug, against_dark, against_dragon, against_electric, against_fairy, against_fight, against_fire, against_flying, against_ghost, against_grass, against_ground, against_ice, against_normal, against_poison, against_psychic, against_rock, against_steel, against_water, attack, base_egg_steps, base_happiness, base_total, capture_rate, classification, defense, experience_growth, height_m, hp, percentage_male, sp_attack, sp_defense, speed, type1, type2, weight_kg, generation, is_legendary, ability);

INSERT into pokemon select pokedex_number, name, against_bug, against_dark, against_dragon, against_electric, against_fairy, against_fight, against_fire, against_flying, against_ghost, against_grass, against_ground, against_ice, against_normal, against_poison, against_psychic, against_rock, against_steel, against_water, attack, base_egg_steps, base_happiness, base_total, capture_rate, classification, defense, experience_growth, height_m, hp, percentage_male, sp_attack, sp_defense, speed, type1, type2, weight_kg, generation, is_legendary, ability from temp;

drop table temp;
drop table split_abilities;
drop table temp_abilities;
