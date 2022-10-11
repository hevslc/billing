defmodule Billing.Repo.Migrations.CreateInstitutionType do
  use Ecto.Migration

  def change do
    up_query = "CREATE TYPE institution_type AS ENUM ('university', 'school', 'daycare')"

    down_query = "DROP TYPE institution_type"

    execute(up_query, down_query)
  end
end
