//WAZIDBB   JOB ,NOTIFY=&SYSUID,
// MSGCLASS=H,MSGLEVEL=(1,1),REGION=144M
//*****************************************************************
//* LICENSED MATERIALS - PROPERTY OF IBM
//* "RESTRICTED MATERIALS OF IBM"
//* (C) COPYRIGHT IBM CORPORATION 2018, 2019. ALL RIGHTS RESERVED
//*
//*  US GOVERNMENT USERS RESTRICTED RIGHTS - USE, DUPLICATION,
//*  OR DISCLOSURE RESTRICTED BY GSA ADP SCHEDULE
//*  CONTRACT WITH IBM CORPORATION
//*
//***
//*
//* THE FOLLOWING SYMBOLICS ARE PROVIDED TO ALLOW THE USER
//* EASILY CUSTOMIZE THE JCL TO YOUR SYSTEM.  THE ONLY SYMBOLIC
//* THAT HAS TO BE CHANGED IS THE 'HLQ' VALUE, WHICH MUST CONTAIN
//* THE HIGH LEVEL QUALIFIER UNDER WHICH THE SAMPLE DATASETS MAY
//* RESIDE.
//*
//* IT MIGHT ALSO BE NECESSARY TO UPDATE THE COBOL COMPILER LIBRARY
//* IF YOUR SYSTEM USES A DIFFERENT VERSION.
//*
//* THE LINK LIBRARY MAY NEED TO BE UPDATED IF YOUR SYSTEM HAS IT
//* INSTALLED UNDER A DIFFERENT DATASET NAME.
//*
//* THE SPACE1 AND SPACE2 VALUES SHOULD WORK AS THEY ARE BUT YOU
//* CAN ALSO CHANGE THEM AS NEEDED.
//*
//*****************************************************************
//    SET HLQ='TSOUSER'                       *TSO USER ID
//*
//*************************
//* CLEAN UP
//*************************
//DELETE   EXEC PGM=IEFBR14
//SYSPRINT DD SYSOUT=*
//SYSOUT   DD SYSOUT=*
//SYSUDUMP DD SYSOUT=*
//DD1      DD DSN=&HLQ..SAMPLE.CUSTRPT,DISP=(MOD,DELETE,DELETE),
//            UNIT=SYSDA,SPACE=(CYL,(0))
//DD2      DD DSN=&HLQ..SAMPLE.CUSTOUT,DISP=(MOD,DELETE,DELETE),
//            UNIT=SYSDA,SPACE=(CYL,(0))
/*
//*************************
//* RUN SAM1
//*************************
//SAM1  EXEC   PGM=SAM1
//STEPLIB DD DSN=&HLQ..SAMPLE.LOAD,DISP=SHR
//*
//SYSOUT   DD SYSOUT=*
//SYSUDUMP DD SYSOUT=*
//*
//* INPUT CUSTOMER FILE
//CUSTFILE DD DISP=SHR,DSN=&HLQ..SAMPLE.CUSTFILE
//*
//* INPUT TRANSACTION FILE
//TRANFILE DD DISP=SHR,DSN=&HLQ..SAMPLE.TRANFILE
//*
//* NEW CUSTOMER FILE
//CUSTOUT  DD DSN=&HLQ..SAMPLE.CUSTOUT,
//    DISP=(NEW,CATLG),UNIT=SYSDA,SPACE=(TRK,(10,10),RLSE),
//    DSORG=PS,RECFM=VB,LRECL=600,BLKSIZE=604
//*
//* OUTPUT CUSTRPT FILE
//CUSTRPT  DD DSN=&HLQ..SAMPLE.CUSTRPT,
//    DISP=(NEW,CATLG),UNIT=SYSDA,SPACE=(TRK,(10,10),RLSE),
//    DSORG=PS,RECFM=FB,LRECL=133,BLKSIZE=0