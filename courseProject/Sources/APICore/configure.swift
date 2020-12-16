import Fluent
import App
import FluentSQLiteDriver
import Foundation
import Vapor

public func configure(_ app: Application) throws {
    
    app.databases.use(.sqlite(.file("db.sqlite")), as: .sqlite)
    app.migrations.add(CreatingDictionary())
    let _ = app.autoMigrate()
    try routes(app)
}