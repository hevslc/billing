defmodule Billing do
  @moduledoc """
  Billing keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias Billing.Institutions.Create, as: InstitutionCreate
  alias Billing.Students.Create, as: StudentCreate
  alias Billing.Enrollments.Create, as: EnrollmentCreate
  alias Billing.Payments.Create, as: PaymentCreate

  defdelegate create_institution(params), to: InstitutionCreate, as: :call
  defdelegate create_student(params), to: StudentCreate, as: :call
  defdelegate create_enrollment(params), to: EnrollmentCreate, as: :call
  defdelegate create_payment(params), to: PaymentCreate, as: :call
end
