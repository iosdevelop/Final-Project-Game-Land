DROP TABLE "history";
DROP TABLE "languageArts";
DROP TABLE "math";
DROP TABLE "science";
DROP TABLE "users";
DROP TABLE "score";

CREATE TABLE "history" (
"ID" INTEGER NOT NULL,
"question" TEXT,
"rightAnswer" TEXT,
"wrongAnswer" TEXT,
"rightScore" INTEGER,
"wrongScore" INTEGER,
"levelDifficulty" INTEGER,
"wrongAnswer3" TEXT DEFAULT (null),
"wrongAnswer2" TEXT,
PRIMARY KEY ("ID") 
);

CREATE TABLE "languageArts" (
"ID" INTEGER NOT NULL,
"question" TEXT,
"rightAnswer" TEXT,
"wrongAnswer" TEXT,
"rightScore" INTEGER,
"wrongScore" INTEGER,
"levelDifficulty" INTEGER,
"wrongAnswer2" TEXT,
"wrongAnswer3" TEXT,
PRIMARY KEY ("ID") 
);

CREATE TABLE "math" (
"ID" INTEGER NOT NULL,
"question" TEXT,
"rightAnswer" TEXT,
"wrongAnswer" TEXT,
"rightScore" INTEGER,
"wrongScore" INTEGER,
"levelDifficulty" INTEGER,
"wrongAnswer2" TEXT,
"wrongAnswer3" TEXT,
PRIMARY KEY ("ID") 
);

CREATE TABLE "science" (
"ID" INTEGER NOT NULL,
"question" TEXT,
"rightAnswer" TEXT,
"wrongAnswer" TEXT,
"rightScore" INTEGER,
"wrongScore" INTEGER,
"levelDifficulty" INTEGER,
"wrongAnswer2" TEXT,
"wrongAnswer3" TEXT,
PRIMARY KEY ("ID") 
);

CREATE TABLE "users" (
"ID" INTEGER NOT NULL,
"UsrName" TEXT,
"UsrAge" INTEGER,
"Score" INTEGER,
"UsrLevel" INTEGER,
PRIMARY KEY ("ID") ,
CONSTRAINT "fk_users_score_1" FOREIGN KEY ("Score") REFERENCES "score" ("total")
);

CREATE TABLE "score" (
"id" INTEGER,
"total" INTEGER,
PRIMARY KEY ("id") 
);

