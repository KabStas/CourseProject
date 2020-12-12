import Foundation

class Search: SearchProtocol{
    
    let read: GetDataProtocol
    let output: OutputProtocol

    init(reading: GetDataProtocol, outputting: OutputProtocol) {
        self.read = reading
        self.output = outputting
    }

    public func searching(key: String?, language: String?, dictionary: [String: [String: String]]?,
        searchingForDeletion: Bool) -> Result<[String : [String : String]], AppErrors> {
        
        let dictionary = dictionary ?? read.creatingDictionary()
        var anotherDict: [String: [String: String]] = [:]
        var searchedString: [String: String] = [:]
        var existedMatches = false

        if let key = key {
            if let language = language {
                dictionary[key]?.forEach { languages, value in
                    if language == languages {
                        existedMatches = true
                        searchedString[language] = value   
                        anotherDict.updateValue(searchedString, forKey: key)
                        if searchingForDeletion != true {
                            output.outputting(value: key)
                            output.outputtingResults(dictionary: searchedString)
                        } 
                    }
                }
                if !existedMatches {
                    output.outputting(value: "Not found")
                    return .failure(.notFound)
                } 
                return .success(anotherDict)
            }
            else {
                dictionary.forEach { word, translations in
                    if key == word {
                        existedMatches = true
                        anotherDict.updateValue(dictionary[key] ?? [:], forKey: key)
                        if searchingForDeletion != true {
                            output.outputting(value: key)
                            output.outputtingResults(dictionary: translations)
                        }
                    }
                }
                if !existedMatches {
                    output.outputting(value: "Not found")
                    return .failure(.notFound)
                } 
                return .success(anotherDict)
            }
        } else if let language = language {
            dictionary.forEach { word, translations in
                translations.forEach { languages, value in
                    if language == languages {
                        existedMatches = true
                        searchedString[language] = value
                        anotherDict.updateValue(searchedString, forKey: word)
                        if searchingForDeletion != true {
                            output.outputtingResults(key: word, value: value, alternativeOutput: true)
                        }  
                    }
                }
            }
            if !existedMatches {
                output.outputting(value: "Not found")
                return .failure(.notFound)
            }
            return .success(anotherDict)
        } 
        else {
            if searchingForDeletion != true {
                output.outputtingResults(dictionary: dictionary)
            } 
            return .success(dictionary)
        }
    }  

    func searching(key: String, dictionary: [String: [String: String]]) -> Result<[String : [String : String]], AppErrors> {

        if let dict = dictionary[key] {
            return .success(dictionary)
        } 
        else {
            return .failure(.notFound)
        }
    }

}