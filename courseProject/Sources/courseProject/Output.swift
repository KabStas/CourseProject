import Foundation

class Output: OutputProtocol  {

    func outputtingResults(key: String) { 
        print(key)
    }

    func outputtingResults(key: String, value: String, alternativeOutput: Bool) {
        alternativeOutput == true
        ? print("  \(key) = \(value)") : print("  \(key): \(value)")
    }
} 