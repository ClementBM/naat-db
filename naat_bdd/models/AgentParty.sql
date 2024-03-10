/*
#############
Agent_Party Table
#############
*/

-- AUTO INCREMENT
CREATE SEQUENCE "Agent_Party_Id_seq";

CREATE TABLE Agent_Party (
    Agent_Party_Id INTEGER PRIMARY KEY NOT NULL DEFAULT nextval('"Agent_Party_Id_seq"'),
    Name TEXT NOT NULL,

    CONSTRAINT UX_Agent_Party_Name UNIQUE (Name)
);
