-- HAKIS
INSERT INTO DB_OPDle.Haki (Tipo) VALUES ('Haki del Rey');
INSERT INTO DB_OPDle.Haki (Tipo) VALUES ('Haki de Observación');
INSERT INTO DB_OPDle.Haki (Tipo) VALUES ('Haki de Armadura');

-- relaciones
-- Luffy tiene los tres tipos
INSERT INTO DB_OPDle.Personaje_has_Haki (Personaje_idPersonaje, Haki_ID) VALUES (1, 1);
INSERT INTO DB_OPDle.Personaje_has_Haki (Personaje_idPersonaje, Haki_ID) VALUES (1, 2);
INSERT INTO DB_OPDle.Personaje_has_Haki (Personaje_idPersonaje, Haki_ID) VALUES (1, 3);

-- Zoro tiene Observación y Armadura, y se confirma el de Rey
INSERT INTO DB_OPDle.Personaje_has_Haki (Personaje_idPersonaje, Haki_ID) VALUES (2, 1);
INSERT INTO DB_OPDle.Personaje_has_Haki (Personaje_idPersonaje, Haki_ID) VALUES (2, 2);
INSERT INTO DB_OPDle.Personaje_has_Haki (Personaje_idPersonaje, Haki_ID) VALUES (2, 3);

-- Sanji tiene Observación y Armadura
INSERT INTO DB_OPDle.Personaje_has_Haki (Personaje_idPersonaje, Haki_ID) VALUES (5, 2);
INSERT INTO DB_OPDle.Personaje_has_Haki (Personaje_idPersonaje, Haki_ID) VALUES (5, 3);

-- Jinbe tiene Armadura y Observación
INSERT INTO DB_OPDle.Personaje_has_Haki (Personaje_idPersonaje, Haki_ID) VALUES (10, 2);
INSERT INTO DB_OPDle.Personaje_has_Haki (Personaje_idPersonaje, Haki_ID) VALUES (10, 3);

-- Usopp tiene Observación
INSERT INTO DB_OPDle.Personaje_has_Haki (Personaje_idPersonaje, Haki_ID) VALUES (4, 2);