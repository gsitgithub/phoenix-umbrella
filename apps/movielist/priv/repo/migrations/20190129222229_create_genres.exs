defmodule Movielist.Repo.Migrations.CreateGenres do
  use Ecto.Migration

  def change do
    alter table(:genres) do
      modify :name, :text, null: false

    end

  end
end
