import App
import Vapor
import Fluent
import Leaf

public struct WebDeletePageController: RouteCollection {
    
    public func boot(routes: RoutesBuilder) throws {
        let todos = routes.grouped("deletePage")
        todos.get(use: deletePage)
    }
    
    func deletePage(req: Request) -> EventLoopFuture<View> {
        return req.view.render("deletePage")
    } 
}