
/*
#############
Decision_Ground Table
#############
*/

CREATE TABLE Decision_Ground (
    Ground_Id INT NOT NULL,
    Decision_Id INT NOT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),

    FOREIGN KEY(Ground_Id) REFERENCES Ground(Ground_Id) ON DELETE RESTRICT,
    FOREIGN KEY(Decision_Id) REFERENCES Decision(Decision_Id) ON DELETE RESTRICT,

    PRIMARY KEY(Ground_Id, Decision_Id)
);

-- CREATE FUNCTION
CREATE OR REPLACE FUNCTION "function_Decision_Ground_updated_at"() 
RETURNS trigger
LANGUAGE plpgsql
AS $function$
begin
    NEW."updated_at" = NOW();
    RETURN NEW;
END;
$function$;

-- CREATE TRIGGER
CREATE TRIGGER "trigger_Decision_Ground_updated_at" 
BEFORE UPDATE
ON Decision_Ground FOR EACH ROW
EXECUTE FUNCTION "function_Decision_Ground_updated_at"();
