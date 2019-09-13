defmodule Hangman do

  ## following line will allow us to use Game instead of Hangman.Game
  alias Hangman.Game

  defdelegate new_game(),             to: Game
  defdelegate tally(game),            to: Game
  defdelegate make_move(game, guess), to: Game

end
