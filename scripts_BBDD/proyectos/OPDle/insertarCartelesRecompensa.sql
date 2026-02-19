-- CARTEL RECOMPENSA
INSERT INTO DB_OPDle.CartelRecompensa (CartelRecompensa) VALUES ('https://static.wikia.nocookie.net/onepiece/images/1/1d/Monkey_D._Luffy_Cartel_Infobox.png/revision/latest?cb=20230713085538&path-prefix=es');

-- relaciones
INSERT INTO DB_OPDle.CartelRecompensa_has_Personaje (CartelRecompensa_idCartelRecompensa, Personaje_idPersonaje) VALUES (1, 1);