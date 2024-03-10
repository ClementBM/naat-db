/*
#############
Ground Table
#############
*/

-- AUTO INCREMENT
CREATE SEQUENCE "Ground_Id_seq";

CREATE TABLE Ground (
    Ground_Id INTEGER PRIMARY KEY NOT NULL DEFAULT nextval('"Ground_Id_seq"'),
    Name TEXT NOT NULL,

    Ground_Type_Id INT NOT NULL,

    FOREIGN KEY(Ground_Type_Id) REFERENCES Ground_Type(Ground_Type_Id) ON DELETE RESTRICT,

    CONSTRAINT UX_Ground_NameType UNIQUE (Name, Ground_Type_Id)
);
