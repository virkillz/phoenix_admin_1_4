defmodule PhoenixAdmin.Repo.Migrations.CreateRoles do
  use Ecto.Migration

  def change do
    create table(:roles) do
      add :name, :string
      add :description, :string

      timestamps()
    end

    create unique_index(:roles, [:name])
  end
end
