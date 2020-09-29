CREATE OR REPLACE FUNCTION FN_GET_GLOSA_ERROR RETURN VARCHAR2
AS

/***********************************************************************************************************************
   NAME:    FN_GET_GLOSA_ERROR
   PURPOSE: Funcion que retorna glosa de error, incluye stacktrace con nombre del SP y linea donde se produce el error

   REVISIONS:
   Ver          Date           Author                       Description
   ---------    ----------     -------------------          -------------------------------------------------------------
   1.0          XX/XX/XXXX     XXX.cl       				1. Funcion que retorna detalles del error ocurrido

************************************************************************************************************************/

LV_BACKTRACE VARCHAR2(4000) := DBMS_UTILITY.format_error_backtrace;
LV_MENSAJE VARCHAR2(4000) := '';

BEGIN

    LV_MENSAJE := CONCAT(LV_BACKTRACE, SUBSTR(SQLERRM, 1, 255));

    RETURN SUBSTR(LV_MENSAJE, 1, 4000);

EXCEPTION
    WHEN OTHERS THEN
        RETURN NULL;
END FN_GET_GLOSA_ERROR;

