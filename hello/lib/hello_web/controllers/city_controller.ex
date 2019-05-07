defmodule HelloWeb.CityController do
  use HelloWeb, :controller
  import Ecto.Query


  alias Hello.Directory
  alias Hello.Directory.City

  action_fallback HelloWeb.FallbackController

  def index(conn, _params) do
    cities = Directory.list_cities()
    render(conn, "index.json", cities: cities)
  end

  def create(conn, %{"city" => city_params}) do
    with {:ok, %City{} = city} <- Directory.create_city(city_params) do
    conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.city_path(conn, :show, city))
      |> render("show.json", city: city)
    end
  end

  def show(conn, %{"id" => id}) do
    city = Directory.get_city!(id)
    render(conn, "show.json", city: city)
  end

  def update(conn, %{"id" => id, "city" => city_params}) do
    city = Directory.get_city!(id)

    with {:ok, %City{} = city} <- Directory.update_city(city, city_params) do
      render(conn, "show.json", city: city)
    end
  end

  def delete(conn, %{"id" => id}) do
    city = Directory.get_city!(id)

    with {:ok, %City{}} <- Directory.delete_city(city) do
      send_resp(conn, :no_content, "")
    end
  end
end
