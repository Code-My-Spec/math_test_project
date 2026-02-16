defmodule MathTestProject.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      MathTestProjectWeb.Telemetry,
      MathTestProject.Repo,
      {DNSCluster, query: Application.get_env(:math_test_project, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: MathTestProject.PubSub},
      # Start a worker by calling: MathTestProject.Worker.start_link(arg)
      # {MathTestProject.Worker, arg},
      # Start to serve requests, typically the last entry
      MathTestProjectWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MathTestProject.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MathTestProjectWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
