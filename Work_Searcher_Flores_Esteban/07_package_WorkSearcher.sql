-- ======================================================================
--  Script: 07_Package_WorkSearcher.sql 
--  Objet : Cr�ation des packages de la base WorkSearcher 
-- ======================================================================

create or replace package pkg_classement_personne is

  PROCEDURE affichageClassement;
  FUNCTION get_positionPersonne(i_id IN VARCHAR)RETURN INTEGER;

end pkg_classement_personne;

/

create or replace package body pkg_classement_personne is

FUNCTION get_positionPersonne(i_id IN VARCHAR)RETURN INTEGER AS
  
  v_cpt INTEGER;
  
CURSOR c_classementP IS SELECT per_id,per_nom, per_prenom, AVG(emp_notepersonne) FROM wor_emploi
JOIN wor_personne ON per_id = emp_per_id
WHERE  emp_datefin IS NOT NULL GROUP BY per_id, per_nom, per_prenom
ORDER BY AVG(emp_notepersonne)DESC;


  BEGIN
    v_cpt := 0;
    FOR v_p IN c_classementP LOOP
      v_cpt := v_cpt + 1;
      IF i_id = v_p.per_id THEN
        RETURN v_cpt;
      END IF;
    END LOOP;
  
  END get_positionPersonne;


PROCEDURE affichageClassement AS

CURSOR c_classementP IS SELECT per_id,per_nom, per_prenom, AVG(emp_notepersonne) AS moyenne FROM wor_emploi
JOIN wor_personne ON per_id = emp_per_id
WHERE  emp_datefin IS NOT NULL GROUP BY per_id, per_nom, per_prenom
ORDER BY AVG(emp_notepersonne)DESC;



BEGIN
  
  FOR v_p IN c_classementP LOOP

    dbms_output.put_line(v_p.per_nom || ' ' || v_p.per_prenom || ' est num�ro ' || get_positionPersonne(v_p.per_id) || 
    ' du classement avec un moyenne de : ' || v_p.moyenne);
  END LOOP;        
END affichageClassement;




end pkg_classement_personne;




/


GRANT EXECUTE ON pkg_classement_personne TO role_worksearcher_user;

/

create or replace package pkg_update_personne is

FUNCTION get_Personne_id(i_pseudo IN VARCHAR)RETURN INTEGER;
PROCEDURE updatePersonne(i_address IN VARCHAR, i_mail IN VARCHAR, i_nationalite IN VARCHAR, i_phone IN VARCHAR
         ,i_desc IN VARCHAR,  i_pseudo IN VARCHAR);

end pkg_update_personne;
/
create or replace package body pkg_update_personne is


FUNCTION get_Personne_id(i_pseudo IN VARCHAR)RETURN INTEGER AS
  v_id INTEGER;
  BEGIN
    SELECT per_id INTO v_id FROM wor_personne WHERE per_username = i_pseudo;
    RETURN v_id;
  
  END get_Personne_id;
  
  

PROCEDURE updatePersonne(i_address IN VARCHAR, i_mail IN VARCHAR, i_nationalite IN VARCHAR, i_phone IN VARCHAR
         ,i_desc IN VARCHAR,  i_pseudo IN VARCHAR) AS

v_id_pers INTEGER;

BEGIN
  
  v_id_pers := get_Personne_id(i_pseudo);
 
  UPDATE wor_personne SET per_adresse = i_address, per_email = i_mail, per_nationalite = i_nationalite, 
  per_telephone = i_phone, per_description = i_desc WHERE per_id = v_id_pers;
  
          
END updatePersonne;



end pkg_update_personne;
/
GRANT EXECUTE ON pkg_update_personne TO role_worksearcher_user;



