public enum ParserResults <success, failure> { 
    case success(Arguments)
    case failure(ArgumentsParserError)
}           