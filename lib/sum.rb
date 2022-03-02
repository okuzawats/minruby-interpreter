def sum(tree)
  if tree[0] == 'lit'
    tree[1]
  else
    left = sum(tree[1])
    right = sum(tree[2])
    left + right
  end
end
