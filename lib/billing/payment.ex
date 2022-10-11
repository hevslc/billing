defmodule Billing.Payment do
  @moduledoc """
  Module for Payment Schema
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias Billing.{Enrollment}

  @fields [:value, :due_date, :status, :enrollment_id]

  @derive {Jason.Encoder, only: @fields ++ [:id]}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "payments" do
    field :value, :decimal
    field :due_date, :date
    field :status, Ecto.Enum, values: [:open, :overdue, :paid]

    belongs_to :enrollment, Enrollment

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, %{} = params) do
    struct
    |> cast(params, @fields)
    |> validate_required(@fields)
  end
end
