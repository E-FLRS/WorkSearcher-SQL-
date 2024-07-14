-- ====================================================================
-- Script : 04_insertions_WorkSearcher.sql
-- Objet  : Insertions de donn�es sur les tables WorkSearcher 
-- ====================================================================


ALTER SESSION SEET NLS_DATE_FORMAT = 'DD-MM-YYYY';


-- ====================================================
-- Insertion (avec un trigger) Table : wor_experiencePro
-- ====================================================
DROP SEQUENCE sq_no_xpPro;
CREATE SEQUENCE  sq_no_xpPro  MINVALUE 1 NOMAXVALUE INCREMENT BY 1

/
CREATE OR REPLACE TRIGGER trgTest
 AFTER
 INSERT OR UPDATE
 ON wor_emploi
FOR EACH ROW
BEGIN
    IF :new.emp_datefin IS NOT NULL THEN
       INSERT INTO wor_experiencepro VALUES(sq_no_xpPro.nextval, :new.emp_per_id, :new.emp_nom, :new.emp_datedebut, :new.emp_datefin);
    END IF;         

END;

/




INSERT INTO wor_personne VALUES(1, 'Flores', 'Esteban','27-05-2002', 'M', NULL, 'particulier', 'EFG', 'class', 'EFG@gmail.com', 
                                'Rue de la paix 2', '079 777 77 77', 'Suisse');
INSERT INTO wor_personne VALUES(2, 'Rama', 'Alessandro','26-04-2001', 'M', NULL, 'particulier', 'Juents', 'class', 'JUENTS@gmail.com',
                                'Rue de lausanne 49', '079 888 88 77', 'Suisse');
INSERT INTO wor_personne VALUES(3, 'Pereira Gomes', 'Daniel','21-11-2000', 'M', NULL, 'particulier', 'Danou', 'class', 'DANOU@gmail.com',
                                'Rue du moulin 3', '079 999 99 99', 'Portugal');
INSERT INTO wor_personne VALUES(4, 'Alexakis', 'Christoph','30-03-2002', 'M', NULL, 'particulier', 'ChrisLeGrec', 'class', 'Chris@gmail.com',
                                'Rue de berthet 8', '079 222 22 22', 'Suisse');
INSERT INTO wor_personne VALUES(5, 'Verdon', 'Pamela','01-09-2001', 'F', NULL, 'particulier', 'Pamito', 'class', 'Pamito@gmail.com',
                                'Rue de lancy 15', '078 289 28 28', 'Suisse');
INSERT INTO wor_personne VALUES(6, 'Zumeri', 'Faton','15-02-1998', 'M', NULL, 'particulier', 'PhotoFaton', 'class', 'Faton@gmail.com',
                                'Rue de onex 56', '078 111 11 11', 'France');
INSERT INTO wor_personne VALUES(7, 'Jolidon', 'Enzo','27-01-2000', 'M', NULL, 'particulier', 'Tayak', 'class', 'Tayak@gmail.com',
                                'Rue de chene 32', '079 562 54 54', 'Suisse');
INSERT INTO wor_personne VALUES(8, 'Husmann', 'Billy','03-09-1992', 'M', NULL, 'particulier', 'yann', 'class', 'yann@gmail.com',
                                'Rue de lancy 5', '078 658 78 56', 'Suisse');
INSERT INTO wor_personne VALUES(9, 'Kilic', 'Anel','24-05-1987', 'M', NULL, 'particulier', 'Bosko', 'class', 'Bosko@gmail.com',
                                'Rue du petit 67', '079 657 65 65', 'Suisse');
INSERT INTO wor_personne VALUES(10, 'Furlan', 'Lucas','23-06-1955', 'M', NULL, 'employeur', 'luky', 'class', 'Luky@gmail.com',
                                'Rue du grand 45', '079 657 62 62', 'Suisse');
INSERT INTO wor_personne VALUES(11, 'Naef', 'Florian','02-07-1991', 'M', NULL, 'employeur', 'Migrolino', 'class', 'Migro@gmail.com',
                                'Rue de carouge 5', '079 132 56 78', 'Suisse');
INSERT INTO wor_personne VALUES(12, 'Mazraoui', 'Myriam','17-06-1987', 'F', NULL, 'employeur', 'Mymy', 'class', 'x',
                                'Rue de la paix 53', '078 654 21 32', 'Maroc');

