require 'minruby'

def execute(code)
  evaluate(minruby_parse(code))
end

def evaluate(tree, genv = {}, lenv = {})
  case tree[0]
  when 'if'
    if evaluate(tree[1], genv, lenv)
      evaluate(tree[2], genv, lenv)
    else
      evaluate(tree[3], genv, lenv)
    end
  when 'while'
    while evaluate(tree[1], genv, lenv)
      evaluate(tree[2], genv, lenv)
    end
  when 'lit'
    tree[1]
  when '+'
    left = evaluate(tree[1], genv, lenv)
    right = evaluate(tree[2], genv, lenv)
    left + right
  when '-'
    left = evaluate(tree[1], genv, lenv)
    right = evaluate(tree[2], genv, lenv)
    left - right
  when '*'
    left = evaluate(tree[1], genv, lenv)
    right = evaluate(tree[2], genv, lenv)
    left * right
  when '/'
    left = evaluate(tree[1], genv, lenv)
    right = evaluate(tree[2], genv, lenv)
    left / right
  when '%'
    left = evaluate(tree[1], genv, lenv)
    right = evaluate(tree[2], genv, lenv)
    left % right
  when '**'
    left = evaluate(tree[1], genv, lenv)
    right = evaluate(tree[2], genv, lenv)
    left**right
  when '=='
    left = evaluate(tree[1], genv, lenv)
    right = evaluate(tree[2], genv, lenv)
    left == right
  when '!='
    left = evaluate(tree[1], genv, lenv)
    right = evaluate(tree[2], genv, lenv)
    left != right
  when '>'
    left = evaluate(tree[1], genv, lenv)
    right = evaluate(tree[2], genv, lenv)
    left > right
  when '>='
    left = evaluate(tree[1], genv, lenv)
    right = evaluate(tree[2], genv, lenv)
    left >= right
  when '<'
    left = evaluate(tree[1], genv, lenv)
    right = evaluate(tree[2], genv, lenv)
    left < right
  when '<='
    left = evaluate(tree[1], genv, lenv)
    right = evaluate(tree[2], genv, lenv)
    left <= right
  when 'func_call'
    # TODO
    p(evaluate(tree[2], genv, lenv))
  when 'stmts'
    i = 1
    last = nil
    while !tree[i].nil?
      last = evaluate(tree[i], genv, lenv)
      i += 1
    end
    last
  when 'var_assign'
    lenv[tree[1]] = evaluate(tree[2], genv, lenv)
  when 'var_ref'
    lenv[tree[1]]
  end
end
