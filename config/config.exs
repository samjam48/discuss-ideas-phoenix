use Mix.Config

# General application configuration
config :discuss,
  ecto_repos: [Discuss.Repo]

# Configures the endpoint
config :discuss, Discuss.Endpoint,
  url: [host: System.get_env("HOST")],
  secret_key_base: System.get_env("SECRET_KEY_BASE"),
  render_errors: [view: Discuss.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Discuss.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configures ueberauth to use github provider
config :ueberauth, Ueberauth,
  providers: [
    # facebook: { Ueberauth.Strategy.Facebook, [ opt1: "value", opts2: "value" ] },
    github: { Ueberauth.Strategy.Github, [default_scope: "user, user:email"] }
  ]

# Get auth keys from local environment
  # If local env deletes keys they can be found in prod.secret.exs
config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: System.get_env("GITHUB_CLIENT_ID"),
  client_secret: System.get_env("GITHUB_CLIENT_SECRET")