COMMIT;

-- ====================================================
-- Insertion Table : wor_langue
-- ====================================================
INSERT INTO wor_langue VALUES(1, 'Français');
INSERT INTO wor_langue VALUES(2, 'Espagnol');
INSERT INTO wor_langue VALUES(3, 'Anglais');
INSERT INTO wor_langue VALUES(4, 'Allemand');
INSERT INTO wor_langue VALUES(5, 'Italien');

COMMIT;


-- ====================================================
-- Insertion Table : wor_langue
-- ====================================================
INSERT INTO wor_langue_personne VALUES(1, 1);
INSERT INTO wor_langue_personne VALUES(2, 1);
INSERT INTO wor_langue_personne VALUES(1, 2);
INSERT INTO wor_langue_personne VALUES(3, 1);
INSERT INTO wor_langue_personne VALUES(1, 3);
INSERT INTO wor_langue_personne VALUES(1, 4);
INSERT INTO wor_langue_personne VALUES(5, 4);
INSERT INTO wor_langue_personne VALUES(1, 5);
INSERT INTO wor_langue_personne VALUES(2, 5);
INSERT INTO wor_langue_personne VALUES(2, 6);
INSERT INTO wor_langue_personne VALUES(1, 6);
INSERT INTO wor_langue_personne VALUES(1, 7);
INSERT INTO wor_langue_personne VALUES(3, 7);
INSERT INTO wor_langue_personne VALUES(1, 8);
INSERT INTO wor_langue_personne VALUES(1, 9);
INSERT INTO wor_langue_personne VALUES(1, 10);
INSERT INTO wor_langue_personne VALUES(2, 10);
INSERT INTO wor_langue_personne VALUES(3, 10);
INSERT INTO wor_langue_personne VALUES(1, 11);
INSERT INTO wor_langue_personne VALUES(2, 11);
INSERT INTO wor_langue_personne VALUES(1, 12);
INSERT INTO wor_langue_personne VALUES(3, 12);

COMMIT;

-- ====================================================
-- Insertion Table : wor_diplome
-- ====================================================
INSERT INTO wor_diplome VALUES(1, 'Bachelor IG');
INSERT INTO wor_diplome VALUES(2, 'Bachelor EE');
INSERT INTO wor_diplome VALUES(3, 'Bachelor Art');
INSERT INTO wor_diplome VALUES(4, 'Master Marketing');
INSERT INTO wor_diplome VALUES(5, 'Maturité Pro');
INSERT INTO wor_diplome VALUES(6, 'Brevet Economie');

COMMIT;




-- ====================================================
-- Insertion Table : wor_diplome
-- ====================================================

INSERT INTO wor_diplome_personne VALUES(1,1);
INSERT INTO wor_diplome_personne VALUES(2,2);
INSERT INTO wor_diplome_personne VALUES(3,3);
INSERT INTO wor_diplome_personne VALUES(4,4);
INSERT INTO wor_diplome_personne VALUES(3,4);
INSERT INTO wor_diplome_personne VALUES(3,5);
INSERT INTO wor_diplome_personne VALUES(1,5);
INSERT INTO wor_diplome_personne VALUES(4,6);
INSERT INTO wor_diplome_personne VALUES(2,7);
INSERT INTO wor_diplome_personne VALUES(3,7);
INSERT INTO wor_diplome_personne VALUES(1,8);
INSERT INTO wor_diplome_personne VALUES(4,9);
INSERT INTO wor_diplome_personne VALUES(5,10);
INSERT INTO wor_diplome_personne VALUES(6,10);
INSERT INTO wor_diplome_personne VALUES(2,11);
INSERT INTO wor_diplome_personne VALUES(1,12);

COMMIT;



