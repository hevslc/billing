defmodule Billing.Students.Delete do
  @moduledoc """
  Module for student exclusion.
  """
  alias Billing.{Repo, Error, Student}

  def call(id) do
    case Repo.get(Student, id) do
      nil -> {:error, Error.build_not_found}
      student_schema -> Repo.delete(student_schema)
    end
  end
end
