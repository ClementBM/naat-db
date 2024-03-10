
/*
#############
Ground_Type Table
#############
*/

-- AUTO INCREMENT
CREATE SEQUENCE "Ground_Type_Id_seq";

CREATE TABLE Ground_Type (
    Ground_Type_Id INTEGER PRIMARY KEY NOT NULL DEFAULT nextval('"Ground_Type_Id_seq"'::regclass),
    Name TEXT NOT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),

    CONSTRAINT UX_Ground_Type_Name UNIQUE (Name)
);

-- AUTO INCREMENT
ALTER SEQUENCE "Ground_Type_Id_seq" owned by Ground_Type.Ground_Type_Id;

-- CREATE FUNCTION
CREATE OR REPLACE FUNCTION "function_Ground_Type_updated_at"() 
RETURNS trigger
LANGUAGE plpgsql
AS $function$
begin
    NEW."updated_at" = NOW();
    RETURN NEW;
END;
$function$;

-- CREATE TRIGGER
CREATE TRIGGER "trigger_Ground_Type_updated_at" 
BEFORE UPDATE
ON Ground_Type FOR EACH ROW
EXECUTE FUNCTION "function_Ground_Type_updated_at"();
