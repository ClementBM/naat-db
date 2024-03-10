/*
#############
Jurisdiction Table
#############
*/

-- AUTO INCREMENT
CREATE SEQUENCE "Jurisdiction_Id_seq";

CREATE TABLE Jurisdiction (
    Jurisdiction_Id INTEGER PRIMARY KEY NOT NULL DEFAULT nextval('"Jurisdiction_Id_seq"'),
    Name TEXT NOT NULL,

    Geolocation TEXT NULL,
    Jurisdiction_Url TEXT NULL,
    Scope TEXT NULL,

    CONSTRAINT UX_Jurisdiction_NameLocation UNIQUE (Name, Geolocation)
);
