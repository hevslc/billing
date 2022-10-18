defmodule Billing.Institutions.Get do
  @moduledoc """
  Module for searching created institution.
  """
  alias Billing.{Repo, Error, Institution}

  def by_id(id) do
    case Repo.get(Institution, id) do
      nil -> {:error, Error.build_not_found}
      institution_schema -> {:ok, institution_schema}
    end
  end

  def all() do
    case Repo.all(Institution) do
      nil -> {:error, Error.build_not_found}
      all_institutions -> {:ok, all_institutions}
    end
  end
end
