import Foundation

public class Delete: DeleteProtocol {

    let read: GetDataProtocol
    let write: PutDataProtocol
    let output: OutputProtocol
    let search: SearchProtocol

    init(reading: GetDataProtocol, searching: SearchProtocol, 
        writing: PutDataProtocol, outputting: OutputProtocol) {
            self.read = reading
            self.search = searching
            self.write = writing
            self.output = outputting
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

    public func deleting(key: String?, language: String?) -> AppResults{
        var dictionary = read.creatingDictionary()
        let result = search.searching(key: key, language:language)

        guard result == .searchingSuccess else {
            return .notFound
        }
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
        output.outputtingResults(dictionary: dictionary)
        write.writing(dictionary: dictionary)
        return .deletingSuccess
    }
}