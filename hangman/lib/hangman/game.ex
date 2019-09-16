defmodule Hangman.Game do

    defstruct(
        turns_left: 7,
        game_state: :initializing,
        letters:    [],
        used:       MapSet.new()
    )

    def new_game(word) do
        %Hangman.Game{
            letters: word |> String.codepoints
        }
    end

    def new_game() do
        new_game(Dictionary.random_word)
    end

    def make_move(game = %{ game_state: state }, _guess) when state in [:won, :lost] do
        game
        |> return_with_tally()
    end

    def make_move(game, guess) do
        accept_move(game, guess, MapSet.member?(game.used, guess))
        |> return_with_tally()
    end

    def tally(game) do
        %{
            game_state: game.game_state,
            turns_left: game.turns_left,
            letters: game.letters |> reveal_guessed(game.used)
        }
    end

    ### Below are our private functions for this module

    # Already guessed acts as documentation b.c. the compiler ignores the variable name b.c. of the _
    defp accept_move(game, _guess, _already_guessed = true) do
        Map.put(game, :game_state, :already_used)
    end

    defp accept_move(game, guess, _) do
        Map.put(game, :used, MapSet.put(game.used, guess))
        |> score_guess(Enum.member?(game.letters, guess))
    end

    defp score_guess(game, _good_guess = true) do
        new_state = MapSet.new(game.letters)
        |> MapSet.subset?(game.used)
        |> maybe_won
        Map.put(game, :game_state, new_state)
    end

    defp score_guess(game = %{ turns_left: 1 }, _not_good_guess) do
       Map.put(game, :game_state, :lost)
       IO.puts "You Lost :( \nThe word was #{game.letters}"
       exit(:normal)
    end

    defp score_guess(game = %{ turns_left: _turns_left }, _not_good_guess) do
        # Following is the map updating syntax (to update more than one field of the map simultaneously)
        %{ game | game_state: :bad_guess,
                  turns_left: Map.get(game, :turns_left) - 1}
     end

    defp reveal_guessed(letters, used) do
        letters
        |> Enum.map(fn letter -> reveal_letter(letter, MapSet.member?(used, letter)) end)
    end

    defp reveal_letter(letter, _in_word = true), do: letter
    defp reveal_letter(_letter, _), do: "_"


    defp maybe_won(true), do: :won
    defp maybe_won(_),    do: :good_guess

    defp return_with_tally(game), do: { game, tally(game) }

end
