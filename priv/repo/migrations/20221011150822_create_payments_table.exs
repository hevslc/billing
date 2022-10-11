defmodule Billing.Repo.Migrations.CreatePaymentsTable do
  use Ecto.Migration

  def change do
    create table :payments do
      add :value,       :decimal, null: false
      add :due_date,    :date, null: false
      add :status,      :status, null: false

      add :enrollment_id, references(:enrollments, type: :binary_id, on_delete: :delete_all), null: false

      timestamps()
    end
  end
end
