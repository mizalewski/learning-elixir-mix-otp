defmodule KV.Bucket do
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
    Agent.update(bucket, fn map -> Map.put(map, key, value) end)
  end

  @doc """
  Gets a value from bucket by key
  """
  def get(bucket, key) do
    Agent.get(bucket, fn map -> Map.get(map, key) end)
  end
end
