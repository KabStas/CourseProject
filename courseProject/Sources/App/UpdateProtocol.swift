public protocol UpdateProtocol {
    func updating(word: String, key: String, language: String) -> AppResults
    func updatingAPI(word: String, key: String, language: String) -> [String: [String: String]]
}