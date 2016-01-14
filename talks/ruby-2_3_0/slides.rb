# encoding: utf-8

center <<-EOS
  \e[1mWhat's new in Ruby 2.3?\e[0m

  https://www.ruby-lang.org/en/news/2015/11/11/ruby-2-3-0-preview1-released

  Vicent Gozalbes
EOS

code <<-EOS
  # Safe navigation operator

  # Ruby <= 2.2.x
  if user && user.admin?
    # do something
  end

  # Ruby 2.3
  if user&.admin?
    # do something
  end
EOS

code <<-EOS
  # Frozen string literals
  # More info at https://wyeworks.com/blog/2015/12/1/immutable-strings-in-ruby-2-dot-3

  str = 'cat'.freeze

  # frozen_string_literal: true
  str = 'cat'
  str[0] = 'b'

  # frozen.rb:5:in `[]=': can't modify frozen String (RuntimeError)
  #   from frozen.rb:5:in `<main>'
EOS

code <<-EOS
  # Array#dig
  list = [
    [2, 3],
    [5, 7, 9],
    [ [11, 13], [17, 19] ]
  ]

  list.dig(1, 2)    #=> 9
  list.dig(2, 1, 0) #=> 17
  list.dig(0, 3)    #=> nil
  list.dig(4, 0)    #=> nil

  # Hash#dig
  dict = {
    a: { x: 23, y: 29 },
    b: { x: 31, z: 37 }
  }

  dict.dig(:a, :x) #=> 23
  dict.dig(:b, :z) #=> 37
  dict.dig(:b, :y) #=> nil
  dict.dig(:c, :x) #=> nil
EOS

code <<-EOS
  # Did you mean?

  class Account
    def initialize
      @full_name = 'John Doe'
    end

    def name
      full_name
    end
  end

  > account = Acount.new
  NameError: uninitialized constant Acount
  Did you mean?  Account

  > account = Account.new
  > account.nams
  NoMethodError: undefined method `nams' for #<Account:0x007fb2291db068>
  Did you mean?  name

  > account.name
  NameError: undefined local variable or method `full_name' for #<Account:0x007fb2292b00d8 @full_name="John Doe">
  Did you mean?  @full_name
EOS

code <<-EOS
  # Hash comparison
  # More info at http://olivierlacan.com/posts/hash-comparison-in-ruby-2-3
  # a >= b, it is checking if all the key-value pairs in b are also present in a

  { x: 1, y: 2 } >= { x: 1 } #=> true
  { x: 1, y: 2 } >= { x: 2 } #=> false
  { x: 1 } >= { x: 1, y: 2 } #=> false
EOS

code <<-EOS
  # Hash#to_proc
  # Returns a lambda that maps the key with the value

  h = { foo: 1, bar: 2, baz: 3}
  p = h.to_proc

  p.call(:foo)  #=> 1
  p.call(:bar)  #=> 2
  p.call(:quux) #=> nil
EOS

code <<-EOS
  # Hash#fetch_values

  h = { foo: 1, bar: 2, baz: 3}
  h.fetch_values(:foo, :bar) #=> [1, 2]

  h.values_at(:foo, :quux)    #=> [1, nil]
  h.fetch_values(:foo, :quux) #=> raise KeyError
EOS

code <<-EOS
  # Enumerable#grep_v
  # It returns the list of items that do not match the condition.

  list = %w(foo bar baz)

  list.grep_v(/ba/)
  #=> ['foo']

  list.grep(/ba/)
  #=> ['bar', 'baz']
EOS

code <<-EOS
  # Numeric#positive? and #negative?

  1.positive? #=> true
  1.negative? #=> false
  -1.negative? #=> true
EOS

code <<-EOS
  # Squiggly HEREDOC
  # it strips the leading whitespace

  # Ruby <= 2.2.x
  class Subscription
    def warning_message
      <<-HEREDOC
        Subscription expiring soon!
        Please update your billing information.
      HEREDOC
    end
  end

      Subscription expiring soon!
      Please update your billing information.

  # Ruby 2.3
  class Subscription
    def warning_message
      <<~HEREDOC
        Subscription expiring soon!
        Please update your billing information.
      HEREDOC
    end
  end

  Subscription expiring soon!
  Please update your billing information.
EOS

__END__

