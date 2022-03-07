require 'minruby'

def execute(code)
  evaluate(minruby_parse(code))
end

def evaluate(tree, lenv = {})
  case tree[0]
  when 'if'
    if evaluate(tree[1], lenv)
      evaluate(tree[2], lenv)
    else
      evaluate(tree[3], lenv)
    end
  when 'while'
    while evaluate(tree[1], lenv)
      evaluate(tree[2], lenv)
    end
  when 'lit'
    tree[1]
  when '+'
    left = evaluate(tree[1], lenv)
    right = evaluate(tree[2], lenv)
    left + right
  when '-'
    left = evaluate(tree[1], lenv)
    right = evaluate(tree[2], lenv)
    left - right
  when '*'
    left = evaluate(tree[1], lenv)
    right = evaluate(tree[2], lenv)
    left * right
  when '/'
    left = evaluate(tree[1], lenv)
    right = evaluate(tree[2], lenv)
    left / right
  when '%'
    left = evaluate(tree[1], lenv)
    right = evaluate(tree[2], lenv)
    left % right
  when '**'
    left = evaluate(tree[1], lenv)
    right = evaluate(tree[2], lenv)
    left**right
  when '=='
    left = evaluate(tree[1], lenv)
    right = evaluate(tree[2], lenv)
    left == right
  when '!='
    left = evaluate(tree[1], lenv)
    right = evaluate(tree[2], lenv)
    left != right
  when '>'
    left = evaluate(tree[1], lenv)
    right = evaluate(tree[2], lenv)
    left > right
  when '>='
    left = evaluate(tree[1], lenv)
    right = evaluate(tree[2], lenv)
    left >= right
  when '<'
    left = evaluate(tree[1], lenv)
    right = evaluate(tree[2], lenv)
    left < right
  when '<='
    left = evaluate(tree[1], lenv)
    right = evaluate(tree[2], lenv)
    left <= right
  when 'func_call'
    # TODO
    p(evaluate(tree[2], lenv))
  when 'stmts'
    i = 1
    last = nil
    while !tree[i].nil?
      last = evaluate(tree[i], lenv)
      i += 1
    end
    last
  when 'var_assign'
    lenv[tree[1]] = evaluate(tree[2], lenv)
  when 'var_ref'
    lenv[tree[1]]
  end
end
