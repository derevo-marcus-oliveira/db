import express from 'express';
import cors from 'cors';

import { router } from './router';
import { CreateEnum, DeleteEnum, FindEnum, UpdateEnum } from './controllers/EnumeradorController';
import { Create, Delete, Find, Update } from './controllers/ProdutoController';

const app = express();

app.use(cors());
app.use(express.json());
app.use(router);

// Adicionar
const adicionarEnum = new CreateEnum();
router.post("/AdicionarEnum", adicionarEnum.handle)

// Buscar
const buscarEnum = new FindEnum();
router.get("/BuscarEnum", buscarEnum.handle)

// Buscar
const alterarEnum = new UpdateEnum();
router.post("/AlterarEnum", alterarEnum.handle)

// Buscar
const excluirEnum = new DeleteEnum();
router.delete("/ExcluirEnum", excluirEnum.handle)


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