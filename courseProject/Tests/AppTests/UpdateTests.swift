import XCTest
@testable import App

final class UpdateTests: XCTestCase {
    private var updating: Update!
    private var reading: GetDataMock!
    private var writing: PutDataMock!
    private var outputting: OutputMock!

    override func setUp() {
        reading = GetDataMock()
        writing = PutDataMock()
        outputting = OutputMock()
        updating = Update(reading: reading, writing: writing, outputting: outputting)
    }

    func testUpdateWithWord() throws {
        let word = "kit"
        let key = "cat"
        let language = "ukr"
        let results = updating.updating(word: word, key: key, language: language)
        XCTAssertEqual(results, Result.UpdatingSuccess)
    }

    func testUpdateWithAnotherWord() throws {
        let word = "kot"
        let key = "cat"
        let language = "rom"
        let results = updating.updating(word: word, key: key, language: language)
        XCTAssertEqual(results, Result.UpdatingSuccess)
    }

    static var allTests = [
        ("testUpdateWithWord", testUpdateWithWord),
        ("testUpdateWithAnotherWord", testUpdateWithAnotherWord),
    ]
}