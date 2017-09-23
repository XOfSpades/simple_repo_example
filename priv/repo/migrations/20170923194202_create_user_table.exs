defmodule SimpleRepoExample.Repo.Migrations.CreateUserTable do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: true) do
      add :first_name,            :string, size: 50
      add :last_name,             :string, size: 50, null: false
      add :email,                 :string, size: 255, null: false
      add :organization,          :string, size: 3, null: false

      timestamps()
    end
  end
end
