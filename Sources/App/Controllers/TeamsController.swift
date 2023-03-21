//
//  File.swift
//  
//
//  Created by ShahadQadi on 27/08/1444 AH.
//

import Foundation
import Fluent
import Vapor
struct TeamsController: RouteCollection{
    func boot(routes: Vapor.RoutesBuilder) throws {
        let obj = routes.grouped("Teams")
        obj.get( use: index)
        obj.post( use: create)
        obj.put( use: update)
        obj.delete(":id", use:delete)
    }
    //Get Method
    func index(req:Request) async throws -> [TeamsModel]{
        try await TeamsModel.query(on: req.db).all()
    }
    //Post Method
    func create(req:Request) async throws  -> TeamsModel {
        let p = try req.content.decode(TeamsModel.self)
        
        try await p.save(on: req.db)
        return p
    }
    //Update Method only for headCoach
    func update(req:Request)  async throws  -> TeamsModel {
        let new = try req.content.decode(TeamsModel.self)
     
        guard let given = try await TeamsModel.find(new.id, on: req.db)
        else {
            throw Abort(.notFound)
        }
        given.headCoach = new.headCoach
        
        try await given.update(on: req.db)
        return given
    }
    
    //Delete Method by only id
    func delete(req:Request) async throws  -> TeamsModel {
        
        guard let given = try await TeamsModel.find(req.parameters.get("id"), on: req.db)
        else {
            throw Abort(.notFound)
        }
        
        try await given.delete(on: req.db)
        return given
    }
}

