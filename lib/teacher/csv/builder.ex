defmodule Teacher.CSV.Builder do

  def to_csv(headers, records) do
    Enum.reduce(records, [headers], fn(record, acc) ->
      row =
        Enum.map(headers, fn(header) ->
          Map.get(record, header)
        end)
      acc ++ [row]
    end)
    |> CSV.encode()
    |> Enum.to_list()
  end

end
