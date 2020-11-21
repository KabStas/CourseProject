import Foundation

public class Search: SearchProtocol {
    
    let read: GetDataProtocol
    let output: OutputProtocol

    init(reading: GetDataProtocol, outputting: OutputProtocol) {
        self.read = reading
        self.output = outputting
    }

    public func searching(key: String?, language: String?) -> Result {
        let dictionary = read.creatingDictionary()
        var alternativeOutput = false
        if let key = key {
            if let language = language { 
                if let word = dictionary[key]?[language] {
                    output.outputting(value: word)
                    return .SearchingSuccess
                }
                else {
                    output.outputting(value: "Not found")
                }
            } 
            else {
                for (word, translations) in dictionary { 
                    if key == word { 
                        output.outputting(value: key)
                        let translations = translations
                        output.outputtingResults(dictionary: translations)
                        return .SearchingSuccess 
                    }
                }
                output.outputting(value: "Not found")
            }
        } else if let language = language {
            var countForMatches = 0
            alternativeOutput = true
            for (word, translations) in dictionary { 
                for (languages, value) in translations {
                    if language == languages {
                        countForMatches += 1    
                        output.outputtingResults(key: word, value: value, 
                            alternativeOutput: alternativeOutput)  
                    }
                }
            }
            if countForMatches == 0 {
                output.outputting(value: "Not found")      
            }
        } 
        else {
            output.outputtingResults(dictionary: dictionary)
        }      
        return .SearchingSuccess
    }
}