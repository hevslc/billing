defmodule Billing.Institution do
  @moduledoc """
  Module for Institution Schema
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias Billing.{Enrollment}

  @fields [:name, :cnpj, :type]

  @unique_fields [:name, :cnpj]

  @derive {Jason.Encoder, only: @fields ++ [:id]}

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "institutions" do
    field :name, :string
    field :cnpj, :string
    field :type, Ecto.Enum, values: [:university, :school, :daycare]

    has_many :enrollments, Enrollment

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, %{} = params) do
    struct
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> unique_constraint(@unique_fields)
    |> validate_format(:cnpj, ~r/^\d+$/)
  end
end
