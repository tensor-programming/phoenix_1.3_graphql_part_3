defmodule Graphical.PostResolver do
  alias Graphical.Posts
  import Ecto.Query, only: [where: 2]
  alias Graphical.Posts.Post
  alias Graphical.Repo
  

  def all(_args, %{context: %{current_user: %{id: id}}}) do
    posts =
      Post
      |> where(user_id: ^id)
      |> Graphical.Repo.all

    {:ok, posts}
  end
  def all(_args, _info) do
    {:error, "Not Authorized"}
  end

  def create(args, _info) do
    Posts.create_post(args)
  end

  def update(%{id: id, post: post_params}, _info) do
    Posts.get_post!(id)
    |> Posts.update_post(post_params)
  end

  def delete(%{id: id}, _info) do
    Posts.get_post!(id)
    |> Posts.delete_post
  end
end