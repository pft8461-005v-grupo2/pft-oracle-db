create or replace PROCEDURE SP_SOLICITUD_COMPRA_CONSULTAR
(
    -- Opcionales
    in_id_solicitud_compra      IN NUMBER,
    in_cliente_id               IN NUMBER,
    in_fechacreacion            IN DATE,
    in_producto                 IN VARCHAR2,
    in_kilogramos               IN NUMBER,
    in_habilitado               IN NUMBER,

    out_registros           OUT SYS_REFCURSOR
)
AS

BEGIN

    -- Validador de valores obligatorios
    OPEN out_registros FOR
    select      id,
                cliente_id,
                fechacreacion,
                producto,
                kilogramos,
                habilitado
    FROM solicitud_compra
    where   
            -- Opcionales
                (in_id_solicitud_compra IS NULL OR id = in_id_solicitud_compra)
            AND (in_cliente_id IS NULL OR cliente_id = in_cliente_id)
            AND (in_fechacreacion IS NULL OR fechacreacion = in_fechacreacion)
            AND (in_producto IS NULL OR producto = in_producto)
            AND (in_kilogramos IS NULL OR kilogramos = in_kilogramos)
            AND (in_habilitado IS NULL OR habilitado = in_habilitado)
               ;

EXCEPTION

    WHEN OTHERS THEN
        out_registros := null;

END SP_SOLICITUD_COMPRA_CONSULTAR;