defmodule Discuss.Plugs.SetUser do
  import Plug.Conn
  import Phoenix.Controller

  alias Discuss.Repo
  alias Discuss.User

  def init(_params) do
  end

  def call(conn, _params) do
    user_id = get_session(conn, :user_id)

    cond do
      user = user_id && Repo.get(User, user_id) ->
        # conn.assigns.user => user struct
        assign(conn, :user, user)

      # if none of our cases are true just use a default statement
      true ->
        # there is no user so assign an empty user
        assign(conn, :user, nil)
    end
  end
end