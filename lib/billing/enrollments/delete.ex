defmodule Billing.Enrollments.Delete do
  @moduledoc """
  Module for enrollment exclusion.
  """
  alias Billing.{Repo, Error, Enrollment}

  def call(id) do
    case Repo.get(Enrollment, id) do
      nil -> {:error, Error.build_not_found}
      enrollment_schema -> Repo.delete(enrollment_schema)
    end
  end
end
