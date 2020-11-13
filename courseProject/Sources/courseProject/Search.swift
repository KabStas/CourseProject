import Foundation

class Search: SearchProtocol {
    
    let read: GetDataProtocol
    let output: OutputProtocol

    init(reading: GetDataProtocol, outputting: OutputProtocol) {
        self.read = reading
        self.output = outputting
    }

    func searching(key: String?, language: String?) {
        let dictionary = read.creatingDictionary()
        var alternativeOutput = false
        if let key = key {
            if let language = language { 
                if let word = dictionary[key]?[language] {
                    output.outputting(key: word)
                }
                else {
                    output.outputting(key: "Not found")
                }
            } 
            else {
                for (word, translations) in dictionary { 
                    if key == word { 
                        output.outputting(key: key)
                        let translations = translations
                        output.outputtingResults(dictionary: translations)
                        return
                    }
                }
                output.outputting(key: "Not found")   
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
                output.outputting(key: "Not found")    
            }
        } 
        else {
            output.outputtingResults(dictionary: dictionary)
        }      
    }
}