import XCTest
@testable import App

final class DeleteTests: XCTestCase {
    private var deleting: Delete!
    private var reading: GetDataMock!
    private var writing: PutDataMock!
    private var outputting: OutputMock!

    override func setUp() {
        reading = GetDataMock()
        writing = PutDataMock()
        outputting = OutputMock()
        deleting = Delete(reading: reading, writing: writing, outputting: outputting)
    }

    func testDeleteWithKeyAndLanguage() throws {
        let key = "cat"
        let language = "rus"
        let results = deleting.deleting(key: key, language: language)
        XCTAssertEqual(results, Result.DeletingSuccess)
    }

    func testDeleteWithAnotherKeyAndLanguage() throws {
        let key = "dog"
        let language = "fr"
        let results = deleting.deleting(key: key, language: language)
        XCTAssertEqual(results, Result.DeletingSuccess)
    }
    
    func testDeleteWithKey() throws {
        let key = "mouse"
        let results = deleting.deleting(key: key, language: nil)
        XCTAssertEqual(results, Result.DeletingSuccess)
    }

    func testDeleteWithAnotherKey() throws {
        let key = "dog"
        let results = deleting.deleting(key: key, language: nil)
        XCTAssertEqual(results, Result.DeletingSuccess)
    }

    func testDeleteWithLanguage() throws {
        let language = "esp"
        let results = deleting.deleting(key: nil, language: language)
        XCTAssertEqual(results, Result.DeletingSuccess)
    }

    func testDeleteWithAnotherLanguage() throws {
        let language = "fr"
        let results = deleting.deleting(key: nil, language: language)
        XCTAssertEqual(results, Result.DeletingSuccess)
    }

    static var allTests = [
        ("testDeleteWithKeyAndLanguage", testDeleteWithKeyAndLanguage),
        ("testDeleteWithAnotherKeyAndLanguage", testDeleteWithAnotherKeyAndLanguage),
        ("testDeleteWithKey", testDeleteWithKey),
        ("testDeleteWithAnotherKey", testDeleteWithAnotherKey),
        ("testDeleteWithLanguage", testDeleteWithLanguage),
        ("testDeleteWithAnotherLanguage", testDeleteWithAnotherLanguage),
    ]
}