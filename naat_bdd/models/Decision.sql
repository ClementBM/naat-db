/*
#############
Decision Table
#############
*/

-- AUTO INCREMENT
CREATE SEQUENCE "Decision_Id_seq";

CREATE TABLE Decision (
    Decision_Id INTEGER PRIMARY KEY NOT NULL DEFAULT nextval('"Decision_Id_seq"'),
    
    Abstract TEXT NULL,

    Introduction_Date DATE NULL,
    Decision_Date DATE NULL,
    
    Solution TEXT NULL,
    Comment TEXT NULL,
    
    Legal_Case_Id INT NOT NULL,
    Decision_Status_Id INT NULL,
    Jurisdiction_Id INT NULL,

    FOREIGN KEY(Legal_Case_Id) REFERENCES Legal_Case(Legal_Case_Id) ON DELETE RESTRICT,
    FOREIGN KEY(Decision_Status_Id) REFERENCES Decision_Status(Decision_Status_Id) ON DELETE RESTRICT,
    FOREIGN KEY(Jurisdiction_Id) REFERENCES Jurisdiction(Jurisdiction_Id) ON DELETE RESTRICT,

    CONSTRAINT UX_Decision_TitleLegal_Case UNIQUE (Legal_Case_Id, Abstract)
);
