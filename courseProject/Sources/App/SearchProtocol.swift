public protocol SearchProtocol {
    func searching(key: String?, language: String?, 
        dictionary: [String: [String: String]]?, searchingForDeletion: Bool) -> AppResults
    func searching(key: String, dictionary: [String: [String: String]]) -> AppResults
    func APIsearching(key: String?, language: String?) -> [String: [String: String]]
}