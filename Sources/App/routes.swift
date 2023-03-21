import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req async in
        "It works!"
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }
 //the below routes was only for testing 
//    app.post("Teams") { req -> EventLoopFuture<TeamsModel> in
//
//        let ts = try req.content.decode(TeamsModel.self)
//
//        return ts.create(on: req.db).map {ts}
//    }
//    app.post("TeamMembers") { req -> EventLoopFuture<TeamMemberModel> in
//
//        let tss = try req.content.decode(TeamMemberModel.self)
//
//        return tss.create(on: req.db).map {tss}
    
    try app.register(collection: TeamsController())
    try app.register(collection: TeamMemberController())
}
