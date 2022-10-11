defmodule Billing.StudentTest do
  @moduledoc """
  Student test
  """
  use Billing.DataCase, async: true
  import Billing.Factory
  alias Billing.{Error, Student}
  alias Billing.Students.Create
  alias Ecto.Changeset

  describe "changeset/2" do
    test "valid params, returns a valid changeset" do
      params = build(:student_params)
      response = Student.changeset(params)

      assert %Changeset{changes: _params, valid?: true} = response
    end

    test "updating a changeset, returns a valid updated" do
      params = build(:student_params)
      update_params = %{"name" => "Student name 2"}
      base_changeset = Student.changeset(params)
      response = Student.changeset(base_changeset, update_params)

      assert %Changeset{changes:  %{name: "Student name 2"}, valid?: true} = response
    end

    test "when there are some error, returns an invalid changeset" do
      params_with_errors = build(:student_params, %{"phone" => "text", "gender" => :any, "payment_method" => :any})
      response = Student.changeset(params_with_errors)
      expected = %{phone: ["is invalid"], gender: ["is invalid"], payment_method: ["is invalid"]}

      assert errors_on(response) == expected
    end
  end

  describe "call/1" do
    test "valid params, returns the student" do
      params = build(:student_params)
      response = Create.call(params)
      assert {:ok, _params} = response
    end

    test "invalid params, returns an error" do
      params = build(:student_params, %{"phone" => "text", "gender" => :any, "payment_method" => :any})
      response = Create.call(params)
      expected = %{phone: ["is invalid"], gender: ["is invalid"], payment_method: ["is invalid"]}

      assert {:error, %Error{result: changeset, status: :bad_request}} = response
      assert errors_on(changeset) == expected
    end
  end
end
