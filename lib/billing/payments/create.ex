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

  def call_error(_anything) do
    {:error, Error.build(:method_not_allowed, "Manual payment creation is not allowed")}
  end

  defp handle_insert({:ok, %Payment{}} = result), do: result

  defp handle_insert({:error, changeset}) do
    {:error, Error.build(:bad_request, changeset)}
  end

end
