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
        let todos = routes.grouped("deleteResultPage")
        todos.get(use: deleteResultPage)
    }

    func deleteResultPage(req: Request) -> EventLoopFuture<View> {
        let parameters = try? req.query.decode(Parameters.self)
        
        var key = parameters?.key
        var language = parameters?.language
        
        if ((parameters?.key?.isEmpty) == true) { 
            key = nil
        }
        if ((parameters?.language?.isEmpty) == true) {
            language = nil
        }
        
        let result = delete
            .deleting(key: key, language: language)
            .mapError{ $0 as Error }
        if case .success(_) = result {
            let newRes = result.map { value in
                Response(
                    results: value.map { value in
                        Response.DeleteResults(
                            key: value.key,
                            elements: value.value.map {
                                Response.DeleteResults.Element(
                                    language: $0.key,
                                    value: $0.value
                                )
                            }
                        )
                    }
                )
            }
            if case .success(let dictionary) = newRes {
                return req.view.render("deleteResultPage", WebDeletePageContext(title: "Delete results", results: dictionary))
            }
        }
        return req.view.render("deleteResultPage", ["title": "Delete results"])
    }
}

struct WebDeletePageContext: Content {
    var title: String
    var results: WebDeleteController.Response
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