require 'minruby'
require_relative './lib/sample'

puts answer 42

tree = minruby_parse("1 + 2 * 4")
pp tree
