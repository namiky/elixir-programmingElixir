defmodule Parallel do
  def pmap(collection,fun)do
    me=self
    collection
    |>Enum.map(fn(elem)->spawn_link fn->(send me,{self,fun.(elem)})end end)
    |>Enum.map(fn(pid)->receive do {pid,result}->result end end)
  end
end
# c("standard8.exs")
#Parallel.pmap 1..10, &(&1+&1)
