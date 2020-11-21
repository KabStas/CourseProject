@testable import App

class PutDataMock: PutDataProtocol {

	var putDataParameters: ([String : [String : String]])!
    var putDataResult: ()
    var putDataCallsCount = 0
    
    func writing(dictionary: [String : [String : String]]) {
        putDataCallsCount += 1
        putDataParameters = ["cat": ["rus": "Кот"]]
        return putDataResult
    }
}