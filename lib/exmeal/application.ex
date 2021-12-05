defmodule Exmeal.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      Exmeal.Repo,
      ExmealWeb.Telemetry,
      {Phoenix.PubSub, name: Exmeal.PubSub},
      ExmealWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: Exmeal.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    ExmealWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
