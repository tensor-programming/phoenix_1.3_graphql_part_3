defmodule Graphical.UserResolver do
  alias Graphical.Accounts 

  def all(_args, _info) do
    {:ok, Accounts.list_users()}
  end

  def find(%{id: id}, _info) do 
    case Accounts.get_user!(id) do
      nil -> {:error, "User id #{id} not found"}
      user -> {:ok, user}
    end
  end

  def update(%{id: id, user: user_params}, _info) do
    Graphical.Accounts.get_user!(id)
    |> Graphical.Accounts.update_user(user_params)
  end

  def login(params, _info) do
    with {:ok, user} <- Graphical.Accounts.User.authenticate(params),
         {:ok, jwt, _ } <- Graphical.Guardian.encode_and_sign(user),
         {:ok, _ } <- Graphical.Accounts.store_user(user, jwt)
    do
      {:ok, %{token: jwt}}
    end
  end
end