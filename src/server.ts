import express from 'express';
import cors from 'cors';

import { router } from './router';
import { Create, Delete, Find, Update } from './controllers/ProdutoController';

const app = express();

app.use(cors());
app.use(express.json());
app.use(router);

// Adicionar
const adicionar = new Create();
router.post("/Adicionar", adicionar.handle)

// Buscar
const buscar = new Find();
router.get("/Buscar", buscar.handle)

// Buscar
const alterar = new Update();
router.post("/Alterar", alterar.handle)

// Buscar
const excluir = new Delete();
router.delete("/Excluir", excluir.handle)

app.listen(4003, () => console.log("server is running on PORT 4003"))