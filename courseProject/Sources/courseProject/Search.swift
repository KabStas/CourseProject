import Foundation

class Search: SearchProtocol {
    
    let output: Outputting
    let dictionary: GettingData
    
    
    init() {
        self.dictionary = GettingData()
        self.output = Outputting()
    }
    
    func searching(key: String?, language: String?) {

        let dictionary = dictionary.creatingDictionary()
        
        if let key = key {
            if let language = language { 
                output.outputtingResultsForKeyAndLanguage(key: key, language: language) 
            } else {
                output.outputtingResultsForKey (key: key)
            }
        } else if let language = language {
            output.outputtingResultsForLanguage (language: language)
        } else {
            output.outputtingResultsWithNoArgs() 
        }
    }
}