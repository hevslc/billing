defmodule Billing.Students.Create do
  @moduledoc """
  Module for Student create
  """
  alias Billing.{Student, Error, Repo}

  def call(%{} = params) do
    params
    |> Student.changeset
    |> Repo.insert
    |> handle_insert
  end

  def call(_anything), do: "Enter the data in a map format"

  defp handle_insert({:ok, %Student{}} = result), do: result

  defp handle_insert({:error, changeset}) do
    {:error, Error.build(:bad_request, changeset)}
  end
end
