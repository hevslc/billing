defmodule BillingWeb.InstitutionsView do
  use BillingWeb, :view

  alias Billing.Institution

  def render("create.json", %{institution: %Institution{} = institution}) do
    %{
      message: "Institution created!",
      institution: %{
        id: institution.id,
        name: institution.name,
        cnpj: institution.cnpj,
        type: institution.type
      }
    }
  end

  def render("institution.json", %{institution: %Institution{} = institution}), do: %{institution: institution}
end
