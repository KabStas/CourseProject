tests_passed=0
tests_failed=0

function test() {

    test_name=$1
    params=$2
    expected_code=$3

    ./.build/debug/Run ${params}
    actual_code=$?

    if [ $actual_code -eq $expected_code ]
    then
        ((tests_passed++))
        tput setaf 2
        echo "$test_name passed with $actual_code (expected $expected_code)"
        tput setaf 7
    else
        ((tests_failed++))
        tput setaf 1
        echo "$test_name failed with $actual_code (expected $expected_code)"
        tput setaf 7
    fi
}

test "Запуск приложения без команд" "" 1
test "Запуск приложения c неправильной командой" "clean" 2
test "Поиск без ключа и языка" "search" 0
test "Поиск по ключу" "search -k cat" 0
test "Поиск по языку" "search -l esp" 0
test "Поиск несуществующего словаря" "search -k horse" 3
test "Поиск по ключу и языку" "search -k cat -l esp" 0
test "Поиск по другому ключу" "search -b cat" 2
test "Один из ключей правильный при поиске" "search -k cat -с esp" 2
test "Удаление по ключу" "delete -k dog" 0
test "Удаление по ключу несуществующего словаря" "delete -k horse" 3
test "Удаление по языку" "delete -l esp" 0
test "Удаление по ключу и языку" "delete -k mouse -l rus" 0
test "Один из ключей правильный при удалении" "delete -t cat -l rus" 2
test "Правильное обновление словаря" "update kit -k cat -l ukr" 0
test "Один из ключей правильный при обновление словаря" "update kit -k cat -t ukr" 2
test "Вызов помощи" "help" 0

tput setaf 2
echo "Tests passed: $tests_passed"
tput setaf 1
echo "Tests failed: $tests_failed"
tput setaf 7

if [ $tests_failed -eq 0 ]; then
  exit 0
else
  exit 1
fi 
