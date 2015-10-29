# encoding: utf-8

center <<-EOS
  \e[1mKeyword Arguments in Ruby 2.1\e[0m

  Vicent
EOS

code <<-EOS
  mysterious_total(100, 10, 5) # => 105
EOS

code <<-EOS
  # Ruby 2.0 introduced first-class support for keyword arguments
  def foo(bar: 'default')
    puts bar
  end

  foo # => 'default'
  foo(bar: 'baz') # => 'baz'
EOS

code <<-EOS
  # Same code using Ruby 1.9
  def foo(options={})
    options = defaults.merge(options)
    puts options[:bar]
  end

  private

  def defaults
    { bar: 'default' }
  end

  foo # => 'default'
  foo(bar: 'baz') # => 'baz'
EOS

code <<-EOS
  # Also works with ruby block
  define_method(:foo) do |bar: 'default'|
    puts bar
  end

  foo # => 'default'
  foo(bar: 'baz') # => 'baz'
EOS

code <<-EOS
  # Ruby 2.1 introduced required keyword arguments
  def foo(bar:)
    puts bar
  end

  foo # => ArgumentError: missing keyword: bar
  foo(bar: 'baz') # => 'baz'
EOS

code <<-EOS
  # Keyword arguments vs positional arguments
  def mysterious_total(subtotal, tax, discount)
    subtotal + tax - discount
  end

  mysterious_total(100, 10, 5) # => 105
EOS

code <<-EOS
  def obvious_total(subtotal:, tax:, discount:)
    subtotal + tax - discount
  end

  # we know what the arguments mean without looking up the implementation
  obvious_total(subtotal: 100, tax: 10, discount: 5) # => 105

  # Keyword arguments allow us to switch the order of the arguments
  obvious_total(subtotal: 100, discount: 5, tax: 10) # => 105

  # Calling code is syntactically equal to calling a method with hash arguments
  # which makes for an easy transition from options hashes to keyword arguments
EOS

section "That's all, thanks!" do
end

__END__

