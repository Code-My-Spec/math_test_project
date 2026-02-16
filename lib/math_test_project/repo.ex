defmodule MathTestProject.Repo do
  use Ecto.Repo,
    otp_app: :math_test_project,
    adapter: Ecto.Adapters.Postgres
end
