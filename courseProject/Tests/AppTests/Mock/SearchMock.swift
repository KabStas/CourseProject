@testable import App

class SearchMock: SearchProtocol {

	var searchParameters: (String?, String?, [String: [String: String]]?)!
    var searchResult: Result<[String : [String : String]], AppErrors> = .success([:])
    var searchCallsCount = 0
    func searching(key: String?, language: String?, 
        dictionary: [String: [String: String]]?, searchingForDeletion: Bool) -> Result<[String : [String : String]], AppErrors> {
        searchCallsCount += 1
        searchParameters = (key, language, dictionary)
        return searchResult
    }

    var searchWithKeyParameters: (String, [String: [String: String]])!
    var searchWithKeyResult: Result<[String : [String : String]], AppErrors> = .success([:])
    var searchWithKeyCallsCount = 0
    func searching(key: String, dictionary: [String: [String: String]]) -> Result<[String : [String : String]], AppErrors> {
        searchWithKeyCallsCount += 1
        searchWithKeyParameters = (key, dictionary)
        return searchWithKeyResult
    }
}