defmodule TextClient.Player do

  alias TextClient.{ Mover, Prompter, State, Summary }

  # will only match a patam that's one of these states
  # won, lost, good guess, bad guesss, already used, initializing
  def play(game = %State{ tally: %{ game_state: :won }}) do
    exit_with_message("You WON!")
  end

  def play(game = %State{ tally: %{ game_state: :lose }}) do
    continue(game)
    exit_with_message("Sorry, you lost")
  end

  def play(game = %State{ tally: %{ game_state: :good_guess }}) do
    continue_with_message(game, "Good guess!")
  end

  def play(game = %State{ tally: %{ game_state: :bad_guess }}) do
    continue_with_message(game, "Sorry, that isn't in the word")
  end

  def play(game = %State{ tally: %{ game_state: :already_used }}) do
    continue_with_message(game, "You've already used that letter")
  end

  def play(game) do
    continue(game)
  end

  defp continue(game) do
    game
    |> Summary.display()
    |> Prompter.accept_move()
    |> Mover.make_move()
    |> play()
  end

  defp display(game) do
    game
  end

  defp prompt(game) do
    game
  end

  defp make_move(game) do
    game
  end

  defp continue_with_message(game, msg) do
    IO.puts(msg)
    continue(game)
  end

  defp exit_with_message(msg) do
    IO.puts(msg)
    exit(:normal)
  end

end
