defmodule Billing.Payments.Get do
  @moduledoc """
  Module for searching created payment.
  """
  alias Billing.{Repo, Error, Payment}

  def by_id(id) do
    case Repo.get(Payment, id) do
      nil -> {:error, Error.build_not_found}
      payment_schema -> {:ok, payment_schema}
    end
  end

  def all() do
    case Repo.all(Payment) do
      nil -> {:error, Error.build_not_found}
      all_payments -> {:ok, all_payments}
    end
  end
end
