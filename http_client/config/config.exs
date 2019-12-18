# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :http_client, HttpClientWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "R4wORWNRlYN0bdeE5wS9/SYG9eN6w5KXTGspe8r4vHufGcVuKg6+eSWsEmmqB26j",
  render_errors: [view: HttpClientWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: HttpClient.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
