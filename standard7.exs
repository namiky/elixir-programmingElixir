#1 (p167)
defmodule Chain do
  def process(next_pid) do
      receive do
        n-> send next_pid,n+1
      end
  end

  def create_process(n) do
    last=Enum.reduce 1..n, self, fn (_,next_pid)->spawn(Chain,:process,[next_pid]) end
    send last, 0
    receive do
      final_answer when is_integer(final_answer) ->
        "result is #{final_answer}"
    end
  end

  def run(n) do
    IO.puts inspect :timer.tc(Chain, :create_process, [n])
  end

  #elixir -r standard7.exs -e "Chain.run(10)"
  #elixir -r standard7.exs -e "Chain.run(100)"
  #elixir --erl "+P 1000000" -r standard7.exs -e "Chain.run(1_000_000)"

end
