**free
//*%CSTD===========================================================*
//** Application. : CBP CBP                                        *
//** Composant. . : CEL2FAHRTU                    Type: SQLRPGLE   *
//**===============================================================*
//** Sous-système : ADH Adhésion                                   *
//** Fonction . . :                                                *
//** Sous-fonction:                                                *
//**%S=============================================================*
//** Description des fonctionnalités:                              *
//**   Deuxième Programme de Test de srvpgm T_cel2fahr             *
//**                                                               *
//**                                                               *
//**%E=============================================================*
//** AUTEUR:KMI            15/03/2017                              *
//** MODIFS:KMI            25/07/2017                              *
//*%ECSTD==========================================================*

ctl-opt nomain;

/copy RPGUNIT/RPGUNIT1,TESTCASE
/copy h1frptechs/qcopsrc,s_spvDS

// définition des constantes
dcl-c APPLICATION     const('ADHTU');



// définition des variables
dcl-s wcurrentdate   date;
dcl-s wvanpalier     packed(18:11);
dcl-s rc             int(10);
dcl-s wCommande      char(512);

dcl-s wtempFahr    packed(5:0);
dcl-s wtempCelsius packed(5:2);
dcl-s wstatus      char(10);

// définition des prototypes
dcl-pr execcmd    int(10) extproc('system');
  cmdstring     pointer value   options(*string);
end-pr;

dcl-pr chargeDB2  ;
  nomTest  char(10) const;
  testCase char(10) const;
end-pr;

dcl-pr celsToFahr Extproc('CELSTOFAHR');
  in_tempCel    packed(5:2);
  ou_tempFahr packed(5:0);
  ou_status      char(10);
end-pr;

dcl-pr test_01_jetepasse10jerecois50etliquid;
end-pr;

dcl-pr test_02_jetepasse0jerecois32etfreezing;
end-pr;

//==============================================================
// CAS de TEST 1 : passant

dcl-proc test_01_jetepasse10jerecois50etliquid export;

  wtempFahr    = 0;
  wtempCelsius = 10;
  wstatus      = *blanks;

  // appel
  celsToFahr (wtempCelsius
             :wtempFahr
             :wstatus);

  assert (wtempFahr=50
         : ' Erreur temp dans celsToFahr '
         );

  assert (wstatus = 'liquid'
         : ' Erreur status dans celsToFahr '
         );

end-proc;

//==============================================================
// CAS de TEST 2 : passant

dcl-proc test_02_jetepasse0jerecois32etfreezing export;

  wtempFahr    = 0;
  wtempCelsius = 0;
  wstatus      = *blanks;

  // appel
  celsToFahr (wtempCelsius
             :wtempFahr
             :wstatus);

  assert (wtempFahr = 32
         : ' Erreur temp dans celsToFahr '
         );

  assert (wstatus = 'freezing'
         : ' Erreur status dans celsToFahr '
         );

end-proc;


//----------------------------------------------------------------
dcl-proc chargeDB2;

  dcl-pi *n;
    APPLICATION    char(10) const;
    testCase       char(10) const;
  end-pi;

  dcl-s wCommand    char(512);

  wrc=0;

  wCommand = 'RUNSQLSTM '
           + 'SRCSTMF'
           + '('''
           + '/Application/Adhesion/TU/chargeDB2/t_spvrcapp/'
           + %trim(testCase)
           + '.sql'
           + ''') '
           + 'COMMIT(*NC) '
           + 'MARGINS(112)';

   wrc = execCmd(wCommand);

   assert(wrc=0
      :'Une erreur est survenue lors de la creation des BDD');

end-proc;

 
