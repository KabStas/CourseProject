import XCTest
@testable import App

final class UpdateTests: XCTestCase {
    private var updating: Update!
    private var reading: GetDataMock!
    private var outputting: OutputMock!
    private var writing: PutDataMock!
    
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
        reading.getDataResult = ["cat": ["ukr":"jhg"]]
        let result = updating.updating(word: word, key: key, language: language)
        XCTAssertEqual(result, .success(["cat": ["ukr":"kit"]]))
        XCTAssertEqual(reading.getDataCallsCount, 1)
        XCTAssertEqual(writing.putDataCallsCount, 1)
        XCTAssertEqual(writing.putDataParameters, ["cat": ["ukr":"kit"]])
        XCTAssertEqual(outputting.outputtingCallsCount, 1)
    }

    func testUpdateWithAnotherWord() throws {
        let word = "kot"
        let key = "cat"
        let language = "rom"
        reading.getDataResult = ["cat": ["rom":"jhg"]]
        let result = updating.updating(word: word, key: key, language: language)
        XCTAssertEqual(result, .success(["cat": ["rom":"kot"]]))
        XCTAssertEqual(reading.getDataCallsCount, 1)
        XCTAssertEqual(writing.putDataCallsCount, 1)
        XCTAssertEqual(writing.putDataParameters, ["cat": ["rom":"kot"]])
        XCTAssertEqual(outputting.outputtingCallsCount, 1)
    }

    func testUpdateWithUncorrectWord() throws {
        let word = "kot"
        let key = "cnt"
        let language = "rom"
        reading.getDataResult = ["cat": ["rom":"kot"]]
        let result = updating.updating(word: word, key: key, language: language)
        XCTAssertEqual(result, .success(["cnt": ["rom":"kot"]]))
        XCTAssertEqual(reading.getDataCallsCount, 1)
        XCTAssertEqual(writing.putDataCallsCount, 1)
        XCTAssertEqual(outputting.outputtingCallsCount, 1)
    }
    
    static var allTests = [
        ("testUpdateWithWord", testUpdateWithWord),
        ("testUpdateWithAnotherWord", testUpdateWithAnotherWord),
        ("testUpdateWithUncorrectWord", testUpdateWithUncorrectWord),
    ]
}
