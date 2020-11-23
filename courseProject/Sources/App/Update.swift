import Foundation

public class Update: UpdateProtocol {
    
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
    

    public func updating(word: String, key: String, language: String) -> AppResults {
        var dictionary = read.creatingDictionary()
        let result = search.searching(key: key, dictionary: dictionary)
        //print(result)
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
}