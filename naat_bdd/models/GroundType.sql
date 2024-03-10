/*
#############
Ground_Type Table
#############
*/

-- AUTO INCREMENT
CREATE SEQUENCE "Ground_Type_Id_seq";

CREATE TABLE Ground_Type (
    Ground_Type_Id INTEGER PRIMARY KEY NOT NULL DEFAULT nextval('"Ground_Type_Id_seq"'),
    Name TEXT NOT NULL,

    CONSTRAINT UX_Ground_Type_Name UNIQUE (Name)
);
