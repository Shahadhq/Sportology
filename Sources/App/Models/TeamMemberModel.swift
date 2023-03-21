//
//  File.swift
//  
//
//  Created by ShahadQadi on 27/08/1444 AH.
//

import Foundation
import Fluent
import Vapor

final class TeamMemberModel: Model, Content {
    static let schema = "TeamMemebers"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "Player Name")
    var PName: String
    
    @Field(key: "Player Age")
    var Age: String
    
    @Field(key: "Player Nationality")
    var PNationality: String
    
    @Field(key: "Player Team")
    var PTeam: String
    
    @Field(key: "Player Postion")
    var PPostion: String
    
    @Field(key: "Player Scoring")
    var PScoring: String
    
    init() { }

    init(id: UUID? = nil, PName: String, PTeam: String, PPostion: String, PScoring:String, Age: String, PNationality: String ) {
        self.id = id
        self.PName = PName
        self.PTeam = PTeam
        self.PPostion = PPostion
        self.PScoring = PScoring
        self.Age = Age
        self.PNationality = PNationality
    }
}
