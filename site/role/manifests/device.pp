class role::device {

  # This role includes profiles for each aspect of a device
  include profile::banner
  include profile::network_vlan
  include profile::interface
  include profile::ntp_server
  include profile::commands

}
