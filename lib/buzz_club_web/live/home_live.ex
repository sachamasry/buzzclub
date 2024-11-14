defmodule BuzzClubWeb.HomeLive do
  @moduledoc """
  """

  use BuzzClubWeb, :live_view
  use BuzzClubNative, :live_view


  def index() do
  end


  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
