-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Detalhe" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome_detalhe" TEXT NOT NULL,
    "tipo_detalhe" TEXT NOT NULL,
    "produto_id" INTEGER NOT NULL,
    CONSTRAINT "Detalhe_produto_id_fkey" FOREIGN KEY ("produto_id") REFERENCES "Produto" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Detalhe" ("id", "nome_detalhe", "produto_id", "tipo_detalhe") SELECT "id", "nome_detalhe", "produto_id", "tipo_detalhe" FROM "Detalhe";
DROP TABLE "Detalhe";
ALTER TABLE "new_Detalhe" RENAME TO "Detalhe";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
