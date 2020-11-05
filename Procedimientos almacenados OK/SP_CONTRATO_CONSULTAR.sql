create or replace PROCEDURE SP_CONTRATO_CONSULTAR
(
    -- Opcionales
    in_id                   IN NUMBER,
    in_fechaInicio          IN DATE,
    in_fechaTermino         IN DATE,
    in_fechaCreacion        IN DATE,
    in_vigencia             IN NUMBER,

    out_resultado           OUT SYS_REFCURSOR
)
AS

BEGIN

    OPEN out_resultado FOR
    select      id,
                fechaInicio,
                fechaTermino,
                fechaCreacion,
                vigencia
    FROM contrato
    where 	
    		-- Opcionales
    		(in_id IS NULL OR id = in_id)
			AND (in_fechaInicio IS NULL OR fechaInicio = in_fechaInicio)
			AND (in_fechaTermino IS NULL OR fechaTermino = in_fechaTermino)
			AND (in_fechaCreacion IS NULL OR fechaCreacion = in_fechaCreacion)
	        AND (in_vigencia IS NULL OR vigencia = in_vigencia)
;

EXCEPTION

    WHEN OTHERS THEN
		out_resultado := null;

END SP_CONTRATO_CONSULTAR;