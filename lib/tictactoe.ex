defmodule Tictactoe do
  @moduledoc """
  Module with main definitions for the tic-tac-toe game.
  """

  @doc """
  Main entry-point of the application.
  """
  def main(_args) do
    IO.puts("Welcome to Tic Tac Toe -- Elixir version!\n")
    board_size = 3

    print_board(board_size)
  end

  @doc """
  Prints the tic-tac-toe board for a given `board_size` size.

  Returns `:ok`.
  """
  @spec print_board(integer) :: :ok
  def print_board(board_size) do
    whole_board = 0..(board_size * board_size - 1) |> Enum.to_list()

    Enum.each(0..(board_size - 2), fn x ->
      row = Enum.to_list(Enum.slice(whole_board, x * board_size, board_size))

      print_numeric_row(row)
      print_row_division(row)
    end)

    print_numeric_row(Enum.slice(whole_board, (board_size - 1) * board_size, board_size))

    IO.puts("")
  end

  @doc """
  Prints row divisions (horizontal lines).

  Returns `:ok`.
  """
  def print_row_division(row_size) do
    row_len = length(row_size)

    Enum.each(
      0..(5 * row_len - 1),
      fn _x ->
        IO.write("-")
      end
    )

    IO.puts("")
  end

  @doc """
  Prints the numeric rows.

  Returns `:ok`.
  """
  def print_numeric_row(row) do
    head = hd(row)
    tail = tl(row)

    IO.write(get_formatted_number(head, false))

    Enum.each(tail, fn x ->
      IO.write(get_formatted_number(x, true))
    end)

    IO.puts("")
  end

  @doc """
  Formats numbers and returns a formatted string.

  Returns the formatted number.
  """
  def get_formatted_number(number, add_vertical_bar \\ false) do
    raw_number = to_string(number)

    prefixed_number =
      if number <= 9 do
        "0#{raw_number} "
      else
        "#{raw_number} "
      end

    if add_vertical_bar do
      "| #{prefixed_number}"
    else
      " #{prefixed_number}"
    end
  end
end

Tictactoe.main(nil)