-- ====================================================
-- Insertion Table : wor_Competence
-- ====================================================
INSERT INTO wor_competence VALUES(1, 'Java');
INSERT INTO wor_competence VALUES(2, 'Python');
INSERT INTO wor_competence VALUES(3, 'C#');
INSERT INTO wor_competence VALUES(4, 'SQL');
INSERT INTO wor_competence VALUES(5, 'Reseau');
INSERT INTO wor_competence VALUES(6, 'MySql');
INSERT INTO wor_competence VALUES(7, 'Modelisation');
INSERT INTO wor_competence VALUES(8, 'Comptabilite');
INSERT INTO wor_competence VALUES(9, 'Droit');
INSERT INTO wor_competence VALUES(10, 'RH');
INSERT INTO wor_competence VALUES(11, 'Langue étrangère');
INSERT INTO wor_competence VALUES (12, 'Art');
INSERT INTO wor_competence VALUES(13, 'Marketing');

COMMIT;

-- ====================================================
-- Insertion Table : wor_ville
-- ====================================================
INSERT INTO wor_ville VALUES(1, 'Genève', 'Suisse');
INSERT INTO wor_ville VALUES(2, 'Lausanne', 'Suisse');
INSERT INTO wor_ville VALUES(3, 'Bienne', 'Suisse');
INSERT INTO wor_ville VALUES(4, 'Neuchatel', 'Suisse');
INSERT INTO wor_ville VALUES(5, 'Berne', 'Suisse');
INSERT INTO wor_ville VALUES(6, 'Gaillard', 'France');

COMMIT;
-- ====================================================
-- Insertion Table : wor_type
-- ====================================================

INSERT INTO wor_type  VALUES (1, 'Programmation');
INSERT INTO wor_type  VALUES (2, 'Design graphique');
INSERT INTO wor_type  VALUES (3, 'Marketing');
INSERT INTO wor_type  VALUES (4, 'administration');
INSERT INTO wor_type VALUES (5, 'Rédaction de contenu');
INSERT INTO wor_type VALUES(6, 'Ressources humaines');
INSERT INTO wor_type VALUES(7, 'Finance');
INSERT INTO wor_type VALUES(8, 'Gestion de données');
INSERT INTO wor_type VALUES(9, 'Droit');


COMMIT;

-- ====================================================
-- Insertion Table : wor_Entreprise
-- ====================================================
INSERT INTO wor_entreprise  VALUES (1, 2, 'ABC Corp', 'Technologie');
INSERT INTO wor_entreprise  VALUES (2, 3, 'XYZ Inc', 'Services financiers');
INSERT INTO wor_entreprise  VALUES (3, 1, 'Acme Corporation', 'Fabrication');
INSERT INTO wor_entreprise  VALUES (4, 4, 'Innovate Ltd', 'Consulting');
INSERT INTO wor_entreprise  VALUES (5, 5, 'Zenith Corporation', 'Technologie');
INSERT INTO wor_entreprise  VALUES (6, 2, 'Globe Corporation', 'Services financiers');
INSERT INTO wor_entreprise  VALUES (7, 1, 'Apex Ltd', 'Technologie');
INSERT INTO wor_entreprise  VALUES (8, 3, 'Global Corporation', 'Consulting');
INSERT INTO wor_entreprise  VALUES (9, 6, 'Alpha Corporation', 'Fabrication');
INSERT INTO wor_entreprise  VALUES (10, 4, 'Beta Inc', 'Services financiers');
INSERT INTO wor_entreprise  VALUES (11, 5, 'Gamma Ltd', 'Technologie');
INSERT INTO wor_entreprise  VALUES (12, 6, 'Sigma Corporation', 'Consulting');
INSERT INTO wor_entreprise  VALUES (13, 4, 'Delta Corporation', 'Services financiers');
INSERT INTO wor_entreprise  VALUES (14, 1, 'Epsilon Inc', 'Technologie');
INSERT INTO wor_entreprise  VALUES (15, 2, 'Zeta Ltd', 'Consulting');

COMMIT;

