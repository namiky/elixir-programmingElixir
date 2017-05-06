defmodule A do
  def a do
    IO.puts ("-----------")
  end
end
A.a

### anonymans funciton
#1
sum = fn (a,b) -> a+b end
IO.puts sum.(2,3)
A.a

#2
list_concat=fn (a,b)-> a++b end
IO.inspect list_concat.([:a,:b],[:c,:d])
A.a

#3
handle=fn
  {:ok,file}->"result oK"
  {_,file}->"NG"
end
IO.puts handle.(File.open("./helloworld.exs"))
IO.puts handle.(File.open("./helloworld.exsA"))
A.a

#4
add2=fn n ->  fn other->n+other end end
add1=add2.(1)
IO.puts add1.(2)
IO.puts add2.(3).(5)
A.a

#%
prefix=fn a -> fn b -> a<>b end end
mrs=prefix.("Mrs")
IO.puts mrs.("Smith")
A.a

#6
func1=fn n -> n*2 end
func2=fn(fun,a) -> fun.(a) end
IO.puts func2.(func1,10)
A.a

#7
list=[1,2,3,4]
IO.inspect Enum.map list,fn x-> x*x end
IO.inspect Enum.map list,fn x-> rem(x,2)==0 end
A.a

#8 ^caret
defmodule C do
  def c(name) do
    fn
      (^name)->"equal"
      (_)->"not equal"
    end
  end
end
func8=C.c("tanaka")
IO.puts func8.("tanaka")
IO.puts func8.("sato")
A.a

#9 &
func9=&(&1+99)
func9=fn x -> x+99 end
IO.puts func9.(1)
A.a

#10 &
Enum.each [1,2,3,4],&(IO.inspect(&1*&1))
A.a

#11 recall
defmodule Func11 do
  def of(0), do: 1
  def of(n), do: n*of(n-1)
end
IO.puts Func11.of(6)
A.a

#12 when
defmodule Func12 do
  def a(a) when is_atom(a) do
    IO.puts "#{a} is atom"
  end
  def a(a) when is_list(a) do
    IO.puts "#{inspect(a)} is list"
  end
end
Func12.a([1,2])
Func12.a(:true)
A.a

#13 default parameter
defmodule Func13 do
  def a(a,b\\1,c\\2,d) do
    IO.puts "#{a}_#{b}_#{c}_#{d}"
  end
end
Func13.a("a","b","c","d")
Func13.a("a","b")
Func13.a("a","b","c")
A.a

#14 default parameter
defmodule Func14 do
  def a(a,b\\2)
  def a(a,1) do
    IO.puts "#{a}_match"
  end
  def a(a,b) do
    IO.puts "#{a}_#{b}"
  end
end
Func14.a(1)
Func14.a(1,99)
Func14.a(1,1)
A.a

#15 pipe line
IO.inspect (1..10)
  |> Enum.map(&(&1*&1))
A.a

#16 metadate
defmodule Func16 do
  @meta "test"
  def a,do: @meta

  @meta "test2"
  def b,do: @meta

  @meta "test3"
  def c do
    #@a "test" #error
    @meta
  end
end
IO.puts Func16.a
IO.puts Func16.b
IO.puts Func16.c
A.a










#
