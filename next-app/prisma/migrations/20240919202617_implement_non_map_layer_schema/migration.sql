/*
  Warnings:

  - You are about to drop the column `link` on the `Initiative` table. All the data in the column will be lost.
  - You are about to drop the column `questionId` on the `Initiative` table. All the data in the column will be lost.
  - You are about to drop the column `text` on the `Initiative` table. All the data in the column will be lost.
  - You are about to alter the column `title` on the `Initiative` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(255)`.
  - You are about to drop the column `question` on the `Question` table. All the data in the column will be lost.
  - You are about to drop the column `text` on the `Question` table. All the data in the column will be lost.
  - You are about to alter the column `title` on the `Question` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(255)`.
  - You are about to drop the `FeatureCollection` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `description` to the `Initiative` table without a default value. This is not possible if the table is not empty.
  - Added the required column `url` to the `Initiative` table without a default value. This is not possible if the table is not empty.
  - Added the required column `content` to the `Question` table without a default value. This is not possible if the table is not empty.
  - Added the required column `down_the_rabbit_hole` to the `Question` table without a default value. This is not possible if the table is not empty.
  - Added the required column `make_your_move` to the `Question` table without a default value. This is not possible if the table is not empty.
  - Added the required column `subtitle` to the `Question` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Initiative" DROP CONSTRAINT "Initiative_questionId_fkey";

-- AlterTable
ALTER TABLE "Initiative" DROP COLUMN "link",
DROP COLUMN "questionId",
DROP COLUMN "text",
ADD COLUMN     "description" TEXT NOT NULL,
ADD COLUMN     "url" TEXT NOT NULL,
ALTER COLUMN "title" SET DATA TYPE VARCHAR(255),
ALTER COLUMN "image" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "Question" DROP COLUMN "question",
DROP COLUMN "text",
ADD COLUMN     "content" TEXT NOT NULL,
ADD COLUMN     "down_the_rabbit_hole" TEXT NOT NULL,
ADD COLUMN     "make_your_move" TEXT NOT NULL,
ADD COLUMN     "subtitle" TEXT NOT NULL,
ALTER COLUMN "title" SET DATA TYPE VARCHAR(255),
ALTER COLUMN "image" SET DATA TYPE TEXT;

-- DropTable
DROP TABLE "FeatureCollection";

-- CreateTable
CREATE TABLE "QuestionInitiative" (
    "question_id" INTEGER NOT NULL,
    "initiative_id" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "QuestionInitiative_question_id_initiative_id_key" ON "QuestionInitiative"("question_id", "initiative_id");
