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

  alias Billing.Institutions.Get, as: InstitutionGet
  alias Billing.Students.Get, as: StudentGet
  alias Billing.Enrollments.Get, as: EnrollmentGet
  alias Billing.Payments.Get, as: PaymentGet

  alias Billing.Institutions.Delete, as: InstitutionDelete
  alias Billing.Students.Delete, as: StudentDelete
  alias Billing.Enrollments.Delete, as: EnrollmentDelete
  alias Billing.Payments.Delete, as: PaymentDelete

  alias Billing.Institutions.Update, as: InstitutionUpdate
  alias Billing.Students.Update, as: StudentUpdate
  alias Billing.Enrollments.Update, as: EnrollmentUpdate
  alias Billing.Payments.Update, as: PaymentUpdate

  defdelegate create_institution(params), to: InstitutionCreate, as: :call
  defdelegate create_student(params), to: StudentCreate, as: :call
  defdelegate create_enrollment(params), to: EnrollmentCreate, as: :call
  defdelegate try_create_payment(params), to: PaymentCreate, as: :call_error

  defdelegate get_institution_by_id(id), to: InstitutionGet, as: :by_id
  defdelegate get_student_by_id(id), to: StudentGet, as: :by_id
  defdelegate get_enrollment_by_id(id), to: EnrollmentGet, as: :by_id
  defdelegate get_payment_by_id(id), to: PaymentGet, as: :by_id

  defdelegate delete_institution(id), to: InstitutionDelete, as: :call
  defdelegate delete_student(id), to: StudentDelete, as: :call
  defdelegate delete_enrollment(id), to: EnrollmentDelete, as: :call
  defdelegate delete_payment(id), to: PaymentDelete, as: :call

  defdelegate update_institution(params), to: InstitutionUpdate, as: :call
  defdelegate update_student(params), to: StudentUpdate, as: :call
  defdelegate update_enrollment(params), to: EnrollmentUpdate, as: :call
  defdelegate update_payment(params), to: PaymentUpdate, as: :call
end
