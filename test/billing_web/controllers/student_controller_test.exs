defmodule BillingWeb.StudentsControllerTest do
  @moduledoc """
  Student controller test
  """
  use BillingWeb.ConnCase, async: true
  import Billing.Factory

  describe "create/2" do
    test "valid params, creates the student", %{conn: conn} do
      params = build(:student_params)

      response =
        conn
        |> post(Routes.students_path(conn, :create, params))
        |> json_response(:created)

      assert %{
        "message" => "Student created!",
        "student" =>  %{
          "name" => "Student name",
          "cpf" => "04319286065",
          "birth_date" => "1998-01-01",
          "phone" => 123,
          "gender" => "f",
          "id" => _id,
        }
      } = response
    end

    test "invalid params, returns a error", %{conn: conn} do
      params = %{"cpf" => "texto", "phone" => "text"}

      response =
        conn
        |> post(Routes.students_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{
        "message" =>%{
          "name" => ["can't be blank"],
          "cpf" => ["has invalid format"],
          "gender" => ["can't be blank"],
          "payment_method" => ["can't be blank"],
          "phone" => ["is invalid"]
        }
      }

      assert expected_response == response
    end
  end

  describe "delete/2" do
    test "existing student with given id, deletes the student", %{conn: conn} do
     id = "7ffc29b2-daa1-44be-bd88-409ce5863fcd"

     insert(:student)

      _response =
        conn
        |> delete(Routes.students_path(conn, :delete, id))
        |> response(:no_content)

      assert _response = ""
    end
  end
end
