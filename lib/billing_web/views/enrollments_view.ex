defmodule BillingWeb.EnrollmentsView do
  use BillingWeb, :view

  alias Billing.Enrollment

  def render("create.json", %{enrollment: %Enrollment{} = enrollment}) do
    %{
      message: "Enrollment created!",
      enrollment: %{
        id: enrollment.id,
        course_name: enrollment.course_name,
        course_value: enrollment.course_value,
        number_payments: enrollment.number_payments,
        due_day: enrollment.due_day,
        institution_id: enrollment.institution_id,
        student_id: enrollment.student_id,
      }
    }
  end

  def render("enrollment.json", %{enrollment: %Enrollment{} = enrollment}), do: %{enrollment: enrollment}
end
