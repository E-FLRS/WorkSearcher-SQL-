REM Fichier		: Installation.cmd
REM Objet		: Cr�ation de la BDD EasyCooking

mkdir .\Logs

REM Lancement du script 01_BDD_EasyCooking.sql dans SQL*PLUS
REM le %1 permet de demander le mot de passe lors du lancement du script
sqlplus SYSTEM/manager@XE @%~dp0\01_BDD_WorkSearcher.sql %~dp0
