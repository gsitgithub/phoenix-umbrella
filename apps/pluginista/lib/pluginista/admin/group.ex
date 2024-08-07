defmodule Pluginista.Admin.Group do
  use Ecto.Schema
  import Ecto.Changeset

  @schema_prefix Grenadier.RepoPrefix.pluginista()
  schema "groups" do
    field :name, :string

    has_many :categories, Pluginista.Admin.Category
    has_many :plugins, Pluginista.Admin.Plugin

    timestamps()
  end

  @doc false
  def changeset(group, attrs) do
    group
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
