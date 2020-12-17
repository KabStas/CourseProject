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
        let todos = routes.grouped("updateResultPage")
        todos.get(use: updatingView)
    }

    func updatingView(req: Request) -> EventLoopFuture<View> {
        let parameters = try? req.query.decode(Parameters.self)
        let result = update
            .updating(word: parameters?.word ?? "", key: parameters?.key ?? "", language: parameters?.language ?? "")
            .mapError{ $0 as Error }

        if case .success(_) = result {
            let newRes = result.map { value in
                Response(
                    results: value.map { value in
                        Response.UpdateResults(
                            key: value.key,
                            elements: value.value.map {
                                Response.UpdateResults.Element(
                                    language: $0.key,
                                    value: $0.value
                                )
                            }
                        )
                    }
                )
            }
            if case .success(let dictionary) = newRes {
                return req.view.render("updateResultPage", WebUpdatePageContext(title: "Update results", results: dictionary))
            }
        }
        return req.view.render("updateResultPage", ["title": "Update results"])
    }
}

struct WebUpdatePageContext: Content {
    var title: String
    var results: WebUpdateController.Response
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