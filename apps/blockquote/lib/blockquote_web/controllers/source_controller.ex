defmodule BlockquoteWeb.SourceController do
  use BlockquoteWeb, :controller

  alias Blockquote.Admin
  alias Blockquote.Admin.Source

  def custom_render(conn, template, assigns) do
    custom_render(conn, view_module(conn), template, assigns)
  end

  def custom_render(conn, view_module, template, assigns) do
    assigns = [{:item_name_singular, "source"}] ++ assigns
    put_view(conn, view_module)
    |> render(template, assigns)
  end

  def related_fields do
    authors = Admin.list_authors() |> BlockquoteWeb.AuthorView.map_for_form
    source_types = Admin.list_source_types() |> BlockquoteWeb.SourceTypeView.map_for_form
    #insert blank value since parent source is optional
    parent_sources = Admin.list_parent_sources() |> BlockquoteWeb.ParentSourceView.map_for_form |> List.insert_at(0, {"", nil})

    [authors: authors, source_types: source_types, parent_sources: parent_sources]
  end

  def index(conn, _params) do
    sources = Admin.list_sources()
    custom_render(conn, BlockquoteWeb.SharedView, "index.html", items: sources, item_view: view_module(conn), item_display_func: :to_s)
  end

  def new_page(conn, changeset) do
    custom_render(conn, "new.html", changeset: changeset, related_fields: related_fields())
  end

  def edit_page(conn, changeset, source) do
    custom_render(conn, "edit.html", changeset: changeset, related_fields: related_fields(), item: source)
  end

  def new(conn, %{"parent_source" => parent_source_id}) do
    changeset = Admin.change_source(%Source{parent_source_id: parent_source_id})
    new_page(conn, changeset)
  end

  def new(conn, _params) do
    changeset = Admin.change_source(%Source{})
    new_page(conn, changeset)
  end

  def create(conn, %{"source" => source_params}) do
    case Admin.create_source(source_params) do
      {:ok, source} ->
        conn
        |> put_flash(:info, "Source created successfully.")
        |> redirect(to: source_path(conn, :show, source))
      {:error, %Ecto.Changeset{} = changeset} ->
        new_page(conn, changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    source = Admin.get_source_for_show!(id)
    custom_render(conn, "show.html", source: source)
  end

  def edit(conn, %{"id" => id}) do
    source = Admin.get_source!(id)
    changeset = Admin.change_source(source)
    edit_page(conn, changeset, source)
  end

  def update(conn, %{"id" => id, "source" => source_params}) do
    source = Admin.get_source!(id)

    case Admin.update_source(source, source_params) do
      {:ok, source} ->
        conn
        |> put_flash(:info, "Source updated successfully.")
        |> redirect(to: source_path(conn, :show, source))
      {:error, %Ecto.Changeset{} = changeset} ->
        edit_page(conn, changeset, source)
    end
  end

  def delete(conn, %{"id" => id}) do
    source = Admin.get_source!(id)
    {:ok, _source} = Admin.delete_source(source)

    conn
    |> put_flash(:info, "Source deleted successfully.")
    |> redirect(to: source_path(conn, :index))
  end
end
