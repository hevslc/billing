defmodule BillingWeb.InstitutionsViewTest do
  use BillingWeb.ConnCase, async: true

  import Phoenix.View
  import Billing.Factory
  alias BillingWeb.InstitutionsView

  test "renders create.json" do
    institution = build(:institution)

    response = render(InstitutionsView, "create.json", institution: institution)

    assert  %{
      institution: %{
        cnpj: "72887390000174",
        id: "7ffc29b2-daa1-44be-bd88-409ce5863fcd",
        name: "Institution Name",
        type: :university
      },
      message: "Institution created!"
    } = response
  end
end
