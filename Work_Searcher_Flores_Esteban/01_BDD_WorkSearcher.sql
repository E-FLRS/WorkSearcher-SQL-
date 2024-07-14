-- ====================================================================
-- Script : 01_WorkSearcher.sql
-- Objet  : Cr�ation BDD WorkSearcher sur SGBD Oracle en Local (XE) 
--
-- Mise � jour des versions
-- Version     Date      Commentaires
-- -----      --------    ---------------------------------------------
-- 1.0	     14.05.2023    Cr�ation
-- ====================================================================

SET ECHO ON
SET LINESIZE 200
SET PAGESIZE 60

-- Cr�ation des utilisateurs en tant que System
SPOOL .\Logs\02_utilisateurs_WorkSearcher.log
@.\02_utilisateurs_WorkSearcher.sql
SPOOL OFF

-- Connexion � XE en tant que WorkSearcher_data (propir�taires des objets de sch�ma)
CONNECT WorkSearcher_data/WorkSearcher_data@XE

-- Cr�ation des tables
SPOOL .\Logs\03_tables_WorkSearcher.log
@.\03_tables_WorkSearcher.sql
SPOOL OFF

-- Chargement des donn�es
SPOOL .\Logs\04_insertions_WorkSearcher.log
@.\04_insertions_WorkSearcher.sql;
SPOOL OFF

-- Cr�ation des vues
SPOOL .\Logs\05_vues_WorkSearcher.log
@.\05_vues_WorkSearcher.sql
SPOOL OFF

-- Cr�ation des triggers pour les clefs primaires
SPOOL .\Logs\06_triggers_WorkSearcher.log
@.\06_triggers_WorkSearcher.sql;
SPOOL OFF

-- Cr�ation des packages
SPOOL .\Logs\07_package_WorkSearcher.log
@.\07_package_WorkSearcher.sql;
SPOOL OFF

-- Connexion � XE en tant que system
CONNECT system/manager/2705@XE

-- Cr�ation des synonymes
SPOOL .\Logs\08_synonymes_WorkSearcher.log
@.\08_synonymes_WorkSearcher.sql;
SPOOL OFF

SET ECHO OFF

EXIT;
