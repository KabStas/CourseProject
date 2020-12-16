enum ArgumentsParserResults <success, failure> { 
    case success(Arguments)
    case failure(AppErrors)
}           