CREATE TABLE IF NOT EXISTS ExperimentTasks (
id int GENERATED BY DEFAULT AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
experimentType VARCHAR(10),
matching VARCHAR(50),
annotatorName VARCHAR(100),
datasetName VARCHAR(100),
errorCount int,
state int,
lastChanged TIMESTAMP,
version VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS Experiments (
  id VARCHAR(300) NOT NULL,
  taskId int NOT NULL,
  PRIMARY KEY (id, taskId)
);

-- Changes from GERBIL QA 0.1.0 to 0.2.0
-- (ALTER should be executed only once for updating old DBs
-- ALTER TABLE ExperimentTasks ADD COLUMN language varchar(3);
DROP INDEX IF EXISTS ExperimentTaskConfig;
CREATE INDEX ExperimentTaskConfig ON ExperimentTasks (matching,experimentType,annotatorName,datasetName);

-- Changes from version 1.0.0 to 1.1.0
CREATE TABLE IF NOT EXISTS ExperimentTasks_Version (
id int PRIMARY KEY,
version VARCHAR(20)
);

-- Changes from version 1.1.0 to OKE2015
CREATE TABLE IF NOT EXISTS ExperimentTasks_AdditionalResults (
resultId int NOT NULL,
taskId int NOT NULL,
value double,
PRIMARY KEY (resultId, taskId)
);

CREATE TABLE IF NOT EXISTS ExperimentTasks_SubTasks (
taskId int NOT NULL,
subTaskId int NOT NULL,
PRIMARY KEY (taskId, subTaskId)
);

