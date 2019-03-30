package 'avahi-daemon'

file '/etc/avahi/services/ssh.service' do
  notifies :reload, "service[avahi-daemon]"
end

service "avahi-daemon" do
  subscribes :reload, "file[/etc/avahi/services/ssh.service]"
end
