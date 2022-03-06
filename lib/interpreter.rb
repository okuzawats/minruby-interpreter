def evaluate(tree)
  case tree[0]
  when 'lit'
    tree[1]
  when '+'
    left = evaluate(tree[1])
    right = evaluate(tree[2])
    left + right
  when '-'
    left = evaluate(tree[1])
    right = evaluate(tree[2])
    left - right
  when '*'
    left = evaluate(tree[1])
    right = evaluate(tree[2])
    left * right
  when '/'
    left = evaluate(tree[1])
    right = evaluate(tree[2])
    left / right
  when '%'
    left = evaluate(tree[1])
    right = evaluate(tree[2])
    left % right
  when '**'
    left = evaluate(tree[1])
    right = evaluate(tree[2])
    left**right
  when '=='
    left = evaluate(tree[1])
    right = evaluate(tree[2])
    left == right
  when '!='
    left = evaluate(tree[1])
    right = evaluate(tree[2])
    left != right
  when '>'
    left = evaluate(tree[1])
    right = evaluate(tree[2])
    left > right
  when '>='
    left = evaluate(tree[1])
    right = evaluate(tree[2])
    left >= right
  when '<'
    left = evaluate(tree[1])
    right = evaluate(tree[2])
    left < right
  when '<='
    left = evaluate(tree[1])
    right = evaluate(tree[2])
    left <= right
  when 'func_call'
    # TODO
    p(evaluate(tree[2]))
  when 'stmts'
    i = 1
    last = nil
    while tree[i] != nil
      last = evaluate(tree[i])
      i = i + 1
    end
    last
  end
end
