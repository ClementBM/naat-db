/*
#############
Agent Table
#############
*/

-- AUTO INCREMENT
CREATE SEQUENCE "Agent_Id_seq";

CREATE TABLE Agent (
    Agent_Id INTEGER PRIMARY KEY NOT NULL DEFAULT nextval('"Agent_Id_seq"'),
    Name TEXT NOT NULL,
    Agent_Url VARCHAR(255) NULL,

    Description TEXT NULL,

    Agent_Type_Id INT NOT NULL,

    FOREIGN KEY(Agent_Type_Id) REFERENCES Agent_Type(Agent_Type_Id) ON DELETE RESTRICT,

    CONSTRAINT UX_Agent_NameType UNIQUE (Name, Agent_Type_Id)
);
