
-- Modelo MySQL - Base de datos Pokémon
-- Engine: InnoDB

DROP DATABASE IF EXISTS pokemon;
CREATE DATABASE pokemon;
USE pokemon;

CREATE TABLE tipo (
    id_tipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE vence_a (
    tipo_fuerte INT NOT NULL,
    tipo_debil INT NOT NULL,
    PRIMARY KEY (tipo_fuerte, tipo_debil),
    FOREIGN KEY (tipo_fuerte) REFERENCES tipo(id_tipo),
    FOREIGN KEY (tipo_debil) REFERENCES tipo(id_tipo)
) ENGINE=InnoDB;

CREATE TABLE movimiento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    puntos_ataque INT,
    puntos_poder INT,
    precision_mov INT
) ENGINE=InnoDB;

CREATE TABLE set_movimientos (
    id_set INT AUTO_INCREMENT PRIMARY KEY,
    mov_1 INT,
    mov_2 INT,
    mov_3 INT,
    mov_4 INT,
    FOREIGN KEY (mov_1) REFERENCES movimiento(id),
    FOREIGN KEY (mov_2) REFERENCES movimiento(id),
    FOREIGN KEY (mov_3) REFERENCES movimiento(id),
    FOREIGN KEY (mov_4) REFERENCES movimiento(id)
) ENGINE=InnoDB;

CREATE TABLE region (
    id_region INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE ciudad (
    id_ciudad INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    region INT NOT NULL,
    FOREIGN KEY (region) REFERENCES region(id_region)
) ENGINE=InnoDB;

CREATE TABLE generacion (
    id_generacion INT AUTO_INCREMENT PRIMARY KEY,
    region INT NOT NULL,
    anyo_descubrimiento INT,
    FOREIGN KEY (region) REFERENCES region(id_region)
) ENGINE=InnoDB;

CREATE TABLE pokemon (
    id_pokemon INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    originario INT,
    set_movimientos INT,
    tipo INT NOT NULL,
    FOREIGN KEY (originario) REFERENCES region(id_region),
    FOREIGN KEY (set_movimientos) REFERENCES set_movimientos(id_set),
    FOREIGN KEY (tipo) REFERENCES tipo(id_tipo)
) ENGINE=InnoDB;

CREATE TABLE entrenador (
    id_entrenador INT AUTO_INCREMENT PRIMARY KEY,
    nombre INT NOT NULL,
    lleva_zapatillas TINYINT(1),
    dinero DECIMAL(16,2),
    nacido_en INT,
    FOREIGN KEY (nacido_en) REFERENCES ciudad(id_ciudad)
) ENGINE=InnoDB;

CREATE TABLE gimnasio (
    id_gym INT AUTO_INCREMENT PRIMARY KEY,
    lider INT,
    num_entrenadores INT,
    ciudad INT NOT NULL,
    FOREIGN KEY (lider) REFERENCES entrenador(id_entrenador),
    FOREIGN KEY (ciudad) REFERENCES ciudad(id_ciudad)
) ENGINE=InnoDB;

CREATE TABLE entrenamiento (
    id_entrenador INT NOT NULL,
    id_pokemon INT NOT NULL,
    nivel INT,
    ataque INT,
    defensa INT,
    ataque_esp INT,
    defensa_esp INT,
    velocidad INT,
    puntos_salud INT,
    inicio_entrenamiento DATE,
    naturaleza VARCHAR(50),
    habilidad VARCHAR(50),
    PRIMARY KEY (id_entrenador, id_pokemon),
    FOREIGN KEY (id_entrenador) REFERENCES entrenador(id_entrenador),
    FOREIGN KEY (id_pokemon) REFERENCES pokemon(id_pokemon)
) ENGINE=InnoDB;
