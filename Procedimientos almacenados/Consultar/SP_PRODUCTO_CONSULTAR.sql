create or replace PROCEDURE SP_PRODUCTO_CONSULTAR
(
    -- Opcionales
    in_id               IN NUMBER,
    in_descripcion      IN VARCHAR2,
    in_habilitado       IN CHAR,

    out_registros           OUT SYS_REFCURSOR
)
AS

BEGIN

	-- Validador de valores obligatorios
    OPEN out_registros FOR

    select      in_id,
                in_descripcion,
                in_habilitado
    FROM producto
    where 	
    		-- Opcionales
    		(in_id IS NULL OR id = in_id)
			AND (in_descripcion IS NULL OR descripcion = in_descripcion)
			AND (in_habilitado IS NULL OR habilitado = in_habilitado)
    ;

EXCEPTION

    WHEN NO_DATA_FOUND THEN
    	out_registros := null;

    WHEN OTHERS THEN
		out_registros := null;

END SP_PRODUCTO_CONSULTAR;
