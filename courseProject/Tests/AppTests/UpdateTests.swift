import XCTest
@testable import App

final class UpdateTests: XCTestCase {
    private var updating: Update!
    private var reading: GetDataMock!
    private var searching: SearchMock!
    private var outputting: OutputMock!
    private var writing: PutDataMock!
    
    override func setUp() {
        reading = GetDataMock()
        writing = PutDataMock()
        outputting = OutputMock()
        searching = SearchMock() 
        updating = Update(reading: reading, searching: searching, 
            writing: writing, outputting: outputting)
    }
    
    func testUpdateWithWord() throws {
        let word = "kit"
        let key = "cat"
        let language = "ukr"
        reading.getDataResult = ["cat": ["ukr":"jhg"]]
        let result = updating.updating(word: word, key: key, language: language)
        XCTAssertEqual(result, AppResults.updatingSuccess)
        XCTAssertEqual(reading.getDataCallsCount, 1)
        XCTAssertEqual(writing.putDataCallsCount, 1)
        XCTAssertEqual(writing.putDataParameters, ["cat": ["ukr":"kit"]])
        XCTAssertEqual(outputting.outputCallsCount, 1)
        XCTAssertEqual(outputting.outputttingCallsCount, 1)
    }

    func testUpdateWithAnotherWord() throws {
        let word = "kot"
        let key = "cat"
        let language = "rom"
        reading.getDataResult = ["cat": ["rom":"jhg"]]
        let result = updating.updating(word: word, key: key, language: language)
        XCTAssertEqual(result, AppResults.updatingSuccess)
        XCTAssertEqual(reading.getDataCallsCount, 1)
        XCTAssertEqual(writing.putDataCallsCount, 1)
        XCTAssertEqual(writing.putDataParameters, ["cat": ["rom":"kot"]])
        XCTAssertEqual(outputting.outputCallsCount, 1)
        XCTAssertEqual(outputting.outputttingCallsCount, 1)
    }

    func testUpdateWithUncorrectWord() throws {
        let word = "kot"
        let key = "cnt"
        let language = "rom"
        reading.getDataResult = ["cat": ["rom":"kot"]]
        searching.searchWithKeyResult = .notFound
        let result = updating.updating(word: word, key: key, language: language)
        XCTAssertEqual(result, AppResults.notFound)
        XCTAssertEqual(reading.getDataCallsCount, 1)
        XCTAssertEqual(writing.putDataCallsCount, 0)
        XCTAssertEqual(outputting.outputCallsCount, 0)
    }
    
    static var allTests = [
        ("testUpdateWithWord", testUpdateWithWord),
        ("testUpdateWithAnotherWord", testUpdateWithAnotherWord),
        ("testUpdateWithUncorrectWord", testUpdateWithUncorrectWord),
    ]
}