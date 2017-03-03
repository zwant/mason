# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :web,
  namespace: Mason.Web

# Configures the endpoint
config :web, Mason.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "m4mECxAqyR/PXO7W4hI1s5FmEcMg39Qfo6edYlzwsSP0eIEkpMInR0wfw/s1lt0A",
  render_errors: [view: Mason.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Mason.Web.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