-- ====================================================
-- Insertion Table : wor_Emploi
-- ====================================================


 
INSERT INTO wor_emploi 
VALUES (1, 1, 1, 1, 'Développeur web junior', '15-11-2015', '31-05-2016', null, 5, NULL, NULL, null, null);
INSERT INTO wor_emploi   
VALUES (2, 7, 9, 2, 'Comptable', '01-06-2017', '31-12-2017', null, 4, NULL, NULL, null, null); 
INSERT INTO wor_emploi   
VALUES (3, 2, 3, 4, 'Designer graphique', '01-12-2019', '31-08-2020', null, 4, NULL, NULL, null, null);
INSERT INTO wor_emploi   
VALUES (4, 3, 11, 5, 'Spécialiste en marketing numérique', '01-10-2016', '31-05-2019', null, 4, NULL, NULL,  null, null); 
INSERT INTO wor_emploi   
VALUES (5, 4, 1, 6, 'Assistant administratif', '30-11-2019', '30-04-2020', null, 5, NULL, NULL, null, null); 
INSERT INTO wor_emploi   
VALUES (6, 5, 6, 3, 'Gestionnaire de médias sociaux', '01-06-2019', '30-06-2020', null, 3, NULL, NULL, null, null); 
INSERT INTO wor_emploi  
VALUES (7, 1, 2, 1, 'Développeur de logiciels', '01-07-2016', '31-05-2020', null, 2, NULL, NULL, null, null); 
INSERT INTO wor_emploi  
VALUES (8, 1, 4, 3, 'Développeur front-end', '01-10-2018', '31-05-2019', null, 5, NULL, NULL,  null, null); 
INSERT INTO wor_emploi  
VALUES (9, 7, 13, 2, 'Comptable fiscaliste', '01-02-2018', '30-01-2020', null, 5, NULL, NULL, null, null); 
INSERT INTO wor_emploi  
VALUES (10, 4, 3, 6, 'Secrétaire administrative', '01-05-2020', '31-12-2022', null, 3, NULL, NULL, null, null);
INSERT INTO wor_emploi  
VALUES (11, 8, 11, 8, 'Analyste de données', '15-11-2021', '31-05-2022', null, 4, NULL, NULL, null, null); 
INSERT INTO wor_emploi  
VALUES (12, 6, 5, 7, 'Conseiller en ressources humaines', '01-12-2019', '31-12-2022', null, 5, NULL, NULL, null, null); 
INSERT INTO wor_emploi  
VALUES (13, 1, 2, 1, 'Développeur full-stack', '01-06-2020', null, null, null, NULL, NULL, null, null); 
INSERT INTO wor_emploi  
VALUES (14, 7, 10, 2, 'Analyste financier', '30-03-2020', null, null, null, NULL, NULL, null, null); 
INSERT INTO wor_emploi  
VALUES (15, 2, 1, 4, 'Graphiste', '01-10-2020', '30-05-2021', null, 4, NULL, NULL, null, null); 
INSERT INTO wor_emploi  
VALUES (16, 3, 9, 3, 'Chargé de projet', '01-01-2021', null, null, null, NULL, NULL, null, null); 
INSERT INTO wor_emploi  
VALUES (17, 9, 4, 9, 'Assistant juridique', '15-11-2020', '31-03-2022', null, 4, NULL, NULL,  null, null); 
INSERT INTO wor_emploi  
VALUES (18, 7, 5, 3, 'Analyste de données', '01-06-2022', '30-04-2023', null, 5, NULL, NULL,  null, null); 
INSERT INTO wor_emploi  
VALUES (19, 6, 11, 7, 'Conseiller en ressources humaines', '01-01-2023', null, null, null, NULL, NULL, null, null); 
INSERT INTO wor_emploi  
VALUES (20, 1, 6, 3, 'Développeur full-stack', '03-01-2020', null, null, null, NULL, NULL, null, null); 
INSERT INTO wor_emploi  
VALUES (21, 2, 10, 4, 'Graphiste', '01-06-2021', null, null, null, NULL, NULL, null, null); 

INSERT INTO wor_emploi VALUES(22, 5, 9, NULL, 'Redacteur en chef', '01-06-2023', NULL, NULL, NULL, NULL, NULL,NULL,NULL);
INSERT INTO wor_emploi VALUES(23, 7, 15, NULL, 'Comptable', '30-06-2023', NULL, NULL, NULL,'Commentaire Entreprise', NULL,'Condition','Critere');
INSERT INTO wor_emploi VALUES(24, 1, 12, NULL, 'Gérant de projet backend', '01-07-2023', NULL, NULL, NULL, 'Commentaire Entreprise', NULL,'Condition ','Critere');

COMMIT;

-- ====================================================
-- Insertion Table : wor_competence_personne
-- ====================================================

