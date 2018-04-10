# 繰り返しメソッド
# timesメソッド (Integerクラスのtimesメソッド)
  sum = 0
  # 処理を5回繰り返す。nには0, 1, 2, 3, 4　が入る
  5.times { |n| sum += n }
  p sum
  # 不要であればブロック引数を省略しても良い
  sum = 0
  # sumに1を加算する処理を5回繰り返す
  5.times {sum += 1}
  p sum

# upto, douowntoメソッド(Integerクラスのuptoメソッド)
# nからmまで数値を1つずつ増やしながら何か処理をしたい場合は、Integerクラスのuptoメソッドを使用
a = []
10.upto(14) { |n| a << n }
p a
# 逆に数値を減らしていきたい場合はdowntoメソッドを使う
a = []
14.downto(10) {|n| a << n}
p a

# stepメソッド
a = []
1.step(10, 2) { |n| a << n }
p a
  # 10から1まで2つずつ値を減らす場合は次のようになる
  a = []
  10.step(1, -2) { |n| a << n }
  p a

# while文とuntil文
# while文は、指定した条件が真である間処理を繰り返す
# 要素数が5つになるまで値を追加する
a = []
while a.size < 5
  a << 1
end
p a
# 以下のようにもかける
a = []
while a.size < 5 do a << 1 end
p a
# ただし、1行で書くなら修飾子としてwhile文を後ろに書く方がスッキリする
a = []
a << 1 while a.size < 5
p a
# どんな条件でも最低1回は実行したい(begin...end)
a = []
begin
  a << 1
end while false
p a

# until文 (条件が偽である間処理を繰り返す)
# 配列の要素が3以下になるまで配列の要素を後ろから削除するコード例
a = [10, 20, 30, 40, 50]
until a.size <= 3
  a.delete_at(-1)
end
p a

# for文  配列やハッシュはfor文で繰り返し処理することもできる
# ただし、Rubyではfor文ではなくeachメソッドやmapメソッドといった繰り返し用のメソッドを使う場合がほとんど

#loopメソッドも、while文で書くことがほとんど

#繰り返し処理用の制御構造 => break, next, redo
#break(each)
numbers = [1, 2, 3, 4, 5].shuffle
numbers.each do |n|
  puts n
  # 5が出たら繰り返しを脱出する
  break if n == 5
end
#break(while)
numbers = [1, 2, 3, 4, 5].shuffle
i = 0
while i < numbers.size
  n = numbers[i]
  puts n
  break if n == 5
  i += 1
end
#breakに引数を渡すと、while文やfor文の戻り値になる。引く数な氏の戻り値はnill
ret =
  while true
    break
  end
p ret

ret =
  while true
    break 123
  end
p ret
