create or replace PROCEDURE SP_SUBASTA_CONSULTAR
(
    -- Opcionales
    IN_ID               IN NUMBER,
    IN_FECHATERMINO     IN DATE,
    IN_HABILITADO       IN NUMBER,

    out_resultado       OUT SYS_REFCURSOR
)
AS

BEGIN

	-- Validador de valores obligatorios
    OPEN out_resultado FOR


    select      ID,
                FECHATERMINO,
                PRECIOGANADOR,
                HABILITADO
    FROM SUBASTA
    where 	
    		-- Opcionales
    		    (IN_ID IS NULL OR ID = IN_ID)
			AND (IN_FECHATERMINO IS NULL OR FECHATERMINO = IN_FECHATERMINO)
			AND (IN_HABILITADO IS NULL OR HABILITADO = IN_HABILITADO)
    ;

EXCEPTION

    WHEN OTHERS THEN
		out_resultado := null;

END SP_SUBASTA_CONSULTAR;
