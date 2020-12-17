@testable import App

class DeleteMock: DeleteProtocol {

	var deleteParameters: (String?, String?)!
    var deleteResult: Result<[String : [String : String]], AppErrors> = .success([:])
    var deleteCallsCount = 0
    func deleting(key: String?, language: String?) -> Result<[String : [String : String]], AppErrors> {
        deleteCallsCount += 1
        deleteParameters = (key, language)
        return deleteResult
    }
}
