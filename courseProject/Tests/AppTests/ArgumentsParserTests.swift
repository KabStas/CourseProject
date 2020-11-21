@testable import App
import XCTest

class ArgumentsParserTests: XCTestCase { 
    
    private var parser: ArgumentsParser!

    override func setUp() {
        parser = ArgumentsParser()
    }

    func testSearchWithKey() throws {
        let arguments = parser.parsing(["search", "-k", "cat"])

        switch arguments {
            case .search(let key, let language):
                XCTAssertEqual(key, "cat")
                XCTAssertEqual(language, nil)

            default:
                XCTFail()
        }
    }

    func testDeletionWithKey() throws {
        let arguments = parser.parsing(["delete", "-k", "dog"])

        switch arguments {
            case .delete(let key, let language):
                XCTAssertEqual(key, "dog")
                XCTAssertEqual(language, nil)

            default:
                XCTFail()
        }
    }

    func testSearchWithLanguage() throws {
        let arguments = parser.parsing(["search", "-l", "rus"])

        switch arguments {
            case .search(let key, let language):
                XCTAssertEqual(key, nil)
                XCTAssertEqual(language, "rus")

            default:
                XCTFail()
        }
    }

    func testDeletionWithLanguage() throws {
        let arguments = parser.parsing(["delete", "-l", "esp"])

        switch arguments {
            case .delete(let key, let language):
                XCTAssertEqual(key, nil)
                XCTAssertEqual(language, "esp")

            default:
                XCTFail()
        }
    }

    func testSearchWithKeyAndLanguage() throws {
        let arguments = parser.parsing(["search", "-k", "cat", "-l", "rus"])

        switch arguments {
            case .search(let key, let language):
                XCTAssertEqual(key, "cat")
                XCTAssertEqual(language, "rus")

            default:
                XCTFail()
        }
    }

    func testDeletionWithKeyAndLanguage() throws {
        let arguments = parser.parsing(["delete", "-k", "dog", "-l", "esp"])

        switch arguments {
            case .delete(let key, let language):
                XCTAssertEqual(key, "dog")
                XCTAssertEqual(language, "esp")

            default:
                XCTFail()
        }
    }

    func testSearchWithoutArguments() throws {
        let arguments = parser.parsing(["search"])

        switch arguments {
            case .search(let key, let language):
                XCTAssertEqual(key, nil)
                XCTAssertEqual(language, nil)

            default:
                XCTFail()
        }
    }

    func testUpdate() throws {
        let arguments = parser.parsing(["update", "kit", "-k", "cat", "-l", "ukr"])

        switch arguments {
            case .update(let word, let key, let language):
                XCTAssertEqual(word, "kit")
                XCTAssertEqual(key, "cat")
                XCTAssertEqual(language, "ukr")

            default:
                XCTFail()
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
        ("testUpdate", testUpdate)
    ]
}