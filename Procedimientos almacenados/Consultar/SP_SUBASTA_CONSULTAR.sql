create or replace PROCEDURE SP_SUBASTA_CONSULTAR
(
    -- Opcionales
    in_id               IN NUMBER,
    in_fechaTermino     IN DATE,
    in_precioGanador    IN NUMBER,
    in_habilitado       IN VARCHAR2,

    out_registros           OUT SYS_REFCURSOR
)
AS

BEGIN

	-- Validador de valores obligatorios
    OPEN out_registros FOR


    select      in_id,
                in_fechaTermino,
                in_precioGanador,
                in_habilitado
    FROM subasta
    where 	
    		-- Opcionales
    		(in_id IS NULL OR id = in_id)
			AND (in_fechaTermino IS NULL OR fechaTermino = in_fechaTermino)
			AND (in_precioGanador IS NULL OR precioGanador = in_precioGanador)
			AND (in_habilitado IS NULL OR habilitado = in_habilitado)
    ;

EXCEPTION

    WHEN NO_DATA_FOUND THEN
    	out_registros := null;

    WHEN OTHERS THEN
		out_registros := null;

END SP_SUBASTA_CONSULTAR;
