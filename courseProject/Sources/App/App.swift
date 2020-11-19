import Foundation

public class Container {
    
    private lazy var parsing = ArgumentsParser()
    private lazy var reading = GetData()
    private lazy var writing = PutData()
    private lazy var updating = Update(reading: getData, writing: putData, outputting: output)
    private lazy var searching = Search(reading: getData, outputting: output)
    private lazy var deleting = Delete(reading: getData, writing: putData, outputting: output)
    private lazy var outputting = Output()
    
    var argumentsParser: ArgumentsParserProtocol {
        parsing
    }
    var search: SearchProtocol {
        searching
    }
    var getData: GetDataProtocol {
        reading 
    }
    var putData: PutDataProtocol {
        writing 
    }
    var delete: DeleteProtocol {
        deleting
    }
    var update: UpdateProtocol {
        updating
    }
    var output: OutputProtocol {
        outputting
    }
}

public func main() -> Int {
    let container = Container()
    let parser = container.argumentsParser
    let arguments = parser.parsing(nil)
    var result = Result.Error
/*
    switch result {
        case .success(let value):
            print(value)
            return 0
        case .failure(let error):
            print(error)
            return 1
*/
    if case .search(let key, let language) = arguments {
        container.search.searching(key: key, language: language)
        result = Result.SearchingSuccess
    } else if case .update(let word, let key, let language) = arguments {
        container.update.updating(word: word, key: key, language: language)
        result = Result.UpdatingSuccess
    } else if case .delete(let key, let language) = arguments {
        container.delete.deleting(key: key, language: language)
        result = Result.DeletingSuccess
    } else if case .help (let helpText) = arguments {
        container.output.outputting(value: helpText)
        result = Result.SuccessfulHelp
    }
        
    guard result != .Error else {
        return 1
    }
    return 0
                
            
/*
    if case .search(let key, let language) = arguments {
        container.search.searching(key: key, language: language)
    } else if case .update(let word, let key, let language) = arguments {
        container.update.updating(word: word, key: key, language: language)
    } else if case .delete(let key, let language) = arguments {
        container.delete.deleting(key: key, language: language)
    } else if case .help (let helpText) = arguments {
        container.output.outputting(value: helpText)
    }*/


/*
    switch value {
            case .search(let key, let language):
                let result : () = container.search.searching(key: key, language: language)
                
                switch result {
                case .success(let values):
                    container.output.outputting(values: values) 
                    return 0    
                case .failure(let error):
                    container.output.outputting(value: error.description)
                    return 1
                }
            default: print("sos")
            } 
        default: print("sos1")  
    }*/
}