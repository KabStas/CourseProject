import App
import Vapor
import Fluent
import Leaf

public struct WebDeleteController: RouteCollection {

    let delete: DeleteProtocol
    
    init(delete: DeleteProtocol) {
        self.delete = delete
    }

    public func boot(routes: RoutesBuilder) throws {
        let todos = routes.grouped("resultPage")
        todos.get(use: deletingView)
    }

    func deletingView(req: Request) -> EventLoopFuture<View> {
        let parameters = try? req.query.decode(Parameters.self)
        req.logger.info("Parameters: \(parameters?.key ?? "") \(parameters?.language ?? "")")
        let result = delete
            .deleting(key: parameters?.key, language: parameters?.language)
            .mapError{ $0 as Error }

        // return result 
            // .map { value in
            //     Response(
            //         results: value.map { value in
            //             Response.SearchResults(
            //                 key: value.key,
            //                 elements: value.elements.map {
            //                 Response.SearchResults.Element(
            //                     language: $0.language,
            //                     value: $0.value
            //                 )
            //             }
            //         )
            //     }
            // )
            //     .flatMap { value in 
            //     req.view.render("search", value)  
            // }
            
    }
}

private extension WebDeleteController {
    struct Parameters: Content {
        let key: String?
        let language: String?
    }
}

extension WebDeleteController {
    struct Response: Content {
        let results: [DeleteResults]

        struct DeleteResults: Codable {
            let key: String
            let elements: [Element]

            struct Element: Codable {
                let language: String
                let value: String
            }
        }
    }
}