require 'minruby'
require_relative './lib/sample'
require_relative './lib/sum'

puts answer 42

tree = minruby_parse('(1 + 2) + (3 + 4)')
pp tree
pp sum tree
