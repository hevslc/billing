defmodule Billing.EnrollmentTest do
  @moduledoc """
  Enrollment test
  """
  use Billing.DataCase, async: true
  import Billing.Factory
  alias Billing.{Error, Enrollment, Students, Institutions}
  alias Billing.Enrollments.Create
  alias Ecto.Changeset

  describe "changeset/2" do
    test "valid params, returns a valid changeset" do
      params = build(:enrollment_params)
      response = Enrollment.changeset(params)

      assert %Changeset{changes: _params, valid?: true} = response
    end

    test "updating a changeset, returns a valid updated" do
      params = build(:enrollment_params)
      update_params = %{"course_name" => "Medicina"}
      base_changeset = Enrollment.changeset(params)
      response = Enrollment.changeset(base_changeset, update_params)

      assert %Changeset{changes:  %{course_name: "Medicina"}, valid?: true} = response
    end

    test "when there are some error, returns an invalid changeset" do
      params_with_errors = build(:enrollment_params, %{"couse_value" => -1, "number_payments" => 0,
        "due_day" => 60})
      response = Enrollment.changeset(params_with_errors)
      expected = %{due_day: ["must be less than or equal to 31"],
                number_payments: ["must be greater than or equal to 1"]}

      assert errors_on(response) == expected
    end
  end

  describe "call/1" do
    test "valid params, returns the enrollment" do
      student_params = build(:student_params)
      {:ok, student} = Students.Create.call(student_params)

      institution_params = build(:institution_params)
      {:ok, institution} = Institutions.Create.call(institution_params)

      params = build(:enrollment_params, %{"student_id" => student.id, "institution_id" => institution.id})
      response = Create.call(params)
      assert {:ok, _params} = response
    end

    test "invalid params, returns an error" do
      student_params = build(:student_params)
      {:ok, student} = Students.Create.call(student_params)

      institution_params = build(:institution_params)
      {:ok, institution} = Institutions.Create.call(institution_params)

      params = build(:enrollment_params, %{
        "couse_value" => -1,
        "number_payments" => 0,
        "due_day" => 60,
        "student_id" => student.id,
        "institution_id" => institution.id})

      response = Create.call(params)
      expected = %{due_day: ["must be less than or equal to 31"],
                  number_payments: ["must be greater than or equal to 1"]}

      assert {:error, %Error{result: changeset, status: :bad_request}} = response
      assert errors_on(changeset) == expected
    end
  end
end
