import Foundation

class Update: UpdateProtocol {
    
    let read: GetDataProtocol
    let write: PutDataProtocol
    let output: OutputProtocol
    
    init(reading: GetDataProtocol, writing: PutDataProtocol, outputting: OutputProtocol) {
        self.read = reading
        self.write = writing
        self.output = outputting
    }
    
    func updating(word: String, key: String, language: String) {

        var dictionary = read.creatingDictionary()
        let isSearchingByLanguage = false
        var newWord: [String: String] = dictionary[key] ?? [:]

        newWord[language] = word
        dictionary[key] = newWord
        for (word, translations) in dictionary { 
            if key == word { 
                output.outputtingSearchResults(string: word)
                for (language, value) in translations {
                    output.outputtingSearchResults(string: language, value: value,
                        boolean: isSearchingByLanguage)
                }
            }
        }
        write.writingToFile(dictionary: dictionary)
    }
}