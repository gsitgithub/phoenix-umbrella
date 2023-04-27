defmodule Movielist.Repo.Migrations.CreateRatings do
  use Ecto.Migration

  def change do
    alter table(:ratings) do
      modify :date_scored, :date, null: false
      modify :score, :integer, null: false
      add :movie_id, references(:movies, on_delete: :nothing), null: false

    end

    create index(:ratings, [:movie_id])
  end
end
