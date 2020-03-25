**free

//      *%CSTD===========================================================*
//      ** Application. : CBP CBP                                        *
//      ** Composant. . : ??                     Type: SQLRPGLE          *
//      **===============================================================*
//      ** Sous-système : ADH Adhésion                                   *
//      ** Fonction . . :                                                *
//      ** Sous-fonction:                                                *
//      **%S=============================================================*
//      ** Description des fonctionnalités:                              *
//      **  Setup du SRVPGM S_ENGLISH                                   *
//      **                                                               *
//      **                                                               *
//      **%E=============================================================*
//      ** AUTEUR:N Mazo         22/02/2018                              *
//      *%ECSTD==========================================================*

ctl-opt nomain;

/copy RPGUNIT/RPGUNIT1,TESTCASE

  dcl-s wCommande   char(512);
  dcl-s wrc          int(10);

// définition des prototypes
dcl-pr setUp;
end-pr;

dcl-pr execcmd    int(10) extproc('system');
  cmdstring     pointer value   options(*string);
end-pr;

//---------------------------------------------------------------//
//  Procédure de mise en place des tests, appelée en entrée
//  elle permet d'initialiser l'environnement (bdd) pour avoir
//  des jeux de test toujours identiques et propres

dcl-proc setUp  export;

  dcl-pi *n;

  end-pi;




end-proc;

//--------------------------------------------------------------------


 
