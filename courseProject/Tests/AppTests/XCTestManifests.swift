import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(ArgumentsParserTests.allTests),
        testCase(DeleteTests.allTests),
        testCase(SearchTests.allTests),
        testCase(UpdateTests.allTests),
    ]
}
#endif
