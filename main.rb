require 'minruby'
require_relative './lib/interpreter'
require_relative './lib/sample'

pp evaluate(minruby_parse('(1 + 2) / 3 * 4 * (56 / 7 + 8 + 9)'))
