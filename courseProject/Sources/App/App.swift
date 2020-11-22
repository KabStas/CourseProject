import Foundation

class Container {
    
    private lazy var parsing = ArgumentsParser()
    private lazy var reading = GetData()
    private lazy var writing = PutData()
    private lazy var searching = Search(reading: getData, outputting: output)
    private lazy var outputting = Output()
    private lazy var updating = Update(reading: getData, searching: search, 
        writing: putData, outputting: output)
    private lazy var deleting = Delete(reading: getData, searching: search, 
        writing: putData, outputting: output)    
    
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
    let result = parser.parsing(nil)

    switch result {
        case .success(let value):
            switch value {
            case .search(let key, let language):
                let result = container.search.searching(key: key, language: language)
                switch result {
                case .searchingSuccess:
                    return 0
                case .notFound:
                    return 3 
                default:
                    return 7            
                }
            case .delete(let key, let language):
                let result = container.delete.deleting(key: key, language: language)
                switch result {
                case .deletingSuccess:
                    return 0
                case .notFound:
                    return 3 
                default:
                    return 7    
                } 
            case .update(let word, let key, let language):
                let result = container.update.updating(word: word, key: key, language: language)
                switch result {
                case .updatingSuccess:
                    return 0
                case .notFound:
                    return 3 
                default:
                    return 7        
                }        
            case .help(let helpText):
                container.output.outputting(value: helpText)
                return 4        
            }
        case .failure(let value):
            switch value {
            case .commandNotFound(let helpText):
                container.output.outputting(value: helpText)
                return 1
            case .parseError(let helpText):
                container.output.outputting(value: helpText)
                return 2 
            }         
    }
}