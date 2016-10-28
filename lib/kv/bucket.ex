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
    Agent.update(bucket, &Map.put(&1, key, value))
  end

  @doc """
  Gets a value from bucket by key
  """
  def get(bucket, key) do
    Agent.get(bucket, &Map.get(&1, key))
  end

  @doc """
  Deletes value from given key and returns deleted value
  """
  def delete(bucket, key) do
    Agent.get_and_update(bucket, &Map.pop(&1, key) ) 
  end
end
