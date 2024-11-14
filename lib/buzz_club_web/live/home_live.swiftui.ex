defmodule BuzzClubWeb.HomeLive.SwiftUI do
  use BuzzClubNative, [:render_component, format: :swiftui]

  def render(assigns, _interface) do
    ~LVN"""
    <Text>Hello, LiveView Native!</Text>
    """
  end
end
