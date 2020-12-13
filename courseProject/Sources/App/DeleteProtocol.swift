public protocol DeleteProtocol {
    func deleting(key: String?, language: String?) -> Result<[String : [String : String]], AppErrors>
}