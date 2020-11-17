import Foundation

public class Update: UpdateProtocol {
    
    let read: GetDataProtocol
    let write: PutDataProtocol
    let output: OutputProtocol
    
    init(reading: GetDataProtocol, writing: PutDataProtocol, outputting: OutputProtocol) {
        self.read = reading
        self.write = writing
        self.output = outputting
    }
    
    public func updating(word: String, key: String, language: String) {
        var dictionary = read.creatingDictionary()
        var newWord: [String: String] = dictionary[key] ?? [:]

        newWord[language] = word
        dictionary[key] = newWord
        guard let dict = dictionary[key] else {
            return
        }
        output.outputting(value: key)
        output.outputtingResults(dictionary: dict)
        write.writing(dictionary: dictionary)
    }
}