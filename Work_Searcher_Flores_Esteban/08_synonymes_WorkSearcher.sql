-- ======================================================================
--  Script: 08_synonymes_WorkSearcher.sql 
--  Objet : Cr�ation des synonymes de la base WorkSearcher 
-- ======================================================================

CREATE OR REPLACE SYNONYM WorkSearcher_user.vw_particulier FOR WorkSearcher_data.vw_particulier;
CREATE OR REPLACE SYNONYM WorkSearcher_user.vw_emploi_fini FOR WorkSearcher_data.vw_emploi_fini;
CREATE OR REPLACE SYNONYM WorkSearcher_user.vw_emploi_enRecherche FOR WorkSearcher_data.vw_emploi_enRecherche;
CREATE OR REPLACE SYNONYM WorkSearcher_user.vw_emploi_personne FOR WorkSearcher_data.vw_emploi_personne;

CREATE OR REPLACE SYNONYM WorkSearcher_user.pkg_update_personne FOR WorkSearcher_data.pkg_update_personne;
CREATE OR REPLACE SYNONYM WorkSearcher_user.pkg_classement_personne FOR WorkSearcher_data.pkg_classement_personne;


CREATE OR REPLACE SYNONYM WorkSearcher_user.sq_personne FOR WorkSearcher_data.sq_personne;
CREATE OR REPLACE SYNONYM WorkSearcher_user.sq_emploi FOR WorkSearcher_data.sq_emploi;
CREATE OR REPLACE SYNONYM WorkSearcher_user.sq_entreprise FOR WorkSearcher_data.sq_entreprise;