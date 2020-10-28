create or replace PROCEDURE SP_CREAR_PRODUCTOR (

IN_CONTRATO_ID IN NUMBER,
IN_RUT IN VARCHAR2,
IN_RAZONSOCIAL IN VARCHAR2,
IN_DIRECCION IN VARCHAR2,
IN_COMUNA IN VARCHAR2,
IN_CORREO IN VARCHAR2,
IN_HABILITADO IN NUMBER,
IN_USUARIO_ID IN NUMBER,
OUT_GLOSA 		OUT VARCHAR2,
OUT_ESTADO 		OUT NUMBER,
OUT_ID_SALIDA 	OUT NUMBER

) AS 

BEGIN

INSERT INTO PRODUCTOR (
ID,
CONTRATO_ID,
RUT,
RAZONSOCIAL,
DIRECCION,
COMUNA,
CORREO,
HABILITADO,
USUARIO_ID

)
VALUES(
PRODUCTOR_SEQUENCE.NEXTVAL,
IN_CONTRATO_ID ,
IN_RUT ,
IN_RAZONSOCIAL ,
IN_DIRECCION ,
IN_COMUNA ,
IN_CORREO ,
IN_HABILITADO,
IN_USUARIO_ID

)

RETURNING ID INTO OUT_ID_SALIDA;

    EXCEPTION
        WHEN OTHERS THEN
            OUT_ESTADO := -1;
            OUT_GLOSA := FN_GET_GLOSA_ERROR;

  NULL;
END SP_CREAR_PRODUCTOR;
