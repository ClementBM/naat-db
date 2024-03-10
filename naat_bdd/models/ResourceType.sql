/*
#############
Resource_Type Table
#############
*/

-- AUTO INCREMENT
CREATE SEQUENCE "Resource_Type_Id_seq";

CREATE TABLE Resource_Type (
    Resource_Type_Id INTEGER PRIMARY KEY NOT NULL DEFAULT nextval('"Resource_Type_Id_seq"'),
    Name TEXT NOT NULL,

    CONSTRAINT UX_Resource_Type_Name UNIQUE (Name)
);
