create or replace PROCEDURE SP_STOCK_DISPONIBLE_CONSULTAR
(
    -- Opcionales
    in_id                    IN NUMBER,
    in_fecha_termino         IN NUMBER,
    in_precio_ganador        IN NUMBER,
    in_habilitado            IN char,

    out_registros           OUT SYS_REFCURSOR
)
AS

BEGIN

	-- Validador de valores obligatorios
    OPEN out_registros FOR


    select      in_id                    ,
                in_fecha_termino         ,
                in_precio_ganador        ,
                in_habilitado            
    FROM subasta
    where 	
    		-- Opcionales
    		(in_id IS NULL OR id = in_id)
			AND (in_fecha_termino IS NULL OR fechatermino = fechatermino)
			AND (in_precio_ganador IS NULL OR precioganador = precioganador)
			AND (in_habilitado IS NULL OR in_habilitado = habilitado)
    ;

EXCEPTION

    WHEN NO_DATA_FOUND THEN
    	out_registros := null;

    WHEN OTHERS THEN
		out_registros := null;

END SP_STOCK_DISPONIBLE_CONSULTAR;
