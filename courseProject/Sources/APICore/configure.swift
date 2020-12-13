import Fluent
import App
import FluentSQLiteDriver
import Foundation
import Vapor
import Leaf
import LeafKit

public func configureAPI(_ app: Application) throws {
    
    app.databases.use(.sqlite(.file("db.sqlite")), as: .sqlite)
    app.migrations.add(CreatingDictionary())
    let _ = app.autoMigrate()
    try routes(app)
}

public func configureWeb(_ app: Application) throws {
    
    app.databases.use(.sqlite(.file("db.sqlite")), as: .sqlite)
    app.migrations.add(CreatingDictionary())
    let _ = app.autoMigrate()
    app.views.use(.leaf)
    try routes(app)
}