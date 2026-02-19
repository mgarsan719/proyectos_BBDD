-- FRUTAS
INSERT INTO DB_OPDle.FrutaDiablo (Tipo, NombreTraducido, Nombre) VALUES ('Zoan', 'Fruta humano-humano modelo Nika', 'Hito-Hito no mi model Nika');  -- Luffy
INSERT INTO DB_OPDle.FrutaDiablo (Tipo, NombreTraducido, Nombre) VALUES ('Zoan', 'Fruta humano-humano', 'Hito Hito no Mi');      -- Chopper
INSERT INTO DB_OPDle.FrutaDiablo (Tipo, NombreTraducido, Nombre) VALUES ('Paramecia', 'Fruta Flor-Flor', 'Hana Hana no Mi'); -- Robin
INSERT INTO DB_OPDle.FrutaDiablo (Tipo, NombreTraducido, Nombre) VALUES ('Paramecia', 'Fruta Renacer-Renacer', 'Yomi Yomi no Mi'); -- Brook

-- relaciones
INSERT INTO DB_OPDle.Personaje_has_FrutaDiablo (Personaje_idPersonaje, FrutaDiablo_ID) VALUES (1, 1);
INSERT INTO DB_OPDle.Personaje_has_FrutaDiablo (Personaje_idPersonaje, FrutaDiablo_ID) VALUES (6, 2);
INSERT INTO DB_OPDle.Personaje_has_FrutaDiablo (Personaje_idPersonaje, FrutaDiablo_ID) VALUES (7, 3);
INSERT INTO DB_OPDle.Personaje_has_FrutaDiablo (Personaje_idPersonaje, FrutaDiablo_ID) VALUES (9, 4);