defmodule A do
  def a, do: IO.puts "-------"
end
A.a
#1 Enum (p93)
list=Enum.to_list 1..5
IO.inspect list

list=Enum.map(list,&(&1*&1))
IO.inspect list

require Integer
list=Enum.filter(list,&Integer.is_even/1)
IO.inspect list

list=Enum.reverse(list)
IO.inspect list

list=Enum.concat(list,[4,5,6])
IO.inspect list

list=Enum.sort(list)
IO.inspect list

IO.puts Enum.max(list)
IO.puts Enum.all? list,&(&1>0)
IO.puts Enum.any? list,&(&1>10)
IO.puts Enum.member? list,10
A.a

#2 stream enumerator Countdown
defmodule Countdown do
  def sleep(seconds) do
    receive do
      after seconds*100 -> nil
    end
  end
  def say(text) do
    spawn fn-> :os.cmd('say #{text}')end
  end

  def timer do
    Stream.resource(
    fn->
      {_h,_m,s}=:erlang.time
      60-s-1
    end,

    fn
      0->
        {:halt,0}
        count->
          sleep(1)
          { [inspect(count)], count-1}
    end,
    fn _ -> end
    )
  end
end

counter=Countdown.timer
printer=counter|>Stream.each(&IO.puts/1)
speaker=printer|>Stream.each(&Countdown.say/1)

speaker|>Enum.take(5)

A.a

#3 comprehension
list=for x<-[1,2,3,4,5],do: x*x
IO.inspect list
list =for x<-[1,4],y<-[2,5], do: "#{x}_#{y}"
IO.inspect list
