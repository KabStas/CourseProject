import App
import Vapor
import Fluent

public struct APIDeleteController: RouteCollection {

    let delete: DeleteProtocol
    
    init(delete: DeleteProtocol) {
        self.delete = delete
    }

    public func boot(routes: RoutesBuilder) throws {
        let todos = routes.grouped("delete")
        todos.post(use: deleting)
    }

    func deleting(req: Request) -> EventLoopFuture<[String: [String: String]]> {
        let parameters = try? req.query.decode(Parameters.self)
        req.logger.info("Parameters: \(parameters?.key ?? "") \(parameters?.language ?? "")")
        let result = delete.deleting(key: parameters?.key, language: parameters?.language)
            .mapError{ $0 as Error }
        return req.eventLoop.future(result: result)
    }
}

private extension APIDeleteController {
    struct Parameters: Content {
        let key: String?
        let language: String?
    }
}