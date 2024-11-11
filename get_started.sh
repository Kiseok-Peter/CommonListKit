# setup_module.sh에 넘겨주는 arguments를 확인하기 위해 print
echo "get_started.sh arguments:"
for an_arg in "$@" ; do
   echo "${an_arg}"
done
echo "number of args: $#"

# terminal text color
function print_gray_text() {
    echo "\033[1;30m$1\033[0m"
}
function print_yello_text() {
    echo "\033[0;33m$1\033[0m"
}
function print_green_text() {
    echo "\033[0;32m$1\033[0m"
}
function print_red_text() {
    echo "\033[0;31m$1\033[0m"
}

# install homebrew
# homebrew가 설치되어있는지 확인하고 설치. homebrew는 rbenv, xcodegen 등 설치에 사용됨
function install_homebrew_if_needed() {
    print_gray_text ">> check homebrew install\n"
    RESULT=$(brew doctor)
    if [ "$RESULT" != "Your system is ready to brew." ]; then
        print_yello_text "🍺 homebrew install...\n"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        print_green_text "✅ homebrew install success\n"
    fi
}
install_homebrew_if_needed

# install via brew
# Brewfile 이용해 brew 설치
print_yello_text "🍺 bundle install...\n"
brew bundle --file=./Brewfile
bundle install
print_green_text "✅ bundle install finish\n"

#tuist install
function install_tuist_if_needed() {
    # 설정 버전 설치
    print_yello_text "🍺 tuist install...\n"
    mise install tuist
    print_green_text "✅ tuist install success\n"
    
    # tuist 명령어 설정
    alias tuist="mise x -- "
}
install_tuist_if_needed

# setup_modules
print_gray_text ">> try setup_modules\n"
sh ./script/setup_modules.sh "$@"
