CREATE table types(type_id INTEGER PRIMARY KEY, name);
INSERT into types(name) select distinct type1 from pokemon;

CREATE table pokemon_types(pokedex_number, type_id, foreign key(pokedex_number) references pokemon(pokedex_number), foreign key(type_id) references types(type_id));
INSERT into pokemon_types(pokedex_number, type_id) select pokedex_number, type_id from pokemon, types where pokemon.type1 LIKE '%' || types.name || '%'; 
INSERT into pokemon_types(pokedex_number, type_id) select pokedex_number, type_id from pokemon, types where pokemon.type2 LIKE '%' || types.name || '%';

