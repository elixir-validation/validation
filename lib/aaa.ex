defmodule Aaa do
  alias Validation, as: V

  def aaa do
    IO.inspect V.mac_address("90-bc-d3-1a-dd-cc")
  end
end
