# Курсовой проект

### Сборка проекта
> 
    git clone https://github.com/KabStas/CourseProject
    cd courseProject
    swift build 

### Запуск проекта
> 
    
    USAGE: swift run RunConsole <subcommand>
    
    SUBCOMMAND:

      search                      Searching for values
      update                      Updating values
      delete                      Deleting values
      help                        Help
       
    ARGUMENT:
      <word>                      A value to add
        
    OPTIONS:
      -k, --key <key>             A word to choose
      -l, --language <language>   A language to choose
      -h, --help                  Show help information  
    
    USAGE: 
      search [--key <key>] [--language <language>]
      update [<word> --key <key> --language <language>]
      delete [--key <key>] [--language <language>]
      
### Запуск API-проекта
> 
    USAGE: swift run RunAPI
    
### Запуск Web-проекта
> 
    USAGE: swift run RunWeb
    
