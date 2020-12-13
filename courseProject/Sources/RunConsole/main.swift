import Foundation
import App

let result = main()

if case .success(_) = result {
    exit(Int32(0))
}
if case .failure(let error) = result {
    exit(Int32(error.errorCode))
}