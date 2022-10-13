defmodule Pluginista.Admin do
  @moduledoc """
  The Admin context.
  """

  import Ecto.Query, warn: false
  alias Pluginista.Repo

  alias Pluginista.Admin.Group

  @doc """
  Returns the list of groups.

  ## Examples

      iex> list_groups()
      [%Group{}, ...]

  """
  def list_groups do
    Repo.all(Group)
  end

  @doc """
  Gets a single group.

  Raises `Ecto.NoResultsError` if the Group does not exist.

  ## Examples

      iex> get_group!(123)
      %Group{}

      iex> get_group!(456)
      ** (Ecto.NoResultsError)

  """
  def get_group!(id), do: Repo.get!(Group, id)

  @doc """
  Creates a group.

  ## Examples

      iex> create_group(%{field: value})
      {:ok, %Group{}}

      iex> create_group(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_group(attrs \\ %{}) do
    %Group{}
    |> Group.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a group.

  ## Examples

      iex> update_group(group, %{field: new_value})
      {:ok, %Group{}}

      iex> update_group(group, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_group(%Group{} = group, attrs) do
    group
    |> Group.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a group.

  ## Examples

      iex> delete_group(group)
      {:ok, %Group{}}

      iex> delete_group(group)
      {:error, %Ecto.Changeset{}}

  """
  def delete_group(%Group{} = group) do
    Repo.delete(group)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking group changes.

  ## Examples

      iex> change_group(group)
      %Ecto.Changeset{data: %Group{}}

  """
  def change_group(%Group{} = group, attrs \\ %{}) do
    Group.changeset(group, attrs)
  end

  alias Pluginista.Admin.Maker

  @doc """
  Returns the list of makers.

  ## Examples

      iex> list_makers()
      [%Maker{}, ...]

  """
  def list_makers do
    Repo.all(Maker)
  end

  @doc """
  Gets a single maker.

  Raises `Ecto.NoResultsError` if the Maker does not exist.

  ## Examples

      iex> get_maker!(123)
      %Maker{}

      iex> get_maker!(456)
      ** (Ecto.NoResultsError)

  """
  def get_maker!(id), do: Repo.get!(Maker, id)

  @doc """
  Creates a maker.

  ## Examples

      iex> create_maker(%{field: value})
      {:ok, %Maker{}}

      iex> create_maker(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_maker(attrs \\ %{}) do
    %Maker{}
    |> Maker.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a maker.

  ## Examples

      iex> update_maker(maker, %{field: new_value})
      {:ok, %Maker{}}

      iex> update_maker(maker, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_maker(%Maker{} = maker, attrs) do
    maker
    |> Maker.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a maker.

  ## Examples

      iex> delete_maker(maker)
      {:ok, %Maker{}}

      iex> delete_maker(maker)
      {:error, %Ecto.Changeset{}}

  """
  def delete_maker(%Maker{} = maker) do
    Repo.delete(maker)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking maker changes.

  ## Examples

      iex> change_maker(maker)
      %Ecto.Changeset{data: %Maker{}}

  """
  def change_maker(%Maker{} = maker, attrs \\ %{}) do
    Maker.changeset(maker, attrs)
  end

  alias Pluginista.Admin.Category

  @doc """
  Returns the list of categories.

  ## Examples

      iex> list_categories()
      [%Category{}, ...]

  """
  def list_categories do
    Repo.all(Category)
  end

  @doc """
  Gets a single category.

  Raises `Ecto.NoResultsError` if the Category does not exist.

  ## Examples

      iex> get_category!(123)
      %Category{}

      iex> get_category!(456)
      ** (Ecto.NoResultsError)

  """
  def get_category!(id), do: Repo.get!(Category, id)

  @doc """
  Creates a category.

  ## Examples

      iex> create_category(%{field: value})
      {:ok, %Category{}}

      iex> create_category(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_category(attrs \\ %{}) do
    %Category{}
    |> Category.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a category.

  ## Examples

      iex> update_category(category, %{field: new_value})
      {:ok, %Category{}}

      iex> update_category(category, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_category(%Category{} = category, attrs) do
    category
    |> Category.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a category.

  ## Examples

      iex> delete_category(category)
      {:ok, %Category{}}

      iex> delete_category(category)
      {:error, %Ecto.Changeset{}}

  """
  def delete_category(%Category{} = category) do
    Repo.delete(category)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking category changes.

  ## Examples

      iex> change_category(category)
      %Ecto.Changeset{data: %Category{}}

  """
  def change_category(%Category{} = category, attrs \\ %{}) do
    Category.changeset(category, attrs)
  end

  alias Pluginista.Admin.Plugin

  @doc """
  Returns the list of plugins.

  ## Examples

      iex> list_plugins()
      [%Plugin{}, ...]

  """
  def list_plugins do
    Repo.all(Plugin)
  end

  @doc """
  Gets a single plugin.

  Raises `Ecto.NoResultsError` if the Plugin does not exist.

  ## Examples

      iex> get_plugin!(123)
      %Plugin{}

      iex> get_plugin!(456)
      ** (Ecto.NoResultsError)

  """
  def get_plugin!(id), do: Repo.get!(Plugin, id)

  @doc """
  Creates a plugin.

  ## Examples

      iex> create_plugin(%{field: value})
      {:ok, %Plugin{}}

      iex> create_plugin(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_plugin(attrs \\ %{}) do
    %Plugin{}
    |> Plugin.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a plugin.

  ## Examples

      iex> update_plugin(plugin, %{field: new_value})
      {:ok, %Plugin{}}

      iex> update_plugin(plugin, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_plugin(%Plugin{} = plugin, attrs) do
    plugin
    |> Plugin.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a plugin.

  ## Examples

      iex> delete_plugin(plugin)
      {:ok, %Plugin{}}

      iex> delete_plugin(plugin)
      {:error, %Ecto.Changeset{}}

  """
  def delete_plugin(%Plugin{} = plugin) do
    Repo.delete(plugin)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking plugin changes.

  ## Examples

      iex> change_plugin(plugin)
      %Ecto.Changeset{data: %Plugin{}}

  """
  def change_plugin(%Plugin{} = plugin, attrs \\ %{}) do
    Plugin.changeset(plugin, attrs)
  end
end
