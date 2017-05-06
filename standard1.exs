## Hello world
defmodule Hello do
  def world do
    a="world"
    IO.puts "Hello #{a}"
  end
end
Hello.world
##
defmodule A do
  def a do
    IO.puts "--------------"
  end
  def a(a) do
    IO.puts "-#{a}-------------"
  end
end
A.a

##
1..10
|> Enum.map(fn(x) -> x * x end)
|> IO.inspect

## atom
IO.puts :FOO
A.a

## list
b=[1,"test",:tomat]
IO.inspect b
b=b++["3"]
IO.puts hd(b)
IO.inspect tl(b)
IO.inspect b
A.a

b=[1,"test",:tomat]
|>IO.inspect
A.a

## tuple
defmodule Test3 do
  def print do
    a={1,2,3,"test","test2"}
    IO.inspect a
  end
end
Test3.print
A.a

## keyword list
#キーはアトムです。
#キーは順序付けされています。
#キーは一意ではありません。
a=[{:tomato,"red"},{:potate,"yellow"}]
IO.inspect a
a=[tomato: "red",potate: "yellow",]
IO.inspect a
A.a

# map
#どんな型のキーも使え、順序付けされません
map=%{:tomato=>"red",1=>"blue"}
IO.inspect map
IO.puts map[1]
IO.puts map.tomato # ATOMの時にどっとで呼び出し可能
# IO.puts map.1  # ERROR
A.a

# with
content = "hi!"
test=with {:ok,file} = File.open("./helloworld.exs"),
          content = IO.read(file, :all),
          :ok=File.close(file)
     do
       "test result is OK"
     end
IO.puts test
IO.puts content
A.a
