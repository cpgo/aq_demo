defmodule AqDemoWeb.UnitLive.Index do
  use AqDemoWeb, :live_view

  alias AqDemo.Market
  alias AqDemo.Market.Unit

  @impl true
  def mount(_params, _session, socket) do # mount runs when the page loads and the client websocket connects to the channel
    {:ok, assign(socket, :units, list_units())}
  end

  @impl true
  def handle_params(params, _url, socket) do # is triggered when the LiveView gets a message
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do # apply_action is pattern matched from the handle_params call depending on what params we got
    socket
    |> assign(:page_title, "Edit Unit")
    |> assign(:unit, Market.get_unit!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Unit")
    |> assign(:unit, %Unit{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Units")
    |> assign(:unit, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do # GenServer handler, we can use this to interact with messages coming phx_click events
    unit = Market.get_unit!(id)
    {:ok, _} = Market.delete_unit(unit)

    {:noreply, assign(socket, :units, list_units())}
  end

  defp list_units do
    Market.list_units()
  end
end
