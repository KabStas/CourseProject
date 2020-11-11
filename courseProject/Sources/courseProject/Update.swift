import Foundation

class Update: UpdateProtocol {
    
    let read: GetDataProtocol
    let write: PutDataProtocol
    
    init(reading: GetDataProtocol, writing: PutDataProtocol) {
        self.read = reading
        self.write = writing
    }
    
    func updating(word: String, key: String, language: String) {

        var dictionary = read.creatingDictionary()
        
        var newWord: [String: String] = dictionary[key] ?? [:]
        newWord[language] = word
        dictionary[key] = newWord
        write.writingToFile(dictionary: dictionary)
    }
}