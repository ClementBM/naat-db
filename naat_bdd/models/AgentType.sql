/*
#############
Agent_Type Table
#############
*/

-- AUTO INCREMENT
CREATE SEQUENCE "Agent_Type_Id_seq";

CREATE TABLE Agent_Type (
    Agent_Type_Id INTEGER PRIMARY KEY NOT NULL DEFAULT nextval('"Agent_Type_Id_seq"'),
    Name TEXT NOT NULL,

    CONSTRAINT UX_Agent_Type_Name UNIQUE (Name)
);
