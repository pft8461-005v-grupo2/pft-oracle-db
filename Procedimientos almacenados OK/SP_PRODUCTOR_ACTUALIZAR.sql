create or replace PROCEDURE SP_PRODUCTOR_ACTUALIZAR (

    IN_ID_PRODUCTOR     IN NUMBER,
    IN_RUT              IN VARCHAR2,
    IN_RAZONSOCIAL      IN VARCHAR2,
    IN_DIRECCION        IN VARCHAR2,
    IN_COMUNA           IN VARCHAR2,
    IN_CORREO           IN VARCHAR2,
    IN_HABILITADO       IN NUMBER,
    IN_USUARIO_ID       IN NUMBER,

    OUT_GLOSA 	    OUT VARCHAR2,
    OUT_ESTADO 	    OUT NUMBER,
    OUT_ID_SALIDA   OUT NUMBER
    )AS 
    
    EX_Sin_data                 EXCEPTION;
    tiene_datos     NUMBER := 0;

BEGIN

    OUT_GLOSA := 'SP_PRODUCTOR_ACTUALIZAR ejecutado exitosamente';
    OUT_ESTADO := 0;

    SELECT
        COUNT(1)
    INTO tiene_datos
    FROM PRODUCTOR product
    WHERE product.ID = IN_ID_PRODUCTOR;

    IF tiene_datos = 0 THEN
        RAISE EX_Sin_data;
    END IF;

    UPDATE PRODUCTOR 
    SET
    PRODUCTOR.RUT = NVL2( IN_RUT , IN_RUT, PRODUCTOR.RUT  ),
    PRODUCTOR.RAZONSOCIAL = NVL2( IN_RAZONSOCIAL , IN_RAZONSOCIAL, PRODUCTOR.RAZONSOCIAL  ),
    PRODUCTOR.DIRECCION = NVL2( IN_DIRECCION , IN_DIRECCION, PRODUCTOR.DIRECCION  ),
    PRODUCTOR.COMUNA = NVL2( IN_COMUNA , IN_COMUNA, PRODUCTOR.COMUNA  ),
    PRODUCTOR.CORREO = NVL2( IN_CORREO , IN_CORREO, PRODUCTOR.CORREO  ),
    PRODUCTOR.HABILITADO = NVL2( IN_HABILITADO , IN_HABILITADO, PRODUCTOR.HABILITADO  )
    WHERE ID=IN_ID_PRODUCTOR ;


    --IF IN_CORREO != null THEN
      --  MERGE INTO usuario usu
      --  USING ( SELECT * from productor) pro
      --  ON (usu.id=pro.usuario_id)
      --  WHEN MATCHED THEN
      --  UPDATE SET
     --     usu.correo=pro.correo;
    -- END IF;     
     
       --IF IN_CORREO != null THEN
        MERGE INTO usuario usu
        USING ( SELECT correo, id,usuario_id from productor) pro
        ON (usu.id=pro.usuario_id)
        WHEN MATCHED THEN
        UPDATE SET
          usu.correo=pro.correo where pro.id=IN_ID_PRODUCTOR ;
     --END IF; 
     
     OUT_ID_SALIDA := IN_ID_PRODUCTOR;

    EXCEPTION

        WHEN EX_Sin_data THEN
                OUT_GLOSA := 'SP_PRODUCTOR_ACTUALIZAR no se encuentra id';
                OUT_ESTADO := -1;
                OUT_ID_SALIDA := -1;

        WHEN OTHERS THEN
            OUT_ESTADO := -1;
            OUT_GLOSA := FN_GET_GLOSA_ERROR;

END SP_PRODUCTOR_ACTUALIZAR;
