defmodule Billing.Students.Get do
  @moduledoc """
  Module for searching created student.
  """
  alias Billing.{Repo, Error, Student}

  def by_id(id) do
    case Repo.get(Student, id) do
      nil -> {:error, Error.build_not_found}
      student_schema -> {:ok, student_schema}
    end
  end

  def all() do
    case Repo.all(Student) do
      nil -> {:error, Error.build_not_found}
      all_students -> {:ok, all_students}
    end
  end
end
