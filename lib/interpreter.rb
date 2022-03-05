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
    true
  when '>='
    true
  when '<'
    true
  when '<='
    true
  end
end
