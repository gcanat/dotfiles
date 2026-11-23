## some other setup possible here.
swaymsg workspace 1
swaymsg layout tabbed
swaymsg exec -- footclient -e ssh nl
swaymsg exec -- footclient -e weechat
swaymsg exec -- footclient -D $HOME/projects/video_reader-rs
swaymsg exec -- footclient -D $HOME/tools/vim
# sleep 0.4   ## This is a bit hacky, but it works.
# swaymsg workspace 2
# swaymsg exec -- /usr/bin/firefox -P "Rust"
# swaymsg exec /usr/bin/codium
# swaymsg exec /usr/bin/vlc
## here I connect to my bluetooth speaker and such.
