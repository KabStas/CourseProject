protocol ArgumentsParserProtocol {
    func parsing(_ arguments: [String]?) -> ArgumentsParserResults <Arguments, AppErrors>
}