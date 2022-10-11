defmodule BillingWeb.EnrollmentsController do
  use BillingWeb, :controller

  alias Billing.Enrollment
  alias BillingWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Enrollment{} = enrollment} <- Billing.create_enrollment(params) do
      conn
      |> put_status(:created)
      |> render("create.json", enrollment: enrollment)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Enrollment{} = enrollment} <- Billing.get_enrollment_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("enrollment.json", enrollment: enrollment)
    end
  end
end
