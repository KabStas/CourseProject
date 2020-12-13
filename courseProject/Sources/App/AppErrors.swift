public enum AppErrors: Swift.Error, Equatable {
    case commandNotFound(text: String)
    case parseError(text: String) 
    case notFound
    case writeError
    case readError
    case deleteError
    case updateError
    case defaultError

    var errorDescription: String {
        switch self {
        case .commandNotFound(text: ""):
            return "Command not found"
        case .parseError(text: ""):         
            return "Parse Error"
        case .notFound:
            return "Value not found in dictionary"
        case .writeError:
            return "Failed to write"
        case .readError:
            return "Failed to read"
        case .deleteError:
            return "Failed to delete"
        case .updateError:
            return "Failed to update"    
        default:
            return "Error"
        }
    }

    public var errorCode: Int {
        switch self {
        case .commandNotFound:
            return 1
        case .parseError:
            return 2       
        case .notFound:
            return 3
        case .writeError:
            return 4
        case .readError:
            return 5
        case .deleteError:
            return 6
        case .updateError:
            return 7
        default:
            return 8
        }
    }
}           