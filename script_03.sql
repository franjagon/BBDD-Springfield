use SPRINGFIELD;

drop function if exists cuenta_adelante;

delimiter $$

/* Vamos a crear y definir una función que realice la cuenta hacia delante desde un número hasta otro y nos devuelva cuantas veces ha contado */
create function cuenta_adelante(n1 int, n2 int)
	returns int

	begin
		/* Declaramos tres variables para el cálculo interno */
		declare i, j, k int;
        
		/* Guardamos los parámetros recibidos en dos variables e inicializamos la tercera a cero */
		if n1 >= n2 then 
			set i = n2;
			set j = n1;
		else 
			set i = n1;
			set j = n2;
		end if;
        
		set k = 0;
    
		/* Iteramos un bucle LOOP para ir contando desde n1 hasta n2 */
		etiqueta: loop
			set i = i + 1;
			set k = k + 1;
            
			if i < j then iterate etiqueta;
			end if;
            
			leave etiqueta;
			end loop etiqueta;
        
		/* Devolvemos las veces que hemos contado para llegar de un numero a otro */
		return k;
	end; $$
    
delimiter ;

select cuenta_adelante(20, 25);
select cuenta_adelante(50, 10);