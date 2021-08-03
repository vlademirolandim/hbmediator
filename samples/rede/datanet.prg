
PROCEDURE MAIN

    HBM_Bootstrap()

RETURN 

PROCEDURE HBMLoad( cRot )

    LOCAL cTela
    SAVE SCREEN TO cTela

    &( "Hbm_" + cRot + "()" )

    RESTORE SCREEN FROM cTela

RETURN 
