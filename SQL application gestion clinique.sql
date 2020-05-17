#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Departement
#------------------------------------------------------------

CREATE TABLE Departement(
        NumDep Int  Auto_increment  NOT NULL ,
        nomDep Varchar (50) NOT NULL
	,CONSTRAINT Departement_Idx INDEX (nomDep)
	,CONSTRAINT Departement_PK PRIMARY KEY (NumDep)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Chambre
#------------------------------------------------------------

CREATE TABLE Chambre(
        NumChambre       Int  Auto_increment  NOT NULL ,
        TypeChambre      Varchar (50) NOT NULL ,
        CategorieChambre Varchar (50) NOT NULL ,
        NumDep           Int NOT NULL
	,CONSTRAINT Chambre_Idx INDEX (TypeChambre,CategorieChambre)
	,CONSTRAINT Chambre_PK PRIMARY KEY (NumChambre)

	,CONSTRAINT Chambre_Departement_FK FOREIGN KEY (NumDep) REFERENCES Departement(NumDep)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Lit
#------------------------------------------------------------

CREATE TABLE Lit(
        NumLit     Int  Auto_increment  NOT NULL ,
        NumChambre Int NOT NULL
	,CONSTRAINT Lit_PK PRIMARY KEY (NumLit)

	,CONSTRAINT Lit_Chambre_FK FOREIGN KEY (NumChambre) REFERENCES Chambre(NumChambre)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Malade
#------------------------------------------------------------

CREATE TABLE Malade(
        NumMalade     Int  Auto_increment  NOT NULL ,
        NomMalade     Varchar (50) NOT NULL ,
        AdresseMalade Varchar (50) NOT NULL ,
        SexeMalade    Varchar (50) NOT NULL ,
        DNaissMalade  Date NOT NULL ,
        LNaissMalade  Text NOT NULL ,
        NumDep        Int NOT NULL
	,CONSTRAINT Malade_Idx INDEX (NomMalade,AdresseMalade,SexeMalade,DNaissMalade,LNaissMalade)
	,CONSTRAINT Malade_PK PRIMARY KEY (NumMalade)

	,CONSTRAINT Malade_Departement_FK FOREIGN KEY (NumDep) REFERENCES Departement(NumDep)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Feuille_Evolution
#------------------------------------------------------------

CREATE TABLE Feuille_Evolution(
        Numfeuille  Int  Auto_increment  NOT NULL ,
        Datefeuille Date NOT NULL ,
        detail      Text NOT NULL ,
        NumMalade   Int NOT NULL
	,CONSTRAINT Feuille_Evolution_Idx INDEX (Datefeuille,detail)
	,CONSTRAINT Feuille_Evolution_PK PRIMARY KEY (Numfeuille)

	,CONSTRAINT Feuille_Evolution_Malade_FK FOREIGN KEY (NumMalade) REFERENCES Malade(NumMalade)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Specialisation
#------------------------------------------------------------

CREATE TABLE Specialisation(
        Specialite Varchar (50) NOT NULL
	,CONSTRAINT Specialisation_PK PRIMARY KEY (Specialite)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Medecin
#------------------------------------------------------------

CREATE TABLE Medecin(
        NumMed     Int  Auto_increment  NOT NULL ,
        NomMed     Varchar (50) NOT NULL ,
        Specialite Varchar (50)
	,CONSTRAINT Medecin_Idx INDEX (NomMed)
	,CONSTRAINT Medecin_PK PRIMARY KEY (NumMed)

	,CONSTRAINT Medecin_Specialisation_FK FOREIGN KEY (Specialite) REFERENCES Specialisation(Specialite)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: occuper
#------------------------------------------------------------

CREATE TABLE occuper(
        NumMalade Int NOT NULL ,
        NumLit    Int NOT NULL
	,CONSTRAINT occuper_PK PRIMARY KEY (NumMalade,NumLit)

	,CONSTRAINT occuper_Malade_FK FOREIGN KEY (NumMalade) REFERENCES Malade(NumMalade)
	,CONSTRAINT occuper_Lit0_FK FOREIGN KEY (NumLit) REFERENCES Lit(NumLit)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: suivre
#------------------------------------------------------------

CREATE TABLE suivre(
        NumMed    Int NOT NULL ,
        NumMalade Int NOT NULL ,
        NumDep    Int NOT NULL
	,CONSTRAINT suivre_PK PRIMARY KEY (NumMed,NumMalade,NumDep)

	,CONSTRAINT suivre_Medecin_FK FOREIGN KEY (NumMed) REFERENCES Medecin(NumMed)
	,CONSTRAINT suivre_Malade0_FK FOREIGN KEY (NumMalade) REFERENCES Malade(NumMalade)
	,CONSTRAINT suivre_Departement1_FK FOREIGN KEY (NumDep) REFERENCES Departement(NumDep)
)ENGINE=InnoDB;

