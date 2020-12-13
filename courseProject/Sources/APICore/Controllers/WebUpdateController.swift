import App
import Vapor
import Fluent
import Leaf

public struct WebUpdateController: RouteCollection {

    let update: UpdateProtocol
    
    init(update: UpdateProtocol) {
        self.update = update
    }

    public func boot(routes: RoutesBuilder) throws {
        let todos = routes.grouped("resultPage")
        todos.get(use: updatingView)
    }

    func updatingView(req: Request) -> EventLoopFuture<View> {
        let parameters = try? req.query.decode(Parameters.self)
        req.logger.info("Parameters: \(parameters?.key ?? "") \(parameters?.language ?? "")")
        let result = update
            .updating(word: parameters?.word ?? "", key: parameters?.key ?? "", language: parameters?.language ?? "")
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

private extension WebUpdateController {
    struct Parameters: Content {
        let word: String
        let key: String
        let language: String
    }
}

extension WebUpdateController {
    struct Response: Content {
        let results: [UpdateResults]

        struct UpdateResults: Codable {
            let key: String
            let elements: [Element]

            struct Element: Codable {
                let language: String
                let value: String
            }
        }
    }
}