
/*
#############
Agent Table
#############
*/

-- AUTO INCREMENT
CREATE SEQUENCE "Agent_Id_seq";

CREATE TABLE Agent (
    Agent_Id INTEGER PRIMARY KEY NOT NULL DEFAULT nextval('"Agent_Id_seq"'::regclass),
    Name TEXT NOT NULL,
    Agent_Url VARCHAR(255) NULL,

    Description TEXT NULL,

    Agent_Type_Id INT NOT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),

    FOREIGN KEY(Agent_Type_Id) REFERENCES Agent_Type(Agent_Type_Id) ON DELETE RESTRICT,

    CONSTRAINT UX_Agent_NameType UNIQUE (Name, Agent_Type_Id)
);

-- AUTO INCREMENT
ALTER SEQUENCE "Agent_Id_seq" owned by Agent.Agent_Id;

-- CREATE FUNCTION
CREATE OR REPLACE FUNCTION "function_Agent_updated_at"() 
RETURNS trigger
LANGUAGE plpgsql
AS $function$
begin
    NEW."updated_at" = NOW();
    RETURN NEW;
END;
$function$;

-- CREATE TRIGGER
CREATE TRIGGER "trigger_Agent_updated_at" 
BEFORE UPDATE
ON Agent FOR EACH ROW
EXECUTE FUNCTION "function_Agent_updated_at"();

