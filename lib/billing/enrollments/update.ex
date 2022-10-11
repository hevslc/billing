defmodule Billing.Enrollments.Update do
  @moduledoc """
  Module for enrollment update.
  """
  alias Billing.{Error, Repo, Enrollment}

  def call(%{"id" => id} = params) do
    case Repo.get(Enrollment, id) do
      nil -> {:error, Error.build_not_found()}
      enrollment_schema -> do_update(enrollment_schema, params)
    end
  end

  defp do_update(%Enrollment{} = enrollment, %{} = params) do
    enrollment
    |> Enrollment.changeset(params)
    |> Repo.update()
  end
end
