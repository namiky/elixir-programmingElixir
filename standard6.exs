defmodule A do
  def a, do: IO.puts"------"
end

#1 multi programming
defmodule SpawnBasic do
  def greet do
    receive do
      {sender,msg}->send sender,{:ok,msg}
      greet
    end
  end
end

  pid = spawn(SpawnBasic,:greet,[])

  send pid, {self,"Hello"}
  receive do
    {:ok,msg}->IO.puts "#{msg} world"
  end

  send pid, {self,"Hello2"}
  receive do
    {:ok,msg}->IO.puts "#{msg} world"
  after 500 -> IO.puts "time out!!!"
  end
