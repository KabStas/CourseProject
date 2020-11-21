import ArgumentParser

public class ArgumentsParser: ArgumentsParserProtocol {
    public func parsing(_ arguments: [String]?) -> Arguments? {
        do {
            let command = try Commands.parseAsRoot(arguments)

            switch command {
            case let command as Commands.Search:
                return .search(key: command.key, language: command.language)
            case let command as Commands.Update:
                return .update(word: command.word, key: command.key, language: command.language)  
            case let command as Commands.Delete:
                return .delete(key: command.key, language: command.language)   
            default:
                return .help(text: Commands.helpMessage())
            }
        }
        catch {
            return .error(error: 1)
        }
    }
}

struct Commands: ParsableCommand {
    static var configuration = CommandConfiguration(
        subcommands: [Search.self, Update.self, Delete.self]
    )
}

extension Commands {
    struct Search: ParsableCommand {
        static var configuration =
            CommandConfiguration(abstract: "Searching for values")
        @Option (name: .shortAndLong)
        var key: String?

        @Option (name: .shortAndLong)
        var language: String?
    }
    struct Delete: ParsableCommand {
        static var configuration =
            CommandConfiguration(abstract: "Deleting selected value")
        @Option (name: .shortAndLong)
        var key: String?

        @Option (name: .shortAndLong)
        var language: String?
    }
    struct Update: ParsableCommand {
        static var configuration =
            CommandConfiguration(abstract: "Updating values")
        @Argument
        var word: String
        
        @Option (name: .shortAndLong)
        var key: String

        @Option (name: .shortAndLong)
        var language: String
    }
}