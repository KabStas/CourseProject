import Foundation

class Container {
    var argumentsParser: ArgumentsParserProtocol {
        return ArgumentsParser()
    }
    var search: SearchProtocol {
        return Search()
    }
    var update: UpdateProtocol {
        return Update()
    }
    var delete: DeleteProtocol {
        return Delete()
    }
    var outputting: OutputtingProtocol {
        return Outputting()
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
        container.outputting.outputtingHelp() 
    } 
}
main()