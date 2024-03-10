
/*
#############
Decision Table
#############
*/

-- AUTO INCREMENT
CREATE SEQUENCE "Decision_Id_seq";

CREATE TABLE Decision (
    Decision_Id INTEGER PRIMARY KEY NOT NULL DEFAULT nextval('"Decision_Id_seq"'::regclass),
    
    Abstract TEXT NULL,

    Introduction_Date DATE NULL,
    Decision_Date DATE NULL,
    
    Solution TEXT NULL,
    Comment TEXT NULL,
    
    Legal_Case_Id INT NOT NULL,
    Decision_Status_Id INT NULL,
    Jurisdiction_Id INT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),

    FOREIGN KEY(Legal_Case_Id) REFERENCES Legal_Case(Legal_Case_Id) ON DELETE RESTRICT,
    FOREIGN KEY(Decision_Status_Id) REFERENCES Decision_Status(Decision_Status_Id) ON DELETE RESTRICT,
    FOREIGN KEY(Jurisdiction_Id) REFERENCES Jurisdiction(Jurisdiction_Id) ON DELETE RESTRICT,

    CONSTRAINT UX_Decision_TitleLegal_Case UNIQUE (Legal_Case_Id, Abstract)
);

-- AUTO INCREMENT
ALTER SEQUENCE "Decision_Id_seq" owned by Decision.Decision_Id;

-- CREATE FUNCTION
CREATE OR REPLACE FUNCTION "function_Decision_updated_at"()
RETURNS trigger
LANGUAGE plpgsql
AS $function$
begin
    NEW."updated_at" = NOW();
    RETURN NEW;
END;
$function$;

-- CREATE TRIGGER
CREATE TRIGGER "trigger_Decision_updated_at" 
BEFORE UPDATE
ON Decision FOR EACH ROW
EXECUTE FUNCTION "function_Decision_updated_at"();
