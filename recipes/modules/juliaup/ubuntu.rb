juliaup_installer_uri = "https://install.julialang.org"

execute "Install juliaup" do
  command %Q[curl -fsSL #{juliaup_installer_uri} | /bin/sh -s -- -y]
  user node[:user]
  not_if "test -x ~/.juliaup/bin/juliaup"
end
