import App
import Vapor
import Fluent

public struct SearchController: RouteCollection {

    let search: SearchProtocol
    
    init(search: SearchProtocol) {
        self.search = search
    }

    public func boot(routes: RoutesBuilder) throws {
        let todos = routes.grouped("search")
        todos.get(use: searching)
    }

    func searching(req: Request) -> EventLoopFuture<[String: [String: String]]> {
        let parameters = try? req.query.decode(Parameters.self)
        req.logger.info("Parameters: \(parameters?.key ?? "") \(parameters?.language ?? "")")
        let result = search.searching(key: parameters?.key, language: parameters?.language, dictionary: nil, searchingForDeletion: false)
            .mapError{ $0 as Error }
        return req.eventLoop.future(result: result)
    }
}

private extension SearchController {
    struct Parameters: Content {
        let key: String?
        let language: String?
    }
}