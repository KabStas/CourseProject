protocol SearchProtocol {
    func searching(key: String?, language: String?, 
        dictionary: [String: [String: String]]?) -> AppResults
    func searching(key: String, dictionary: [String: [String: String]]) -> AppResults  
}