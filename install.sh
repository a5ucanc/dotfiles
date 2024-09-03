# zsh
echo "# user preferences" >> $HOME/.zshrc

## history
sed -i -e '/HISTSIZE/s/1000/50000/' \
       -e '/SAVEHIST/s/2000/$HISTSIZE/' \
       $HOME/.zshrc

## aliases
cat << EOL >> $HOME/.zshrc
alias bloodhound='sudo neo4j start && bloodhound && sudo neo4j stop'
EOL


# tmux
## Install ohmytmux
git clone https://github.com/gpakosz/.tmux $HOME/.tmux
ln -s -f $HOME/.tmux/.tmux.conf $HOME/.tmux.conf
cp $HOME/.tmux/.tmux.conf.local $HOME/

## Apply customizations
echo "export EDITOR=vim" >> $HOME/.zshrc
sed -i -e '/tmux_conf_new_session_prompt/s/false/true/' \
       -e '/tmux_conf_new_session_retain_current_path/s/false/true/' \
       -e '/tmux_conf_new_window_retain_current_path/s/false/true/' \
       -e '/set -g history-limit/{s/#//;s/10000/100000/}' \
       -e "/set -g @plugin 'tmux-plugins\/tmux-resurrect'/s/#//" \
       -e "/set -g @plugin 'tmux-plugins\/tmux-resurrect'/a set -g @resurrect-capture-pane-contents 'on'" \
       -e "/set -g @plugin 'tmux-plugins\/tmux-continuum/s/#//" \
       -e "/set -g @continuum-restore 'on'/s/#//" \
       $HOME/.tmux.conf.local

# vim 
## Install vimrc
git clone https://github.com/amix/vimrc $HOME/.vim_runtime
/bin/bash $HOME/.vim_runtime/install_awesome_vimrc.sh
