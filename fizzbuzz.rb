i = 1
while i <= 100
  if i % 15 == 0
    p('Fizz Buzz')
  elsif i % 3 == 0
    p('Fizz')
  elsif i % 5 == 0
    p('Buzz')
  else
    p(i)
  end
  i = i + 1
end
