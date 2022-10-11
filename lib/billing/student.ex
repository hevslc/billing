defmodule Billing.Student do
  @moduledoc """
  Module for Student Schema
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias Billing.{Enrollment}

  @fields [:name, :cpf, :birth_date, :phone, :gender, :payment_method]

  @derive {Jason.Encoder, only: @fields ++ [:id]}

  @required_fields [:name, :cpf, :gender, :payment_method]

  @unique_fields [:name, :cpf]

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "students" do
    field :name, :string
    field :cpf, :string
    field :birth_date, :date
    field :phone, :integer
    field :gender, Ecto.Enum, values: [:f, :m]
    field :payment_method, Ecto.Enum, values: [:card, :boleto]

    has_many :enrollments, Enrollment, on_delete: :delete_all

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, %{} = params) do
    struct
    |> cast(params, @fields)
    |> validate_required(@required_fields)
    |> unique_constraint(@unique_fields)
    |> validate_format(:cpf, ~r/^\d+$/)
  end
end
