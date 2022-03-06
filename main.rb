require 'minruby'
require_relative './lib/interpreter'
require_relative './lib/sample'

str = minruby_load()
tree = minruby_parse(str)
answer = evaluate(tree)
