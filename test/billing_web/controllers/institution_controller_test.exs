defmodule BillingWeb.InstitutionsControllerTest do
  @moduledoc """
  Institution controller test
  """
  use BillingWeb.ConnCase, async: true
  import Billing.Factory

  describe "create/2" do
    test "valid params, creates the institution", %{conn: conn} do
      params = build(:institution_params)

      response =
        conn
        |> post(Routes.institutions_path(conn, :create, params))
        |> json_response(:created)

      assert %{
        "message" => "Institution created!",
        "institution" =>  %{
          "name" => "Institution name",
          "cnpj" => "72887390000174",
          "type" => "university",
          "id" => _id,
        }
      } = response
    end

    test "invalid params, returns a error", %{conn: conn} do
      params = %{"cnpj" => "texto"}

      response =
        conn
        |> post(Routes.institutions_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{
        "message" =>%{
          "name" => ["can't be blank"],
          "type" => ["can't be blank"],
          "cnpj" => ["has invalid format"],
        }
      }

      assert expected_response == response
    end
  end

  describe "delete/2" do
    test "existing institution with given id, deletes the institution", %{conn: conn} do
     id = "7ffc29b2-daa1-44be-bd88-409ce5863fcd"

     insert(:institution)

      _response =
        conn
        |> delete(Routes.institutions_path(conn, :delete, id))
        |> response(:no_content)

      assert _response = ""
    end

  end
end
