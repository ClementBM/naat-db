
/*
#############
Decision_Resource Table
#############
*/

-- AUTO INCREMENT

CREATE TABLE Decision_Resource (
    Resource_Id INT NOT NULL,
    Decision_Id INT NOT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),

    -- Foreign Keys
    FOREIGN KEY(Resource_Id) REFERENCES Resource(Resource_Id) ON DELETE RESTRICT,
    FOREIGN KEY(Decision_Id) REFERENCES Decision(Decision_Id) ON DELETE RESTRICT,

    PRIMARY KEY(Resource_Id, Decision_Id)
);

-- CREATE FUNCTION
CREATE OR REPLACE FUNCTION "function_Decision_Resource_updated_at"() 
RETURNS trigger
LANGUAGE plpgsql
AS $function$
begin
    NEW."updated_at" = NOW();
    RETURN NEW;
END;
$function$;

-- CREATE TRIGGER
CREATE TRIGGER "trigger_Decision_Resource_updated_at" 
BEFORE UPDATE
ON Decision_Resource FOR EACH ROW
EXECUTE FUNCTION "function_Decision_Resource_updated_at"();

