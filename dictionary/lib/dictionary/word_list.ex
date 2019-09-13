defmodule Dictionary.WordList do

  @me __MODULE__

  def start_link() do
    Agent.start_link(&word_list/0, name: @me)
  end

  def random_word() do
    #if :rand.uniform < 0.33 do
     # Agent.get(@me, fn _ -> exit(:boom) end)
    #end
    # I guess agent gets passed into Enum.random/1 ?
    Agent.get(@me, &Enum.random/1)
  end

  def word_list() do
    "../../assets/words.txt"
    |> Path.expand(__DIR__)
    |> File.read!()
    |> String.split(~r/\n/)
  end

end
