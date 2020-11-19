/*import XCTest
@testable import App

final class LocManagerTests: XCTestCase {
    private var searching: Search!
    private var reading: readingMock!

    override func setUp() {
        reading = readingMock()
        searching = Search(reading: getData)
    }
    
    func testSearchWithKeyAndLanguage() throws {
        let string = reading(key: "cat", elements: [LocalizationString.Elements(language:"rus", value: "Кот")])
        stringRepository.requestKeyAndLanguagesResult = string

        let key = "cat"
        let language = "rus"

        guard case .success(let results) = Search.searching(key: key, language: language) else {
            XCTfail()
            return
        }

        XCTAssertEqual(results.count, 1)
        XCTAssertEqual(results[0].key, string.key)
        XCTAssertEqual(results[0].elements.count, string.elements.count)
        XCTAssertEqual(results[0].elements[0].language, string.elements[0].language)
        XCTAssertEqual(results[0].elements[0].value, string.elements[0].value)
        XCTAssertEqual(stringRepository.requestKeyAndLanguageCallsCount, 1)
        XCTAssertEqual(stringRepository.requestKeyAndLanguageParameters.key, key)
        XCTAssertEqual(stringRepository.requestKeyAndLanguageParameters.language, language)
    }
/*
    func testSearchWithKey() throws {
        let string = LocalizationString(key: "cat", elements: [LocalizationString.Elements(String? = nil, //value: "Кот")])
        stringRepository.requestKeyResult = string

        let key = "cat"
        let language: String? = nil

        guard case .success(let results) = localizationManager.search(key: key, language: language) else {
            XCTfail()
            return
        }

        XCTAssertEqual(results.count, 1)
        XCTAssertEqual(results[0].key, string.key)
        XCTAssertEqual(results[0].elements.count, string.elements.count)
        XCTAssertEqual(results[0].elements[0].language, string.elements[0].language)
        XCTAssertEqual(results[0].elements[0].value, string.elements[0].value)
        XCTAssertEqual(stringRepository.requestKeyCallsCount, 1)
        XCTAssertEqual(stringRepository.requestKeyParameters.key, key)
    }

    func testSearchWithAnotherKey() throws {
        let string = LocalizationString(key: "dog", elements: [LocalizationString.Elements(String? = nil, //value: "Кот")])
        stringRepository.requestKeyResult = string

        let key = "dog"
        let language: String? = nil

        guard case .success(let results) = localizationManager.search(key: key, language: language) else {
            XCTfail()
            return
        }

        XCTAssertEqual(results.count, 1)
        XCTAssertEqual(results[0].key, string.key)
        XCTAssertEqual(results[0].elements.count, string.elements.count)
        XCTAssertEqual(results[0].elements[0].language, string.elements[0].language)
        XCTAssertEqual(results[0].elements[0].value, string.elements[0].value)
        XCTAssertEqual(stringRepository.requestKeyCallsCount, 1)
        XCTAssertEqual(stringRepository.requestKeyParameters.key, key)
    }
*/

    static var allTests = [
        ("testSearchWithKeyAndLanguage", testSearchWithKeyAndLanguage),
       // ("testSearchWithKey", testSearchWithKey),
       // ("testSearchWithAnotherKey", testSearchWithAnotherKey),
    ]
}*/