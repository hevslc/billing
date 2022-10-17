defmodule Billing.Enrollments.Create do
  @moduledoc """
  Module for Enrollment creation
  """
  alias Billing.{Enrollment, Payments, Error, Repo}

  def call(%{} = params) do
    params
    |> Enrollment.changeset
    |> Repo.insert
    |> handle_insert
    |> get_due_date
    |> get_payment_value
    |> create_payments
  end

  def call(_anything), do: "Enter the data in a map format"

  defp handle_insert({:ok, %Enrollment{}} = result), do: result

  defp handle_insert({:error, changeset}) do
    {:error, Error.build(:bad_request, changeset)}
  end

  defp get_due_date({:ok, enrollment}) do
    today = DateTime.now!("Etc/UTC")
    due_date = %Date{day: enrollment.due_day, month: today.month, year: today.year}
    due_date = if today.day > enrollment.due_day, do: increase_month(due_date), else: due_date
    {enrollment, due_date}
  end

  defp get_due_date(error), do: error

  defp get_payment_value({enrollment, due_date}) do
    payment_value = Decimal.div(enrollment.course_value, enrollment.number_payments)
    {enrollment, due_date, payment_value, enrollment.number_payments}
  end

  defp create_payments({enrollment, due_date, value, counter}) do
    case create_payment(due_date, value, enrollment.id) do
      {:error, error} -> {:error, error}
      _ ->
        counter = counter - 1
        due_date = increase_month(due_date)
        case counter == 0 do
          true -> {:ok, enrollment}
          false -> create_payments({enrollment, due_date, value, counter})
        end
    end
  end

  defp create_payment(due_date, value, id) do
    Payments.Create.call(%{
      value: value,
      due_date: due_date,
      status: :open,
      enrollment_id: id,
    })
  end

  defp increase_month(date) do
    case date.month + 1 > 12 do
      true -> %Date{day: date.day, month: 1, year: (date.year + 1)}
      false -> %Date{day: date.day, month: (date.month + 1), year: date.year}
    end
  end
end
