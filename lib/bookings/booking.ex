defmodule Flightex.Bookings.Booking do
  @keys [:complete_date, :local_origin, :local_destination, :user_id, :id]
  @enforce_keys @keys
  defstruct @keys

  def build([year, month, day, hour, minute, second], local_origin, local_destination, user_id) do
    {:ok,
    %__MODULE__{
      id: UUID.uuid4(),
      complete_date: NaiveDateTime.new(year, month, day, hour, minute, second),
      local_origin: local_origin,
      local_destination: local_destination,
      user_id: user_id,
    }}

  end


  def build(_complete_date, _local_origin, _local_destination), do: {:error, "Need more Parameters"}
  def build(_complete_date, _local_origin), do: {:error, "Need more Parameters"}
  def build(_complete_date), do: {:error, "Need more Parameters"}
  def build(), do: {:error, "This function need parameters"}
end