/*
  Warnings:

  - You are about to alter the column `custo_beneficio` on the `Opniao` table. The data in that column could be lost. The data in that column will be cast from `String` to `Decimal`.
  - You are about to alter the column `geral` on the `Opniao` table. The data in that column could be lost. The data in that column will be cast from `String` to `Decimal`.
  - You are about to alter the column `tecnico` on the `Opniao` table. The data in that column could be lost. The data in that column will be cast from `String` to `Decimal`.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Opniao" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "geral" DECIMAL NOT NULL,
    "tecnico" DECIMAL NOT NULL,
    "custo_beneficio" DECIMAL NOT NULL,
    CONSTRAINT "Opniao_id_fkey" FOREIGN KEY ("id") REFERENCES "Produto" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Opniao" ("custo_beneficio", "geral", "id", "tecnico") SELECT "custo_beneficio", "geral", "id", "tecnico" FROM "Opniao";
DROP TABLE "Opniao";
ALTER TABLE "new_Opniao" RENAME TO "Opniao";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
