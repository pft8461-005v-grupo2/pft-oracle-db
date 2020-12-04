CREATE OR REPLACE VIEW STOCK_DISPONIBLE
(
    INGRESO_ID,
    PRODUCTO_ID,
    DESCRIPCION,
    KILOGRAMOS,
    PRECIOKGVENTAUNITARIO,
    PRECIOKGCOSTOUNITARIO,
    FECHACREACION_INGRESO,
    PRODUCTOR_ID,
    USUARIO_ID,
    RUT_PRODUCTOR,
    RAZONSOCIAL_PRODUCTOR,
    DIRECCION_PRODUCTOR,
    COMUNA_PRODUCTOR,
    CORREO_PRODUCTOR,
    CONTRATO_ID,
    VIGENCIA_CONTRATO
) AS

SELECT
    ingreso.id as ingreso_id,
    ingreso.producto_id,
    producto.descripción,
    ingreso.kilogramos,
    ingreso.preciokgventaunitario,
    ingreso.preciokgcostounitario,
    ingreso.fechacreacion,
    ingreso.productor_id,
    productor.usuario_id,
    productor.rut,
    productor.razonsocial,
    productor.direccion,
    productor.comuna,
    productor.correo,
    contrato.id AS contrato_id,
    contrato.vigencia
FROM
         ingreso
    INNER JOIN productor ON productor.id = ingreso.productor_id
    INNER JOIN producto ON producto.id = ingreso.producto_id
    INNER JOIN contrato ON productor.id = contrato.productor_id
    
WHERE ingreso.habilitado = 1 AND contrato.vigencia = 1 AND productor.habilitado = 1

