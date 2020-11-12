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
                    output.outputtingResults(key: word)
                }
                else {
                    output.outputtingResults(key: "Not found")
                }
            } else {
                alternativeOutput = false
                for (word, translations) in dictionary { 
                    if key == word { 
                        output.outputtingResults(key: key)
                        for (language, value) in translations {
                            output.outputtingResults(key: language, value: value, alternativeOutput: alternativeOutput)
                        }
                        return
                    }
                }
                output.outputtingResults(key: "Not found")   
            }
        } else if let language = language {
            var countForMatches = 0
            alternativeOutput = true
            for (word, translations) in dictionary { 
                for (languages, value) in translations {
                    if language == languages {
                        countForMatches += 1    
                        output.outputtingResults(key: word, value: value, alternativeOutput: alternativeOutput)  
                    }
                }
            }
            if countForMatches == 0 {
                output.outputtingResults(key: "Not found")    
            }
        } else { 
            for (word, translations) in dictionary { 
                output.outputtingResults(key: word)
                for (language, value) in translations {
                    output.outputtingResults(key: language, value: value, alternativeOutput: alternativeOutput)
                }
            }
        }      
    }
}