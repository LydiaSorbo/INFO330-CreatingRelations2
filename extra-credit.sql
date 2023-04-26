--added Huskichu and Cougarite into pokemon table
INSERT into pokemon values('802', 'Huskichu', '100', '50000', '100', '600', '45', 'Supreme Mascot Pokemon', '100', '1000000', '1', '100', '100', '100', '100', '100', '10', '7', '1');
INSERT into pokemon values('803', 'Cougarite', '1', '50000', '100', '600', '100', 'Lesser Mascot Pokemon', '1', '10', '1', '100', '100', '1', '1', '1', '10', '7', '0');

--added the mascot type into the types table
INSERT into types values(19, 'Mascot');

--added Huskichu and Cougarite pokedex number and type_id into pokemon_types
INSERT into pokemon_types values(802, 19);
INSERT into pokemon_types values(803, 19);

--created trainer table with trainer_id primary key and first_name, last_name columns
--inserted trainer entries
CREATE table trainer(trainer_id INTEGER PRIMARY KEY, first_name VARCHAR(80), last_name VARCHAR(80));
INSERT into trainer(first_name, last_name) values('Lydia', 'Sorbo');
INSERT into trainer(first_name, last_name) values('Justin', 'Dong');
INSERT into trainer(first_name, last_name) values('Kaarina', 'Tulleau');
INSERT into trainer(first_name, last_name) values('Ted', 'Neward');

--created favorite_pokemon_types table with trainer_id and type_id foreign keys which reference trainer and types tables respectively
CREATE table favorite_pokemon_types(trainer_id, type_id, foreign key(trainer_id) references trainer(trainer_id), foreign key(type_id) references types(type_id));

--inserted entries into favorite_pokemon_types
INSERT into favorite_pokemon_types values(1, 2);
INSERT into favorite_pokemon_types values(1, 15);
INSERT into favorite_pokemon_types values(2, 19);
INSERT into favorite_pokemon_types values(3, 19);
INSERT into favorite_pokemon_types values(4, 7);
INSERT into favorite_pokemon_types values(4, 19);

--created pokemon_teams table with trainer_id and pokedex_number composite primary key (to ensure unique combinations of trainers to pokemon, a trainer can't have the same pokemon twice) 
CREATE table pokemon_teams(trainer_id, pokedex_number, foreign key (trainer_id) references trainer(trainer_id), foreign key(pokedex_number) references pokemon(pokedex_number), PRIMARY KEY (trainer_id, pokedex_number)); 

--created a trigger on the pokemon_teams table to prevent a trainer from having more than 10 pokemon
CREATE TRIGGER max_pokemon_per_trainer
BEFORE insert on pokemon_teams
FOR EACH ROW
WHEN ((select count(*) from pokemon_teams where trainer_id = NEW.trainer_id) >= 10)
BEGIN
  SELECT RAISE(FAIL, 'Maximum 10 pokemon per trainer');
END;

--inserted entries into pokemon_teams table
insert into pokemon_teams values(1, 802);
insert into pokemon_teams values(2, 802);
insert into pokemon_teams values(3, 802);
insert into pokemon_teams values(4, 802);
insert into pokemon_teams values(4, 5);
insert into pokemon_teams values(1, 151);
