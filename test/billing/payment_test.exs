defmodule Billing.PaymentTest do
  @moduledoc """
  Payment test
  """

  use Billing.DataCase, async: true
  import Billing.Factory
  alias Billing.{Error, Payment, Enrollments, Students, Institutions}
  alias Billing.Payments.Create
  alias Ecto.Changeset

  describe "changeset/2" do
    test "valid params, return a valid changeset" do
      params = build(:payment_params)
      response = Payment.changeset(params)

      assert %Changeset{changes: _params, valid?: true} = response
    end

    test "updating a changeset, returns a valid updated" do
      params = build(:payment_params)
      update_params = %{params | "value" => 900.00}
      base_changeset = Payment.changeset(params)
      response = Payment.changeset(base_changeset, update_params)

      assert %Changeset{changes: _update_params, valid?: true} = response
    end

    test "when there are some error, returns am invalid changeset" do
      params_with_errors = build(:payment_params, %{"status" => "any"})
      response = Payment.changeset(params_with_errors)
      expected = %{status: ["is invalid"]}

      assert errors_on(response) == expected
    end
  end

  describe "call/1" do
    test "valid params, returns the enrollment" do
      student_params = build(:student_params)
      {:ok, student} = Students.Create.call(student_params)

      institution_params = build(:institution_params)
      {:ok, institution} = Institutions.Create.call(institution_params)

      enrollment_params = build(:enrollment_params, %{"student_id" => student.id, "institution_id" => institution.id})
      {:ok, enrollment} = Enrollments.Create.call(enrollment_params)

      params = build(:payment_params, %{"enrollment_id" => enrollment.id})
      response = Create.call(params)
      assert {:ok, _params} = response
    end

    test "invalid params, returns an error" do
      student_params = build(:student_params)
      {:ok, student} = Students.Create.call(student_params)

      institution_params = build(:institution_params)
      {:ok, institution} = Institutions.Create.call(institution_params)

      enrollment_params = build(:enrollment_params, %{"student_id" => student.id, "institution_id" => institution.id})
      {:ok, enrollment} = Enrollments.Create.call(enrollment_params)

      params = build(:payment_params, %{"enrollment_id" => enrollment.id, "status" => "any"})

      response = Create.call(params)
      expected = %{status: ["is invalid"]}

      assert {:error, %Error{result: changeset, status: :bad_request}} = response
      assert errors_on(changeset) == expected
    end
  end

end
