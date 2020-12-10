import App
import Vapor
import Fluent

public struct DeleteController: RouteCollection {

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
        let result = delete.deletingAPI(key: parameters?.key, language: parameters?.language)
        return req.eventLoop.future(result)
    }
}

private extension DeleteController {
    struct Parameters: Content {
        let key: String?
        let language: String?
    }
}