//
//  File.swift
//  
//
//  Created by ShahadQadi on 27/08/1444 AH.
//

import Foundation
import Fluent
import Vapor

struct CreateTeamMember: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("TeamMemebers")
            .id()
            .field("Player Name", .string)
            .field("Player Age", .string)
            .field("Player Nationality", .string)
            .field("Player Team", .string)
            .field("Player Postion", .string)
            .field("Player Scoring", .string)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("TeamMemebers").delete()
    }
}
