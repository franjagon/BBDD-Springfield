use SPRINGFIELD;

drop procedure if exists cuenta_adelante_con_salto;

delimiter $$

/* Vamos a crear y definir un procedimiento que realice la cuenta hacia delante desde un número hasta otro (con un salto) y nos devuelva cuantas veces ha contado */
create procedure cuenta_adelante_con_salto(n1 int, n2 int, salto int)
	begin

		/* Guardamos los parámetros recibidos en tres variables e inicializamos la cuarta a cero */
		if n1 >= n2 then 
			set @i = n2;
			set @j = n1;
		else 
			set @i = n1;
			set @j = n2;
		end if;
        
		set @k = salto;
        	set @cuenta = 0;
    
		/* Iteramos un bucle REPEAT para ir contando desde n1 hasta n2 con el salto */
		repeat
			set @i = @i + @k;
			set @cuenta = @cuenta + 1;
		until @i >= @j end repeat;
	end; $$
    
delimiter ;

/* Invocamos el procedimiento con CALL y hacemos SELECT de la variable que nos interesa */
call cuenta_adelante_con_salto(10, 50, 5);
select @cuenta;

call cuenta_adelante_con_salto(1, 300, 3);
select @cuenta;
