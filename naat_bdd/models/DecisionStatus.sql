/*
#############
Decision_Status Table
#############
*/

-- AUTO INCREMENT
CREATE SEQUENCE "Decision_Status_Id_seq";

CREATE TABLE Decision_Status (
    Decision_Status_Id INTEGER PRIMARY KEY NOT NULL DEFAULT nextval('"Decision_Status_Id_seq"'::regclass),
    Name TEXT NOT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),

    CONSTRAINT UX_Decision_Status_Name UNIQUE (Name)
);

-- AUTO INCREMENT
ALTER SEQUENCE "Decision_Status_Id_seq" owned by Decision_Status.Decision_Status_Id;

-- CREATE FUNCTION
CREATE OR REPLACE FUNCTION "function_Decision_Status_updated_at"() 
RETURNS trigger
LANGUAGE plpgsql
AS $function$
begin
    NEW."updated_at" = NOW();
    RETURN NEW;
END;
$function$;

-- CREATE TRIGGER
CREATE TRIGGER "trigger_Decision_Status_updated_at" 
BEFORE UPDATE
ON Decision_Status FOR EACH ROW
EXECUTE FUNCTION "function_Decision_Status_updated_at"();