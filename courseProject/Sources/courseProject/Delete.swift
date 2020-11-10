import Foundation

class Delete: DeleteProtocol {

    let dict: GettingData
    let write: PuttingData
    
    init() {
        self.dict = GettingData()
        self.write = PuttingData()
    }

    private func deletingValuesFromDictionary(language: String, dictionary: [String: [String: String]]) -> 
        [String: [String: String]] {

        var dictionary = dictionary
        for (word, translations) in dictionary {
            var  translations = translations
            translations[language] = nil
            dictionary[word] = translations
        } 
        return dictionary
    }

    private func deletingValuesFromDictionary(key: String, language: String, 
        dictionary: [String: [String: String]]) -> [String: [String: String]] {

        var dictionary = dictionary        
        var translations = dictionary[key] ?? [:]
        translations[language] = nil
        dictionary[key] = translations
        return dictionary
    }

    private func deletingValuesFromDictionary(key: String, dictionary: [String: [String: String]]) -> 
        [String: [String: String]] {
        
        var dictionary = dictionary
        dictionary[key] = nil
        return dictionary     
    }

    func deleting(key: String?, language: String?) {

        var dictionary = dict.creatingDictionary()
        
        if let key = key {
            if let language = language { 
                dictionary = deletingValuesFromDictionary(key: key, language: language, 
                    dictionary: dictionary)
            } else { 
                dictionary = deletingValuesFromDictionary(key: key, 
                    dictionary: dictionary)        
            }
        } else if let language = language {
            dictionary = deletingValuesFromDictionary(language: language, 
                dictionary: dictionary) 
        }
        write.writingToFile(dictionary: dictionary)
    }
}          