defmodule ExmealWeb.ErrorView do
  use ExmealWeb, :view

  import Ecto.Changeset, only: [traverse_errors: 2]

  def translate_errors(changeset) do
    traverse_errors(changeset, fn {msg, opts} ->
      Enum.reduce(opts, msg, fn {key, result}, acc ->
        String.replace(acc, "%{#{key}}", to_string(result))
      end)
    end)
  end
end
