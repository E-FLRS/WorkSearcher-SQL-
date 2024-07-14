-- ====================================================================
-- Script : 02_utilisateurs_WorkSearcher.sql
-- Objet  : Cr�ation des utilisateurs BDD WorkSearcher sur SGBD Oracle en Local (XE)
--
-- Mise � jour des versions
-- Version     Date      Commentaires
-- -----     --------    ------------------------------------------
-- 1.0	    14.05.20223   Cr�ation utilisateurs
-- ====================================================================
-- =============================================================================================
-- Suppression des r�les, utilisateurs et profil
-- =============================================================================================
-- Suppression des utilisateurs
DROP USER WorkSearcher_data CASCADE;
DROP USER WorkSearcher_user CASCADE;

-- Suppression des r�les
DROP ROLE role_WorkSearcher_data CASCADE;
DROP ROLE role_WorkSearcher_user CASCADE;

-- Suppression du profil
DROP PROFILE WorkSearcher_profil;

-- =============================================================================================
-- Cr�ation du profil
-- =============================================================================================
-- Creation du profil WorkSearcher_profil
CREATE PROFILE WorkSearcher_profil LIMIT
	SESSIONS_PER_USER 3
	FAILED_LOGIN_ATTEMPTS 3 
	PASSWORD_LOCK_TIME 1/24
	PASSWORD_LIFE_TIME 180 
	PASSWORD_REUSE_TIME 180 
	PASSWORD_REUSE_MAX UNLIMITED
	PASSWORD_GRACE_TIME 7;

-- =============================================================================================
-- Cr�ation du r�le role_WorkSearcher_data (r�le de l'utilisateur propri�taire des objets de la base)
-- =============================================================================================
-- Creation du r�le role_WorkSearcher_data
CREATE ROLE role_WorkSearcher_data;

-- droit de se connecter � la BDD
GRANT CONNECT TO role_WorkSearcher_data;

-- droit de cr�er des triggers, s�quence, tables, packages, ...
GRANT RESOURCE TO role_WorkSearcher_data;

-- droit de cr�er des vues
GRANT CREATE VIEW TO role_WorkSearcher_data;

-- droit de cr�er des synonymes
GRANT CREATE ANY SYNONYM TO role_WorkSearcher_data;


-- ===============================
-- Cr�ation du r�le role_WorkSearcher_user (r�le de l'utilisateur de l'application)
-- ===============================
-- Creation du r�le role_WorkSearcher_user
CREATE ROLE role_WorkSearcher_user;

-- droit de se connecter � la BDD
GRANT CREATE SESSION TO role_WorkSearcher_user;

-- ===================================
-- Cr�ation de l'utilisateur WorkSearcher_data (propri�taire des objets de sch�ma de la base)
-- ===================================
-- Creation de l'utilisateur WorkSearcher_data 
CREATE USER WorkSearcher_data
	PROFILE WorkSearcher_profil
	IDENTIFIED BY WorkSearcher_data
	DEFAULT TABLESPACE USERS
	TEMPORARY TABLESPACE TEMP
;
GRANT role_WorkSearcher_data TO WorkSearcher_data;
ALTER USER WorkSearcher_data quota unlimited ON USERS;

--===================================
--Cr�ation de l'utilisateur WorkSearcher_user (utilisateur de l'application)
--===================================
CREATE USER WorkSearcher_user
	PROFILE WorkSearcher_profil
	IDENTIFIED BY WorkSearcher_user
;
GRANT role_WorkSearcher_user TO WorkSearcher_user;
