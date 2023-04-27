defmodule Photog.Repo.Migrations.CreateTags do
  use Ecto.Migration

  def change do
    alter table(:tags) do
      modify :name, :text, null: false
      add :apple_photos_uuid, :text

    end

    create unique_index(:tags, [:apple_photos_uuid])
  end
end
