# ~/.config/fish/conf.d/fzf_key_bindings.fish

if not set -q FZF_DISABLE_KEYBINDINGS
    if set -q FZF_LEGACY_KEYBINDINGS; and test $FZF_LEGACY_KEYBINDINGS -eq 1
        # Legacy bindings (for older behavior)

        fzf_configure_bindings \
            --directory=\ct \
            --history=\cr \
            --processes=\cg \
            --variables=\co
    else
        # Modern default bindings
        fzf_configure_bindings \
            --directory=\cf \
            --git_log=\cl \
            --git_status=\cs \
            --history=\cr \
            --processes=\cp \
            --variables=\cv
    end

    # Optional tab completion
    if set -q FZF_COMPLETE
        fzf_configure_bindings --complete=\t
    end
end


function fzf_key_bindings_uninstall -e fzf_key_bindings_uninstall
    # disabled until we figure out a sensible way to ensure user overrides

    # are not erased

end

