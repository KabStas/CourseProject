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
        let alternativeOutput = false
        var newWord: [String: String] = dictionary[key] ?? [:]

        newWord[language] = word
        dictionary[key] = newWord
        for (word, translations) in dictionary { 
            if key == word { 
                output.outputtingResults(key: key)
                for (language, value) in translations {
                    output.outputtingResults(key: language, value: value,
                        alternativeOutput: alternativeOutput)
                }
            }
        }
        write.writing(dictionary: dictionary)
    }
}