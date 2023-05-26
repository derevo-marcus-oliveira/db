/*
  Warnings:

  - The primary key for the `Detalhe` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Detalhe" (
    "id" INTEGER NOT NULL,
    "caracteristica" TEXT NOT NULL,
    "descricao" TEXT NOT NULL,
    "produto_id" INTEGER NOT NULL,

    PRIMARY KEY ("id", "produto_id"),
    CONSTRAINT "Detalhe_produto_id_fkey" FOREIGN KEY ("produto_id") REFERENCES "Produto" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "new_Detalhe" ("caracteristica", "descricao", "id", "produto_id") SELECT "caracteristica", "descricao", "id", "produto_id" FROM "Detalhe";
DROP TABLE "Detalhe";
ALTER TABLE "new_Detalhe" RENAME TO "Detalhe";
CREATE UNIQUE INDEX "Detalhe_id_key" ON "Detalhe"("id");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
