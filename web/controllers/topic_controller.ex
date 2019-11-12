defmodule Discuss.TopicController do
  use Discuss.Web, :controller

  alias Discuss.Topic

  def new(conn, _params) do
    # struct = %Topic{}
    # params = %{}
    # changeset = Topic.changeset(struct, params)
    changeset = Topic.changeset(%Topic{}, %{})

    render conn, "new.html", changeset: changeset
  end

  # def create(conn, params) do
  #   %{"topic" => topic} = params
  # end
  def create(conn, %{"topic" => topic}) do
    changeset = Topic.changeset(%Topic{}, topic)

    case Repo.insert(changeset) do
      {:ok, post} -> IO.inspect(post)
      {:error, changeset} -> render conn, "new.html", changeset: changeset
    end
  end
end