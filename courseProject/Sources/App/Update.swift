import Foundation

class Update: UpdateProtocol {
    
    let read: GetDataProtocol
    let write: PutDataProtocol
    let output: OutputProtocol
    
    init(reading: GetDataProtocol,writing: PutDataProtocol, outputting: OutputProtocol) {
            self.read = reading
            self.write = writing
            self.output = outputting
    }
    
    func updating(word: String, key: String, language: String) -> Result<[String : [String : String]], AppErrors> {
        var dictionary = read.creatingDictionary()
        var anotherDict: [String: [String: String]] = [:]
        var newWord: [String: String] = dictionary[key] ?? [:]
        newWord[language] = word
        anotherDict.updateValue(newWord, forKey: key)
        dictionary.updateValue(newWord, forKey: key)
        output.outputtingResults(dictionary: anotherDict)
        write.writing(dictionary: dictionary)
        return .success(anotherDict)
    }
}