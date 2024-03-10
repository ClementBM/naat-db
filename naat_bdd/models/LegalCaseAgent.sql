
/*
#############
Legal_Case_Agent Table
#############
*/

CREATE TABLE Legal_Case_Agent (
    Agent_Id INT NOT NULL,
    Legal_Case_Id INT NOT NULL,
    Agent_Party_Id INT NOT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),

    FOREIGN KEY(Agent_Id) REFERENCES Agent(Agent_Id) ON DELETE RESTRICT,
    FOREIGN KEY(Legal_Case_Id) REFERENCES Legal_Case(Legal_Case_Id) ON DELETE RESTRICT,
    FOREIGN KEY(Agent_Party_Id) REFERENCES Agent_Party(Agent_Party_Id),

    PRIMARY KEY(Agent_Id, Legal_Case_Id)
);

-- CREATE FUNCTION
CREATE OR REPLACE FUNCTION "function_Legal_Case_Agent_updated_at"() 
RETURNS trigger
LANGUAGE plpgsql
AS $function$
begin
    NEW."updated_at" = NOW();
    RETURN NEW;
END;
$function$;

-- CREATE TRIGGER
CREATE TRIGGER "trigger_Legal_Case_Agent_updated_at" 
BEFORE UPDATE
ON Legal_Case_Agent FOR EACH ROW
EXECUTE FUNCTION "function_Legal_Case_Agent_updated_at"();
