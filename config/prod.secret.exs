use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or you later on).
config :discuss, Discuss.Endpoint,
  secret_key_base: System.get_env("SECRET_KEY_BASE")

# Configure your database
config :discuss, Discuss.Repo,
  ssl: true,
  url: System.get_env("DATABASE_URL"),
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "discuss_prod",
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: System.get_env("CLIENT_ID"),
  client_secret: System.get_env("CLIENT_SECRET")
