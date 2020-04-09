# Elixir-Hangman

Elixir is a functional programming language, built on top the Erlang VM and leveraging its OTP Framework which allows Elixir to be a great language for concurrent and reliable applications.

### Development

1. Download Elixir, iex, and asdf (an Elixir and Erlang Version Manager)
2. Follow [this guide](https://github.com/asdf-vm/asdf-elixir) to install the required versions of Elixir and Erlang using asdf
3. Follow [this guide](https://hexdocs.pm/phoenix/installation.html) to install Phoenix
4. Clone this repo with `git clone git@github.com:matthewfollegot/Elixir-Hangman.git` if using SSH or `git clone https://github.com/matthewfollegot/Elixir-Hangman.git` if using HTTPS
5. Run `mix deps.get` & `mix compile`
6. To play the game locally on the CLI run `iex -S mix` in `hangman/`
7. In `http_client/` run `mix phx.server` to launch the server
