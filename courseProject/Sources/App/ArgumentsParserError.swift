public enum ArgumentsParserError {
    case commandNotFound(text: String)
    case parseError(text: String)

    public var errorDescription: String {
        switch self {
        case .commandNotFound:
            return "Сommand not found"
        case .parseError:
            return "Parsing error"
        }
    }
}