defmodule Billing.Enrollments.Create do
  @moduledoc """
  Module for Enrollment creation
  """
  alias Billing.{Enrollment, Error, Repo}

  def call(%{} = params) do
    params
    |> Enrollment.changeset
    |> Repo.insert
    |> handle_insert
  end

  def call(_anything), do: "Enter the data in a map format"

  defp handle_insert({:ok, %Enrollment{}} = result), do: result

  defp handle_insert({:error, changeset}) do
    {:error, Error.build(:bad_request, changeset)}
  end
end
