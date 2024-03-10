/*
#############
Decision_Ground Table
#############
*/

CREATE TABLE Decision_Ground (
    Ground_Id INT NOT NULL,
    Decision_Id INT NOT NULL,

    FOREIGN KEY(Ground_Id) REFERENCES Ground(Ground_Id) ON DELETE RESTRICT,
    FOREIGN KEY(Decision_Id) REFERENCES Decision(Decision_Id) ON DELETE RESTRICT,

    PRIMARY KEY(Ground_Id, Decision_Id)
);
