public protocol SearchProtocol {
    func searching(key: String?, language: String?) -> Result
}