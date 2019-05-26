use SPRINGFIELD;

drop function if exists cuenta_atras;

delimiter $$

/* Vamos a crear y definir una función que realice la cuenta atrás desde un número y nos devuelva cuantas veces ha contado */
create function cuenta_atras(n int)
	returns int

	begin
		/* Declaramos dos variables para el cálculo interno */
		declare i, j int;
        
		/* Guardamos el parámetro recibido en una variable e inicializamos la otra a cero */
		set i = n;
		set j = 0;
    
		/* Iteramos un bucle WHILE para ir contando hacia atrás */
		etiqueta: while i > 0 do
			set i = i - 1;
			set j = j + 1;
		end while etiqueta;
        
		/* Devolvemos las veces que hemos contado hasta llegar a cero */
		return j;
	end; $$
    
delimiter ;

select cuenta_atras(20);
select cuenta_atras(50);