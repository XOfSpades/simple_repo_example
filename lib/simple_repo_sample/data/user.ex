defmodule SimpleRepoSample.Data.User do
  use Ecto.Schema

  schema "users" do
    field :first_name,         :string, default: nil
    field :last_name,          :string
    field :email,              :string
    field :organization,       :string, default: nil

    timestamps()
  end

  def changeset(model, params \\ :empty) do
    fields = ~w(first_name last_name email organization)

    model
    |> Ecto.Changeset.cast(params, fields)
    |> Ecto.Changeset.validate_required(:last_name)
    |> Ecto.Changeset.validate_length(:last_name, max: 50)
    |> Ecto.Changeset.validate_length(:first_name, max: 50)
    |> Ecto.Changeset.validate_required(:email)
    |> Ecto.Changeset.validate_length(:organization, max: 150)
  end
end
