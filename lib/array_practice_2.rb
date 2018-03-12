# %記法で文字列配列を簡潔に作成
  #(!で囲む場合)
  a = %W!apple melon orange!
  p a
  # ()で囲む場合
  a = %W(apple melon orange)
  p a
  # 値にスペースを含めたい場合
  a = %W(big\ apple small\ melon orange)
  p a
  # 式展開や改行文字を含めたい場合は大文字のWを使用する
  prefix = 'This is'
  a = %W(#{prefix}\ an\ apple small\nmelon orange)
  p a

# 文字列を配列に変換
  # 文字列を一文字一文字配列の要素に分解するメソッド
  a = 'Ruby'.chars
  p a
  # splitメソッドは引数で渡した区切り文字で文字列を配列に分割するメソッド
  a = 'Ruby,Java,Perl,PHP'.split(',')
  p a

# 配列に初期値を設定する
  # a = [] と同じ
  a = Array.new
  # 要素が5つの配列を作成する
  a = Array.new(5)
  p a
  # 要素が5つで0を初期値とする配列を作成
  a = Array.new(5, 0)
  p a
  # 要素が10で1,2,3,1,2,3と繰り返す配列を作る (?)
  a = Array.new(10) { |n| n % 3 + 1 }
  p a
# 実際には注意点も含め、配列に初期値を渡すときはブロックで渡すようにする
# 配列の各要素は１つのオブジェクトに紐づいている。今回だと１つの文字列オブジェクトに紐づいている
# イミュータブルなクラスや値以外の場合（数値、シンボル、true/false、nil　以外）
  a = Array.new(5) { 'default' }
  p a
  str = a[0]
  str.upcase!
  p str
  p a

#添え字付きの繰り返し処理 each_with_indexメソッドは、ブロック引数の第２引数に添え字を渡してくれる
fruits = ['apple', 'orange', 'melon']
fruits.each_with_index { |fruit, i| puts "#{i}: #{fruit}" }

# with_indexメソッドを使った添え字付きの繰り返し処理
  # map処理との併用
  fruits = ['apple', 'orange', 'melon']
  p fruits.map.with_index { |fruit, i| "#{i}: #{fruit}" }
  # delete_ifとの併用
  fruits = ['apple', 'orange', 'melon']
  p fruits.delete_if.with_index { |fruit, i| fruit.include?('a') && i.odd? }

# ブロックなしでメソッドを呼ぶとEnumeratorオブジェクトが返る。よってwith_indexメソッドが呼び出せる
fruits = ['apple', 'orange', 'melon']
p fruits.each
p fruits.map
p fruits.delete_if

# 添え字を0以外の数値から開始させる
fruits = ['apple', 'orange', 'melon']
  # eachで繰り返しつつ、1から始まる添え字を取得する
  fruits.each.with_index(1) { |fruit, i| puts "#{i}: #{fruit}" }
  # mapで処理しつつ、10から始まる添え字を取得する
  p fruits.map.with_index(10) { |fruit, i| "#{i}: #{fruit}" }

# 配列がブロック引数に渡される場合
# [縦, 横]
dimensions = [[10, 20], [30, 40], [50, 60]]
  # 面積の集計結果を格納する配列
  areas = []
  # 配列の要素分だけブロック引数を用意すると、各要素の値が別々の変数に格納される
  dimensions.each do |length, width|
    areas << length * width
  end
  p areas
  # each_with_indexのようにもとからブロック引数を２つ受け取る場合
  dimensions = [[10, 20], [30, 40], [50, 60]]
  # ブロック引数を()で囲んで、配列の要素を別々の引数として受け取る
  dimensions.each_with_index do |(length, width), i|
    puts "length: #{length}, width: #{width}, i #{i}"
  end

# ブロックローカル変数 (あまり使う機会はない)
numbers = [1, 2, 3, 4]
sum = 0
  # ブロックの外にあるsumとは別物の変数sumを用意する
  numbers.each do |n; sum|
    # 別物のsumを10で初期化し、ブロック引数の値を加算する
    sum = 10
    sum += 10
    # 加算した値をターミナルに表示する
    p sum
  end
  # ブロックの中で使っていたsumは別物なので、ブロックの外のsumには変化がない
  p sum  #=> 0

# 繰り返し処理以外で使用するブロック (テキストファイルに文字列を書き込む例)
# sample.txtを開いて文字列を書き込む（クローズ処理は自動的に行われる）
#File.open("./sample.txt", "w") do |file|
  #file.puts("1行目のテキストです。")
  #file.puts("2行目のテキストです。")
  #file.puts("3行目のテキストです。")
#end

# ブロックの後ろに別のメソッドを続けて書く
names = ['田中', '鈴木', '佐藤']
p names.map { |name| "#{name}さん" }.join('と')

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
