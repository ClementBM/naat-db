
/*
#############
Legal_Case_Status Table
#############
*/

-- AUTO INCREMENT
CREATE SEQUENCE "Legal_Case_Status_Id_seq";

CREATE TABLE Legal_Case_Status (
    Legal_Case_Status_Id INTEGER PRIMARY KEY NOT NULL DEFAULT nextval('"Legal_Case_Status_Id_seq"'::regclass),
    Name TEXT NOT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),

    CONSTRAINT UX_Legal_Case_Status_Name UNIQUE (Name)
);

-- AUTO INCREMENT
ALTER SEQUENCE "Legal_Case_Status_Id_seq" owned by Legal_Case_Status.Legal_Case_Status_Id;

-- CREATE FUNCTION
CREATE OR REPLACE FUNCTION "function_Legal_Case_Status_updated_at"() 
RETURNS trigger
LANGUAGE plpgsql
AS $function$
begin
    NEW."updated_at" = NOW();
    RETURN NEW;
END;
$function$;

-- CREATE TRIGGER
CREATE TRIGGER "trigger_Legal_Case_Status_updated_at" 
BEFORE UPDATE
ON Legal_Case_Status FOR EACH ROW
EXECUTE FUNCTION "function_Legal_Case_Status_updated_at"();

