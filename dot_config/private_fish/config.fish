if status is-interactive
  #starship init fish | source
  set -gx PATH $PATH $HOME/.krew/bin
  set -g fish_key_bindings fish_vi_key_bindings
  set fzf_directory_opts --bind "ctrl-o:execute($EDITOR {} &> /dev/tty)"

  set -gx COLORTERM truecolor

  set -gx EDITOR nvim
  set -gx VIRTUAL_ENV_DISABLE_PROMPT true
  set -gx GOPATH $HOME/go
  set -x PATH $GOPATH/bin $HOME/.composer/vendor/bin $HOME/Library/Python/3.7/bin $PATH
  set -gx HOMEBREW_AUTO_UPDATE_SECS 86400
  set -gx DOCKER_BUILDKIT 1
  set -gx COMPOSE_DOCKER_CLI_BUILD 1
  set -g fish_bind_mode insert
  set -g theme_newline_cursor no

  # Title options
  set -g theme_title_display_process yes
  set -g theme_title_display_path yes
  set -g theme_title_display_user yes
  set -g theme_title_use_abbreviated_path yes

  # Prompt options
  set -g theme_display_virtualenv no
  set -g theme_display_vi yes
  set -g theme_display_k8s_context yes
  set -g theme_display_k8s_namespace yes
  set -g theme_display_user ssh
  set -g default_user fpruss
  set -g theme_display_hostname ssh
  set -g theme_show_exit_status yes
  set -g theme_git_worktree_support no
  set -g theme_display_git yes
  set -g theme_display_git_dirty yes
  set -g theme_display_git_untracked yes
  set -g theme_display_git_ahead_verbose yes
  set -g theme_display_git_dirty_verbose yes
  set -g theme_display_git_master_branch yes
  set -g theme_display_date yes
  set -g theme_display_cmd_duration yes
  set -g theme_powerline_fonts yes
  set -g theme_nerd_fonts no
  set -g theme_color_scheme solarized-dark

  bind -M insert \cg forget

  if which asdf > /dev/null; status --is-interactive; and source (brew --prefix asdf)/asdf.fish; end
  if which direnv > /dev/null; direnv hook fish | source; end
  if which goenv > /dev/null; status --is-interactive; and source (goenv init -|psub); end
  if which rbenv > /dev/null; status --is-interactive; and source (rbenv init -|psub); end
  if which swiftenv > /dev/null; status --is-interactive; and source (swiftenv init -|psub); end
end
