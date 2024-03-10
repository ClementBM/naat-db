
/*
#############
Jurisdiction Table
#############
*/

-- AUTO INCREMENT
CREATE SEQUENCE "Jurisdiction_Id_seq";

CREATE TABLE Jurisdiction (
    Jurisdiction_Id INTEGER PRIMARY KEY NOT NULL DEFAULT nextval('"Jurisdiction_Id_seq"'::regclass),
    Name TEXT NOT NULL,

    Geolocation TEXT NULL,
    Jurisdiction_Url TEXT NULL,
    Scope TEXT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),

    CONSTRAINT UX_Jurisdiction_NameLocation UNIQUE (Name, Geolocation)
);

-- AUTO INCREMENT
ALTER SEQUENCE "Jurisdiction_Id_seq" owned by Jurisdiction.Jurisdiction_Id;

-- CREATE FUNCTION
CREATE OR REPLACE FUNCTION "function_Jurisdiction_updated_at"() 
RETURNS trigger
LANGUAGE plpgsql
AS $function$
begin
    NEW."updated_at" = NOW();
    RETURN NEW;
END;
$function$;

-- CREATE TRIGGER
CREATE TRIGGER "trigger_Jurisdiction_updated_at" 
BEFORE UPDATE
ON Jurisdiction FOR EACH ROW
EXECUTE FUNCTION "function_Jurisdiction_updated_at"();
