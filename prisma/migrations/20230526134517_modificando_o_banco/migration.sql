/*
  Warnings:

  - You are about to drop the column `detalhe` on the `Detalhe` table. All the data in the column will be lost.
  - Added the required column `descricao` to the `Detalhe` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Detalhe" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "caracteristica" TEXT NOT NULL,
    "descricao" TEXT NOT NULL,
    "produto_id" INTEGER NOT NULL,
    CONSTRAINT "Detalhe_produto_id_fkey" FOREIGN KEY ("produto_id") REFERENCES "Produto" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "new_Detalhe" ("caracteristica", "id", "produto_id") SELECT "caracteristica", "id", "produto_id" FROM "Detalhe";
DROP TABLE "Detalhe";
ALTER TABLE "new_Detalhe" RENAME TO "Detalhe";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
