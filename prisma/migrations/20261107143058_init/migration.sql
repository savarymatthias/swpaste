-- CreateEnum
CREATE TYPE "MonsterSource" AS ENUM ('MANUAL', 'IMPORT');

-- CreateTable
CREATE TABLE "Paste" (
    "id" TEXT NOT NULL,
    "editTokenHash" TEXT NOT NULL,
    "title" VARCHAR(80),
    "description" VARCHAR(2000),
    "location" VARCHAR(80),
    "context" TEXT,
    "hidden" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "lastViewedAt" TIMESTAMP(3),

    CONSTRAINT "Paste_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PasteMonster" (
    "id" SERIAL NOT NULL,
    "pasteId" TEXT NOT NULL,
    "position" INTEGER NOT NULL,
    "source" "MonsterSource" NOT NULL,
    "monsterId" INTEGER NOT NULL,
    "context" TEXT,
    "sets" JSONB NOT NULL,
    "stats" JSONB NOT NULL,
    "mainStats" JSONB,
    "runes" JSONB,
    "artifacts" JSONB,

    CONSTRAINT "PasteMonster_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "PasteMonster_pasteId_position_key" ON "PasteMonster"("pasteId", "position");

-- AddForeignKey
ALTER TABLE "PasteMonster" ADD CONSTRAINT "PasteMonster_pasteId_fkey" FOREIGN KEY ("pasteId") REFERENCES "Paste"("id") ON DELETE CASCADE ON UPDATE CASCADE;
