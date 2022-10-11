defmodule BillingWeb.StudentsViewTest do
  use BillingWeb.ConnCase, async: true

  import Phoenix.View
  import Billing.Factory
  alias BillingWeb.StudentsView

  test "renders create.json" do
    student = build(:student)

    response = render(StudentsView, "create.json", student: student)

    assert  %{
      student: %{
        name: "Student name",
        cpf: "04319286065",
        birth_date: "1998-01-01",
        phone: 123,
        gender: "f",
        payment_method: "card",
        id: "7ffc29b2-daa1-44be-bd88-409ce5863fcd",
      },
      message: "Student created!"
    } = response
  end
end
