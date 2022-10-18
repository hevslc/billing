defmodule BillingWeb.InstitutionsController do
  use BillingWeb, :controller

  alias Billing.Institution
  alias BillingWeb.FallbackController

  action_fallback FallbackController

  def index(conn, _params) do
    with {:ok, institutions} <- Billing.get_all_institutions do
      conn
      |> put_status(:ok)
      |> render("index.json", institutions: institutions)
    end
  end

  def create(conn, params) do
    with {:ok, %Institution{} = institution} <- Billing.create_institution(params) do
      conn
      |> put_status(:created)
      |> render("create.json", institution: institution)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Institution{} = institution} <- Billing.get_institution_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("institution.json", institution: institution)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %Institution{}} <- Billing.delete_institution(id) do
      conn
      |> put_status(:no_content)
      |> text("")
    end
  end

  def update(conn, %{} = params) do
    with {:ok, %Institution{} = institution} <- Billing.update_institution(params) do
        conn
        |> put_status(:ok)
        |> render("institution.json", institution: institution)
    end
  end
end
