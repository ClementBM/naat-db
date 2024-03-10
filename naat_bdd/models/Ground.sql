
/*
#############
Ground Table
#############
*/

-- AUTO INCREMENT
CREATE SEQUENCE "Ground_Id_seq";

CREATE TABLE Ground (
    Ground_Id INTEGER PRIMARY KEY NOT NULL DEFAULT nextval('"Ground_Id_seq"'::regclass),
    Name TEXT NOT NULL,

    Ground_Type_Id INT NOT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),

    FOREIGN KEY(Ground_Type_Id) REFERENCES Ground_Type(Ground_Type_Id) ON DELETE RESTRICT,

    CONSTRAINT UX_Ground_NameType UNIQUE (Name, Ground_Type_Id)
);

-- AUTO INCREMENT
ALTER SEQUENCE "Ground_Id_seq" owned by Ground.Ground_Id;

-- CREATE FUNCTION
CREATE OR REPLACE FUNCTION "function_Ground_updated_at"() 
RETURNS trigger
LANGUAGE plpgsql
AS $function$
begin
    NEW."updated_at" = NOW();
    RETURN NEW;
END;
$function$;

-- CREATE TRIGGER
CREATE TRIGGER "trigger_Ground_updated_at" 
BEFORE UPDATE
ON Ground FOR EACH ROW
EXECUTE FUNCTION "function_Ground_updated_at"();
