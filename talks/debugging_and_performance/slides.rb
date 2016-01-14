# encoding: utf-8

center <<-EOS
  \e[1mDebugging and performance tools\e[0m

  Vicent Gozalbes
EOS

block <<-EOS
  Debugging Rails Applications

  - Views
    * <%= debug @transfer %>
    * <%= simple_format @transfer.to_yaml %>

  - The logger
    logger.debug "Transfer: \#{@transfer.attributes.inspect\}"

  - byebug or pry-byebug
EOS

block <<-EOS
  Performance in Rails Applications

  - https://github.com/flyerhzm/bullet
    help to kill N+1 queries and unused eager loading

  - http://miniprofiler.com
EOS

__END__

