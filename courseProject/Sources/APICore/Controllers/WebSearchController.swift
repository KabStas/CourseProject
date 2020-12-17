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
        let todos = routes.grouped("searchResultPage")
        todos.get(use: searchResultPage)
    }

    func searchResultPage(req: Request) -> EventLoopFuture<View> {
        let parameters = try? req.query.decode(Parameters.self)

        var key = parameters?.key
        var language = parameters?.language
        
        if ((parameters?.key?.isEmpty) == true) { 
            key = nil
        }
        if ((parameters?.language?.isEmpty) == true) {
            language = nil
        }
        
        let result = search
            .searching(key: key, language: language, dictionary: nil, searchingForDeletion: false)

        if case .success(_) = result {
            let newRes = result.map { value in
                Response(
                    results: value.map { value in
                        Response.SearchResults(
                            key: value.key,
                            elements: value.value.map {
                                Response.SearchResults.Element(
                                    language: $0.key,
                                    value: $0.value
                                )
                            }
                        )
                    }
                )
            }
            if case .success(let dictionary) = newRes {
                return req.view.render("searchResultPage", WebSearchPageContext(title: "Search results", results: dictionary))
            }
        }
        return req.view.render("searchResultPage", ["title": "Search results"])
    }
}

struct WebSearchPageContext: Content {
    var title: String
    var results: WebSearchController.Response
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