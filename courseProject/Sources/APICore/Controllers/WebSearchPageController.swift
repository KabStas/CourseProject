import App
import Vapor
import Fluent
import Leaf

public struct WebSearchPageController: RouteCollection {
    
    public func boot(routes: RoutesBuilder) throws {
        let todos = routes.grouped("searchPage")
        todos.get(use: searchPage)
    }
    
    func searchPage(req: Request) -> EventLoopFuture<View> {
        return req.view.render("searchPage")
    } 
}