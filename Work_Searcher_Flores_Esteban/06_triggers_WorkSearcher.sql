-- ====================================================================
-- Script : 06_triggers_WorkSearcher.sql
-- Objet  : Cr�ation des triggers WorkSearcher sur SGBD Oracle en Local (XE) 
--
-- Mise � jour des versions
-- Version   Date      Commentaires
-- -----   --------    ------------------------------------------
-- 1.0	    14.05.2023    Cr�ation trigers
-- ====================================================================

-- ====================================================
-- Trigger insertion personne
-- ====================================================

DROP SEQUENCE sq_personne;

CREATE SEQUENCE   sq_personne  MINVALUE 13 NOMAXVALUE INCREMENT BY 1 
/

CREATE OR REPLACE TRIGGER  trg_personne_id
  BEFORE insert on wor_personne               
  for each row  
begin   
       :NEW.per_id := sq_personne.NEXTVAL;
end; 

/
ALTER TRIGGER  trg_personne_id ENABLE
/

-- ====================================================
-- Trigger insertion emploi
-- ====================================================
DROP SEQUENCE sq_emploi;

CREATE SEQUENCE sq_emploi MINVALUE 25 NOMAXVALUE INCREMENT BY 1;
/
CREATE OR REPLACE TRIGGER  trg_emploi_id
  BEFORE insert on wor_emploi               
  for each row  
begin   
       :NEW.emp_id := sq_emploi.NEXTVAL;
end; 
/
ALTER TRIGGER  trg_emploi_id ENABLE;
/



-- ====================================================
-- Trigger insertion entreprise
-- ====================================================
DROP SEQUENCE sq_entreprise;
CREATE SEQUENCE sq_entreprise MINVALUE 16 NOMAXVALUE INCREMENT BY 1;

/
CREATE OR REPLACE TRIGGER  trg_entreprise_id
  BEFORE insert on wor_entreprise              
  for each row  
begin   
       :NEW.ent_id := sq_entreprise.NEXTVAL;
end; 
/
ALTER TRIGGER  trg_entreprise_id ENABLE;
/










