create or replace PROCEDURE SP_DETALLE_SOLICITUD_CONSULTAR
(
    -- Opcionales
    in_id                   IN NUMBER,
    in_solicitud_compra_id  IN NUMBER,
    in_producto             IN VARCHAR2,
    in_kilogramos           IN NUMBER,

    out_registros           OUT SYS_REFCURSOR
)
AS

BEGIN

	-- Validador de valores obligatorios
    OPEN out_registros FOR


    select      in_id,
                in_solicitud_compra_id,
                in_producto,
                in_kilogramos
    FROM detalle_solicitud
    where 	
    		-- Opcionales
    		(in_id IS NULL OR id = in_id)
			AND (in_solicitud_compra_id IS NULL OR solicitud_compra_id = in_solicitud_compra_id)
			AND (in_producto IS NULL OR producto = in_producto)
			AND (in_kilogramos IS NULL OR kilogramos = in_kilogramos)
    ;

EXCEPTION

    WHEN NO_DATA_FOUND THEN
    	out_registros := null;

    WHEN OTHERS THEN
		out_registros := null;

END SP_DETALLE_SOLICITUD_CONSULTAR;
