import { Request, Response } from "express";
import { prisma } from "../prismaClient";



export class CreateEnum {
    async handle(request: Request, response: Response) {

        const { type, name } = request.body;

        try {
            
            const produto = await prisma.enumeradores.create({
                data: {
                    type : type,
                    name : name
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

export class FindEnum {
    async handle(request: Request, response: Response) {

        const { type, name } = request.body;

        try {
            
            const produto = await prisma.enumeradores.findMany({
                where: {
                    type,
                    name,
                }
            })

            return response.json(produto);
        }
        catch (error) {
            console.error(error);
        }
    }
}

export class DeleteEnum {
    async handle(request: Request, response: Response) {

        const { id } = request.body;

        try { 
            
            const produto = await prisma.enumeradores.delete({
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


export class UpdateEnum {
    async handle(request: Request, response: Response) {

        const { id, type, name } = request.body;

        try {            
            const produto = await prisma.enumeradores.update({
                where : {
                    id
                },
                data : {
                    type,
                    name
                }
            })

            return response.json(produto);
        }
        catch (error) {
            console.error(error);
        }
    }
}