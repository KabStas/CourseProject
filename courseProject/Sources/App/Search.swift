import Foundation

class Search: SearchProtocol{
    
    let read: GetDataProtocol
    let output: OutputProtocol

    init(reading: GetDataProtocol, outputting: OutputProtocol) {
        self.read = reading
        self.output = outputting
    }

    func searching(key: String?, language: String?, dictionary: [String: [String: String]]?,
        searchingForDeletion: Bool) -> AppResults {
        var alternativeOutput = false
        let dictionary = dictionary ?? read.creatingDictionary()

        if let key = key {
            if let language = language { 
                if let word = dictionary[key]?[language] {
                    if searchingForDeletion != true {
                        output.outputting(value: word)
                    }
                    return .searchingSuccess
                }
                else {
                    output.outputting(value:"Not found")
                    return .notFound
                }
            } 
            else {
                for (word, translations) in dictionary {       
                    if key == word { 
                        if searchingForDeletion != true {
                            output.outputting(value: key)
                            let translations = translations
                            output.outputtingResults(dictionary: translations)
                        }
                        return .searchingSuccess
                    }
                } 
                output.outputting(value:"Not found")
                return .notFound
            }
        } else if let language = language {
            var countForMatches = 0
            alternativeOutput = true
            dictionary.forEach { word, translations in
                translations.forEach { languages, value in
                    if language == languages {
                        countForMatches += 1 
                        if searchingForDeletion != true {   
                            output.outputtingResults(key: word, value: value, 
                                alternativeOutput: alternativeOutput)
                        }  
                    }
                }
            }
            return .searchingSuccess
            if countForMatches == 0 {
                output.outputting(value:"Not found")
                return .notFound
            }
        } 
        else {
            if searchingForDeletion != true {
                output.outputtingResults(dictionary: dictionary)
            }
        } 
    return .searchingSuccess
    }

    func searching(key: String, dictionary: [String: [String: String]]) -> AppResults {

        if let dict = dictionary[key] {
            return .searchingSuccess
        } 
        else {
            return .notFound
        }
    }





    func APIsearching(key: String?, language: String?) -> ([String: [String: String]]) {
        var alternativeOutput = false
        let dictionary = read.creatingDictionary()

        if let key = key {
            if let language = language { 
                if let word = dictionary[key]?[language] {
                    //output.outputting(value: word)
                    return ["String": ["String": "String"]]
                }
                else {
                    //output.outputting(value:"Not found")
                    return ["String": ["String": "String"]]
                }
            } 
            else {
                for (word, translations) in dictionary { 
                    if key == word { 
                        //output.outputting(value: key)
                        let translations = translations
                        //output.outputtingResults(dictionary: translations)
                        return ["String": ["String": "String"]] 
                    }
                }
                //output.outputting(value:"Not found")
                return ["String": ["String": "String"]]
            }
        } else if let language = language {
            var countForMatches = 0
            alternativeOutput = true
            for (word, translations) in dictionary { 
                for (languages, value) in translations {
                    if language == languages {
                        countForMatches += 1    
                        //output.outputtingResults(key: word, value: value, 
                            //alternativeOutput: alternativeOutput)  
                    }
                }
            }
            if countForMatches == 0 {
                //output.outputting(value:"Not found")
                return ["String": ["String": "String"]]
            }
        } 
        else {
            //output.outputtingResults(dictionary: dictionary)
        } 
    return ["String": ["String": "String"]]
    }
}