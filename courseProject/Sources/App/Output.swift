import Foundation

public class Output: OutputProtocol  {
    
    public func outputting(value: String) { 
        print(value)
    }

    public func outputtingResults(key: String, value: String, alternativeOutput: Bool) {
        alternativeOutput == true
        ? print("  \(key) = \(value)") : print("  \(key): \(value)")
    }

    public func outputtingResults(dictionary: [String: [String: String]]) { 
        let alternativeOutput = false
        for (word, translations) in dictionary {
            outputting(value: word)
            for (language, value) in translations {
                outputtingResults(key: language, value: value,
                    alternativeOutput: alternativeOutput)
            }
        }
    }

    public func outputtingResults(dictionary: [String: String]) {
        let alternativeOutput = false
        for (language, value) in dictionary {
            outputtingResults(key: language, value: value, alternativeOutput: alternativeOutput)
        }
    }
} 