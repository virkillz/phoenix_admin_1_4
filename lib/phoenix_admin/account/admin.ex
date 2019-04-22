defmodule PhoenixAdmin.Account.Admin do
  use Ecto.Schema
  import Ecto.Changeset
  alias PhoenixAdmin.Account.Admin

  schema "admins" do
    field :bio, :string
    field :email, :string
    field :full_name, :string
    field :ip, :string
    field :is_active, :boolean, default: false
    field :last_login, :date
    field :location, :string
    field :username, :string
    field :password_hash, :string
    field :password, :string , virtual: true
    field :repassword, :string, virtual: true    
    field :phone_number, :string
    field :role, :id

    timestamps()
  end

  @doc false
  def changeset(admin, attrs) do
    admin
    |> cast(attrs, [:username, :email, :password_hash, :password, :repassword, :full_name, :phone_number, :location, :is_active, :bio, :ip, :last_login])
    |> validate_required([:username, :email, :password, :repassword, :full_name])
    |> unique_constraint(:email)
    |> unique_constraint(:user)    
  end

  def registration_changeset(%Admin{} = admin, attrs) do
    admin
    |> cast(attrs, [:username, :email, :password_hash, :repassword, :password, :full_name, :phone_number, :location, :is_active, :bio, :ip, :last_login])
    |> validate_required([:username, :email, :password, :repassword, :full_name])
    |> validate_length(:password, min: 5)
    |> validate_password
    |> unique_constraint(:email)
    |> put_password_hash()
  end

  def validate_password(changeset) do 
    password = get_field(changeset, :password)
    repassword = get_field(changeset, :repassword)    
    if password == repassword do
      changeset
    else
      add_error(changeset, :repassword, "Password didn't match")
    end
  end

  def put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        change(changeset, password_hash: Comeonin.Bcrypt.hashpwsalt(pass))
      _ ->
        changeset
    end
  end  
end
