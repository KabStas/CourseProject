protocol ArgumentsParserProtocol {
    func parsing(_ arguments: [String]?) -> ParserResults <Arguments, ArgumentsParserError>
}