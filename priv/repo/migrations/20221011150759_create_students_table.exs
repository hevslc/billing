defmodule Billing.Repo.Migrations.CreateStudentsTable do
  use Ecto.Migration

  def change do
    create table :students do
      add :name,            :string, null: false
      add :cpf,             :string, null: false
      add :birth_date,      :date
      add :phone,           :integer
      add :gender,          :gender, null: false
      add :payment_method,  :payment_method, null: false

      timestamps()
    end

    create unique_index(:students, [:name, :cpf] )
  end
end
