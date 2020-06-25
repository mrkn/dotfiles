package "nodejs"

case node[:platform_version]
when '20.04'
  package "npm"
end
