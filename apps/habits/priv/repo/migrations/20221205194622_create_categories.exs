defmodule Habits.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    alter table(:categories) do
      modify :name, :text, null: false
      add :color, :text

    end

  end
end
