defmodule AqDemo.Repo do
  use Ecto.Repo,
    otp_app: :aq_demo,
    adapter: Ecto.Adapters.Postgres
end
