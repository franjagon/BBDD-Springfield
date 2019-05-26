use SPRINGFIELD;

/* Intentamos eliminar la función, por si estuviera ya definida */
drop function if exists comparar_dos_numeros;

/* EL DELIMITER $$ es obligatorio antes de crear la función */
delimiter $$

/* Vamos a crear y definir una función que realice la comparación de dos números y nos devuelva dicha comparación */
create function comparar_dos_numeros(n1 int, n2 int)
	returns varchar(20)

	/* Siempre que un bloque de código vaya contener mas de una instrucción hay que poner BEGIN y END */
	begin
		/* Declaramos una variable en la que la función calculará el resultado a devolver */
		declare s varchar(20);
    
       		/* Realizamos la comparación de los números, guardando en cada caso el resultado de la comparación en la variable */
		if n1 > n2 then set s = ' es mayor que ';
        	elseif n1 < n2 then set s = ' es menor que ';
        	else set s = ' es igual a ';
        	end if;
        
        	/* Antes de devolver el resultado, maquillamos la variable con un CONCAT */
        	set s = concat(n1, s, n2);
        
        	return s;
	end; $$
    
delimiter ;

/* Y ahora invocamos la función */

select comparar_dos_numeros(5, 8);
select comparar_dos_numeros(7, 3);
select comparar_dos_numeros(4, 4);
