import App
// import Vapor
// import Foundation

// struct SearchController: RouteCollection {

//     let search: SearchProtocol
    
//     init(searching: SearchProtocol) {
//         self.search = searching
//     }

//     func boot(routes: RoutesBuilder) throws {
//         let todos = routes.grouped("search")
//         todos.get(use: searching)
//     }

//     func searching(req: Request) throws -> EventLoopFuture<[String]> {
//         let parameters = try? req.query.decode(Parameters.self)
//         //req.logger.info("Parameters: \(parameters?.key ?? "") \(parameters?.language ?? "")")
//         let result = search.APIsearching(key: parameters?.key, language: parameters?.language)
//         //let result
//         return req.eventLoop.future(result: result)
//     }
// }

// private extension SearchController {
//     struct Parameters: Content {
//         let key: String?
//         let language: String?
//     }
// }