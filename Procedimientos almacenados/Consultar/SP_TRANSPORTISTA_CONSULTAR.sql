create or replace PROCEDURE SP_TRANSPORTISTA_CONSULTAR
(
    -- Opcionales
    in_id               IN NUMBER,
    in_usuario_id       IN NUMBER,
    in_rut              IN VARCHAR2,
    in_razonSocial      IN VARCHAR2,
    in_direccion        IN VARCHAR2,
    in_comuna           IN VARCHAR2,
    in_correo           IN VARCHAR2,
    in_habilitado       IN VARCHAR2,

    out_registros           OUT SYS_REFCURSOR
)
AS

BEGIN

	-- Validador de valores obligatorios
    OPEN out_registros FOR


    select      in_id,
                in_usuario_id,
                in_rut,
                in_razonSocial,
                in_direccion,
                in_comuna,
                in_correo,
                in_habilitado
    FROM transportista
    where 	
    		-- Opcionales
    		(in_id IS NULL OR id = in_id)
			AND (in_usuario_id IS NULL OR usuario_id = in_usuario_id)
			AND (in_rut IS NULL OR rut = in_rut)
			AND (in_razonSocial IS NULL OR razonSocial = in_razonSocial)
			AND (in_direccion IS NULL OR direccion = in_direccion)
			AND (in_comuna IS NULL OR comuna = in_comuna)
			AND (in_correo IS NULL OR correo = in_correo)
			AND (in_habilitado IS NULL OR habilitado = in_habilitado)
    ;

EXCEPTION

    WHEN NO_DATA_FOUND THEN
    	out_registros := null;

    WHEN OTHERS THEN
		out_registros := null;

END SP_TRANSPORTISTA_CONSULTAR;
