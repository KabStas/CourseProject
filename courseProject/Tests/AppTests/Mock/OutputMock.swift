@testable import App

class OutputMock: OutputProtocol {

	var outputParameters: (String)!
    var outputResult: ()
    var outputCallsCount = 0
    
    func outputting(value: String) {
        outputCallsCount += 1
        outputParameters = value
        return outputResult
    }

    var outputingParameters: (String, String, Bool)!
    var outputingResult: ()
    var outputingCallsCount = 0
    
    func outputtingResults(key: String, value: String, alternativeOutput: Bool) {
        outputingCallsCount += 1
        outputingParameters = (key, value, alternativeOutput)
        return outputingResult
    }

    var outputtingParameters: ([String: [String: String]])!
    var outputtingResult: ()
    var outputtingCallsCount = 0
    
    func outputtingResults(dictionary: [String: [String: String]]) {
        outputtingCallsCount += 1
        outputtingParameters = dictionary
        return outputtingResult
    }

    var outputttingParameters: ([String: String])!
    var outputttingResult: ()
    var outputttingCallsCount = 0
    
    func outputtingResults(dictionary: [String: String]) {
        outputttingCallsCount += 1
        outputttingParameters = dictionary
        return outputttingResult
    }
}