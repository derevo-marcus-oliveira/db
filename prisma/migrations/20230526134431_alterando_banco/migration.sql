-- CreateTable
CREATE TABLE "Opniao" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "geral" TEXT NOT NULL,
    "tecnico" TEXT NOT NULL,
    "custo_beneficio" TEXT NOT NULL,
    CONSTRAINT "Opniao_id_fkey" FOREIGN KEY ("id") REFERENCES "Produto" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Imagens" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "url_imagem" TEXT NOT NULL,
    "produto_id" INTEGER NOT NULL,
    CONSTRAINT "Imagens_produto_id_fkey" FOREIGN KEY ("produto_id") REFERENCES "Produto" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "Imagens_url_imagem_key" ON "Imagens"("url_imagem");
