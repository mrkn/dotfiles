package "libfuse2"

directory "/opt/nvim" do
  owner "root"
  group "root"
  mode "0755"
end

execute "curl -sfSL -o /opt/nvim/nvim.appimage https://github.com/neovim/neovim/releases/latest/download/nvim.appimage"
execute "chmod a+x /opt/nvim/nvim.appimage"
execute "ln -sf /opt/nvim/nvim.appimage #{ENV["HOME"]}/bin/nvim"

package 'python3-dev'
package 'python3-pip'

execute 'pip3 install neovim'

# For commonize VS Code setting with macOS
directory '/opt/brew/bin'
execute 'ln -sf /opt/nvim/nvim.appimage /opt/brew/bin/nvim'
