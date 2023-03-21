//
//  File.swift
//  
//
//  Created by ShahadQadi on 27/08/1444 AH.
//

import Foundation
import Fluent
import Vapor

final class TeamsModel: Model, Content {
    static let schema = "Teams"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "Team Name")
    var TName: String
    
    @Field(key: "Team Place")
    var TPlace: String
    
    @Field(key: "Team Foundation Date")
    var TDate: String
    
    @Field(key: "Head Coach")
    var headCoach: String
    
    @Field(key: "Number of Champions")
    var NChampions: String
    

    init() { }

    init(id: UUID? = nil, TName: String, TPlace: String, TDate: String, headCoach: String, NChampions: String ) {
        self.id = id
        self.TName = TName
        self.TPlace = TPlace
        self.TDate = TDate
        self.headCoach = headCoach
        self.NChampions = NChampions
    }
}
