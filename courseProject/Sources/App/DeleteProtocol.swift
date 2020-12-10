public protocol DeleteProtocol {
    func deleting(key: String?, language: String?) -> AppResults
    func deletingAPI(key: String?, language: String?) -> [String: [String: String]]
}