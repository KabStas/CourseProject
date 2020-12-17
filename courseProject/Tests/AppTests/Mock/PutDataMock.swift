@testable import App

class PutDataMock: PutDataProtocol {

	var putDataParameters: ([String : [String : String]])!
    var putDataCallsCount = 0
    func writing(dictionary: [String : [String : String]]) {
        putDataCallsCount += 1
        putDataParameters = dictionary
    }
}