INSERT INTO wor_competence_personne VALUES (1, 1, 4, '15-11-2015');
INSERT INTO wor_competence_personne VALUES (2, 1, 5, '15-05-2014');
INSERT INTO wor_competence_personne VALUES (4, 2, 3, '01-09-2017');
INSERT INTO wor_competence_personne VALUES (8, 2, 5, '01-06-2018');
INSERT INTO wor_competence_personne VALUES (2, 3, 5, '01-08-2020');
INSERT INTO wor_competence_personne VALUES (3, 3, 4, '01-12-2022');
INSERT INTO wor_competence_personne VALUES (12, 4, 5, '01-10-2019');
INSERT INTO wor_competence_personne VALUES (11, 5, 5, '30-10-2022');
INSERT INTO wor_competence_personne VALUES (13, 5, 5, '01-12-2019');
INSERT INTO wor_competence_personne VALUES (11, 6, 3, '15-11-2021');
INSERT INTO wor_competence_personne VALUES (10, 7, 5, '15-11-2020');
INSERT INTO wor_competence_personne VALUES (11, 7, 3, '01-02-2023');
INSERT INTO wor_competence_personne VALUES (4, 8, 5, '01-04-2018');
INSERT INTO wor_competence_personne VALUES (7, 8, 4, '15-03-2017');
INSERT INTO wor_competence_personne VALUES (5, 8, 2, '15-11-2018');
INSERT INTO wor_competence_personne VALUES (9, 9, 5, '15-06-2021');

-- ====================================================
-- Insertion Table : wor_competence_emploi
-- ====================================================

INSERT INTO wor_competence_emploi VALUES (1, 1, 4, 2); 
INSERT INTO wor_competence_emploi VALUES (2, 1, 2, 1); 
INSERT INTO wor_competence_emploi VALUES (8, 2, 3, 3); 
INSERT INTO wor_competence_emploi VALUES (9, 2, 2, 2); 
INSERT INTO wor_competence_emploi VALUES (2, 3, 3, 2); 
INSERT INTO wor_competence_emploi VALUES (12, 3, 5, 1);
INSERT INTO wor_competence_emploi VALUES (13, 4, 4, 3);
INSERT INTO wor_competence_emploi VALUES (11, 4, 2, 2);
INSERT INTO wor_competence_emploi VALUES (4, 5, 3, 1); 
INSERT INTO wor_competence_emploi VALUES (6, 5, 2, 1); 
INSERT INTO wor_competence_emploi VALUES (13, 6, 4, 2);
INSERT INTO wor_competence_emploi VALUES (11, 6, 3, 1);
INSERT INTO wor_competence_emploi VALUES (1, 7, 5, 4); 
INSERT INTO wor_competence_emploi VALUES (3, 7, 4, 3); 
INSERT INTO wor_competence_emploi VALUES (1, 8, 4, 2); 
INSERT INTO wor_competence_emploi VALUES (2, 8, 3, 1); 
INSERT INTO wor_competence_emploi VALUES (8, 9, 4, 4); 
INSERT INTO wor_competence_emploi VALUES (9, 9, 3, 3); 
INSERT INTO wor_competence_emploi VALUES (4, 10, 3, 1);
INSERT INTO wor_competence_emploi VALUES (6, 10, 2, 1); 
INSERT INTO wor_competence_emploi VALUES (4, 11, 5, 3); 
INSERT INTO wor_competence_emploi VALUES (7, 11, 4, 2); 
INSERT INTO wor_competence_emploi VALUES (10, 12, 4, 3);
INSERT INTO wor_competence_emploi VALUES (1, 13, 3, 4);
INSERT INTO wor_competence_emploi VALUES (8, 14, 2, 1);
INSERT INTO wor_competence_emploi VALUES (12, 15, 2, 1);
INSERT INTO wor_competence_emploi VALUES (13, 16, 3, 2);
INSERT INTO wor_competence_emploi VALUES (9, 17, 3, 1);
INSERT INTO wor_competence_emploi VALUES (4, 18, 4, 3);
INSERT INTO wor_competence_emploi VALUES (6, 18, 2, 2);
INSERT INTO wor_competence_emploi VALUES (10, 19, 3, 4);
INSERT INTO wor_competence_emploi VALUES (1, 20, 3, 2);
INSERT INTO wor_competence_emploi VALUES (12, 21, 2, 1);

COMMIT;

