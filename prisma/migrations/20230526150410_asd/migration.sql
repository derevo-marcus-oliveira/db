/*
  Warnings:

  - A unique constraint covering the columns `[produto_id]` on the table `Imagens` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "Imagens_produto_id_key" ON "Imagens"("produto_id");
