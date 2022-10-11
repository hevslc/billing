defmodule BillingWeb.PaymentsView do
  use BillingWeb, :view

  alias Billing.Payment

  def render("create.json", %{payment: %Payment{} = payment}) do
    %{
      message: "Payment created!",
      payment: %{
        id: payment.id,
        value: payment.value,
        due_date: payment.due_date,
        status: payment.status,
        enrollment_id: payment.enrollment_id,
      }
    }
  end

  def render("payment.json", %{payment: %Payment{} = payment}), do: %{payment: payment}
end
