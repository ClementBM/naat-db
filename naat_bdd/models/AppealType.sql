/*
#############
Appeal_Type Table
#############
*/

-- AUTO INCREMENT
CREATE SEQUENCE "Appeal_Type_Id_seq";

CREATE TABLE Appeal_Type (
    Appeal_Type_Id INTEGER PRIMARY KEY NOT NULL DEFAULT nextval('"Appeal_Type_Id_seq"'),
    Name TEXT NOT NULL,

    CONSTRAINT UX_AppealType_Name UNIQUE (Name)
);
