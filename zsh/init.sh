rm -rf $HOME/.zcompcache
rm -rf $HOME/.zcompdump
rm -rf $HOME/.zdirs
rm -rf $HOME/.zsh_history
rm -rf $HOME/.zshrc

ln -s $HOME/.config/zsh/zcompcache  $HOME/.zcompcache
ln -s $HOME/.config/zsh/zcompdump   $HOME/.zcompdump
ln -s $HOME/.config/zsh/zdirs       $HOME/.zdirs
ln -s $HOME/.config/zsh/zsh_history $HOME/.zsh_history
ln -s $HOME/.config/zsh/zshrc       $HOME/.zshrc
