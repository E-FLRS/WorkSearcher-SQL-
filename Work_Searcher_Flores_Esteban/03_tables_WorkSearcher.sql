-- -----------------------------------------------------------------------------
--             G�n�ration d'une base de donn�es pour
--                      Oracle Version 10g
--                        (24/4/2023 15:53:15)
-- -----------------------------------------------------------------------------
--      Nom de la base : MLR5
--      Projet : Espace de travail
--      Auteur : Flores
--      Date de derni�re modification : 24/4/2023 15:53:05
-- -----------------------------------------------------------------------------

DROP TABLE WOR_DIPLOME CASCADE CONSTRAINTS;

DROP TABLE WOR_ENTREPRISE CASCADE CONSTRAINTS;

DROP TABLE WOR_EMPLOI CASCADE CONSTRAINTS;

DROP TABLE WOR_PERSONNE CASCADE CONSTRAINTS;

DROP TABLE WOR_VILLE CASCADE CONSTRAINTS;

DROP TABLE WOR_LANGUE CASCADE CONSTRAINTS;

DROP TABLE WOR_COMPETENCE CASCADE CONSTRAINTS;

DROP TABLE WOR_EXPERIENCEPRO CASCADE CONSTRAINTS;

DROP TABLE WOR_TYPE CASCADE CONSTRAINTS;

DROP TABLE WOR_LANGUE_PERSONNE CASCADE CONSTRAINTS;

DROP TABLE WOR_COMPETENCE_EMPLOI CASCADE CONSTRAINTS;

DROP TABLE WOR_DIPLOME_PERSONNE CASCADE CONSTRAINTS;

DROP TABLE WOR_COMPETENCE_PERSONNE CASCADE CONSTRAINTS;

DROP TRIGGER trg_personne_id;
DROP TRIGGER trg_emploi_id;
DROP TRIGGER trg_entreprise_id;




-- -----------------------------------------------------------------------------
--       TABLE : WOR_DIPLOME
-- -----------------------------------------------------------------------------

