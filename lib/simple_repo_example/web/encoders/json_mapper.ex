defmodule SimpleRepoExample.JsonMapper do
  def to_json_tuple({key, value}) do
    [first_part|other_parts] = key |> Atom.to_string |> String.split("_")

    new_key = [first_part|other_parts |> Enum.map(&String.capitalize/1)]
    |> List.to_string

    {new_key, value}
  end

  def to_json(entity, attributes) do
    entity
    |> Map.take(attributes)
    |> Enum.filter_map(fn {_key, value} -> value != nil end, &to_json_tuple/1)
    |> Enum.into(%{})
    |> Poison.Encoder.encode([])
  end
end
