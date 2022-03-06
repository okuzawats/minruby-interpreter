def evaluate(tree, env = {})
  case tree[0]
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
