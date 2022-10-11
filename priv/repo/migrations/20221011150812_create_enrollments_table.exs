defmodule Billing.Repo.Migrations.CreateEnrollmentsTable do
  use Ecto.Migration

  def change do
    create table :enrollments do
      add :course_value,        :decimal, null: false
      add :number_payments,     :integer, null: false
      add :due_day,             :integer, null: false
      add :course_name,         :string, null: false

      add :institution_id, references(:institutions, type: :binary_id, on_delete: :delete_all), null: false
      add :student_id, references(:students, type: :binary_id, on_delete: :delete_all), null: false

      timestamps()
    end
  end
end
