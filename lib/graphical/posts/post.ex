defmodule Graphical.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias Graphical.Posts.Post


  schema "posts" do
    field :body, :string
    field :title, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Post{} = post, attrs) do
    post
    |> cast(attrs, [:title, :body, :user_id])
    |> validate_required([:title, :body, :user_id])
  end
end
