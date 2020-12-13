import XCTest
@testable import App

final class DeleteTests: XCTestCase {
    private var deleting: Delete!
    private var reading: GetDataMock!
    private var searching: SearchMock!
    private var writing: PutDataMock!
    private var outputting: OutputMock!
    
    override func setUp() {
        reading = GetDataMock()
        writing = PutDataMock()
        outputting = OutputMock()
        searching = SearchMock()
        deleting = Delete(reading: reading, searching: searching, 
            writing: writing, outputting: outputting)
    }

    func testDeleteWithKeyAndLanguage() throws {
        let key = "cat"
        let language = "rus"
        reading.getDataResult = ["cat":["rus":"Кот"]]
        let results = deleting.deleting(key: key, language: language)
        XCTAssertEqual(results, .success(["cat":[:]]))
        XCTAssertEqual(reading.getDataCallsCount, 1)  
        XCTAssertEqual(writing.putDataCallsCount, 1)
        XCTAssertEqual(writing.putDataParameters, ["cat":[:]])
        XCTAssertEqual(outputting.outputtingCallsCount, 1)
    }
    
    func testDeleteWithKey() throws {
        let key = "mouse"
        reading.getDataResult = ["mouse":["fr":"La souris"]]
        let results = deleting.deleting(key: key, language: nil)
        XCTAssertEqual(results, .success([:]))
        XCTAssertEqual(reading.getDataCallsCount, 1)  
        XCTAssertEqual(writing.putDataCallsCount, 1)
        XCTAssertEqual(writing.putDataParameters, [:])
        XCTAssertEqual(outputting.outputtingCallsCount, 1)
    }

    func testDeleteWithLanguage() throws {
        let language = "rus"
        reading.getDataResult = ["mouse":["rus":"Мышь"]]
        let results = deleting.deleting(key: nil, language: language)
        XCTAssertEqual(results, .success(["mouse":[:]]))
        XCTAssertEqual(reading.getDataCallsCount, 1)  
        XCTAssertEqual(writing.putDataCallsCount, 1)
        XCTAssertEqual(writing.putDataParameters, ["mouse":[:]])
        XCTAssertEqual(outputting.outputtingCallsCount, 1)
    }

    func testDeleteWithUncorrectLanguage() throws {
        let language = "lg"
        reading.getDataResult = ["mouse":["rus":"Мышь"]]
        searching.searchResult = .failure(.notFound)
        let results = deleting.deleting(key: nil, language: language)
        XCTAssertEqual(results, .failure(.notFound))
        XCTAssertEqual(reading.getDataCallsCount, 1)  
        XCTAssertEqual(writing.putDataCallsCount, 0)
        XCTAssertEqual(outputting.outputtingCallsCount, 0)
    }

    func testDeleteWithUncorrectKey() throws {
        let key = "horse"
        reading.getDataResult = ["mouse":["rus":"Мышь"]]
        searching.searchResult = .failure(.notFound)
        let results = deleting.deleting(key: key, language: nil)
        XCTAssertEqual(results, .failure(.notFound))
        XCTAssertEqual(reading.getDataCallsCount, 1)  
        XCTAssertEqual(writing.putDataCallsCount, 0)
        XCTAssertEqual(outputting.outputtingCallsCount, 0)
    }

    static var allTests = [
        ("testDeleteWithKeyAndLanguage", testDeleteWithKeyAndLanguage),
        ("testDeleteWithKey", testDeleteWithKey),
        ("testDeleteWithLanguage", testDeleteWithLanguage),
        ("testDeleteWithUncorrectLanguage", testDeleteWithUncorrectLanguage),
        ("testDeleteWithUncorrectKey", testDeleteWithUncorrectKey),
    ]
}