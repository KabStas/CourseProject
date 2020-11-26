@testable import App
import XCTest

class ArgumentsParserTests: XCTestCase { 
    
    private var parser: ArgumentsParser!

    override func setUp() {
        parser = ArgumentsParser()
    }

    override func tearDown() {
        parser = nil      
    }

    func testSearchWithKey() throws {
        let arguments = parser.parsing(["search", "-k", "cat"])

        switch arguments {
            case .success(.search(let key, let language)):
                XCTAssertEqual(key, "cat")
                XCTAssertEqual(language, nil)
            default:
                XCTFail(ArgumentsParserError.parseError(text: "error").errorDescription)
        }
    }

    func testDeletionWithKey() throws {
        let arguments = parser.parsing(["delete", "-k", "dog"])

        switch arguments {
            case .success(.delete(let key, let language)):
                XCTAssertEqual(key, "dog")
                XCTAssertEqual(language, nil)

            default:
                XCTFail(ArgumentsParserError.parseError(text: "error").errorDescription)
    
        }
    }

    func testSearchWithLanguage() throws {
        let arguments = parser.parsing(["search", "-l", "rus"])

        switch arguments {
            case .success(.search(let key, let language)):
                XCTAssertEqual(key, nil)
                XCTAssertEqual(language, "rus")

            default:
                XCTFail(ArgumentsParserError.parseError(text: "error").errorDescription)
        }
    }

    func testDeletionWithLanguage() throws {
        let arguments = parser.parsing(["delete", "-l", "esp"])

        switch arguments {
            case .success(.delete(let key, let language)):
                XCTAssertEqual(key, nil)
                XCTAssertEqual(language, "esp")

            default:
                XCTFail(ArgumentsParserError.parseError(text: "error").errorDescription)
        }
    }

    func testSearchWithKeyAndLanguage() throws {
        let arguments = parser.parsing(["search", "-k", "cat", "-l", "rus"])

        switch arguments {
            case .success(.search(let key, let language)):
                XCTAssertEqual(key, "cat")
                XCTAssertEqual(language, "rus")

            default:
                XCTFail(ArgumentsParserError.parseError(text: "error").errorDescription)
        }
    }

    func testDeletionWithKeyAndLanguage() throws {
        let arguments = parser.parsing(["delete", "-k", "dog", "-l", "esp"])

        switch arguments {
            case .success(.delete(let key, let language)):
                XCTAssertEqual(key, "dog")
                XCTAssertEqual(language, "esp")

            default:
                XCTFail(ArgumentsParserError.parseError(text: "error").errorDescription)
        }
    }

    func testSearchWithoutArguments() throws {
        let arguments = parser.parsing(["search"])

        switch arguments {
            case .success(.search(let key, let language)):
                XCTAssertEqual(key, nil)
                XCTAssertEqual(language, nil)

            default:
                XCTFail(ArgumentsParserError.parseError(text: "error").errorDescription)
        }
    }

    func testUpdate() throws {
        let arguments = parser.parsing(["update", "kit", "-k", "cat", "-l", "ukr"])

        switch arguments {
            case .success(.update(let word, let key, let language)):
                XCTAssertEqual(word, "kit")
                XCTAssertEqual(key, "cat")
                XCTAssertEqual(language, "ukr")

            default:
                XCTFail(ArgumentsParserError.parseError(text: "error").errorDescription)
        }
    }

    func testParsingWithoutArguments() throws {
        
        let arguments = parser.parsing([])

        switch arguments {
            case .failure(.commandNotFound(let text)):
                XCTAssertEqual(text, Commands.helpMessage())
            default:
                XCTFail(ArgumentsParserError.parseError(text: "error").errorDescription)
        }
    }

    func testParsingWithUncorrectArguments() throws {
        
        let arguments = parser.parsing(["search", "-b", "cat",])

        switch arguments {
            case .failure(.parseError(let text)):
                XCTAssertEqual(text, Commands.helpMessage())
            default:
                XCTFail(ArgumentsParserError.parseError(text: "error").errorDescription)
        }
    }

    static var allTests = [
        ("testSearchWithKey", testSearchWithKey),
        ("testDeletionWithKey", testDeletionWithKey),
        ("testSearchWithLanguage", testSearchWithLanguage),
        ("testDeletionWithLanguage", testDeletionWithLanguage),
        ("testSearchWithKeyAndLanguage", testSearchWithLanguage),
        ("testDeletionWithKeyAndLanguage", testDeletionWithLanguage),
        ("testSearchWithoutArguments", testSearchWithoutArguments),
        ("testParsingWithoutArguments", testParsingWithoutArguments),
        ("testParsingWithUncorrectArguments", testParsingWithUncorrectArguments) 
    ]
}