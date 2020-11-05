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
    in_habilitado       IN NUMBER,

    out_resultado        OUT SYS_REFCURSOR
)
AS

BEGIN

    OPEN out_resultado FOR
    select      id,
                usuario_id,
                rut,
                razonSocial,
                direccion,
                comuna,
                correo,
                habilitado
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

    WHEN OTHERS THEN
		out_resultado := null;

END SP_TRANSPORTISTA_CONSULTAR;