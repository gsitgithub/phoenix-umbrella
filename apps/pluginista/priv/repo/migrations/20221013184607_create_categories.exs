defmodule Pluginista.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    alter table(:categories) do
      modify :name, :text, null: false
      add :group_id, references(:groups, on_delete: :nothing), null: false

    end

    create unique_index(:categories, [:name, :group_id])
  end
end
