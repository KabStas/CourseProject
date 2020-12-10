import Foundation

class Update: UpdateProtocol {
    
    let read: GetDataProtocol
    let search: SearchProtocol
    let write: PutDataProtocol
    let output: OutputProtocol
    
    init(reading: GetDataProtocol,searching: SearchProtocol, 
        writing: PutDataProtocol, outputting: OutputProtocol) {
            self.read = reading
            self.search = searching
            self.write = writing
            self.output = outputting
    }
    
    func updating(word: String, key: String, language: String) -> AppResults {
        var dictionary = read.creatingDictionary()
        let result = search.searching(key: key, dictionary: dictionary)
        guard result == .searchingSuccess else {
            return .notFound
        }
        var newWord: [String: String] = dictionary[key] ?? [:]
        newWord[language] = word
        dictionary[key] = newWord
        let dict = dictionary[key] ?? [:]
        output.outputting(value: key)
        output.outputtingResults(dictionary: dict)
        write.writing(dictionary: dictionary)
        return .updatingSuccess
    }

    public func updatingAPI(word: String, key: String, language: String) -> [String: [String: String]] {
        var dictionary = read.creatingDictionary()
        var newWord: [String: String] = dictionary[key] ?? [:]
        newWord[language] = word
        dictionary[key] = newWord
        write.writing(dictionary: dictionary)
        return dictionary
    }
}