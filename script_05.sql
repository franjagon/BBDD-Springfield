use SPRINGFIELD;

/* Eliminamos y creamos una tabla temporal que contendra el nombre de los personajes y su encriptación */
drop table if exists TMP_PERSONAJES_ENCRIPTADOS;

create table TMP_PERSONAJES_ENCRIPTADOS
	(DESC_PERSONAJE varchar(255),
	 CLAVE varchar(255));

/* Eliminamos y creamos un TRIGGER BEFORE sobre la tabla temporal que calculará la clave encriptada para cada fila que insertemos */
drop trigger if exists trig_clave;

create trigger trig_clave before insert on TMP_PERSONAJES_ENCRIPTADOS
	for each row set new.CLAVE = md5(new.DESC_PERSONAJE);

/* Cargaremos la tabla temporal con los nombres de los personajes de la tabla PERSONAJES */
insert into TMP_PERSONAJES_ENCRIPTADOS(DESC_PERSONAJE)
	select DESC_PERSONAJE from PERSONAJES;

/* Veamos que contiene la tabla finalmente (tras la actuación del TRIGGER BEFORE */
select * from TMP_PERSONAJES_ENCRIPTADOS;
