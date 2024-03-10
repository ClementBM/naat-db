/*
#############
Decision_Resource Table
#############
*/

CREATE TABLE Decision_Resource (
    Resource_Id INT NOT NULL,
    Decision_Id INT NOT NULL,

    -- Foreign Keys
    FOREIGN KEY(Resource_Id) REFERENCES Resource(Resource_Id) ON DELETE RESTRICT,
    FOREIGN KEY(Decision_Id) REFERENCES Decision(Decision_Id) ON DELETE RESTRICT,

    PRIMARY KEY(Resource_Id, Decision_Id)
);
