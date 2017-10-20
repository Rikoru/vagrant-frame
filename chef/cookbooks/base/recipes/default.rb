# Update package list
execute 'apt_update' do
  command 'apt-get update'
end

# Install packages
package "wget"
package "ntp"

# Move files
cookbook_file "ntp.conf" do
  path "/etc/ntp.conf"
end

# Run commands
execute 'ntp_restart' do
  command 'service ntp restart'
end