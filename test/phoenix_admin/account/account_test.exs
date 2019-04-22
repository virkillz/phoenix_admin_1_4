defmodule PhoenixAdmin.AccountTest do
  use PhoenixAdmin.DataCase

  alias PhoenixAdmin.Account

  describe "roles" do
    alias PhoenixAdmin.Account.Role

    @valid_attrs %{description: "some description", name: "some name"}
    @update_attrs %{description: "some updated description", name: "some updated name"}
    @invalid_attrs %{description: nil, name: nil}

    def role_fixture(attrs \\ %{}) do
      {:ok, role} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Account.create_role()

      role
    end

    test "list_roles/0 returns all roles" do
      role = role_fixture()
      assert Account.list_roles() == [role]
    end

    test "get_role!/1 returns the role with given id" do
      role = role_fixture()
      assert Account.get_role!(role.id) == role
    end

    test "create_role/1 with valid data creates a role" do
      assert {:ok, %Role{} = role} = Account.create_role(@valid_attrs)
      assert role.description == "some description"
      assert role.name == "some name"
    end

    test "create_role/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_role(@invalid_attrs)
    end

    test "update_role/2 with valid data updates the role" do
      role = role_fixture()
      assert {:ok, %Role{} = role} = Account.update_role(role, @update_attrs)
      assert role.description == "some updated description"
      assert role.name == "some updated name"
    end

    test "update_role/2 with invalid data returns error changeset" do
      role = role_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_role(role, @invalid_attrs)
      assert role == Account.get_role!(role.id)
    end

    test "delete_role/1 deletes the role" do
      role = role_fixture()
      assert {:ok, %Role{}} = Account.delete_role(role)
      assert_raise Ecto.NoResultsError, fn -> Account.get_role!(role.id) end
    end

    test "change_role/1 returns a role changeset" do
      role = role_fixture()
      assert %Ecto.Changeset{} = Account.change_role(role)
    end
  end

  describe "admins" do
    alias PhoenixAdmin.Account.Admin

    @valid_attrs %{bio: "some bio", email: "some email", full_name: "some full_name", ip: "some ip", is_active: true, last_login: ~D[2010-04-17], location: "some location", name: "some name", password_hash: "some password_hash", phone_number: "some phone_number"}
    @update_attrs %{bio: "some updated bio", email: "some updated email", full_name: "some updated full_name", ip: "some updated ip", is_active: false, last_login: ~D[2011-05-18], location: "some updated location", name: "some updated name", password_hash: "some updated password_hash", phone_number: "some updated phone_number"}
    @invalid_attrs %{bio: nil, email: nil, full_name: nil, ip: nil, is_active: nil, last_login: nil, location: nil, name: nil, password_hash: nil, phone_number: nil}

    def admin_fixture(attrs \\ %{}) do
      {:ok, admin} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Account.create_admin()

      admin
    end

    test "list_admins/0 returns all admins" do
      admin = admin_fixture()
      assert Account.list_admins() == [admin]
    end

    test "get_admin!/1 returns the admin with given id" do
      admin = admin_fixture()
      assert Account.get_admin!(admin.id) == admin
    end

    test "create_admin/1 with valid data creates a admin" do
      assert {:ok, %Admin{} = admin} = Account.create_admin(@valid_attrs)
      assert admin.bio == "some bio"
      assert admin.email == "some email"
      assert admin.full_name == "some full_name"
      assert admin.ip == "some ip"
      assert admin.is_active == true
      assert admin.last_login == ~D[2010-04-17]
      assert admin.location == "some location"
      assert admin.name == "some name"
      assert admin.password_hash == "some password_hash"
      assert admin.phone_number == "some phone_number"
    end

    test "create_admin/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_admin(@invalid_attrs)
    end

    test "update_admin/2 with valid data updates the admin" do
      admin = admin_fixture()
      assert {:ok, %Admin{} = admin} = Account.update_admin(admin, @update_attrs)
      assert admin.bio == "some updated bio"
      assert admin.email == "some updated email"
      assert admin.full_name == "some updated full_name"
      assert admin.ip == "some updated ip"
      assert admin.is_active == false
      assert admin.last_login == ~D[2011-05-18]
      assert admin.location == "some updated location"
      assert admin.name == "some updated name"
      assert admin.password_hash == "some updated password_hash"
      assert admin.phone_number == "some updated phone_number"
    end

    test "update_admin/2 with invalid data returns error changeset" do
      admin = admin_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_admin(admin, @invalid_attrs)
      assert admin == Account.get_admin!(admin.id)
    end

    test "delete_admin/1 deletes the admin" do
      admin = admin_fixture()
      assert {:ok, %Admin{}} = Account.delete_admin(admin)
      assert_raise Ecto.NoResultsError, fn -> Account.get_admin!(admin.id) end
    end

    test "change_admin/1 returns a admin changeset" do
      admin = admin_fixture()
      assert %Ecto.Changeset{} = Account.change_admin(admin)
    end
  end
end
