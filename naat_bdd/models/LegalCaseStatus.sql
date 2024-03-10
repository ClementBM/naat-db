/*
#############
Legal_Case_Status Table
#############
*/

-- AUTO INCREMENT
CREATE SEQUENCE "Legal_Case_Status_Id_seq";

CREATE TABLE Legal_Case_Status (
    Legal_Case_Status_Id INTEGER PRIMARY KEY NOT NULL DEFAULT nextval('"Legal_Case_Status_Id_seq"'),
    Name TEXT NOT NULL,

    CONSTRAINT UX_Legal_Case_Status_Name UNIQUE (Name)
);
