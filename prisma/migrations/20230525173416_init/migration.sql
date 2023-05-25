-- CreateTable
CREATE TABLE "Produto" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "tipo" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "marca" TEXT NOT NULL,
    "modelo" TEXT NOT NULL,
    "data" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE "Detalhe" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome_detalhe" TEXT NOT NULL,
    "tipo_detalhe" TEXT NOT NULL,
    CONSTRAINT "Detalhe_id_fkey" FOREIGN KEY ("id") REFERENCES "Produto" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
