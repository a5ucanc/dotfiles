# tmux
## Install ohmytmux
ln -s -f .tmux/.tmux.conf $HOME/.tmux.conf
cp .tmux/.tmux.conf.local $HOME/

## Apply customizations
echo "export EDITOR=vim" >> .zshrc
sed -i -e '/tmux_conf_new_session_prompt/s/false/true/' \
       -e '/tmux_conf_new_session_retain_current_path/s/false/true/' \
       -e '/tmux_conf_new_window_retain_current_path/s/false/true/' \
       -e '/set -g history-limit/{s/#//;s/10000/100000/}' \
       -e "/set -g @plugin 'tmux-plugins/tmux-resurrect'/s/#//" \
       -e "/set -g @plugin 'tmux-plugins/tmux-resurrect'/a\nset -g @resurrect-capture-pane-contents 'on'/" \
       -e "/set -g @plugin 'tmux-plugins/tmux-continuum/s/#//" \
       -e "/set -g @continuum-restore 'on'/s/#/" \
       $HOME/.tmux.conf.local

# vim 
cp vimrc $HOME/.vim_runtime
/bin/bash ~/.vim_runtime/install_awesome_vimrc.sh
