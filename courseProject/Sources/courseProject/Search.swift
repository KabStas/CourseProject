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
        var isSearchingByLanguage = false
        
        if let key = key {
            if let language = language { 
                for (word, translations) in dictionary { 
                    if key == word { 
                        for (languages, value) in translations {
                            if language == languages {
                                output.outputtingSearchResults(string: value)
                                return
                            }
                        }
                    } 
                }
                output.outputtingSearchResults(string: "Not found")      
            } else {
                isSearchingByLanguage = false
                for (word, translations) in dictionary { 
                    if key == word { 
                        output.outputtingSearchResults(string: word)
                        for (language, value) in translations {
                            output.outputtingSearchResults(string: language, value: value,
                                boolean: isSearchingByLanguage)
                        }
                        return
                    }
                }
                output.outputtingSearchResults(string: "Not found")   
            }
        } else if let language = language {

            var countForMatches = 0
            isSearchingByLanguage = true
            for (word, translations) in dictionary { 
                for (languages, value) in translations {
                    if language == languages {
                        countForMatches += 1    
                        output.outputtingSearchResults(string: word, value: value, 
                            boolean: isSearchingByLanguage)
                        
                    }
                }
            }
            if countForMatches == 0 {
                output.outputtingSearchResults(string: "Not found")    
            }
        } else { 
            isSearchingByLanguage = false
            for (word, translations) in dictionary {
                output.outputtingSearchResults(string: word)
                for (language, value) in translations {
                    output.outputtingSearchResults(string: language, value: value,
                        boolean: isSearchingByLanguage)
                }
            }
        }
    }
}