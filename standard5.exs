defmodule A do
  def a,do: IO.puts"-------"
end

#1 IF
if 1+1==3 do
  IO.puts "nothing"
else
  IO.puts "yi"
end

#2 unless
unless 1+1==3 do
  IO.puts "nothing"
else
  IO.puts "yi"
end
A.a

#3 cond
defmodule Func3 do
  def a(a,b) do
    cond do
      a>b ->
        IO.puts "a is large"
      a<b ->
        IO.puts "b is large"
      a==b ->
        IO.puts "equal"
      true ->
        IO.puts "catch error"
    end
  end
end
Func3.a(3,2)
Func3.a(1,2)
Func3.a(2,2)
A.a

#4 exception
#raise "Give up" , message: "message!!!"

#
case File.open("sample.txt") do
  {:ok, file}->IO.puts "OK"
  {:error, message}->
    IO.puts :stderr,"Couldnt open"
    # raise "MEssage"
end
file=File.open!("sample.txt")
A.a
