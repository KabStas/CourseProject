import Foundation

class PutData: PutDataProtocol {
   
    func writing(dictionary: [String: [String: String]] ) {  
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let json = (try? encoder.encode(dictionary))
        guard let path = Bundle.module.url(forResource: "dict", withExtension: "json") else { 
            return 
        }
        try? json?.write(to: path)
    }
}