import App
import Vapor
import Fluent

public struct APIUpdateController: RouteCollection {

    let update: UpdateProtocol
    
    init(update: UpdateProtocol) {
        self.update = update
    }

    public func boot(routes: RoutesBuilder) throws {
        let todos = routes.grouped("update")
        todos.post(use: updating)
    }

    func updating(req: Request) -> EventLoopFuture<[String: [String: String]]> {
        let parameters = try? req.query.decode(Parameters.self)
        req.logger.info("Parameters: \(parameters?.word ?? "") \(parameters?.key ?? "") \(parameters?.language ?? "")")
        let result = update.updating(word: parameters?.word ?? "", key: parameters?.key ?? "", language: parameters?.language ?? "")
            .mapError{ $0 as Error }
        return req.eventLoop.future(result: result)
    }
}

private extension APIUpdateController {
    struct Parameters: Content {
        let word: String
        let key: String
        let language: String
    }
}