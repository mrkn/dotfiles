package 'software-properties-common'

execute 'add-apt-repository -y ppa:neovim-ppa/stable'
execute 'apt-get update'

package 'neovim'

package 'python3-dev'
package 'python3-pip'

execute 'pip3 install neovim'

# For commonize VS Code setting with macOS
directory '/opt/brew/bin'
execute 'ln -sf /usr/bin/nvim /opt/brew/bin/nvim'
