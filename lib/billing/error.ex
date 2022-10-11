defmodule Billing.Error do
  @moduledoc """
  Error handling module
  """
  @keys [:status, :result]

  @enforce_keys @keys

  defstruct @keys

  def build(status, result) do
    %__MODULE__{
      status: status,
      result: result
    }
  end

  def build_not_found, do: build(:not_found, "Not found")
end
