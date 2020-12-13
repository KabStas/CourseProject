import XCTest
@testable import App

final class SearchTests: XCTestCase {
    private var searching: Search!
    private var reading: GetDataMock!
    private var outputting: OutputMock!

    override func setUp() {
        reading = GetDataMock()
        outputting = OutputMock()
        searching = Search(reading: reading, outputting: outputting)
    }

    func testSearchWithKeyAndLanguage() throws {
        let key = "cat"
        let language = "rus"
        reading.getDataResult = ["cat": ["rus":"Кот"]]
        let results = searching.searching(key: key, language: language, 
            dictionary: nil, searchingForDeletion: false)
        XCTAssertEqual(results, .success(["cat": ["rus":"Кот"]]))
        XCTAssertEqual(reading.getDataCallsCount, 1)
        XCTAssertEqual(outputting.outputCallsCount, 1)
        XCTAssertEqual(outputting.outputParameters, "cat")
        XCTAssertEqual(outputting.outputCallsCount, 1)
        XCTAssertEqual(outputting.outputttingParameters, ["rus":"Кот"])
    }

    func testSearchWithKey() throws {
        let key = "dog"
        reading.getDataResult = ["dog": ["rus":"Собака"]]
        let results = searching.searching(key: key, language: nil, 
            dictionary: nil, searchingForDeletion: false)
        XCTAssertEqual(results, .success(["dog": ["rus":"Собака"]]))
        XCTAssertEqual(reading.getDataCallsCount, 1)
        XCTAssertEqual(outputting.outputCallsCount, 1)
        XCTAssertEqual(outputting.outputParameters, "dog")
        XCTAssertEqual(outputting.outputttingCallsCount, 1)
        XCTAssertEqual(outputting.outputttingParameters, ["rus":"Собака"])
    }

    func testSearchWithLanguage() throws {
        let language = "rus"
        reading.getDataResult = ["mouse": ["rus":"Мышь"]]
        let results = searching.searching(key: nil, language: language, 
            dictionary: nil, searchingForDeletion: false)
        XCTAssertEqual(results, .success(["mouse": ["rus":"Мышь"]]))
        XCTAssertEqual(reading.getDataCallsCount, 1)
        XCTAssertEqual(outputting.outputingCallsCount, 1)  
    }

    func testSearchWithoutArguments() throws {
        reading.getDataResult = ["mouse": ["rus":"Мышь"]]
        let results = searching.searching(key: nil, language: nil, 
            dictionary: nil, searchingForDeletion: false)
        XCTAssertEqual(results, .success(["mouse": ["rus":"Мышь"]]))
        XCTAssertEqual(reading.getDataCallsCount, 1)
        XCTAssertEqual(outputting.outputtingCallsCount, 1) 
        XCTAssertEqual(outputting.outputtingParameters, ["mouse": ["rus":"Мышь"]]) 
    }

    func testSearchWithUncorrectKeyAndLanguage() throws {
        let key = "horse"
        let language = "mol"
        reading.getDataResult = ["dog": ["rus":"Собака"]]
        let results = searching.searching(key: key, language: language, 
            dictionary: nil, searchingForDeletion: false)
        XCTAssertEqual(results, .failure(.notFound))
        XCTAssertEqual(reading.getDataCallsCount, 1)
        XCTAssertEqual(outputting.outputCallsCount, 1)
        XCTAssertEqual(outputting.outputParameters, "Not found")
    }

    func testSearchWithUncorrectKey() throws {
        let key = "dig"
        reading.getDataResult = ["dog": ["rus":"Собака"]]
        let results = searching.searching(key: key, language: nil, 
            dictionary: nil, searchingForDeletion: false)
        XCTAssertEqual(results, .failure(.notFound))
        XCTAssertEqual(reading.getDataCallsCount, 1)
        XCTAssertEqual(outputting.outputCallsCount, 1)
        XCTAssertEqual(outputting.outputParameters, "Not found")
        XCTAssertEqual(outputting.outputttingCallsCount, 0)
    }

    func testSearchWithUncorrectLanguage() throws {
        let language = "slv"
        reading.getDataResult = ["mouse": ["rus":"Мышь"]]
        let results = searching.searching(key: nil, language: language, dictionary: nil, 
            searchingForDeletion: false)
        XCTAssertEqual(results, .failure(.notFound))
        XCTAssertEqual(reading.getDataCallsCount, 1)
        XCTAssertEqual(outputting.outputCallsCount, 1)
        XCTAssertEqual(outputting.outputParameters, "Not found")
        XCTAssertEqual(outputting.outputingCallsCount, 0)  
    }

    static var allTests = [
        ("testSearchWithKeyAndLanguage", testSearchWithKeyAndLanguage),
        ("testSearchWithKey", testSearchWithKey),
        ("testSearchWithLanguage", testSearchWithLanguage),
        ("testSearchWithoutArguments", testSearchWithoutArguments),
        ("testSearchWithUncorrectKeyAndLanguage", testSearchWithUncorrectKeyAndLanguage),
        ("testSearchWithUncorrectKey", testSearchWithUncorrectKey),
        ("testSearchWithUncorrectLanguage", testSearchWithUncorrectLanguage),
    ]
}