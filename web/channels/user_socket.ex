defmodule Discuss.UserSocket do
  use Phoenix.Socket

  # Our new endpoint for handling comments
  channel "comments:*", Discuss.CommentsChannel


  transport :websocket, Phoenix.Transports.WebSocket

  def connect(params, socket) do
  
    IO.puts("++++ sockets +++++")
    IO.inspect(params["token"])
    case Phoenix.Token.verify(socket, "key", params["token"]) do
      {:ok, user_id} ->
        {:ok, assign(socket, :user_id, user_id)}
      {:error, _error} ->
        :error
    end
  end

  def id(_socket), do: nil
end
