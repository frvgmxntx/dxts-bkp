if status is-interactive
    # Commands to run in interactive sessions can go here
end

#alias
alias ..="cd .."
alias calc="qalc"
alias cat="bat"
alias cdh="cd /home/frvg/.config/hypr/"
alias ls="eza --tree --level=3 --color=always --icons=always -a"
alias lt="eza --long --color=always --icons=always -a"
alias nv="nvim"
alias pipes="pipes.sh -p 20 -r 0 -R -K -f 144"
alias rld="source ~/.config/fish/config.fish"
alias rm="gio trash"
alias update="sudo pacman -Syu"

#launch hyprland login on start
if uwsm check may-start
	exec uwsm start hyprland.desktop
end

#starship prompt
starship init fish | source
#zoxide plugin
zoxide init fish | source

# yazi wrapper
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end
