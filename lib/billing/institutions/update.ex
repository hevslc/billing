defmodule Billing.Institutions.Update do
  @moduledoc """
  Module for institution update.
  """
  alias Billing.{Error, Repo, Institution}

  def call(%{"id" => id} = params) do
    case Repo.get(Institution, id) do
      nil -> {:error, Error.build_not_found()}
      institution_schema -> do_update(institution_schema, params)
    end
  end

  defp do_update(%Institution{} = institution, %{} = params) do
    institution
    |> Institution.changeset(params)
    |> Repo.update()
  end
end
