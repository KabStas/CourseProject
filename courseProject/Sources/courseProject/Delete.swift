import Foundation

class Delete: DeleteProtocol {

    let dict: GettingData
    let write: PuttingData
    
    init() {
        self.dict = GettingData()
        self.write = PuttingData()
    }

    func deletingValuesFromDictionary (language: String) -> [String: [String: String]] {

        var dictionary = dict.creatingDictionary()
        for (word, translations) in dictionary {
            var  translations = translations
            translations[language] = nil
            dictionary[word] = translations
        } 
        return dictionary
    }

    func deletingValuesFromDictionary (key: String, language: String) -> 
        [String: [String: String]] {

        var dictionary = dict.creatingDictionary()        
        var translations = dictionary[key] ?? [:]
        translations[language] = nil
        dictionary[key] = translations
        return dictionary
    }

    func deleting (key: String?, language: String?) {

        var dictionary = dict.creatingDictionary()
        
        if let key = key {
            if let language = language { 
                dictionary = deletingValuesFromDictionary (key: key, language: language)
            } else {
                dictionary[key] = nil          
            }
        } else if let language = language {
            dictionary = deletingValuesFromDictionary (language: language) 
        }
        write.writingToFile(dictionary: dictionary)
    }
}          