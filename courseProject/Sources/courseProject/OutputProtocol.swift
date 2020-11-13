protocol OutputProtocol {
    func outputting(key: String) 
    func outputtingResults(key: String, value: String, alternativeOutput: Bool)
    func outputtingResults(dictionary: [String: [String: String]])
    func outputtingResults(dictionary: [String: String])
} 