create or replace PROCEDURE SP_CLIENTE_ACTUALIZAR (
      
    IN_ID_CLIENTE           IN NUMBER,
    IN_IDENTIFICADOR        IN VARCHAR2,
    IN_RAZON_SOCIAL         IN VARCHAR2,
    IN_DIRECCION            IN VARCHAR2,
    IN_CIUDAD               IN VARCHAR2,
    IN_PAIS_ORIGEN          IN VARCHAR2,
    IN_TIPO_CLIENTE         IN NUMBER,
    IN_CORREO               IN VARCHAR2,
    IN_HABILITADO           IN NUMBER,
    
    
    OUT_GLOSA 		        OUT VARCHAR2,
    OUT_ESTADO 		        OUT NUMBER,
    OUT_ID_SALIDA 	        OUT NUMBER
    
) AS 

EX_Sin_data                 EXCEPTION;
tiene_datos     NUMBER := 0;

BEGIN

    OUT_GLOSA := 'SP_ACTUALIZAR_CLIENTE ejecutado exitosamente';
    OUT_ESTADO := 0;


    SELECT
        COUNT(1)
    INTO tiene_datos
    FROM CLIENTE client
    WHERE client.ID = IN_ID_CLIENTE;

    IF tiene_datos = 0 THEN
        RAISE EX_Sin_data;
    END IF;

    UPDATE CLIENTE
    SET  
       cliente.identificador = NVL2( IN_IDENTIFICADOR , IN_IDENTIFICADOR, CLIENTE.identificador  ),
       cliente.razonsocial = NVL2( IN_RAZON_SOCIAL , IN_RAZON_SOCIAL, CLIENTE.razonsocial  ),
       cliente.direccion = NVL2( IN_DIRECCION , IN_DIRECCION, CLIENTE.direccion  ),
       cliente.ciudad = NVL2( IN_CIUDAD , IN_CIUDAD, CLIENTE.ciudad  ),
       cliente.pais_origen = NVL2( IN_PAIS_ORIGEN , IN_PAIS_ORIGEN, CLIENTE.pais_origen  ),
       cliente.tipo_cliente = NVL2( IN_TIPO_CLIENTE , IN_TIPO_CLIENTE, CLIENTE.tipo_cliente  ),
       cliente.correo = NVL2( IN_CORREO , IN_CORREO, CLIENTE.correo  ),
       cliente.habilitado = NVL2( IN_HABILITADO , IN_HABILITADO, CLIENTE.habilitado  )
    WHERE ID=IN_ID_CLIENTE ;


   -- IF IN_CORREO != null THEN
        MERGE INTO usuario usu
        USING ( SELECT correo, id,usuario_id from CLIENTE) CLI
        ON (usu.id=CLI.usuario_id)
        WHEN MATCHED THEN
        UPDATE SET
          usu.correo=CLI.correo where CLI.id=IN_ID_CLIENTE;
    --END IF;

    OUT_ID_SALIDA := IN_ID_CLIENTE;

    EXCEPTION
        WHEN EX_Sin_data THEN
            OUT_GLOSA := 'SP_ACTUALIZAR_CLIENTE no se encuentra id';
            OUT_ESTADO := -1;
            OUT_ID_SALIDA := -1;


        WHEN OTHERS THEN
            OUT_ESTADO := -1;
            OUT_GLOSA := FN_GET_GLOSA_ERROR;

        NULL;
END SP_CLIENTE_ACTUALIZAR;
