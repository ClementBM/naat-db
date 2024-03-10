
/*
#############
Legal_Case Table
#############
*/

-- AUTO INCREMENT
CREATE SEQUENCE "Legal_Case_Id_seq";

CREATE TABLE Legal_Case (
    Legal_Case_Id INTEGER PRIMARY KEY NOT NULL DEFAULT nextval('"Legal_Case_Id_seq"'::regclass),
    Title TEXT NOT NULL,
    Facts_Digest TEXT NULL,
    Facts_Date DATE NULL,

    Google_Drive_Folder TEXT NULL,

    Legal_Case_Status_Id INT NULL,
    Appeal_Type_Id INT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),

    FOREIGN KEY(Legal_Case_Status_Id) REFERENCES Legal_Case_Status(Legal_Case_Status_Id) ON DELETE RESTRICT,
    FOREIGN KEY(Appeal_Type_Id) REFERENCES Appeal_Type(Appeal_Type_Id) ON DELETE RESTRICT,

    CONSTRAINT UX_Legal_Case_Title UNIQUE (Title)
);

-- AUTO INCREMENT
ALTER SEQUENCE "Legal_Case_Id_seq" owned by Legal_Case.Legal_Case_Id;

-- CREATE FUNCTION
CREATE OR REPLACE FUNCTION "function_Legal_Case_updated_at"() 
RETURNS trigger
LANGUAGE plpgsql
AS $function$
begin
    NEW."updated_at" = NOW();
    RETURN NEW;
END;
$function$;

-- CREATE TRIGGER
CREATE TRIGGER "trigger_Legal_Case_updated_at" 
BEFORE UPDATE
ON Legal_Case FOR EACH ROW /* `Legal_Case` ? */
EXECUTE FUNCTION "function_Legal_Case_updated_at"();
