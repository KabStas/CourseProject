import ArgumentParser
//import Foundation

class ArgumentsParser: ArgumentsParserProtocol {
    func parsing() -> Arguments? {
        do {
            let command = try Commands.parseAsRoot()

            switch command {
            case let command as Commands.Search:
                return .search(key: command.key, language: command.language)

            case let command as Commands.Update:
                return .update(word: command.word, key: command.key, language: command.language)  

            case let command as Commands.Delete:
                return .delete(key: command.key, language: command.language)

            default:
                print(Commands.helpMessage())
                return nil                
            }
        } 
        catch {
            print(Commands.helpMessage())
            return nil   
        }
    }
}

private struct Commands: ParsableCommand {
  
    static var configuration = CommandConfiguration(
        subcommands: [Search.self, Update.self, Delete.self]
    )
}

extension Commands {
    struct Search: ParsableCommand {
        @Option (name: .shortAndLong, help: "A word to translate")
        var key: String?

        @Option (name: .shortAndLong, help: "A language to choose")
        var language: String?
    }
    struct Delete: ParsableCommand {
        @Option (name: .shortAndLong, help: "A word to translate")
        var key: String?

        @Option (name: .shortAndLong, help: "A language to choose")
        var language: String?
    }
    struct Update: ParsableCommand {
        @Argument(help: "SOS")
        var word: String
        
        @Option (name: .shortAndLong, help: "A word to translate")
        var key: String

        @Option (name: .shortAndLong, help: "A language to choose")
        var language: String
    }
}