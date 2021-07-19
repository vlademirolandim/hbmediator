
PROCEDURE MAIN

    HBM_Bootstrap()

RETURN 

PROCEDURE HBMLoad( cRot )
    LOCAL cTelaAnt 
    SAVE SCREEN TO cTelaAnt

    &( "Hbm_" + cRot + "()" )

    RESTORE SCREEN FROM cTelaAnt

RETURN 
