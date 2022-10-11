defmodule Billing.Institutions.Create do
  @moduledoc """
  Module for Institution creation
  """
  alias Billing.{Institution, Error, Repo}

  def call(%{} = params) do
    params
    |> Institution.changeset
    |> Repo.insert
    |> handle_insert
  end

  def call(_anything), do: "Enter the data in a map format"

  defp handle_insert({:ok, %Institution{}} = result), do: result

  defp handle_insert({:error, changeset}) do
    {:error, Error.build(:bad_request, changeset)}
  end
end
