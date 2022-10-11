defmodule BillingWeb.PaymentsController do
  use BillingWeb, :controller

  alias Billing.Payment
  alias BillingWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Payment{} = payment} <- Billing.create_payment(params) do
      conn
      |> put_status(:created)
      |> render("create.json", payment: payment)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Payment{} = payment} <- Billing.get_payment_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("payment.json", payment: payment)
    end
  end
end
