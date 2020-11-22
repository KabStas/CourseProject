public enum ArgumentsParserError {
    case commandNotFound(text: String)
    case parseError(text: String)
}