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

  def show(conn, %{"id" => id}) do
    with {:ok, %Student{} = student} <- Billing.get_student_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("student.json", student: student)
    end
  end
end
