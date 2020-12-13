import ArgumentParser

class ArgumentsParser: ArgumentsParserProtocol {
    func parsing(_ arguments: [String]?) -> ArgumentsParserResults <Arguments, AppErrors> {
        do {
            let command = try Commands.parseAsRoot(arguments)

            switch command {
            case let command as Commands.Search:
                return .success(.search(key: command.key, language: command.language))

            case let command as Commands.Update:
                return .success(.update(word: command.word, key: command.key, language: command.language))  
            
            case let command as Commands.Delete:
                return .success(.delete(key: command.key, language: command.language))   
            
            case let command as Commands.Help:
                return .success(.help(text: Commands.helpMessage()))

            default:
                return .failure(.commandNotFound(text: Commands.helpMessage()))
            }
        }
        catch {
            return .failure(.parseError(text: Commands.helpMessage()))
        }
    }
}

struct Commands: ParsableCommand {
    static var configuration = CommandConfiguration(
        subcommands: [Search.self, Update.self, Delete.self, Help.self]
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
    struct Help: ParsableCommand {
        static var configuration =
            CommandConfiguration(abstract: "Help")
        @Option (name: .shortAndLong)
        var help: String?
    }
}