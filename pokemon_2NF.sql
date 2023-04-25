CREATE table abilities(ability_id INTEGER PRIMARY KEY, name);
INSERT into abilities(name) select distinct ability from pokemon;

CREATE temp table pokemon_temp as select * from pokemon;

ALTER table pokemon drop column ability;

CREATE temp table temp as select distinct * from pokemon;
drop table pokemon;

CREATE table pokemon (pokedex_number, name, against_bug, against_dark, against_dragon, against_electric, against_fairy, against_fight, against_fire, against_flying, against_ghost, against_grass, against_ground, against_ice, against_normal, against_poison, against_psychic, against_rock, against_steel, against_water, attack, base_egg_steps, base_happiness, base_total, capture_rate, classification, defense, experience_growth, height_m, hp, percentage_male, sp_attack, sp_defense, speed, type1, type2, weight_kg, generation, is_legendary, PRIMARY KEY (pokedex_number));

INSERT into pokemon select pokedex_number, name, against_bug, against_dark, against_dragon, against_electric, against_fairy, against_fight, against_fire, against_flying, against_ghost, against_grass, against_ground, against_ice, against_normal, against_poison, against_psychic, against_rock, against_steel, against_water, attack, base_egg_steps, base_happiness, base_total, capture_rate, classification, defense, experience_growth, height_m, hp, percentage_male, sp_attack, sp_defense, speed, type1, type2, weight_kg, generation, is_legendary from temp;

drop table temp;

CREATE table pokemon_abilities(pokedex_number, ability_id, foreign key(pokedex_number) references pokemon(pokedex_number), foreign key (ability_id) references abilities(ability_id));

INSERT into pokemon_abilities (pokedex_number, ability_id) select pokedex_number, ability_id from pokemon_temp, abilities where pokemon_temp.ability LIKE '%' || abilities.name || '%';

drop table pokemon_temp;

CREATE table types(type_id INTEGER PRIMARY KEY, name);
INSERT into types(name) select distinct type1 from pokemon;

CREATE table pokemon_types(pokedex_number, type_id, foreign key(pokedex_number) references pokemon(pokedex_number), foreign key(type_id) references types(type_id));
INSERT into pokemon_types(pokedex_number, type_id) select pokedex_number, type_id from pokemon, types where pokemon.type1 LIKE '%' || types.name || '%'; 
INSERT into pokemon_types(pokedex_number, type_id) select pokedex_number, type_id from pokemon, types where pokemon.type2 LIKE '%' || types.name || '%';

alter table pokemon drop column type1;
alter table pokemon drop column type2;

alter table pokemon_types add column against_grass;
alter table pokemon_types add column against_fire;
alter table pokemon_types add column against_water;
alter table pokemon_types add column against_bug;
alter table pokemon_types add column against_normal;
alter table pokemon_types add column against_poison;
alter table pokemon_types add column against_electric;
alter table pokemon_types add column against_ground;
alter table pokemon_types add column against_fairy;
alter table pokemon_types add column against_fight;
alter table pokemon_types add column against_psychic;
alter table pokemon_types add column against_rock;
alter table pokemon_types add column against_ghost;
alter table pokemon_types add column against_ice;
alter table pokemon_types add column against_dragon;
alter table pokemon_types add column against_dark;
alter table pokemon_types add column against_steel;
alter table pokemon_types add column against_flying;

update pokemon_types set against_grass = pokemon.against_grass from pokemon where pokemon_types.pokedex_number = pokemon.pokedex_number;
update pokemon_types set against_fire = pokemon.against_fire from pokemon where pokemon_types.pokedex_number = pokemon.pokedex_number;
update pokemon_types set against_water = pokemon.against_water from pokemon where pokemon_types.pokedex_number = pokemon.pokedex_number;
update pokemon_types set against_bug = pokemon.against_bug from pokemon where pokemon_types.pokedex_number = pokemon.pokedex_number;
update pokemon_types set against_normal = pokemon.against_normal from pokemon where pokemon_types.pokedex_number = pokemon.pokedex_number;
update pokemon_types set against_poison = pokemon.against_poison from pokemon where pokemon_types.pokedex_number = pokemon.pokedex_number;
update pokemon_types set against_electric = pokemon.against_electric from pokemon where pokemon_types.pokedex_number = pokemon.pokedex_number;
update pokemon_types set against_ground = pokemon.against_ground from pokemon where pokemon_types.pokedex_number = pokemon.pokedex_number;
update pokemon_types set against_fairy = pokemon.against_fairy from pokemon where pokemon_types.pokedex_number = pokemon.pokedex_number;
update pokemon_types set against_fight = pokemon.against_fight from pokemon where pokemon_types.pokedex_number = pokemon.pokedex_number;
update pokemon_types set against_psychic = pokemon.against_psychic from pokemon where pokemon_types.pokedex_number = pokemon.pokedex_number;
update pokemon_types set against_rock = pokemon.against_rock from pokemon where pokemon_types.pokedex_number = pokemon.pokedex_number;
update pokemon_types set against_ghost = pokemon.against_ghost from pokemon where pokemon_types.pokedex_number = pokemon.pokedex_number;
update pokemon_types set against_ice = pokemon.against_ice from pokemon where pokemon_types.pokedex_number = pokemon.pokedex_number;
update pokemon_types set against_dragon = pokemon.against_dragon from pokemon where pokemon_types.pokedex_number = pokemon.pokedex_number;
update pokemon_types set against_dark = pokemon.against_dark from pokemon where pokemon_types.pokedex_number = pokemon.pokedex_number;
update pokemon_types set against_steel = pokemon.against_steel from pokemon where pokemon_types.pokedex_number = pokemon.pokedex_number;
update pokemon_types set against_flying = pokemon.against_flying from pokemon where pokemon_types.pokedex_number = pokemon.pokedex_number;

alter table pokemon drop column against_grass;
alter table pokemon drop column against_fire;
alter table pokemon drop column against_water;
alter table pokemon drop column against_bug;
alter table pokemon drop column against_normal;
alter table pokemon drop column against_poison;
alter table pokemon drop column against_electric;
alter table pokemon drop column against_ground;
alter table pokemon drop column against_fairy;
alter table pokemon drop column against_fight;
alter table pokemon drop column against_psychic;
alter table pokemon drop column against_rock;
alter table pokemon drop column against_ghost;
alter table pokemon drop column against_ice;
alter table pokemon drop column against_dragon;
alter table pokemon drop column against_dark;
alter table pokemon drop column against_steel;
alter table pokemon drop column against_flying;
