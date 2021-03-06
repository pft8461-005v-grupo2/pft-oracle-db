create or replace PROCEDURE SP_CLIENTE_CONSULTAR
(
    -- Opcionales
    in_id                       IN NUMBER,
    in_usuario_id               IN NUMBER,
    in_identificador            IN VARCHAR2,
    in_razonSocial              IN VARCHAR2,
    in_direccion                IN VARCHAR2,
    in_ciudad                   IN VARCHAR2,
    in_pais_origen              IN VARCHAR2,
    in_tipo_cliente             IN INT,
    in_correo                   IN VARCHAR2,
    in_habilitado               IN VARCHAR2,

    out_resultado           OUT SYS_REFCURSOR
)
AS

BEGIN

    OPEN out_resultado FOR
    select      id,
                usuario_id,
                identificador,
                razonSocial,
                direccion,
                ciudad,
                pais_origen,
                tipo_cliente,
                correo,
                habilitado
    FROM cliente
    where 	
    		-- Opcionales
    		(in_id IS NULL OR id = in_id)
			AND (in_usuario_id IS NULL OR usuario_id = in_usuario_id)
			AND (in_identificador IS NULL OR identificador = in_identificador)
			AND (in_razonSocial IS NULL OR razonSocial = in_razonSocial)
			AND (in_direccion IS NULL OR direccion = in_direccion)
	        AND (in_ciudad IS NULL OR ciudad = in_ciudad)
	        AND (in_pais_origen IS NULL OR pais_origen = in_pais_origen)
	        AND (in_tipo_cliente IS NULL OR tipo_cliente = in_tipo_cliente)
	        AND (in_correo IS NULL OR correo = in_correo)
	        AND (in_habilitado IS NULL OR habilitado = in_habilitado)
			   ;

EXCEPTION

    WHEN OTHERS THEN
		out_resultado := null;

END SP_CLIENTE_CONSULTAR;
