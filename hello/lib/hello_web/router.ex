defmodule HelloWeb.Router do
  use HelloWeb, :router

  pipeline :browser do
    plug :accepts, ["html", "text"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HelloWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/test", PageController, :test
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show
    forward "/jobs", BackgroundJob.Plug
    resources "/users", UserController
  end

  scope "/admin", as: :admin do
    resources "/reviews", HelloWeb.Admin.ReviewController
  end
  # Other scopes may use custom stacks.
  scope "/api", HelloWeb do
    pipe_through :api

    resources "/reviews", ReviewController
  end

end
