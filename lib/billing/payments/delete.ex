defmodule Billing.Payments.Delete do
  @moduledoc """
  Module for payment exclusion.
  """
  alias Billing.{Repo, Error, Payment}

  def call(id) do
    case Repo.get(Payment, id) do
      nil -> {:error, Error.build_not_found}
      payment_schema -> Repo.delete(payment_schema)
    end
  end
end
