
/*
#############
Resource Table
#############
*/

-- AUTO INCREMENT
CREATE SEQUENCE "Resource_Id_seq";

CREATE TABLE Resource (
    Resource_Id INTEGER PRIMARY KEY NOT NULL DEFAULT nextval('"Resource_Id_seq"'::regclass),
    
    Name TEXT NOT NULL,
    Url TEXT,
    
    Resource_Type_Id INT NOT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),

    FOREIGN KEY(Resource_Type_Id) REFERENCES Resource_Type(Resource_Type_Id) ON DELETE RESTRICT,

    CONSTRAINT UX_Resource_NameType UNIQUE (Name, Resource_Type_Id)
);

-- AUTO INCREMENT
ALTER SEQUENCE "Resource_Id_seq" owned by Resource.Resource_Id;

-- CREATE FUNCTION
CREATE OR REPLACE FUNCTION "function_Resource_updated_at"() 
RETURNS trigger
LANGUAGE plpgsql
AS $function$
begin
    NEW."updated_at" = NOW();
    RETURN NEW;
END;
$function$;

-- CREATE TRIGGER
CREATE TRIGGER "trigger_Resource_updated_at" 
BEFORE UPDATE
ON Resource FOR EACH ROW
EXECUTE FUNCTION "function_Resource_updated_at"();

