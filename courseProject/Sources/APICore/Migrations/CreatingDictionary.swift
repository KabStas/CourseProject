import Foundation
import Fluent

struct CreatingDictionary: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("dictionary")
            .id()
            .field("word", .string)
            .field("language", .string)
            .field("translation", .string)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("dictionary").delete()
    }
}