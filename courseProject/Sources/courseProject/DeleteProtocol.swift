protocol DeleteProtocol {
    func deleting (key: String?, language: String?)
    func deletingValuesFromDictionary (language: String) -> [String: [String: String]] 
    func deletingValuesFromDictionary (key: String, language: String) -> [String: [String: String]]
}