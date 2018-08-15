class profile::interface (
  Hash $interfaces = {},
) {

  $interfaces.each |$interface, $parameters| {
    network_interface { $interface:
      * => $parameters,
      #enable      => $parameters[enable],
      #description => $parameters[description],
      #speed       => $parameters[speed],
      #mtu         => $parameters[mtu],
    }
  }
}
