import Foundation

class Output: OutputProtocol  {
    
    func outputting(key: String) { 
        print(key)
    }

    func outputtingResults(key: String, value: String, alternativeOutput: Bool) {
        alternativeOutput == true
        ? print("  \(key) = \(value)") : print("  \(key): \(value)")
    }

    func outputtingResults(dictionary: [String: [String: String]]) {
        let alternativeOutput = false
        for (word, translations) in dictionary {
            outputting(key: word)
            for (language, value) in translations {
                outputtingResults(key: language, value: value,
                    alternativeOutput: alternativeOutput)
            }
        }
    }

    func outputtingResults(dictionary: [String: String]) {
        let alternativeOutput = false
        for (language, value) in dictionary {
            outputtingResults(key: language, value: value, alternativeOutput: alternativeOutput)
        }
    }
} 