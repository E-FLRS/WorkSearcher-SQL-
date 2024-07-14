--------------------------------------------------------------------------------------------
--Script : uninstall_Worksearcher.sql
--Objet  : Désintallation de la base de données Worksearcher
--
--Mise � jour des versions
--Version   Date      Commentaires
-------   --------    ----------------------------------------------------------------
--1.0    14.05.2023   Cr�ation
--------------------------------------------------------------------------------------------

-- Suppression des utilisateurs (CASCADE), r�les et profil
SPOOL .\Logs\uninstall_Worksearcher.log

--=============================================
--Suppression des r�les, utilisateurs et profil
--=============================================
--Suppression des utilisateurs
DROP USER Worksearcher_data CASCADE;
DROP USER Worksearcher_user CASCADE;

--Suppression des r�les
DROP ROLE role_Worksearcher_data CASCADE;
DROP ROLE role_Worksearcher_user CASCADE;

--Suppression du profil
DROP PROFILE Worksearcher_profil CASCADE;

SPOOL OFF

EXIT;
