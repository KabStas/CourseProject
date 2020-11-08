import Foundation

class Update: UpdateProtocol {
    
    let dict: GettingData
    let write: PuttingData
    
    init() {
        self.dict = GettingData()
        self.write = PuttingData()
    }

    func updating(word: String, key: String, language: String) {

        var dictionary = dict.creatingDictionary()
        
        var newWord: [String: String] = dictionary[key] ?? [:]
        newWord[language] = word
        dictionary[key] = newWord
        write.writingToFile(dictionary: dictionary)
    }
}