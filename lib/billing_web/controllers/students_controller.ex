defmodule BillingWeb.StudentsController do
  use BillingWeb, :controller

  alias Billing.Student
  alias BillingWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Student{} = student} <- Billing.create_student(params) do
      conn
      |> put_status(:created)
      |> render("create.json", student: student)
    end
  end
end
