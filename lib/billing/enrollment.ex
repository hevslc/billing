defmodule Billing.Enrollment do
  @moduledoc """
  Module for Enrollment Schema
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias Billing.{Payment, Institution, Student}

  @fields [
    :course_name,
    :course_value,
    :number_payments,
    :due_day,
    :institution_id,
    :student_id,
  ]

  @derive {Jason.Encoder, only: @fields ++ [:id]}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "enrollments" do
    field :course_name, :string
    field :course_value, :decimal
    field :number_payments, :integer
    field :due_day, :integer

    has_many :payments, Payment
    belongs_to :institution, Institution
    belongs_to :student, Student

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, %{} = params) do
    struct
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> validate_number(:course_value, greater_than: 0)
    |> validate_number(:number_payments, greater_than_or_equal_to: 1)
    |> validate_number(:due_day, greater_than_or_equal_to: 1, less_than_or_equal_to: 31)
  end
end
