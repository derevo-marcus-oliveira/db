import { Request, Response } from "express";
import { prisma } from "../prismaClient";


export class Create {
    async handle(request: Request, response: Response) {

        const { tipo, nome, marca, modelo, detalhes, opniao, imagens } = request.body;

        try {
            
            const produto = await prisma.produto.create({
                data: {
                    tipo : tipo,
                    nome : nome,
                    marca : marca,
                    modelo : modelo,
                    detalhes : {
                        create : detalhes                 
                    },
                    opniao: {
                        create: opniao
                    },
                    imagens : {
                        create: imagens
                    }
                },
                include: {
                    detalhes : true,                    
                    imagens : true,
                    opniao : true
                }
            })
            
            return response.json(produto);
        }
        catch (error) {
            console.error(error);
            return response.json(error);
        }
    }
}

export class Find {
    async handle(request: Request, response: Response) {

        const { tipo, nome, marca, modelo } = request.body;

        try {
            
            const produto = await prisma.produto.findMany({
                where: {
                    tipo,
                    nome,
                    marca,
                    modelo
                },
                include: {
                    detalhes : true,                    
                    imagens : true,
                    opniao : true,
                }
            })

            return response.json(produto);
        }
        catch (error) {
            console.error(error);
        }
    }
}

export class Delete {
    async handle(request: Request, response: Response) {

        const { id } = request.body;

        try { 
            
            const imagens = await prisma.imagens.deleteMany({
                where : {
                    produto_id: id
                }                
            })  

            const detalhes = await prisma.detalhe.deleteMany({
                where : {
                    produto_id: id
                }                
            })    
            
            const opniao = await prisma.opniao.delete({
                where : {
                    id
                }                
            })

            const produto = await prisma.produto.delete({
                where : {
                    id
                }                
            })

            return response.json(produto);
        }
        catch (error) {
            console.error(error);
        }
    }
}


export class Update {
    async handle(request: Request, response: Response) {

        const { id, tipo, nome, marca, modelo, detalhes } = request.body;

        try {            
            const produto = await prisma.produto.update({
                where : {
                    id
                },
                data : {
                    tipo,
                    nome,
                    marca,
                    modelo,
                    detalhes : {
                        update : detalhes
                    },
                    imagens : {
                        update : detalhes
                    },
                    opniao : {
                        update : detalhes
                    }
                },
                include: {
                    detalhes : true,                    
                    imagens : true,
                    opniao : true,
                }
            })

            return response.json(produto);
        }
        catch (error) {
            console.error(error);
        }
    }
}