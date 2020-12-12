public protocol UpdateProtocol {
    func updating(word: String, key: String, language: String) -> Result<[String : [String : String]], AppErrors>
}