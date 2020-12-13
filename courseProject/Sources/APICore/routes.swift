import Vapor
import App
import Fluent
import Foundation

public func routes(_ app: Application) throws {

    let container = Container()
    let searching = container.search
    let deleting = container.delete
    let updating = container.update

    app.get() { req in
        return "Здравствуйте!"
    }
    app.get("main") { req -> EventLoopFuture<View> in
        return req.view.render("main")
    }
    
    try app.register(collection: APISearchController(search: searching))
    try app.register(collection: APIDeleteController(delete: deleting))
    try app.register(collection: APIUpdateController(update: updating))

    // try app.register(collection: WebSearchController(search: searching))
    // try app.register(collection: WebDeleteController(delete: deleting))
    // try app.register(collection: WebUpdateController(update: updating))
}