import Foundation

class Outputting: OutputtingProtocol  {

    let dict: GettingData

    init() {
        self.dict = GettingData()
    }
    

    func outputtingResultsWithNoArgs() {
        
        let dictionary = dict.creatingDictionary()

        for (word, translations) in dictionary {
            print(word)
            for (language, value) in translations {
                print("  \(language): \(value)")
            }
        }
    }

    func outputtingResultsForKey (key: String) {
        
        let dictionary = dict.creatingDictionary()
        
        for (word, translations) in dictionary { 
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
        
        let dictionary = dict.creatingDictionary()
        var countForMatches = 0
        
        for (word, translations) in dictionary { 
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
        
        let dictionary = dict.creatingDictionary()
        
        for (word, translations) in dictionary { 
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
} 