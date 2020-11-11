import Foundation

class Output: OutputProtocol  {

    func outputtingSearchResults(string: String) {
        
        print(string) 
    }

    func outputtingSearchResults(string: String, value: String, boolean: Bool) {
        
        if boolean == false {
            print("  \(string): \(value)")
        } else {
            print("  \(string) = \(value)")
        } 
    }

    func outputtingHelp() {
        print(Commands.helpMessage())
    }
} 