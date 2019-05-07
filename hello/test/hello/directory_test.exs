defmodule Hello.DirectoryTest do
  use Hello.DataCase

  alias Hello.Directory

  describe "cities" do
    alias Hello.Directory.City

    @valid_attrs %{name: "some name", prev: "some prev", status: true}
    @update_attrs %{name: "some updated name", prev: "some updated prev", status: false}
    @invalid_attrs %{name: nil, prev: nil, status: nil}

    def city_fixture(attrs \\ %{}) do
      {:ok, city} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Directory.create_city()

      city
    end

    test "list_cities/0 returns all cities" do
      city = city_fixture()
      assert Directory.list_cities() == [city]
    end

    test "get_city!/1 returns the city with given id" do
      city = city_fixture()
      assert Directory.get_city!(city.id) == city
    end

    test "create_city/1 with valid data creates a city" do
      assert {:ok, %City{} = city} = Directory.create_city(@valid_attrs)
      assert city.name == "some name"
      assert city.prev == "some prev"
      assert city.status == true
    end

    test "create_city/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Directory.create_city(@invalid_attrs)
    end

    test "update_city/2 with valid data updates the city" do
      city = city_fixture()
      assert {:ok, %City{} = city} = Directory.update_city(city, @update_attrs)
      assert city.name == "some updated name"
      assert city.prev == "some updated prev"
      assert city.status == false
    end

    test "update_city/2 with invalid data returns error changeset" do
      city = city_fixture()
      assert {:error, %Ecto.Changeset{}} = Directory.update_city(city, @invalid_attrs)
      assert city == Directory.get_city!(city.id)
    end

    test "delete_city/1 deletes the city" do
      city = city_fixture()
      assert {:ok, %City{}} = Directory.delete_city(city)
      assert_raise Ecto.NoResultsError, fn -> Directory.get_city!(city.id) end
    end

    test "change_city/1 returns a city changeset" do
      city = city_fixture()
      assert %Ecto.Changeset{} = Directory.change_city(city)
    end
  end
end
