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

#添え字付きの繰り返し処理
fruits = ['apple', 'orange', 'melon']
fruits.each_with_index { |fruit, i| puts "#{i}: #{fruit}" }

# with_indexメソッドを使った添え字付きの繰り返し処理
  # map処理との併用
  fruits = ['apple', 'orange', 'melon']
  p fruits.map.with_index { |fruit, i| "#{i}: #{fruit}" }
  # delete_ifとの併用
  fruits = ['apple', 'orange', 'melon']
  p fruits.delete_if.with_index { |fruit, i| fruit.include?('a') && i.odd? }
