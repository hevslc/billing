defmodule BillingWeb.InstitutionsView do
  use BillingWeb, :view
  alias Billing.Institution
  alias BillingWeb.InstitutionsView

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

  def render("index.json", %{institutions: institutions}) do
    %{institutions: render_many(institutions, InstitutionsView, "institution.json")}
  end
end
