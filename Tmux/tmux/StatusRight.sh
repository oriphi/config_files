tmux ls | cut -d" " -f 1 | cut -d: -f1 | cut -c1-2 | awk '{print "#[bg=red] " $1 " #[bg=green]"}' | tr "\n" " "
