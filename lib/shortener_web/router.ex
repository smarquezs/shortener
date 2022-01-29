defmodule ShortenerWeb.Router do
  use ShortenerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ShortenerWeb do
    pipe_through :browser

    get "/", LinkController, :new
    post "/links", LinkController, :create
    get "/:id", LinkController, :redirect_to
    get "/:id/stats", LinkController, :show
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: ShortenerWeb.Telemetry
    end
  end
end
