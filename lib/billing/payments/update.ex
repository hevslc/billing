defmodule Billing.Payments.Update do
  @moduledoc """
  Module for payment update.
  """
  alias Billing.{Error, Repo, Payment}

  def call(%{"id" => id} = params) do
    case Repo.get(Payment, id) do
      nil -> {:error, Error.build_not_found()}
      payment_schema -> do_update(payment_schema, params)
    end
  end

  defp do_update(%Payment{} = payment, %{} = params) do
    payment
    |> Payment.changeset(params)
    |> Repo.update()
  end
end
