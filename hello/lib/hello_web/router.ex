defmodule HelloWeb.Router do
  use HelloWeb, :router

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

  scope "/", HelloWeb do
    pipe_through :browser
    get "/", DefaultController, :index

    #get "/", PageController, :index
  end

  scope "/api", HelloWeb do
  pipe_through :api
  resources "/cities", CitiesController, except: [:new, :edit]
  end

  # Other scopes may use custom stacks.
   scope "/api", HelloWeb do
     pipe_through :api
     resources "/cities", CityController, except: [:new, :edit]
   end

end
