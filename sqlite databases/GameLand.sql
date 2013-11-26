CREATE TABLE "history" ("ID" INTEGER PRIMARY KEY  NOT NULL , "question" TEXT, "rightAnswer" TEXT, "wrongAnswer" TEXT, "rightScore" INTEGER, "wrongScore" INTEGER, "levelDifficulty" INTEGER, "wrongAnswer1" TEXT);
CREATE TABLE "languageArts" ("ID" INTEGER PRIMARY KEY  NOT NULL , "question" TEXT, "rightAnswer" TEXT, "wrongAnswer" TEXT, "rightScore" INTEGER, "wrongScore" INTEGER, "levelDifficulty" INTEGER, "wrongAnswer2" TEXT);
CREATE TABLE "math" ("ID" INTEGER PRIMARY KEY  NOT NULL , "question" TEXT, "rightAnswer" TEXT, "wrongAnswer" TEXT, "rightScore" INTEGER, "wrongScore" INTEGER, "levelDifficulty" INTEGER, "wrongAnswer2" TEXT);
CREATE TABLE "science" ("ID" INTEGER PRIMARY KEY  NOT NULL , "question" TEXT, "rightAnswer" TEXT, "wrongAnswer" TEXT, "rightScore" INTEGER, "wrongScore" INTEGER, "levelDifficulty" INTEGER, "wrongAnswer2" TEXT);
CREATE TABLE "users" ("ID" INTEGER PRIMARY KEY  NOT NULL , "UsrName" TEXT, "UsrAge" INTEGER, "Score" INTEGER, "UsrLevel" INTEGER);
