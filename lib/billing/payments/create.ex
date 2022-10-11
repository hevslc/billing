defmodule Billing.Payments.Create do
  @moduledoc """
  Module for Payment creation
  """
  alias Billing.{Payment, Error, Repo}

  def call(%{} = params) do
    params
    |> Payment.changeset
    |> Repo.insert
    |> handle_insert
  end

  def call(_anything), do: "Enter the data in a map format"

  defp handle_insert({:ok, %Payment{}} = result), do: result

  defp handle_insert({:error, changeset}) do
    {:error, Error.build(:bad_request, changeset)}
  end
end
