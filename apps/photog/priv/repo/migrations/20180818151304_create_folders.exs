defmodule Photog.Repo.Migrations.CreateFolders do
  use Ecto.Migration

  def change do
    alter table(:folders) do
      add :apple_photos_uuid, :text, null: false
      modify :name, :text, null: false

    end
    create unique_index(:folders, [:apple_photos_uuid])
  end
end
