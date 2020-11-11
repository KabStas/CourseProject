import Foundation

class Container {
    
    private lazy var parsing = ArgumentsParser()
    private lazy var reading = GetData()
    private lazy var writing = PutData()
    private lazy var updating = Update(reading: getData, writing: putData)
    private lazy var searching = Search(reading: getData, outputting: output)
    private lazy var deleting = Delete(reading: getData, writing: putData)
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

func main() {

    let container = Container()
    let parser = container.argumentsParser
    let arguments = parser.parsing()

    if case .search(let key, let language) = arguments {
        container.search.searching(key: key, language: language)
    } else if case .update(let word, let key, let language) = arguments {
        container.update.updating(word: word, key: key, language: language)
    } else if case .delete(let key, let language) = arguments {
        container.delete.deleting(key: key, language: language)
    } else {
        container.output.outputtingHelp() 
    } 
}
main()