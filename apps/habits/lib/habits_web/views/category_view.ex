defmodule HabitsWeb.CategoryView do
  use HabitsWeb, :view
  alias Habits.Admin.Category

  Common.ViewHelpers.Form.define_map_for_form(true)

  def colors do
    [
      "beige",
      "black",
      "blue",
      "brown",
      "cyan",
      "gold",
      "green",
      "hot-pink",
      "lime",
      "maroon",
      "olive",
      "orange",
      "pink",
      "purple",
      "red",
      "salmon",
      "sandy",
      "sky",
      "yellow"
    ]
  end

  def colors_for_form do
    colors() |> Enum.map(fn color -> {String.capitalize(color), color} end)
  end

  def color_style(%Category{} = category) do
    "category-color category-color--#{category.color}"
  end

  def streak_item_style(%Category{} = category, count) do
    case count do
      0 -> ""
      _ -> color_style(category)
    end
  end
end
