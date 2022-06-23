# Function to source files if they exist
function zsh_add_file() {
    [ -f "$ZDOTDIR/options/$1" ] && source "$ZDOTDIR/options/$1"
}

function zsh_add_plugin() {
    PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    if [ -d "$ZDOTDIR/options/github-plugins/$PLUGIN_NAME" ]; then
        # For plugins
        zsh_add_file "github-plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" || \
        #zsh_add_file "plugins/github/$PLUGIN_NAME/$PLUGIN_NAME.zsh" || \
        zsh_add_file "github-plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh-theme" || \
        zsh_add_file "github-plugins/$PLUGIN_NAME/$PLUGIN_NAME.sh"
    else
        echo -e "\e[1;33mAdding: $1\e[0m"
        git clone "https://github.com/$1.git" "$ZDOTDIR/options/github-plugins/$PLUGIN_NAME"
    fi
}

# function zsh_add_completion() {
#     PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
#     if [ -d "$ZDOTDIR/options/github-plugins/$PLUGIN_NAME" ]; then
#         # For completions
#         fpath=($ZDOTDIR/options/github-plugins/$PLUGIN_NAME/src $fpath)
#         zsh_add_file "github-plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh"
#     else
#         echo -e "\e[1;33mAdding: $1\e[0m"
#         git clone "https://github.com/$1.git" "$ZDOTDIR/options/github-plugins/$PLUGIN_NAME"
#         fpath=($ZDOTDIR/options/github-plugins/$PLUGIN_NAME/src $fpath)
#         [ -f $HOME/.config/zsh/.zcompdump ] && rm -f $HOME/.config/zsh/.zcompdump
#     fi
# }
