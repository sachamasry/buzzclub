defmodule BuzzClub.Repo do
  use Ecto.Repo,
    otp_app: :buzz_club,
    adapter: Ecto.Adapters.SQLite3
end
