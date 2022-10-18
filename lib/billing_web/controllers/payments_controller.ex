defmodule BillingWeb.PaymentsController do
  use BillingWeb, :controller

  alias Billing.Payment
  alias BillingWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    Billing.try_create_payment(params)
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Payment{} = payment} <- Billing.get_payment_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("payment.json", payment: payment)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %Payment{}} <- Billing.delete_payment(id) do
      conn
      |> put_status(:no_content)
      |> text("")
    end
  end

  def update(conn, %{} = params) do
    with {:ok, %Payment{} = payment} <- Billing.update_payment(params) do
        conn
        |> put_status(:ok)
        |> render("payment.json", payment: payment)
    end
  end
end
