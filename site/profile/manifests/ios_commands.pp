class profile::ios_commands (
  Hash $commands = {},
) {

  $commands.each |$name, $value| {
    if $value =~ String {
      $command = $value
      $regex = $value
    } elsif $value =~ Hash {
      $command = $value[command]
      $idempotent_regex = $value[idempotent_regex]
      $multiline_regex = $value[multiline_regex]
      if $idempotent_regex {
        $regex = $idempotent_regex
      } elsif $multiline_regex {
        $regex = sprintf('%s(?!\s+)', regsubst($multiline_regex, '\n', '\\n', 'G'))
      } else {
        $regex = $command
      }
    }
    ios_config { $name:
      command          => $command,
      idempotent_regex => $regex,
    }
  }


}
