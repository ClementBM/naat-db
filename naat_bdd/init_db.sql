
/*
Agent_Type
Entreprise, Etat, Organisation publique, Association, Particulier
*/
INSERT INTO Agent_Type (Name) VALUES ('Entreprise');
INSERT INTO Agent_Type (Name) VALUES ('Etat');
INSERT INTO Agent_Type (Name) VALUES ('Organisation publique');
INSERT INTO Agent_Type (Name) VALUES ('Association');
INSERT INTO Agent_Type (Name) VALUES ('Particulier');

/*
Ground_Type
Public trust, Tort law, Droits humains, Normes environnementales, Droit civil
*/
INSERT INTO Ground_Type (Name) VALUES ('Public trust');
INSERT INTO Ground_Type (Name) VALUES ('Tort law');
INSERT INTO Ground_Type (Name) VALUES ('Droits humains');
INSERT INTO Ground_Type (Name) VALUES ('Normes environnementales');
INSERT INTO Ground_Type (Name) VALUES ('Droit civil');

/*
Appeal_Type
Climat, Environnement, Climat/Environnement
*/
INSERT INTO Appeal_Type (Name) VALUES ('Climat');
INSERT INTO Appeal_Type (Name) VALUES ('Environnement');
INSERT INTO Appeal_Type (Name) VALUES ('Climat/Environnement');
INSERT INTO Appeal_Type (Name) VALUES ('Autre');

/*
Resource_Type
Décision, Ouvrage/Article, Newsletter
*/
INSERT INTO Resource_Type (Name) VALUES ('Décision');
INSERT INTO Resource_Type (Name) VALUES ('Ouvrage/Article');
INSERT INTO Resource_Type (Name) VALUES ('Newsletter');

/*
Final_Decision
Demandes accueillies, Rejet, Ne statue pas sur le fond, Demande partiellement accueillies
*/
INSERT INTO Final_Decision (Name) VALUES ('Demandes accueillies');
INSERT INTO Final_Decision (Name) VALUES ('Rejet');
INSERT INTO Final_Decision (Name) VALUES ('Ne statue pas sur le fond');
INSERT INTO Final_Decision (Name) VALUES ('Demande partiellement accueillies');

/*
Case_Status
En cours, Finie, En appel
*/
INSERT INTO Case_Status (Name) VALUES ('En cours');
INSERT INTO Case_Status (Name) VALUES ('Finie');
INSERT INTO Case_Status (Name) VALUES ('En appel');

/*
AgentParty
Partie demanderesse, Partie défenderesse, Tiers
*/
INSERT INTO Agent_Party (Name) VALUES ('Partie demanderesse');
INSERT INTO Agent_Party (Name) VALUES ('Partie défenderesse');
INSERT INTO Agent_Party (Name) VALUES ('Tiers');
