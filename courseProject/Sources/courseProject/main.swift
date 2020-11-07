// import Foundation
// import ArgumentParser

func main() {
    let container = Container()
    let parser = container.argumentsParser
    guard let arguments = parser.parsing() else {
        return 
    }
    print(arguments)
}

main()

class Container {
    var argumentsParser: ArgumentsParserProtocol {
        return ArgumentsParser()
    }
}


/*
import Foundation
import ArgumentParser

let path = Bundle.main.path(forResource: "dict", ofType: "json") ?? "dict.json"
var dictionaries: [String: [String: String]] = [:]
let decoder = JSONDecoder()
let encoder = JSONEncoder()

if let json = FileManager.default.contents(atPath: path) { 
    dictionaries = (try? decoder.decode([String: [String: String]].self, from: json)) ?? [:]
} else {
    dictionaries = [:]
} 

func outputtingResultsWithNoArgs() {

    for (word, translations) in dictionaries {
        print(word)
        for (language, value) in translations {
            print("  \(language): \(value)")
        }
    }
}

func outputtingResultsForKey (key: String) {

    for (word, translations) in dictionaries { 
        if key == word { 
            print(word)
            for (language, value) in translations {
                print("  \(language): \(value)")
            }
            return
        } 
    }
    print("Not found")   
}

func outputtingResultsForLanguage (language: String) {

    var countForMatches = 0

    for (word, translations) in dictionaries { 
        for (languages, value) in translations {
            if language == languages {
                countForMatches += 1    
                print("  \(word) = \(value)")
            }
        }
    }
    if countForMatches == 0 {
        print("Not found")   
    }
}   
  
func outputtingResultsForKeyAndLanguage (key: String, language: String) {

    for (word, translations) in dictionaries { 
        if key == word { 
            for (languages, value) in translations {
                if language == languages {
                    print(value)
                    return
                }
            }
        } 
    }
    print("Not found") 
}  

func addingValuesToDictionary (addingWord: String, key: String, language: String) -> 
    [String: [String: String]] {

    var newWord: [String: String] = dictionaries[key] ?? [:]
    newWord[language] = addingWord
    dictionaries[key] = newWord
    return dictionaries
}

func deletingValuesFromDictionary (language: String) -> [String: [String: String]] {

    for (word, translations) in dictionaries {
        var  translations = translations
        translations[language] = nil
        dictionaries[word] = translations
    } 
    return dictionaries
}

func deletingValuesFromDictionary (key: String, language: String) -> 
    [String: [String: String]] {

    var translations = dictionaries[key] ?? [:]
    translations[language] = nil
    dictionaries[key] = translations
    return dictionaries
}

func encodingToJsonWithWritingToFile (dictionaries: [String: [String: String]]) {

    encoder.outputFormatting = .prettyPrinted
    let json = (try? encoder.encode(dictionaries))
    guard let path = Bundle.module.url(forResource: "dict", withExtension: "json") else {return}
    try? json?.write(to: path)
    //print(path)
}

enum Action: String, ExpressibleByArgument {

    case search, update, delete
}

struct Run: ParsableCommand {
    
    @Argument(help: "search, update or delete")
    var action: Action
    @Argument(help: "chosen word to update") 
    var word: String?
    @Option(name: .shortAndLong, help: "A word to translate")
    var key: String?
    @Option(name: .shortAndLong, help: "A language to choose")
    var language: String?   

    func run() throws {
        
        switch action {
        case .search:
            if let finalKey = key {
                if let finalLanguage = language { 
                outputtingResultsForKeyAndLanguage(key: finalKey, language: finalLanguage) 
                } else {
                    outputtingResultsForKey (key: finalKey)
                }
            } else if let finalLanguage = language {
                outputtingResultsForLanguage (language: finalLanguage)
            } else {
                outputtingResultsWithNoArgs() 
            }
        case .update:
            if let finalKey = key, let finalLanguage = language, let finalWord = word {
                dictionaries = addingValuesToDictionary (addingWord: finalWord, key: finalKey, 
                    language: finalLanguage)
                encodingToJsonWithWritingToFile (dictionaries: dictionaries)
            }
        case .delete:
            if let finalKey = key {
                if let finalLanguage = language { 
                    dictionaries = deletingValuesFromDictionary (key: finalKey, language: finalLanguage)
                    encodingToJsonWithWritingToFile (dictionaries: dictionaries)
                } else {
                    dictionaries[finalKey] = nil
                    encodingToJsonWithWritingToFile (dictionaries: dictionaries)           
                }
            } else if let finalLanguage = language {
                dictionaries = deletingValuesFromDictionary (language: finalLanguage)
                encodingToJsonWithWritingToFile (dictionaries: dictionaries)
            }          
        }
    }
}
Run.main()
*/