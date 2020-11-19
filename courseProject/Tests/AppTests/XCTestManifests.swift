import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        //testCase(LocalisationAppTests.allTests),
        testCase(ArgumentsParserTests.allTests)
    ]
}
#endif
