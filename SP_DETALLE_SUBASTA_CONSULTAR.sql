create or replace PROCEDURE SP_DETALLE_SUBASTA_CONSULTAR
(
    -- Opcionales
    in_transportista_id     IN NUMBER,
    in_subasta_id         	IN NUMBER,
    in_valorPropuesta       IN NUMBER,

    out_registros           OUT SYS_REFCURSOR
)
AS

DECLARE
    valorPropuesta_id int ;
BEGIN

	-- Validador de valores obligatorios
    OPEN out_registros FOR


    select  transportista_id,
            subasta_id ,
    		valorPropuesta_id
    FROM detalle_subasta
    where 	
    		-- Opcionales
    		(in_transportista_id IS NULL OR transportista_id = in_transportista_id)
			AND (in_subasta_id IS NULL OR subasta_id = in_subasta_id)
			AND (in_valorPropuesta IS NULL OR valorPropuesta = in_valorPropuesta)
    ;

EXCEPTION

    WHEN NO_DATA_FOUND THEN
    	out_registros := null;

    WHEN OTHERS THEN
		out_registros := null;

END SP_DETALLE_SUBASTA_CONSULTAR;
