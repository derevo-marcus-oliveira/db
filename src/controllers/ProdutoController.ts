import { Request, Response } from "express";
import { prisma } from "../prismaClient";


export class Create {
    async handle(request: Request, response: Response) {

        const { tipo, nome, marca, modelo, detalhes } = request.body;

        try {
            
            const produto = await prisma.produto.create({
                data: {
                    tipo : tipo,
                    nome : nome,
                    marca : marca,
                    modelo : modelo,
                    detalhes : {
                        create : detalhes                 
                    }
                },
                include: {
                    detalhes : true
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

        const { tipo, nome, marca, modelo, detalhes } = request.body;

        try {
            
            const produto = await prisma.produto.findMany({
                include: {
                    detalhes
                  },
            })

            return response.json(produto);
        }
        catch (error) {
            console.error(error);
        }
    }
}