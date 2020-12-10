@testable import App

class SearchMock: SearchProtocol {

	var searchParameters: (String?, String?, [String: [String: String]]?)!
    var searchResult: AppResults = .searchingSuccess
    var searchCallsCount = 0
    func searching(key: String?, language: String?, 
        dictionary: [String: [String: String]]?, searchingForDeletion: Bool) -> AppResults {
        searchCallsCount += 1
        searchParameters = (key, language, dictionary)
        return searchResult
    }

    var searchWithKeyParameters: (String, [String: [String: String]])!
    var searchWithKeyResult: AppResults = .searchingSuccess
    var searchWithKeyCallsCount = 0
    func searching(key: String, dictionary: [String: [String: String]]) -> AppResults {
        searchWithKeyCallsCount += 1
        searchWithKeyParameters = (key, dictionary)
        return searchWithKeyResult
    }

    var searchWithKeyParametersAPI: (String?, String?)!
    var searchWithKeyResultAPI: [String: [String: String]] = [:]
    var searchWithKeyCallsCountAPI = 0
    public func searchingAPI(key: String?, language: String?) -> [String: [String: String]] {
        searchWithKeyCallsCountAPI += 1
        searchWithKeyParametersAPI = (key, language)
        return searchWithKeyResultAPI
    }
}