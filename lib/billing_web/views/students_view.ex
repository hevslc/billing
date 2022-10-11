defmodule BillingWeb.StudentsView do
  use BillingWeb, :view

  alias Billing.Student

  def render("create.json", %{student: %Student{} = student}) do
    %{
      message: "Student created!",
      student: %{
        id: student.id,
        name: student.name,
        cpf: student.cpf,
        birth_date: student.birth_date,
        phone: student.phone,
        gender: student.gender,
        payment_method: student.payment_method,
      }
    }
  end

  def render("student.json", %{student: %Student{} = student}), do: %{student: student}
end
