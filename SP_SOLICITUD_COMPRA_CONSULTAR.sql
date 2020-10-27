create or replace PROCEDURE SP_SOLICITUD_COMPRA_CONSULTAR
(
    -- Opcionales
    in_id                       IN NUMBER,
    in_cliente_id               IN NUMBER,
    in_fechaCreación            IN DATE,
    in_habilitado               IN VARCHAR2,

    out_registros           OUT SYS_REFCURSOR
)
AS

BEGIN

	-- Validador de valores obligatorios
    OPEN out_registros FOR


    select      in_id,
                in_cliente_id,
                in_fechaCreación,
                in_habilitado
    FROM solicitud_compra
    where 	
    		-- Opcionales
    		(in_id IS NULL OR id = in_id)
			AND (in_cliente_id IS NULL OR cliente_id = in_cliente_id)
			AND (in_fechaCreación IS NULL OR fechaCreación = in_fechaCreación)
	        AND (in_habilitado IS NULL OR habilitado = in_habilitado)
			   ;

EXCEPTION

    WHEN NO_DATA_FOUND THEN
    	out_registros := null;

    WHEN OTHERS THEN
		out_registros := null;

END SP_SOLICITUD_COMPRA_CONSULTAR;
