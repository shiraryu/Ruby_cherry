# 雑多に記述

# 配列
  p [].class

a = [1, 2, 3, 4, 5]

# 取得
  p a[0]
  p a[100]  #=> nil
  p a.size  #=> 3  配列の長さ(要素の個数)
  p a.values_at(0, 2, 4)
  p a[a.size - 1]
  p a[-2, 2]
  p a.last(2)
  p a.first
# 変更
  a[-3] = -10
  p a
  a[1, 3] = 100
  p a
# 追加
  p a[1] = 20 #=> [1, 20, 3, 4, 5] , ただし、元の大きさより大きい添え字を指定すると(a[5]など)間にnilが入る[1, 2, 3, 4, 5, nil, ◯]
  p a << 1
  a.push(1)
  p a
  a.push(2, 3)
  p a

# 削除
m = [1, 2, 3]
  m.delete_at(1) # 2番目の要素を削除 , 存在しない場合はnilが返る
  p m

# 多重代入
  q, r = [1, 2]
  # divmodは商と余りを配列で返す
  p 14.divmod(3)  #=>[4, 2]
  # 戻り値を配列のまま受け取る
  quo_rem = 14.divmod(3)
  p "商=#{quo_rem[0]}, 余り=#{quo_rem[1]}" #=> "商=4, 余り=2"
  # 多重代入で別々の変数として受け取る
  quotient, remainder = 14.divmod(3)
  p "商=#{quotient}, 余り=#{remainder}"

# ブロック
# Rubyの繰り返し処理
numbers = [1, 2, 3, 4]
sum = 0
numbers.each do |n|
  sum += n
end
  p sum

# 配列の要素を削除する条件を自由に指定する
  s = [1, 2, 3, 1, 2, 3]
  #配列から値が2の要素の削除
  s.delete(2)
  p s
  # 配列から値が奇数の要素を削除
  t = [1, 2, 3, 1, 2, 3]
  t.delete_if do |n|
    n.odd?
  end
  p t

# do...endと{}  do...endの代わりに{}を使う(1行でコンパクトに書きたいとき)
num_bers = [1, 2, 3, 4]
sum = 0
num_bers.each {|n| sum += n}
p sum

# mapメソッド(collect)  空の配列を用意して、他の配列をループ処理結果を空の配列に詰め込む処理の大半はmapメソッドに置き換えられる
nums = [1, 2, 3, 4, 5]
new_numbers = nums.map {|n| n * 10}
p new_numbers

# select / find_all  ブロックの戻り値が真になった要素だけを集められる
numbers = [1, 2, 3, 4, 5, 6]
even_numners = numbers.select {|n| n.even?}
p even_numners

# rejectメソッド  selectメソッドの反対でブロックの戻り値が真になった要素を除外した配列を返す(falseを返すと同じ意味)
numbers = [1, 2, 3, 4, 5, 6]
  #3の倍数を除外
non_multiples_of_three = numbers.reject {|n| n % 3 == 0}
p non_multiples_of_three

# find / detect


# 破壊的な連結
b = [1]
c = [2, 3]
  p b.concat(c)

# 非破壊的な連結,新しく配列を返す （推奨）
d = [1, 2, 3]
e = [3, 4, 5]
  p d + e
# 集合（和、差、積）　非破壊的
  p d | e
  p d - e  #左から右に含まれるもの要素を取り除く
  p d & e  #２つの配列に共通する要素を返す

# Setクラス（本格的な集合演算の場合は配列よりこちらを推奨）
require 'set' #通常はファイルの先頭に記載
f = Set.new([1, 2, 3])
g = Set.new([3, 4, 5])
  p f | g
  p f - g
  p f & g

#多重代入で切り捨てられる値を受け取る
h, *i = 100, 200, 300
  p h
  p i

#一つの配列を複数の引数として展開(splat展開)
j = []
k = [2, 3]
  p j.push(1)
  p j.push(*k)  #配列を*付きで追加　=>[1, 2, 3]

# メソッドの可変長引数を使う、、、便利だ。。。
def greeting(*names)
  "#{names.join('と')}、こんにちは！"
end
  p greeting('田中さん')
  p greeting('田中さん', '鈴木さん')
  p greeting('田中さん', '鈴木さん', '佐藤さん')

# *で配列同士を非破壊的に連結する(aplat展開の一種)
l = [1, 2, 3]
  # [] の中にそのまま配列を置く場合 =>[[1, 2, 3]]
  p [l]
  # *付きで配列を置くと、展開されて別々の要素になる =>[1, 2, 3]
  p [*l]
  #他の利用方法 =>[-1, 0, 1, 2, 3, 4, 5]　　※[-1, 0] + a + [4, 5]も同じ意味だが、こっちの方が簡潔
  p [-1, 0, *l, 4, 5]

# ==で等しい配列かどうかを判断 true or false
  p [1, 2, 3] == [1, 2, 3]  #=> true
