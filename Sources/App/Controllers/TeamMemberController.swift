//
//  File.swift
//  
//
//  Created by ShahadQadi on 28/08/1444 AH.
//

import Foundation
import Fluent
import Vapor
struct TeamMemberController: RouteCollection{
    func boot(routes: Vapor.RoutesBuilder) throws {
        let obj = routes.grouped("TeamMember")
        obj.get( use: index)
        obj.post( use: create)
        obj.put( use: update)
        obj.delete(":id", use:delete)
    }
    //Get Method
    func index(req:Request) async throws -> [TeamMemberModel]{
        try await TeamMemberModel.query(on: req.db).all()
    }
    //Post Method
    func create(req:Request) async throws  -> TeamMemberModel {
        let p = try req.content.decode(TeamMemberModel.self)
        
        try await p.save(on: req.db)
        return p
    }
    //Update Method only for Age
    func update(req:Request)  async throws  -> TeamMemberModel {
        let new = try req.content.decode(TeamMemberModel.self)
        guard let given = try await TeamMemberModel.find(new.id, on: req.db)
        else {
            throw Abort(.notFound)
        }
        given.Age = new.Age
        try await given.update(on: req.db)
        return given
    }
    //Delete Method
    func delete(req:Request) async throws  -> TeamMemberModel {
        
        guard let given = try await TeamMemberModel.find(req.parameters.get("id"), on: req.db)
        else {
            throw Abort(.notFound)
        }
        
        try await given.delete(on: req.db)
        return given
    }
}

