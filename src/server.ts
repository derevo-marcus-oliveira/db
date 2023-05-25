import express from 'express';
import cors from 'cors';

import { router } from './router';
import { Create, Find } from './controllers/ProdutoController';

const app = express();

app.use(cors());
app.use(express.json());
app.use(router);

// Adicionar
const adicionar = new Create();
router.post("/Adicionar", adicionar.handle)

// Adicionar
const find = new Find();
router.get("/Buscar", find.handle)

app.listen(4003, () => console.log("server is running on PORT 4003"))