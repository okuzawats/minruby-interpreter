require 'minruby'

def execute(code)
  evaluate(minruby_parse(code))
end

def evaluate(tree, env = {})
  # tree[0]は節の種別を表す文字列。種別に応じて、子の節を再帰的に評価する。
  case tree[0]
  when 'if'
    # ifの場合は、子1を評価した結果がtrueであれば子2を、falseであれば子3を再帰的に評価する。
    if evaluate(tree[1], env)
      evaluate(tree[2], env)
    else
      evaluate(tree[3], env)
    end
  when 'while'
    # whileの場合は、子1を評価した結果がtrueであれば子2を評価する。
    # 子2を評価した後、再度子1を評価してtrueである限り、同じ処理を実行し続ける。
    while evaluate(tree[1], env)
      evaluate(tree[2], env)
    end
  when 'lit'
    # リテラルの場合は、値を評価する。
    tree[1]
  when '+'
    # "+"の場合は、子1を左項、子2を右項として加算（子1+子2）を評価する。
    left = evaluate(tree[1], env)
    right = evaluate(tree[2], env)
    left + right
  when '-'
    # "-"の場合は、子1を左項、子2を右項として減算（子1-子2）を評価する。
    left = evaluate(tree[1], env)
    right = evaluate(tree[2], env)
    left - right
  when '*'
    # "*"の場合は、子1を左項、子2を右項として乗算（子1*子2）を評価する。
    left = evaluate(tree[1], env)
    right = evaluate(tree[2], env)
    left * right
  when '/'
    # "/"の場合は、子1を左項、子2を右項として商（子1/子2）評価する。
    left = evaluate(tree[1], env)
    right = evaluate(tree[2], env)
    left / right
  when '%'
    # "%"の場合は、子1を左項、子2を右項として剰余（子1%子2）を評価する。
    left = evaluate(tree[1], env)
    right = evaluate(tree[2], env)
    left % right
  when '**'
    # "**"の場合は、子1の子2による累乗（子1^子2）を評価する。
    left = evaluate(tree[1], env)
    right = evaluate(tree[2], env)
    left**right
  when '=='
    ## "==" の場合は、子1と子2の等価性を評価する。
    left = evaluate(tree[1], env)
    right = evaluate(tree[2], env)
    left == right
  when '!='
    ## "!=" の場合は、子1と子2の非等価性を評価する。
    left = evaluate(tree[1], env)
    right = evaluate(tree[2], env)
    left != right
  when '>'
    ## ">" の場合は、子1大なり子2であることを評価する。
    left = evaluate(tree[1], env)
    right = evaluate(tree[2], env)
    left > right
  when '>='
    ## ">" の場合は、子1大なりイコール子2であることを評価する。
    left = evaluate(tree[1], env)
    right = evaluate(tree[2], env)
    left >= right
  when '<'
    ## ">" の場合は、子1小なり子2であることを評価する。
    left = evaluate(tree[1], env)
    right = evaluate(tree[2], env)
    left < right
  when '<='
    ## ">" の場合は、子1小なりイコール子2であることを評価する。
    left = evaluate(tree[1], env)
    right = evaluate(tree[2], env)
    left <= right
  when 'func_call'
    # TODO
    p(evaluate(tree[2], env))
  when 'stmts'
    # 式の場合は、各項を評価し、最後の評価結果を再度評価する。
    i = 1
    last = nil
    while !tree[i].nil?
      last = evaluate(tree[i], env)
      i += 1
    end
    last
  when 'var_assign'
    # 子1に子2を代入する。
    env[tree[1]] = evaluate(tree[2], env)
  when 'var_ref'
    # 子1を評価する。
    env[tree[1]]
  end
end
