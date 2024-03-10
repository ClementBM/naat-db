/*
#############
Legal_Case Table
#############
*/

-- AUTO INCREMENT
CREATE SEQUENCE "Legal_Case_Id_seq";

CREATE TABLE Legal_Case (
    Legal_Case_Id INTEGER PRIMARY KEY NOT NULL DEFAULT nextval('"Legal_Case_Id_seq"'),
    Title TEXT NOT NULL,
    Facts_Digest TEXT NULL,
    Facts_Date DATE NULL,

    Google_Drive_Folder TEXT NULL,

    Legal_Case_Status_Id INT NULL,
    Appeal_Type_Id INT NULL,

    FOREIGN KEY(Legal_Case_Status_Id) REFERENCES Legal_Case_Status(Legal_Case_Status_Id) ON DELETE RESTRICT,
    FOREIGN KEY(Appeal_Type_Id) REFERENCES Appeal_Type(Appeal_Type_Id) ON DELETE RESTRICT,

    CONSTRAINT UX_Legal_Case_Title UNIQUE (Title)
);
