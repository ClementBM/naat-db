
/*
#############
Agent_Type Table
#############
*/

-- AUTO INCREMENT
CREATE SEQUENCE "Agent_Type_Id_seq";

CREATE TABLE Agent_Type (
    Agent_Type_Id INTEGER PRIMARY KEY NOT NULL DEFAULT nextval('"Agent_Type_Id_seq"'::regclass),
    Name TEXT NOT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),

    CONSTRAINT UX_Agent_Type_Name UNIQUE (Name)
);

-- AUTO INCREMENT
ALTER SEQUENCE "Agent_Type_Id_seq" owned by Agent_Type.Agent_Type_Id;

-- CREATE FUNCTION
CREATE OR REPLACE FUNCTION "function_Agent_Type_updated_at"() 
RETURNS trigger
LANGUAGE plpgsql
AS $function$
begin
    NEW."updated_at" = NOW();
    RETURN NEW;
END;
$function$;

-- CREATE TRIGGER
CREATE TRIGGER "trigger_Agent_Type_updated_at" 
BEFORE UPDATE
ON Agent_Type FOR EACH ROW
EXECUTE FUNCTION "function_Agent_Type_updated_at"();
