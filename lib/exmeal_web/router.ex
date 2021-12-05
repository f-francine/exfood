defmodule ExmealWeb.Router do
  use ExmealWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ExmealWeb do
    pipe_through :api
  end
end
