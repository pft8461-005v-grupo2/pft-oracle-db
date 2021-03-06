create or replace PROCEDURE SP_STOCK_DISPONIBLE_CONSULTAR
(
    -- Opcionales
    in_id                       IN NUMBER,
    in_producto_id              IN NUMBER,
    in_kilogramos               IN NUMBER,
    in_fechaUltimaModificacion  IN DATE,

    out_registros           OUT SYS_REFCURSOR
)
AS

BEGIN

	-- Validador de valores obligatorios
    OPEN out_registros FOR


    select      in_id,
                in_producto_id,
                in_kilogramos,
                in_fechaUltimaModificacion
    FROM stock_disponible
    where 	
    		-- Opcionales
    		(in_id IS NULL OR id = in_id)
			AND (in_producto_id IS NULL OR producto_id = in_producto_id)
			AND (in_kilogramos IS NULL OR kilogramos = in_kilogramos)
			AND (in_fechaUltimaModificacion IS NULL OR FECHAULTIMAMODIFICACION = in_fechaUltimaModificacion)
    ;

EXCEPTION

    WHEN NO_DATA_FOUND THEN
    	out_registros := null;

    WHEN OTHERS THEN
		out_registros := null;

END SP_STOCK_DISPONIBLE_CONSULTAR;
