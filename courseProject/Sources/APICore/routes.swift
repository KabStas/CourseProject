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
    
    try app.register(collection: SearchController(search: searching))
    try app.register(collection: DeleteController(delete: deleting))
    try app.register(collection: UpdateController(update: updating))
}