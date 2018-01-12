defmodule GraphicalWeb.Router do
  use GraphicalWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :graphql do
    plug GraphicalWeb.Context
  end

  scope "/", GraphicalWeb do
    pipe_through :api

    get "/", PageController, :index
  end

  scope "/api" do
    pipe_through :graphql

    forward "/", Absinthe.Plug,
      schema: GraphicalWeb.Schema
  end

  forward "/graphiql", Absinthe.Plug.GraphiQL,
    schema: GraphicalWeb.Schema
end
