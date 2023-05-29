-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Detalhe" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "caracteristica" TEXT NOT NULL,
    "descricao" TEXT NOT NULL,
    "produto_id" INTEGER NOT NULL,
    CONSTRAINT "Detalhe_produto_id_fkey" FOREIGN KEY ("produto_id") REFERENCES "Produto" ("id") ON DELETE CASCADE ON UPDATE NO ACTION
);
INSERT INTO "new_Detalhe" ("caracteristica", "descricao", "id", "produto_id") SELECT "caracteristica", "descricao", "id", "produto_id" FROM "Detalhe";
DROP TABLE "Detalhe";
ALTER TABLE "new_Detalhe" RENAME TO "Detalhe";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
