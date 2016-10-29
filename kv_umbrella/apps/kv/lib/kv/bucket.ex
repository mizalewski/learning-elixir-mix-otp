defmodule KV.Bucket do
  require Logger

  @doc """
  Starts KV bucket
  """
  def start_link do
    Agent.start_link(fn -> %{} end)
  end

  @doc """
  Puts the value to bucket for the given key
  """
  def put(bucket, key, value) do
    Logger.info("Puts key `#{inspect key}` with value: `#{inspect value}`")
    Agent.update(bucket, &Map.put(&1, key, value))
  end

  @doc """
  Gets a value from bucket by key
  """
  def get(bucket, key) do
    Logger.info("Gets value for key `#{inspect key}`")
    Agent.get(bucket, &Map.get(&1, key))
  end

  @doc """
  Deletes value from given key and returns deleted value
  """
  def delete(bucket, key) do
    Logger.info("Deletes key `#{inspect key}`")
    Agent.get_and_update(bucket, fn dict -> Map.pop(dict, key) end)
  end
end
