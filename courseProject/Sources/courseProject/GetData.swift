import Foundation

class GetData: GetDataProtocol {

    func creatingDictionary() -> [String: [String: String]] {
        let path = Bundle.main.path(forResource: "dict", ofType: "json") ?? "dict.json"
        var dictionary: [String: [String: String]]
        let decoder = JSONDecoder()
        if let json = FileManager.default.contents(atPath: path) { 
            dictionary = (try? decoder.decode([String: [String: String]].self, from: json)) ?? [:]
        } else {
            dictionary = [:]
        }
        return dictionary
    }
}