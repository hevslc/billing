defmodule Billing.Students.Update do
  @moduledoc """
  Module for student update.
  """
  alias Billing.{Error, Repo, Student}

  def call(%{"id" => id} = params) do
    case Repo.get(Student, id) do
      nil -> {:error, Error.build_not_found()}
      studant_schema -> do_update(studant_schema, params)
    end
  end

  defp do_update(%Student{} = studant, %{} = params) do
    studant
    |> Student.changeset(params)
    |> Repo.update()
  end
end
