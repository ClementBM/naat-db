/*
#############
Resource Table
#############
*/

-- AUTO INCREMENT
CREATE SEQUENCE "Resource_Id_seq";

CREATE TABLE Resource (
    Resource_Id INTEGER PRIMARY KEY NOT NULL DEFAULT nextval('"Resource_Id_seq"'),
    
    Name TEXT NOT NULL,
    Url TEXT,
    
    Resource_Type_Id INT NOT NULL,

    FOREIGN KEY(Resource_Type_Id) REFERENCES Resource_Type(Resource_Type_Id) ON DELETE RESTRICT,

    CONSTRAINT UX_Resource_NameType UNIQUE (Name, Resource_Type_Id)
);
