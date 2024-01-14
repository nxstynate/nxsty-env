if status is-interactive
    # Commands to run in interactive sessions can go here
end

if type -q exa
    alias ll "exa -l -g --icons"
    alias lla "ll -a"
end

# Key Command: 
alias cls clear
alias g git


# Fuzzy Finder:
alias tmfi='fzf-tmux'
alias fi='fzf'
alias nvfi='nvim $(fzf)'
alias nvti='nvim $(fzf-tmux)'
alias fid='cd (find * -type d | fzf)'
alias nfid='nvim (find * -type d | fzf)'
alias cfid='code . (find * -type d | fzf)'
alias vim='nvim'
alias cptc 'xclip -selection clipboard'



# set -U fish_idnent_style block
# set -U tide_git_status_icons yes
# set -U tide_git_branch_color red
# set -U fish_color_quote yellow
# set -U fish_color_command cyan

set -g tide_git_bg_color 268bd2
set -g tide_git_bg_color_unstable C4A000
set -g tide_git_bg_color_urgent CC0000
set -g tide_git_branch_color 000000
set -g tide_git_color_branch 000000
set -g tide_git_color_conflicted 000000
set -g tide_git_color_dirty 000000
set -g tide_git_color_operation 000000
set -g tide_git_color_staged 000000
set -g tide_git_color_stash 000000
set -g tide_git_color_untracked 000000
set -g tide_git_color_upstream 000000
set -g tide_git_conflicted_color 000000
set -g tide_git_dirty_color 000000
set -g tide_git_icon 
set -g tide_git_operation_color 000000
set -g tide_git_staged_color 000000
set -g tide_git_stash_color 000000
set -g tide_git_untracked_color 000000
set -g tide_git_upstream_color 000000
set -g tide_pwd_bg_color 444444

set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_fir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname yes
set -g theme_hostname always

# Text Colors:
# set -g fish_color_normal white
bind \cH backward-kill-word