CREATE TABLE WOR_DIPLOME
   (
    DIP_ID NUMBER(5)  NOT NULL,
    DIP_NOM VARCHAR2(50)  NOT NULL
,   CONSTRAINT PK_WOR_DIPLOME PRIMARY KEY (DIP_ID)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : wor_VILLE
-- -----------------------------------------------------------------------------

CREATE TABLE wor_VILLE
   (
    VIL_ID NUMBER(5)  NOT NULL,
    VIL_NOM VARCHAR2(50) NOT NULL,
    VIL_PAYS VARCHAR2(32)  NOT NULL
,   CONSTRAINT PK_wor_VILLE PRIMARY KEY (VIL_ID)  
   ) ;

COMMENT ON COLUMN wor_VILLE.VIL_ID
     IS 'id de la ville';

COMMENT ON COLUMN wor_VILLE.VIL_NOM
     IS 'nom de la ville';

-- -----------------------------------------------------------------------------
--       TABLE : WOR_EMPLOI
-- -----------------------------------------------------------------------------

CREATE TABLE WOR_EMPLOI
   (
    EMP_ID NUMBER(5)  NOT NULL,
    EMP_TYP_ID NUMBER(5)  NOT NULL,
    EMP_ENT_ID NUMBER(5)  NOT NULL,
    EMP_PER_ID NUMBER(5)  NULL,
    EMP_NOM VARCHAR2(50)  NOT NULL,
    EMP_DATEDEBUT DATE  NOT NULL,
    EMP_DATEFIN DATE  NULL,
    EMP_COMMENTAIREPERSONNE VARCHAR2(50)  NULL,
    EMP_NOTEPERSONNE NUMBER(5)  NULL,
    EMP_COMMENTAIREENTREPRISE VARCHAR2(50)  NULL,
    EMP_NOTEENTREPRISE NUMBER(5)  NULL,
    EMP_CONDITION VARCHAR2(50)  NULL,
    EMP_CRITERE VARCHAR2(50)  NULL
,   CONSTRAINT PK_WOR_EMPLOI PRIMARY KEY (EMP_ID)  
   ) ;

COMMENT ON COLUMN WOR_EMPLOI.EMP_ID
     IS 'id du travail';

COMMENT ON COLUMN WOR_EMPLOI.EMP_ENT_ID
     IS 'id de l''entreprise';

COMMENT ON COLUMN WOR_EMPLOI.EMP_PER_ID
     IS 'Ceci est l''id de la personne';

COMMENT ON COLUMN WOR_EMPLOI.EMP_NOM
     IS 'nom du travail';

COMMENT ON COLUMN WOR_EMPLOI.EMP_DATEDEBUT
     IS 'date du d�but de l''emploi';

COMMENT ON COLUMN WOR_EMPLOI.EMP_DATEFIN
     IS 'date de fin de l''emploi';

COMMENT ON COLUMN WOR_EMPLOI.EMP_COMMENTAIREPERSONNE
     IS 'Commentaire sur la personne qui occupe l''emploi';

COMMENT ON COLUMN WOR_EMPLOI.EMP_NOTEPERSONNE
     IS 'Note sur la personne qui occupe l''emploi';

COMMENT ON COLUMN WOR_EMPLOI.EMP_COMMENTAIREENTREPRISE
     IS 'commentaire sur l''entreprise qui propose l''emploi';

COMMENT ON COLUMN WOR_EMPLOI.EMP_NOTEENTREPRISE
     IS 'note sur l''entreprise qui propose l''emploi';

COMMENT ON COLUMN WOR_EMPLOI.EMP_CONDITION
     IS 'Condition de l''emploi (�tre passion�, travailler les week-end...)';

COMMENT ON COLUMN WOR_EMPLOI.EMP_CRITERE
     IS 'crit�re pour l''emploi (diplome...)';



-- -----------------------------------------------------------------------------
--       TABLE : WOR_PERSONNE
-- -----------------------------------------------------------------------------

CREATE TABLE WOR_PERSONNE
   (
    PER_ID NUMBER(5)  NOT NULL,
    PER_NOM VARCHAR2(50)  NULL,
    PER_PRENOM VARCHAR2(50)  NULL,
    PER_DATENAISSANCE DATE  NULL,
    PER_SEXE VARCHAR2(50)  NULL,
    PER_DESCRIPTION VARCHAR2(50)  NULL,
    PER_ROLE VARCHAR2(50)  NULL,
    PER_USERNAME VARCHAR2(50)  NULL,
    PER_PASSWORD VARCHAR2(50)  NULL,
    PER_EMAIL VARCHAR2(50)  NULL,
    PER_ADRESSE VARCHAR2(50)  NULL,
    PER_TELEPHONE VARCHAR2(50)  NULL,
    PER_NATIONALITE VARCHAR2(50)  NULL
,   CONSTRAINT PK_WOR_PERSONNE PRIMARY KEY (PER_ID)  
   ) ;

COMMENT ON COLUMN WOR_PERSONNE.PER_ID
     IS 'Ceci est l''id de la personne';

COMMENT ON COLUMN WOR_PERSONNE.PER_NOM
     IS 'C''est le nom de la personne';

COMMENT ON COLUMN WOR_PERSONNE.PER_PRENOM
     IS 'c''est le prenom de la personne';

COMMENT ON COLUMN WOR_PERSONNE.PER_DATENAISSANCE
     IS 'c''est l''age de la personne';

COMMENT ON COLUMN WOR_PERSONNE.PER_SEXE
     IS 'c''est le sexe de la personne (homme ou femme)';

COMMENT ON COLUMN WOR_PERSONNE.PER_DESCRIPTION
     IS 'Description de la personne, son profil';

-- -----------------------------------------------------------------------------
--       TABLE : wor_TYPE
-- -----------------------------------------------------------------------------

CREATE TABLE wor_TYPE
   (
    TYP_ID NUMBER(5)  NOT NULL,
    TYP_NOM VARCHAR2(50)  NOT NULL
,   CONSTRAINT PK_wor_TYPE PRIMARY KEY (TYP_ID)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : wor_COMPETENCE
-- -----------------------------------------------------------------------------

CREATE TABLE wor_COMPETENCE
   (
    COM_ID NUMBER(5)  NOT NULL,
    COM_NOM VARCHAR2(50)  NOT NULL
,   CONSTRAINT PK_wor_COMPETENCE PRIMARY KEY (COM_ID)  
   ) ;

COMMENT ON COLUMN wor_COMPETENCE.COM_ID
     IS 'id de la competence';

COMMENT ON COLUMN wor_COMPETENCE.COM_NOM
     IS 'nom de la comp�tence';


-- -----------------------------------------------------------------------------
--       TABLE : WOR_LANGUE
-- -----------------------------------------------------------------------------

CREATE TABLE WOR_LANGUE
   (
    LAN_ID  NUMBER(5)  NOT NULL,
    LAN_NOM VARCHAR2(50)  NOT NULL
,   CONSTRAINT PK_WOR_LANGUE PRIMARY KEY (LAN_ID)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : wor_ENTREPRISE
-- -----------------------------------------------------------------------------

CREATE TABLE wor_ENTREPRISE
   (
    ENT_ID NUMBER(5)  NOT NULL,
    ENT_VIL_ID NUMBER(5)  NOT NULL,
    ENT_NOM VARCHAR2(50)  NOT NULL,
    ENT_TYPE VARCHAR2(50)  NULL
,   CONSTRAINT PK_wor_ENTREPRISE PRIMARY KEY (ENT_ID)  
   ) ;

COMMENT ON COLUMN wor_ENTREPRISE.ENT_ID
     IS 'id de l''entreprise';

COMMENT ON COLUMN wor_ENTREPRISE.ENT_VIL_ID
     IS 'id de la ville';

COMMENT ON COLUMN wor_ENTREPRISE.ENT_NOM
     IS 'nom de l''entreprise';

COMMENT ON COLUMN wor_ENTREPRISE.ENT_TYPE
     IS 'type de l''entreprise';




-- -----------------------------------------------------------------------------
--       TABLE : WOR_EXPERIENCEPRO
-- -----------------------------------------------------------------------------

CREATE TABLE WOR_EXPERIENCEPRO
   (
    EXP_ID NUMBER(5)  NOT NULL,
    EXP_PER_ID NUMBER(5)  NOT NULL,
    EXP_NOM VARCHAR2(50)  NOT NULL,
    EXP_DATEDEBUT DATE  NOT NULL,
    EXP_DATEFIN DATE  NOT NULL
,   CONSTRAINT PK_WOR_EXPERIENCEPRO PRIMARY KEY (EXP_ID)  
   ) ;

COMMENT ON COLUMN WOR_EXPERIENCEPRO.EXP_PER_ID
     IS 'Ceci est l''id de la personne';



-- -----------------------------------------------------------------------------
--       TABLE : WOR_LANGUE_PERSONNE
-- -----------------------------------------------------------------------------

CREATE TABLE WOR_LANGUE_PERSONNE
   (
    LP_LAN_ID NUMBER(5)  NOT NULL,
    LP_PER_ID NUMBER(5)  NOT NULL
,   CONSTRAINT PK_WOR_LANGUE_PERSONNE PRIMARY KEY (LP_LAN_ID, LP_PER_ID)  
   ) ;

COMMENT ON COLUMN WOR_LANGUE_PERSONNE.LP_PER_ID
     IS 'Ceci est l''id de la personne';


-- -----------------------------------------------------------------------------
--       TABLE : WOR_COMPETENCE_EMPLOI
-- -----------------------------------------------------------------------------

CREATE TABLE WOR_COMPETENCE_EMPLOI
   (
    CE_COM_ID NUMBER(5)  NOT NULL,
    CE_TRA_ID NUMBER(5)  NOT NULL,
    CE_TRA_NIVEAUREQUIS VARCHAR2(50)  NULL,
    CE_TRA_EXPERIENCEREQUISE VARCHAR2(50)  NULL
,   CONSTRAINT PK_WOR_COMPETENCE_EMPLOI PRIMARY KEY (CE_COM_ID, CE_TRA_ID)  
   ) ;

COMMENT ON COLUMN WOR_COMPETENCE_EMPLOI.CE_COM_ID
     IS 'id de la competence';

COMMENT ON COLUMN WOR_COMPETENCE_EMPLOI.CE_TRA_ID
     IS 'id du travail';

COMMENT ON COLUMN WOR_COMPETENCE_EMPLOI.CE_TRA_NIVEAUREQUIS
     IS 'Niveau que le travail exige pour la comp�tence';

COMMENT ON COLUMN WOR_COMPETENCE_EMPLOI.CE_TRA_EXPERIENCEREQUISE
     IS 'niveau d''exprience que le poste requiere';



-- -----------------------------------------------------------------------------
--       TABLE : WOR_DIPLOME_PERSONNE
-- -----------------------------------------------------------------------------

CREATE TABLE WOR_DIPLOME_PERSONNE
   (
    DP_DIP_ID NUMBER(5)  NOT NULL,
    DP_PER_ID NUMBER(5)  NOT NULL
,   CONSTRAINT PK_WOR_DIPLOME_PERSONNE PRIMARY KEY (DP_DIP_ID, DP_PER_ID)  
   ) ;

COMMENT ON COLUMN WOR_DIPLOME_PERSONNE.DP_PER_ID
     IS 'Ceci est l''id de la personne';


-- -----------------------------------------------------------------------------
--       TABLE : WOR_COMPETENCE_PERSONNE
-- -----------------------------------------------------------------------------

CREATE TABLE WOR_COMPETENCE_PERSONNE
   (
    CP_COM_ID NUMBER(5)  NOT NULL,
    CP_PER_ID NUMBER(5)  NOT NULL,
    CP_NIVEAU NUMBER(5)  NOT NULL,
    CP_DATEDEBUTEXPERIENCE DATE  NOT NULL
,   CONSTRAINT PK_WOR_COMPETENCE_PERSONNE PRIMARY KEY (CP_COM_ID, CP_PER_ID)  
   ) ;

COMMENT ON COLUMN WOR_COMPETENCE_PERSONNE.CP_COM_ID
     IS 'id de la competence';

COMMENT ON COLUMN WOR_COMPETENCE_PERSONNE.CP_PER_ID
     IS 'Ceci est l''id de la personne';

COMMENT ON COLUMN WOR_COMPETENCE_PERSONNE.CP_NIVEAU
     IS 'c''est le niveau que la personne a de cette comp�tence';

COMMENT ON COLUMN WOR_COMPETENCE_PERSONNE.CP_DATEDEBUTEXPERIENCE
     IS 'date depuis quand la personne a atteind le niveau de la comp�tence';





-- -----------------------------------------------------------------------------
--       CREATION DES REFERENCES DE TABLE
-- -----------------------------------------------------------------------------


ALTER TABLE WOR_ENTREPRISE ADD (
     CONSTRAINT FK_WOR_ENTREPRISE_WOR_VILLE
          FOREIGN KEY (ENT_VIL_ID)
               REFERENCES WOR_VILLE (VIL_ID))   ;

ALTER TABLE WOR_EMPLOI ADD (
     CONSTRAINT FK_WOR_EMPLOI_WOR_ENTREPRISE
          FOREIGN KEY (EMP_ENT_ID)
               REFERENCES WOR_ENTREPRISE (ENT_ID))   ;

ALTER TABLE WOR_EMPLOI ADD (
     CONSTRAINT FK_WOR_EMPLOI_WOR_TYPE
          FOREIGN KEY (EMP_TYP_ID)
               REFERENCES WOR_TYPE (TYP_ID))   ;

ALTER TABLE WOR_EMPLOI ADD (
     CONSTRAINT FK_WOR_EMPLOI_WOR_PERSONNE
          FOREIGN KEY (EMP_PER_ID)
               REFERENCES WOR_PERSONNE (PER_ID))   ;

ALTER TABLE WOR_EXPERIENCEPRO ADD (
     CONSTRAINT FK_WOR_EXPERIENCEPRO_WOR_PERSO
          FOREIGN KEY (EXP_PER_ID)
               REFERENCES WOR_PERSONNE (PER_ID))   ;

ALTER TABLE WOR_LANGUE_PERSONNE ADD (
     CONSTRAINT FK_WOR_LANGUE_PERSONNE_WOR_LAN
          FOREIGN KEY (LP_LAN_ID)
               REFERENCES WOR_LANGUE (LAN_ID))   ;

ALTER TABLE WOR_LANGUE_PERSONNE ADD (
     CONSTRAINT FK_WOR_LANGUE_PERSONNE_WOR_PER
          FOREIGN KEY (LP_PER_ID)
               REFERENCES WOR_PERSONNE (PER_ID))   ;

ALTER TABLE WOR_COMPETENCE_EMPLOI ADD (
     CONSTRAINT FK_WOR_COMPETENCE_EMPLOI_WOR_C
          FOREIGN KEY (CE_COM_ID)
               REFERENCES WOR_COMPETENCE (COM_ID))   ;

ALTER TABLE WOR_COMPETENCE_EMPLOI ADD (
     CONSTRAINT FK_WOR_COMPETENCE_EMPLOI_WOR_E
          FOREIGN KEY (CE_TRA_ID)
               REFERENCES WOR_EMPLOI (EMP_ID))   ;

ALTER TABLE WOR_DIPLOME_PERSONNE ADD (
     CONSTRAINT FK_WOR_DIPLOME_PERSONNE_WOR_DI
          FOREIGN KEY (DP_DIP_ID)
               REFERENCES WOR_DIPLOME (DIP_ID))   ;

ALTER TABLE WOR_DIPLOME_PERSONNE ADD (
     CONSTRAINT FK_WOR_DIPLOME_PERSONNE_WOR_PE
          FOREIGN KEY (DP_PER_ID)
               REFERENCES WOR_PERSONNE (PER_ID))   ;

ALTER TABLE WOR_COMPETENCE_PERSONNE ADD (
     CONSTRAINT FK_WOR_COMPETENCE_PERSONNE_WOR
          FOREIGN KEY (CP_COM_ID)
               REFERENCES WOR_COMPETENCE (COM_ID))   ;

ALTER TABLE WOR_COMPETENCE_PERSONNE ADD (
     CONSTRAINT FK_WOR_COMPETENCE_PERSONNE_WO1
          FOREIGN KEY (CP_PER_ID)
               REFERENCES WOR_PERSONNE (PER_ID))   ;


-- -----------------------------------------------------------------------------
--                FIN DE GENERATION
-- -----------------------------------------------------------------------------
