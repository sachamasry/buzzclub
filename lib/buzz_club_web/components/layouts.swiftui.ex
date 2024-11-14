defmodule BuzzClubWeb.Layouts.SwiftUI do
  use BuzzClubNative, [:layout, format: :swiftui]

  embed_templates "layouts_swiftui/*"
end
