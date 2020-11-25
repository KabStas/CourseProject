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
}