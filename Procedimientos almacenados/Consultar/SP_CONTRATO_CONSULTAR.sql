create or replace PROCEDURE SP_CONTRATO_CONSULTAR
(
    -- Opcionales
    in_id                   IN NUMBER,
    in_productor_id         IN NUMBER,
    in_fechaInicio          IN DATE,
    in_fechaTermino         IN DATE,
    in_fechaCreacion        IN DATE,
    in_vigencia             IN CHAR,

    out_registros           OUT SYS_REFCURSOR
)
AS

BEGIN

	-- Validador de valores obligatorios
    OPEN out_registros FOR


    select      in_id,
                in_productor_id,
                in_fechaInicio,
                in_fechaTermino,
                in_fechaCreacion,
                in_vigencia
    FROM contrato
    where 	
    		-- Opcionales
    		(in_id IS NULL OR id = in_id)
			AND (in_productor_id IS NULL OR productor_id = in_productor_id)
			AND (in_fechaInicio IS NULL OR fechaInicio = in_fechaInicio)
			AND (in_fechaTermino IS NULL OR fechaTermino = in_fechaTermino)
			AND (in_fechaCreacion IS NULL OR fechaCreacion = in_fechaCreacion)
	        AND (in_vigencia IS NULL OR vigencia = in_vigencia)
;

EXCEPTION

    WHEN NO_DATA_FOUND THEN
    	out_registros := null;

    WHEN OTHERS THEN
		out_registros := null;

END SP_CONTRATO_CONSULTAR;
