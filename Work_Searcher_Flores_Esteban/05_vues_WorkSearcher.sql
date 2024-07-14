-- ======================================================================
--  Script: 05_vues_WorkSearcher.sql 
--  Objet : Cr�ation des vues sch�ma de la base WorkSearcher
--  Objectif : cr�er des vues et tester l'interrogation et la mise-�-jour � travers ces vues. 
-- ======================================================================

-- ====================================================
-- Cr�ation des VUES
-- ====================================================
-- ====================================================
-- Vue d'affichage des particulier
-- ====================================================
CREATE OR REPLACE VIEW vw_particulier(Nom, Prenom, Age, Sexe, descriptions, Mail, Nationalite, Telephone) AS
       SELECT per_nom, per_prenom, ROUND(months_between(SYSDATE, per_datenaissance) / 12, 0) , per_sexe, per_description, per_email, per_nationalite, per_telephone 
       FROM wor_personne WHERE UPPER(per_role) = 'PARTICULIER';
       


GRANT SELECT, INSERT, UPDATE, DELETE ON vw_particulier TO WorkSearcher_user;
-- ====================================================
-- Vue d'affichage des emplois qui sont encore en cours
-- ou qui sont finit
-- ====================================================
CREATE OR REPLACE VIEW vw_emploi_fini("Nom", "Date de début", "Date de fin", "Note de l employé", "Note de l entrprise") AS
       SELECT emp_nom, emp_datedebut, emp_datefin, emp_notepersonne, emp_noteentreprise FROM wor_emploi WHERE emp_datedebut < SYSDATE;


GRANT SELECT, INSERT, UPDATE, DELETE ON vw_emploi_fini TO WorkSearcher_user;
-- ====================================================
-- Vue d'affichage des emplois qui sont encore en recherche 
-- ====================================================

CREATE OR REPLACE VIEW vw_emploi_enRecherche("IdEmploi", "Nom", "Date","type", "descEntreprise", "descCondition", "descCritere") AS
       SELECT emp_id, emp_nom, emp_datedebut, typ_nom, emp_commentaireentreprise, emp_condition, emp_critere FROM wor_emploi JOIN wor_type ON emp_typ_id = typ_id WHERE emp_datedebut > SYSDATE;

GRANT SELECT, INSERT, UPDATE, DELETE ON vw_emploi_enRecherche TO WorkSearcher_user;


-- ====================================================
-- Vue d'affichage des emplois avec le nom et prenom de
-- l'employé qui a le job
-- ====================================================
CREATE OR REPLACE VIEW vw_emploi_personne("Nom de l employe", "Prenom de l employe", "Nom du travail", "Date de debut", "Date de fin") AS
SELECT per_nom, per_prenom, emp_nom, emp_datedebut, emp_datefin FROM wor_personne
JOIN wor_emploi ON per_id = emp_per_id WHERE emp_datedebut < SYSDATE;

GRANT SELECT, INSERT, UPDATE, DELETE ON vw_emploi_personne TO WorkSearcher_user;

  
