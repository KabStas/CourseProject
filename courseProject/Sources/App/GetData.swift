import Foundation

class GetData: GetDataProtocol {

    func creatingDictionary() -> [String: [String: String]] {

        var dictionary: [String: [String: String]] = ["cat": ["esp": "Gato",
                                                              "rus": "Кот",
                                                              "fr": "Le chat"],
                                                      "dog": ["esp": "Perro",
                                                              "rus": "Собака",
                                                              "fr": "La chienne"],
                                                      "mouse": ["esp": "Ratón",
                                                              "rus": "Мышь",
                                                              "fr": "La souris"]]    
        
        // let path = Bundle.module.path(forResource: "dict", ofType: "json") ?? "dict.json"
        // var dictionary: [String: [String: String]]
        // let decoder = JSONDecoder()
        // if let json = FileManager.default.contents(atPath: path) { 
        //     dictionary = (try? decoder.decode([String: [String: String]].self, from: json)) ?? [:]
        // } else {
        //     dictionary = [:]
        // }
        return dictionary
    }
}