require 'minruby'

def execute(code)
  evaluate(minruby_parse(code))
end

def evaluate(tree, env = {})
  case tree[0]
  when 'if'
    if evaluate(tree[1], env)
      evaluate(tree[2], env)
    else
      evaluate(tree[3], env)
    end
  when 'while'
    while evaluate(tree[1], env)
      evaluate(tree[2], env)
    end
  when 'lit'
    tree[1]
  when '+'
    left = evaluate(tree[1], env)
    right = evaluate(tree[2], env)
    left + right
  when '-'
    left = evaluate(tree[1], env)
    right = evaluate(tree[2], env)
    left - right
  when '*'
    left = evaluate(tree[1], env)
    right = evaluate(tree[2], env)
    left * right
  when '/'
    left = evaluate(tree[1], env)
    right = evaluate(tree[2], env)
    left / right
  when '%'
    left = evaluate(tree[1], env)
    right = evaluate(tree[2], env)
    left % right
  when '**'
    left = evaluate(tree[1], env)
    right = evaluate(tree[2], env)
    left**right
  when '=='
    left = evaluate(tree[1], env)
    right = evaluate(tree[2], env)
    left == right
  when '!='
    left = evaluate(tree[1], env)
    right = evaluate(tree[2], env)
    left != right
  when '>'
    left = evaluate(tree[1], env)
    right = evaluate(tree[2], env)
    left > right
  when '>='
    left = evaluate(tree[1], env)
    right = evaluate(tree[2], env)
    left >= right
  when '<'
    left = evaluate(tree[1], env)
    right = evaluate(tree[2], env)
    left < right
  when '<='
    left = evaluate(tree[1], env)
    right = evaluate(tree[2], env)
    left <= right
  when 'func_call'
    # TODO
    p(evaluate(tree[2], env))
  when 'stmts'
    i = 1
    last = nil
    while !tree[i].nil?
      last = evaluate(tree[i], env)
      i += 1
    end
    last
  when 'var_assign'
    env[tree[1]] = evaluate(tree[2], env)
  when 'var_ref'
    env[tree[1]]
  end
end
