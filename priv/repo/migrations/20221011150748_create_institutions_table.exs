defmodule Billing.Repo.Migrations.CreateInstitutionsTable do
  use Ecto.Migration

  def change do
    create table :institutions do
      add :name,    :string, null: false
      add :cnpj,    :string, null: false
      add :type,    :institution_type

      timestamps()
    end

    create unique_index(:institutions, [:name, :cnpj])
  end
end
