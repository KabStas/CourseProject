import App
import Vapor
import Fluent
import Leaf

public struct WebUpdatePageController: RouteCollection {
    
    public func boot(routes: RoutesBuilder) throws {
        let todos = routes.grouped("updatePage")
        todos.get(use: updatePage)
    }
    
    func updatePage(req: Request) -> EventLoopFuture<View> {
        return req.view.render("updatePage")
    } 
}