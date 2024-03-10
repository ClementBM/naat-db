
/*
#############
Resource_Type Table
#############
*/

-- AUTO INCREMENT
CREATE SEQUENCE "Resource_Type_Id_seq";

CREATE TABLE Resource_Type (
    Resource_Type_Id INTEGER PRIMARY KEY NOT NULL DEFAULT nextval('"Resource_Type_Id_seq"'::regclass),
    Name TEXT NOT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),

    CONSTRAINT UX_Resource_Type_Name UNIQUE (Name)
);

-- AUTO INCREMENT
ALTER SEQUENCE "Resource_Type_Id_seq" owned by Resource_Type.Resource_Type_Id;

-- CREATE FUNCTION
CREATE OR REPLACE FUNCTION "function_Resource_Type_updated_at"() 
RETURNS trigger
LANGUAGE plpgsql
AS $function$
begin
    NEW."updated_at" = NOW();
    RETURN NEW;
END;
$function$;

-- CREATE TRIGGER
CREATE TRIGGER "trigger_Resource_Type_updated_at" 
BEFORE UPDATE
ON Resource_Type FOR EACH ROW
EXECUTE FUNCTION "function_Resource_Type_updated_at"();
