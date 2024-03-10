/*
#############
Legal_Case_Agent Table
#############
*/

CREATE TABLE Legal_Case_Agent (
    Agent_Id INT NOT NULL,
    Legal_Case_Id INT NOT NULL,
    Agent_Party_Id INT NOT NULL,

    FOREIGN KEY(Agent_Id) REFERENCES Agent(Agent_Id) ON DELETE RESTRICT,
    FOREIGN KEY(Legal_Case_Id) REFERENCES Legal_Case(Legal_Case_Id) ON DELETE RESTRICT,
    FOREIGN KEY(Agent_Party_Id) REFERENCES Agent_Party(Agent_Party_Id),

    PRIMARY KEY(Agent_Id, Legal_Case_Id)
);
