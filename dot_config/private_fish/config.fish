if status is-interactive
    # Commands to run in interactive sessions can go here
  starship init fish | source
  set -gx PATH $PATH $HOME/.krew/bin
  set -g fish_key_bindings fish_vi_key_bindings
  set fzf_directory_opts --bind "ctrl-o:execute($EDITOR {} &> /dev/tty)"
end
