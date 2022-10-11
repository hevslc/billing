# defmodule BillingWeb.EnrollmentsControllerTest do
#   @moduledoc """
#   Enrollment controller test
#   """
#   use BillingWeb.ConnCase, async: true

#   import Billing.Factory
#   alias Billing.{Error, Students, Institutions}

#   describe "create/2" do
#     test "valid params, creates the enrollment", %{conn: conn} do
#       student_params = build(:student_params)
#       {:ok, student} = Students.Create.call(student_params)

#       institution_params = build(:institution_params)
#       {:ok, institution} = Institutions.Create.call(institution_params)

#       institution_id = institution.id
#       student_id = student.id

#       params = build(:enrollment_params, %{"student_id" => student_id, "institution_id" => institution_id})

#       response =
#         conn
#         |> post(Routes.enrollments_path(conn, :create, params))
#         |> json_response(:created)


#       assert %{
#         "message" => "Enrollment created!",
#         "enrollment" =>  %{
#           "course_value" => 300,
#           "number_payments" => 2,
#           "due_day" => 5,
#           "course_name" => "Biologia",
#           "student_id" => _student_id,
#           "institution_id" => _institution_id,
#           "id" => _id,
#         }
#       } = response
#     end

#     test "invalid params, returns a error", %{conn: conn} do
#       params = %{"cpf" => "texto", "phone" => "text"}

#       response =
#         conn
#         |> post(Routes.enrollments_path(conn, :create, params))
#         |> json_response(:bad_request)

#       expected_response = %{
#         "message" =>%{
#           "name" => ["can't be blank"],
#           "cpf" => ["has invalid format"],
#           "gender" => ["can't be blank"],
#           "payment_method" => ["can't be blank"],
#           "phone" => ["is invalid"]
#         }
#       }

#       assert expected_response == response
#     end
#   end

#   describe "delete/2" do
#     test "existing enrollment with given id, deletes the enrollment", %{conn: conn} do
#      id = "7ffc29b2-daa1-44be-bd88-409ce5863fcd"

#      insert(:enrollment)

#       _response =
#         conn
#         |> delete(Routes.enrollments_path(conn, :delete, id))
#         |> response(:no_content)

#       assert _response = ""
#     end
#   end
# end
