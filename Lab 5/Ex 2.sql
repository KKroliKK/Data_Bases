CREATE TABLE GroupT
(
    groupId INT NOT NULL,
    PRIMARY KEY (groupId)
);

CREATE TABLE Company
(
    companyId INT NOT NULL,
    groupId INT NOT NULL,
    Relationship_companyId INT NOT NULL,
    PRIMARY KEY (companyId),
    FOREIGN KEY (groupId) REFERENCES GroupT(groupId),
    FOREIGN KEY (Relationship_companyId) REFERENCES Company(companyId)
);

CREATE TABLE item
(
    itemId INT NOT NULL,
    plantId INT NOT NULL,
    PRIMARY KEY (itemId),
    FOREIGN KEY (plantId) REFERENCES Plant(plantId)
);

CREATE TABLE Plant
(
    plantId INT NOT NULL,
    companyId INT NOT NULL,
    PRIMARY KEY (plantId),
    FOREIGN KEY (companyId) REFERENCES Company(companyId)
);