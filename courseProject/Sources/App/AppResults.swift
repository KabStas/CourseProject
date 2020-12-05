public enum AppResults { 
    case searchingSuccess
    case notFound
    case deletingSuccess
    case updatingSuccess

    var errorDescription: String {
        switch self {
        case .notFound:
            return "Value not found in dictionary"
        default:
            return "Error"
        }
    }
}           