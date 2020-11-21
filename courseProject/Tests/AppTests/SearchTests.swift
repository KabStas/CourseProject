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
        let results = searching.searching(key: key, language: language)
        XCTAssertEqual(results, Result.SearchingSuccess)
    }

    func testSearchWithKey() throws {
        let key = "dog"
        let results = searching.searching(key: key, language: nil)
        XCTAssertEqual(results, Result.SearchingSuccess)
    }

    func testSearchWithLanguage() throws {
        let language = "esp"
        let results = searching.searching(key: nil, language: language)
        XCTAssertEqual(results, Result.SearchingSuccess)
    }

    func testSearchWithoutArguments() throws {
        let results = searching.searching(key: nil, language: nil)
        XCTAssertEqual(results, Result.SearchingSuccess)
    }

    func testSearchWithAnotherKeyAndLanguage() throws {
        let key = "dog"
        let language = "esp"
        let results = searching.searching(key: key, language: language)
        XCTAssertEqual(results, Result.SearchingSuccess)
    }
    
    func testSearchWithAnotherKey() throws {
        let key = "mouse"
        let results = searching.searching(key: key, language: nil)
        XCTAssertEqual(results, Result.SearchingSuccess)
    }

    func testSearchWithAnotherLanguage() throws {
        let language = "fr"
        let results = searching.searching(key: nil, language: language)
        XCTAssertEqual(results, Result.SearchingSuccess)
    }

    static var allTests = [
        ("testSearchWithKeyAndLanguage", testSearchWithKeyAndLanguage),
        ("testSearchWithKey", testSearchWithKey),
        ("testSearchWithLanguage", testSearchWithLanguage),
        ("testSearchWithoutArguments", testSearchWithoutArguments),
        ("testSearchWithAnotherKeyAndLanguage", testSearchWithAnotherKeyAndLanguage),
        ("testSearchWithAnotherKey", testSearchWithAnotherKey),
        ("testSearchWithAnotherLanguage", testSearchWithAnotherLanguage),
    ]
}