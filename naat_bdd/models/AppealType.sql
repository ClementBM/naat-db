
/*
#############
Appeal_Type Table
#############
*/


-- AUTO INCREMENT
CREATE SEQUENCE "Appeal_Type_Id_seq";

CREATE TABLE Appeal_Type (
    Appeal_Type_Id INTEGER PRIMARY KEY NOT NULL DEFAULT nextval('"Appeal_Type_Id_seq"'::regclass),
    Name TEXT NOT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),

    CONSTRAINT UX_AppealType_Name UNIQUE (Name)
);

-- AUTO INCREMENT
ALTER SEQUENCE "Appeal_Type_Id_seq" owned by Appeal_Type.Appeal_Type_Id;

-- CREATE FUNCTION
CREATE OR REPLACE FUNCTION "function_Appeal_Type_updated_at"()
RETURNS trigger
LANGUAGE plpgsql
AS $function$
begin
    NEW."updated_at" = NOW();
    RETURN NEW;
END;
$function$;

-- CREATE TRIGGER
CREATE TRIGGER "trigger_Appeal_Type_updated_at" 
BEFORE UPDATE
ON Appeal_Type FOR EACH ROW
EXECUTE FUNCTION "function_Appeal_Type_updated_at"();
