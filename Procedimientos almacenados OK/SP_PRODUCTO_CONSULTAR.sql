create or replace PROCEDURE SP_PRODUCTO_CONSULTAR
(
    -- Opcionales
    in_id               IN NUMBER,
    in_descripcion      IN VARCHAR2,
    in_habilitado       IN NUMBER,

    out_resultado           OUT SYS_REFCURSOR
)
AS

BEGIN

	-- Validador de valores obligatorios
    OPEN out_resultado FOR

    select      id,
                descripcion,
                habilitado
    FROM producto
    where 	
    		-- Opcionales
    		    (in_id IS NULL OR id = in_id)
			AND (in_descripcion IS NULL OR descripcion = in_descripcion)
			AND (in_habilitado IS NULL OR habilitado = in_habilitado)
    ;

EXCEPTION

    WHEN OTHERS THEN
		out_resultado := null;

END SP_PRODUCTO_CONSULTAR;
