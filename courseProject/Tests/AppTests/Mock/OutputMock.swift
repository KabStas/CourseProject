@testable import App

class OutputMock: OutputProtocol {

	var outputParameters: (String)!
    var outputCallsCount = 0
    func outputting(value: String) {
        outputCallsCount += 1
        outputParameters = value
    }

    var outputingParameters: (String, String, Bool)!
    var outputingCallsCount = 0
    func outputtingResults(key: String, value: String, alternativeOutput: Bool) {
        outputingCallsCount += 1
        outputingParameters = (key, value, alternativeOutput)
    }

    var outputtingParameters: ([String: [String: String]])!
    var outputtingCallsCount = 0
    func outputtingResults(dictionary: [String: [String: String]]) {
        outputtingCallsCount += 1
        outputtingParameters = dictionary
    }

    var outputttingParameters: ([String: String])!
    var outputttingCallsCount = 0
    func outputtingResults(dictionary: [String: String]) {
        outputttingCallsCount += 1
        outputttingParameters = dictionary
    }
}