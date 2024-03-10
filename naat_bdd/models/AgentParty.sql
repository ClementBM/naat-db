
/*
#############
Agent_Party Table
#############
*/

-- AUTO INCREMENT
CREATE SEQUENCE "Agent_Party_Id_seq";

CREATE TABLE Agent_Party (
    Agent_Party_Id INTEGER PRIMARY KEY NOT NULL DEFAULT nextval('"Agent_Party_Id_seq"'::regclass),
    Name TEXT NOT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),

    CONSTRAINT UX_Agent_Party_Name UNIQUE (Name)
);

-- AUTO INCREMENT
ALTER SEQUENCE "Agent_Party_Id_seq" owned by Agent_Party.Agent_Party_Id;

-- CREATE FUNCTION
CREATE OR REPLACE FUNCTION "function_Agent_Party_updated_at"() 
RETURNS trigger
LANGUAGE plpgsql
AS $function$
begin
    NEW."updated_at" = NOW();
    RETURN NEW;
END;
$function$;

-- CREATE TRIGGER
CREATE TRIGGER "trigger_Agent_Party_updated_at" 
BEFORE UPDATE
ON Agent_Party FOR EACH ROW
EXECUTE FUNCTION "function_Agent_Party_updated_at"();
