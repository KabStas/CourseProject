import Foundation
// import ArgumentParser

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
}

func main() {

    let container = Container()
    let parser = container.argumentsParser
    guard let arguments = parser.parsing() else {
        return 
    }

    if case .search (let key, let language) = arguments {
        if let key: String = key, let language: String = language {
            container.search.searching (key: key, language: language)
        } else if let key: String = key {
            container.search.searching (key: key, language: nil)
        } else if let language: String = language {
            container.search.searching (key: nil, language: language)
        }else {
            container.search.searching (key: nil, language: nil)
        }
    } else if case .update (let word, let key, let language) = arguments {
        container.update.updating (word: word, key: key, language: language)
       
    } else if case .delete (let key, let language) = arguments {
        if let key: String = key, let language: String = language {
            container.delete.deleting (key: key, language: language)
        } else if let key: String = key {
            container.delete.deleting (key: key, language: nil)
        } else if let language: String = language {
            container.delete.deleting (key: nil, language: language)
        } 
    }
}
main()
