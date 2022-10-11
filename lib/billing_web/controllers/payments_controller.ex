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
end
