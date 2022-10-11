defmodule Billing.Factory do
  use ExMachina.Ecto, repo: Billing.Repo
  alias Billing.{Institution, Student, Enrollment, Payment}

  def institution_params_factory do
    %{
      "name" => "Institution name",
      "cnpj" => "72887390000174",
      "type" => "university",
    }
  end

  def institution_factory do
    %Institution{
      name: "Institution Name",
      type: :university,
      cnpj: "72887390000174",
      id: "7ffc29b2-daa1-44be-bd88-409ce5863fcd",
    }
  end

  def student_params_factory do
    %{
      "name" => "Student name",
      "cpf" => "04319286065",
      "birth_date" => "1998-01-01",
      "phone" => 123,
      "gender" => "f",
      "payment_method" => "card",
    }
  end

  def student_factory do
    %Student{
      name: "Student name",
      cpf: "04319286065",
      birth_date: "1998-01-01",
      phone: 123,
      gender: "f",
      payment_method: "card",
      id: "7ffc29b2-daa1-44be-bd88-409ce5863fcd",
    }
  end

  def enrollment_params_factory do
    %{
      "course_value" => 300,
      "number_payments" => 2,
      "due_day" => 5,
      "course_name" => "Biologia",
      "student_id" => "b721fcad-e6e8-4e8f-910b-6911f2158b4a",
      "institution_id" => "b721fcad-e6e8-4e8f-910b-6911f2158b4a",
    }
  end

  def enrollment_factory do
    %Enrollment{
      course_value: 300,
      number_payments: 2,
      due_day: 5,
      course_name: "Biologia",
      student_id: "b721fcad-e6e8-4e8f-910b-6911f2158b4a",
      institution_id: "b721fcad-e6e8-4e8f-910b-6911f2158b4a",
      id: "7ffc29b2-daa1-44be-bd88-409ce5863fcd",
    }
  end

  def payment_params_factory do
    %{
      "value" =>  600.00,
      "due_date" =>  "2022-09-05",
      "status" =>   "open",
      "enrollment_id" =>  "7ffc29b2-daa1-44be-bd88-409ce5863fcd",
    }
  end

  def payment_factory do
    %Payment{
      value: 600.00,
      due_date: "2022-09-05",
      status: :open,
      enrollment_id: "7ffc29b2-daa1-44be-bd88-409ce5863fcd",
      id: "7ffc29b2-daa1-44be-bd88-409ce5863fcd",
    }
  end
end
