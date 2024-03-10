/*
#############
Decision_Status Table
#############
*/

-- AUTO INCREMENT
CREATE SEQUENCE "Decision_Status_Id_seq";

CREATE TABLE Decision_Status (
    Decision_Status_Id INTEGER PRIMARY KEY NOT NULL DEFAULT nextval('"Decision_Status_Id_seq"'),
    Name TEXT NOT NULL,

    CONSTRAINT UX_Decision_Status_Name UNIQUE (Name)
);
