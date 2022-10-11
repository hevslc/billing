defmodule BillingWeb.InstitutionsController do
  use BillingWeb, :controller

  alias Billing.Institution
  alias BillingWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Institution{} = institution} <- Billing.create_institution(params) do
      conn
      |> put_status(:created)
      |> render("create.json", institution: institution)
    end
  end
end
