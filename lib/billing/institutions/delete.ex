defmodule Billing.Institutions.Delete do
  @moduledoc """
  Module for institution exclusion.
  """
  alias Billing.{Repo, Error, Institution}

  def call(id) do
    case Repo.get(Institution, id) do
      nil -> {:error, Error.build_not_found}
      institution_schema -> Repo.delete(institution_schema)
    end
  end
end
