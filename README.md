# TUDEMO
Test Unitaire Demo
- ajouter les BIBs RPGUNIT et ADHTU
## 1) Créer le CLLE de compilation des modules

- ajouter chaque Module SU... TU... et TD...

On pourrait meme ajouter le SAVRSTOBJ dans le CL.
- SAVRSTOBJ OBJ(T_NOMCLI) LIB(ADHTU) RMTLOCNAME(SRV0803) OBJTYPE(*SRVPGM)
- pour les modules effectuer les tests pas à pas.
- se connecter à la machine d'intégration : ajouter les BIBs..
- rucalltst t_nomcli
