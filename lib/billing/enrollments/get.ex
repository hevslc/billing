defmodule Billing.Enrollments.Get do
  @moduledoc """
  Module for searching created enrollment.
  """
  alias Billing.{Repo, Error, Enrollment}

  def by_id(id) do
    case Repo.get(Enrollment, id) do
      nil -> {:error, Error.build_not_found}
      enrollment_schema -> {:ok, enrollment_schema}
    end
  end

  def all() do
    case Repo.all(Enrollment) do
      nil -> {:error, Error.build_not_found}
      all_enrollments -> {:ok, all_enrollments}
    end
  end
end
