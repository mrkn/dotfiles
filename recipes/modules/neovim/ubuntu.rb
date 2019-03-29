package 'software-properties-common'

execute 'add-apt-repository -y ppa:neovim-ppa/stable'
execute 'apt-get update'

package 'neovim'

package 'python3-dev'
package 'python3-pip'

execute 'pip3 install neovim'

execute 'ln -sf /usr/bin/nvim $HOME/bin/nvim'
