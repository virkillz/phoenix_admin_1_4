
# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Phoenixadmin.Repo.insert!(%Phoenixadmin.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias PhoenixAdmin.Repo
alias PhoenixAdmin.Account.Admin

  Repo.insert! %Admin{
    full_name: "Michael Admin",
    username: "admin",
    password_hash: "$2b$12$XTi9qKUeH9E1RAFSIqrZk.Ymctk8lKhGJPSHVcop8OARTqcgucd/y"
  }