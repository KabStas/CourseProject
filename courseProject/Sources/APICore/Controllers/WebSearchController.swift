import App
import Vapor
import Fluent
import Leaf

public struct WebSearchController: RouteCollection {

    let search: SearchProtocol
    
    init(search: SearchProtocol) {
        self.search = search
    }

    public func boot(routes: RoutesBuilder) throws {
        let todos = routes.grouped("resultPage")
        todos.get(use: searchingView)
    }

    func searchingView(req: Request) -> EventLoopFuture<View> {
        let parameters = try? req.query.decode(Parameters.self)
        req.logger.info("Parameters: \(parameters?.key ?? "") \(parameters?.language ?? "")")
        let result = search
            .searching(key: parameters?.key, language: parameters?.language, dictionary: nil, searchingForDeletion: false)
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

private extension WebSearchController {
    struct Parameters: Content {
        let key: String?
        let language: String?
    }
}

extension WebSearchController {
    struct Response: Content {
        let results: [SearchResults]

        struct SearchResults: Codable {
            let key: String
            let elements: [Element]

            struct Element: Codable {
                let language: String
                let value: String
            }
        }
    }
}