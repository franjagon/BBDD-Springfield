use SPRINGFIELD;

drop function if exists personaje_id;

delimiter $$

/* Creamos una funcion a la que pasaremos un nombre de personaje y nos devolverá su ID_PERSONAJE si es ESTUDIANTE */
create function personaje_id(nombre_personaje varchar(255))
	returns int
    
    begin
		/* Declaramos una variable para manejar el error y otra para contener el resultado a devolver por la función */
		declare ok boolean default False;
        declare personajeID int default 0;
        
        /* Declaramos un cursor que apuntará a la vista VW_PERSONAJES recuperando el ID_personaje del DESC_PERSONAJE que reciba la función si es ESTUDIANTE */
		declare c1 cursor for
			select ID_PERSONAJE
              from VW_PERSONAJES
			 where DESC_PROFESION = 'ESTUDIANTE'
               and DESC_PERSONAJE = nombre_personaje;
        
        /* Manejamos la posibilidad de que el cursor devuelva un null (NOT FOUND) para que la función no casque */
        /* Esto forzará a que la función devuelva el valor por defecto de la variable (cero) */
		declare continue handler for not found
			set ok = True;
        
        /* Abrimos, lanzamos el cursor cargando lo que devuelva en nuestra variable interna y lo cerramos */
		open c1;
        fetch c1 into personajeID;
        close c1;
        
        /* Devolvemos el ID_PERSONAJE si lo hemos encontrado */
        return personajeID;
	end; $$
    
delimiter ;

select personaje_id('BART SIMPSON');
select personaje_id('SEYMOUR SKINNER');
select personaje_id('LISA SIMPSON');