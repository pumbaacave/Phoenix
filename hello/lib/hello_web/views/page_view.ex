defmodule HelloWeb.PageView do
  use HelloWeb, :view

  def handler_info(conn) do
    "Request Handled BY: #{controller_module conn}.#{action_name conn}"
  end

  def connection_keys(conn) do
    conn
    |> Map.from_struct()
    |> Enum.map(fn {key, value} -> {key, value} end)
  end
end
