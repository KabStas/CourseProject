@testable import App

class DeleteMock: DeleteProtocol {

	var deleteParameters: (String?, String?)!
    var deleteResult: AppResults = .deletingSuccess
    var deleteCallsCount = 0
    func deleting(key: String?, language: String?) -> AppResults {
        deleteCallsCount += 1
        deleteParameters = (key, language)
        return deleteResult
    }

    var deleteParametersAPI: (String?, String?)!
    var deleteResultAPI: [String: [String: String]] = [:]    
    var deleteCallsCountAPI = 0
    public func deletingAPI(key: String?, language: String?) -> [String: [String: String]] {
        deleteCallsCountAPI += 1
        deleteParametersAPI = (key, language)
        return deleteResultAPI
    }

}
