defmodule Umbrella.Common.Config do
  def secret_key_base() do
    System.get_env("UMBRELLA_SECRET_KEY_BASE", "pTlqYpnNuuhdjjy+uza2Ih+G6GdE8/nYiATPOT6PEAkcWTB4qjtH0+urfiYJwF0X")
  end

  def postgres_config(database_name) when is_binary(database_name) do
    [
      username: "postgres",
      password: "postgres",
      database: database_name,
      hostname: "localhost",
      show_sensitive_data_on_connection_error: true,
      pool_size: 5
    ]
  end

  def grenadier_port do
    6009
  end
end
