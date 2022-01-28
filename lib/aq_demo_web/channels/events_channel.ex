defmodule AqDemoWeb.EventsChannel do
  use AqDemoWeb, :channel

  def join("events:*", _message, socket) do
    {:ok, socket}
  end

  def join("events:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end
end
