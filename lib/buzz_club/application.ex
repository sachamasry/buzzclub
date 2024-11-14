defmodule BuzzClub.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      BuzzClubWeb.Telemetry,
      BuzzClub.Repo,
      {Ecto.Migrator,
        repos: Application.fetch_env!(:buzz_club, :ecto_repos),
        skip: skip_migrations?()},
      {DNSCluster, query: Application.get_env(:buzz_club, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: BuzzClub.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: BuzzClub.Finch},
      # Start a worker by calling: BuzzClub.Worker.start_link(arg)
      # {BuzzClub.Worker, arg},
      # Start to serve requests, typically the last entry
      BuzzClubWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BuzzClub.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BuzzClubWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  defp skip_migrations?() do
    # By default, sqlite migrations are run when using a release
    System.get_env("RELEASE_NAME") != nil
  end
end
