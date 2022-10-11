defmodule Billing.InstitutionTest do
  @moduledoc """
  Institution test
  """
  use Billing.DataCase, async: true
  import Billing.Factory
  alias Billing.{Error, Institution}
  alias Billing.Institutions.Create
  alias Ecto.Changeset

  describe "changeset/2" do
    test "valid params, returns a valid changeset" do
      params = build(:institution_params)
      response = Institution.changeset(params)

      assert %Changeset{changes: _params, valid?: true} = response
    end

    test "updating a changeset, returns a valid updated" do
      params = build(:institution_params)
      update_params = %{"name" => "Institution name 2"}
      base_changeset = Institution.changeset(params)
      response = Institution.changeset(base_changeset, update_params)

      assert %Changeset{changes:  %{name: "Institution name 2"}, valid?: true} = response
    end

    test "when there are some error, returns an invalid changeset" do
      params_with_errors = build(:institution_params, %{"cnpj" => "text", "type" => :any})
      response = Institution.changeset(params_with_errors)
      expected = %{cnpj: ["has invalid format"], type: ["is invalid"]}

      assert errors_on(response) == expected
    end
  end

  describe "call/1" do
    test "valid params, returns the institution" do
      params = build(:institution_params)
      response = Create.call(params)
      assert {:ok, _params} = response
    end

    test "invalid params, returns an error" do
      params = build(:institution_params, %{"cnpj" => "text", "type" => :any})
      response = Create.call(params)
      expected = %{cnpj: ["has invalid format"], type: ["is invalid"]}

      assert {:error, %Error{result: changeset, status: :bad_request}} = response
      assert errors_on(changeset) == expected
    end
  end
end
