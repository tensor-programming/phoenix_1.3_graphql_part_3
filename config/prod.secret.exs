use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :graphical, GraphicalWeb.Endpoint,
  secret_key_base: "Ti9wgROd5CN4RuHmkervWMT7kjPiUebTptj0STFteUc5ZBYud79t+34jmVdsqmiT"

# Configure your database
config :graphical, Graphical.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "graphical_prod",
  pool_size: 15
