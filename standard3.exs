defmodule A do
  def a, do: IO.puts"-----------"
end
A.a

#1
defmodule Func1 do
  def l([]), do: 0
  def l([_head|tail]), do: 1+l(tail)
end
IO.puts Func1.l([1,2,3])
A.a

#2
defmodule Func2 do
  def l([]), do: []
  def l([ head | tail ]), do: [head*head|l(tail)]
end
IO.inspect Func2.l([1,2,3,4,5])
A.a

#3
defmodule Func3 do
  def sum(list), do: _sum(list,0)
  defp _sum([],total), do: total
  defp _sum([head|tail],total), do: _sum(tail,head+total)
end
IO.puts Func3.sum([1,2,3,4,5,6])
A.a

#4
defmodule Func4 do
  def a([],value,_),do: value
  def a([head|tail],value,f), do: a(tail,f.(head,value),f)
end
IO.puts Func4.a([1,2,3],5,&(&1*&2))
A.a

#5
defmodule Func5 do
  def a(to=last,last), do: [last]
  def a(to,last), do: [to|a(to+1,last)]
end
IO.inspect Func5.a(1,5)
IO.inspect [1,2|[3]]
A.a

#6
map=%{name: "Dave",likes: "Programming",where: "Dallas"}
IO.inspect Map.keys map
IO.inspect Map.values map
IO.inspect Map.has_key? map, :where
%{name: test}=map
IO.puts test
A.a

#7 for
people=[
  %{name: "taro1", height: 1.25},
  %{name: "taro2", height: 1.27},
  %{name: "taro3", height: 1.35},
  %{name: "taro4", height: 1.65},
  %{name: "taro5", height: 1.85},
]
IO.inspect(for person=%{height: height}<-people, height>1.3, do: person)
A.a

#8 (p80)
defmodule Func8 do
  def a( %{name: name,height: height} ) when height>1.3 do
    IO.inspect "#{name} is      height over 1.3"
  end

  def a(%{name: name,height: height}) do
    IO.inspect "#{name} is not  height over 1.3"
  end
end

people
|>Enum.each(&Func8.a/1)
A.a

# 9(o81) map
map=%{"one"=>1,"two"=>2,"theree"=>3}
new_map=%{map|"two"=>TWO}
|>Enum.each(&(IO.inspect &1))
A.a
Map.put_new(map,"four",4)
|>Enum.each(&(IO.inspect &1))
A.a

#10(p82)
#require Structre
defmodule Structure do
  defstruct name: "", paid: false, over_10: true
  def a1(attend=%Structure{}) do
    attend.paid && attend.over_10
  end
  def a2(%Structure{paid: true, over_10: true}) do
    IO.puts "#{Structure.name} is AAA"
  end
  def a3(%Structure{})do
    IO.puts "test"
  end
end

defmodule Main do
  def main do
    IO.inspect s1=%Structure{}
    IO.inspect s2=%Structure{name: "taro"}
    IO.inspect s3=%Structure{name: "sato",paid: true, over_10: true}
    A.a
    IO.puts Structure.a1(s1)
    s2=%Structure{s1|paid: true}
    IO.inspect Structure.a1(s2)
    Structure.a3(s2)
    Structure.a3(s1)
  end
end
Main.main
A.a

#11(p84)
defmodule Customor do
  defstruct name: "", company: ""
end
defmodule BugReport do
  defstruct owner: %Customor{}, details: "", severity: 1
end
defmodule Main11 do
  def main do
    IO.inspect report1=%BugReport{owner: %Customor{name: "Dave",company: "Psy"},details: "broken"}
    IO.inspect put_in(report1.owner.company,"ProgStart")
    IO.inspect update_in(report1.owner.name,&("Mr."<>&1))

  end
end
Main11.main
