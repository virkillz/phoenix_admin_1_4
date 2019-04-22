defmodule PhoenixAdmin.Repo.Migrations.CreateAdmins do
  use Ecto.Migration

  def change do
    create table(:admins) do
      add :username, :string
      add :email, :string
      add :password_hash, :string
      add :full_name, :string
      add :phone_number, :string
      add :location, :string
      add :is_active, :boolean, default: false, null: false
      add :bio, :text
      add :ip, :string
      add :last_login, :date
      add :role, references(:roles, on_delete: :nothing)

      timestamps()
    end

    create unique_index(:admins, [:email])
    create unique_index(:admins, [:username])    
    create index(:admins, [:role])
  end
end
