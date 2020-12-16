import Foundation

public class Container {
    
    public init() {}
    private lazy var parsing = ArgumentsParser()
    private lazy var reading = GetData()
    private lazy var writing = PutData()
    private lazy var searching = Search(reading: getData, outputting: output)
    private lazy var outputting = Output()
    private lazy var updating = Update(reading: getData, writing: putData, outputting: output)
    private lazy var deleting = Delete(reading: getData, searching: search, 
        writing: putData, outputting: output)    
    
    var argumentsParser: ArgumentsParserProtocol {
        parsing
    }
    public var search: SearchProtocol {
        searching
    }
    var getData: GetDataProtocol {
        reading 
    }
    var putData: PutDataProtocol {
        writing 
    }
    public var delete: DeleteProtocol {
        deleting
    }
    public var update: UpdateProtocol {
        updating
    }
    var output: OutputProtocol {
        outputting
    }
}

public func main() -> Result<[String : [String : String]], AppErrors> {
    let container = Container()
    let parser = container.argumentsParser
    let result = parser.parsing(nil)

    switch result {
        case .success(let value):
            switch value {
            case .search(let key, let language):
                let result = container.search
                    .searching(key: key, language: language, dictionary: nil, searchingForDeletion: false)
                return result
            case .delete(let key, let language):
                let result = container.delete
                    .deleting(key: key, language: language)
                return result
            case .update(let word, let key, let language):
                let result = container.update
                    .updating(word: word, key: key, language: language)
                return result                
            case .help(let helpText):
                container.output.outputting(value: helpText) 
                return .success([:])
            }        
        case .failure(let value):
            switch value {
            case .commandNotFound(let helpText):
                container.output.outputting(value: helpText)
                return .failure(.commandNotFound(text: helpText))
            case .parseError(let helpText):
                container.output.outputting(value: helpText)
                return .failure(.parseError(text: helpText))
            default:
                return .failure(.defaultError) 
            }
    }
}