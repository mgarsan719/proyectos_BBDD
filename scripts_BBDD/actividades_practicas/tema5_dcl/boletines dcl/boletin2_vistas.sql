use centro_educativo;

create or replace view mostar_nombre_alumnos as
	select id_alum, nombre, apellidos from alumno; -- como root
    
    SELECT * FROM mostar_nombre_alumnos;
    
-- create or replace view matriculacion_alumno_asignatura as
 
SELECT 
    alumno.id_alum as id_alumno,
    ALUMNO.NOMBRE AS Nombre_Alumno,
    ASIGNATURA.NOMBRE AS Nombre_Asignatura
FROM ALUMNO, MATRICULADO, ASIGNATURA
WHERE ALUMNO.ID_ALUM = MATRICULADO.ID_ALUM 
  AND ASIGNATURA.ID_ASIG = MATRICULADO.ID_ASIG;