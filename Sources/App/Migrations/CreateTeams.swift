//
//  File.swift
//  
//
//  Created by ShahadQadi on 27/08/1444 AH.
//

import Foundation
import Fluent
import Vapor

struct CreateTeams: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("Teams")
            .id()
            .field("Team Name", .string)
            .field("Team Place", .string)
            .field("Team Foundation Date", .string)
            .field("Head Coach", .string)
            .field("Number of Champions", .string )
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
      database.schema("Teams").delete()
    }
}
