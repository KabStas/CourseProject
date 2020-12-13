public protocol SearchProtocol {
    func searching(key: String?, language: String?, 
        dictionary: [String: [String: String]]?, searchingForDeletion: Bool) -> Result<[String : [String : String]], AppErrors>
    func searching(key: String, dictionary: [String: [String: String]]) -> Result<[String : [String : String]], AppErrors>
}