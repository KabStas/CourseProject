import Fluent
import App
import FluentPostgresDriver
import Foundation
import Vapor
import Leaf
import LeafKit

public func configureAPI(_ app: Application) throws {
    
    app.databases.use(.postgres(hostname: "localhost", username: "vapor", password: "vapor", database: "vapor"), as: .psql)
    app.migrations.add(CreatingDictionary())
    let _ = app.autoMigrate()
    try routes(app)
}

public func configureWeb(_ app: Application) throws {
    
    app.databases.use(.postgres(hostname: "localhost", username: "vapor", password: "vapor", database: "vapor"), as: .psql)
    app.migrations.add(CreatingDictionary())
    let _ = app.autoMigrate()
    app.views.use(.leaf)
    try routes(app)
}