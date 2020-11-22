# Курсовой проект

### Сборка проекта
> 
    git clone https://github.com/KabStas/CourseProject
    cd courseProject
    swift build 

### Запуск проекта
> 
    
    USAGE: swift run Run <subcommand>
    
    SUBCOMMAND:
      search                  Searching for values
      OPTIONS:
        -k, --key             A word to find
        -l, --language        A language to choose
        
    SUBCOMMAND:
      update                  Updating values
      ARGUMENT:
        <word>                A value to add
      OPTIONS:
        -k, --key             A word to update
        -l, --language        A language to choose
        
    SUBCOMMAND:
      delete                  Deleting values
      OPTIONS:
        -k, --key             A word to delete
        -l, --language        A language to choose
     
    SUBCOMMAND:
      help                    Help     
