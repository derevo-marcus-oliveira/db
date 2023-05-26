/*
  Warnings:

  - The primary key for the `Imagens` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Imagens" (
    "id" INTEGER NOT NULL,
    "url_imagem" TEXT NOT NULL,
    "produto_id" INTEGER NOT NULL,

    PRIMARY KEY ("id", "produto_id"),
    CONSTRAINT "Imagens_produto_id_fkey" FOREIGN KEY ("produto_id") REFERENCES "Produto" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "new_Imagens" ("id", "produto_id", "url_imagem") SELECT "id", "produto_id", "url_imagem" FROM "Imagens";
DROP TABLE "Imagens";
ALTER TABLE "new_Imagens" RENAME TO "Imagens";
CREATE UNIQUE INDEX "Imagens_id_key" ON "Imagens"("id");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
