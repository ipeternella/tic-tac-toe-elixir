defmodule TictactoeTest do
  use ExUnit.Case
  doctest Tictactoe

  test "Should format a number < 10 without a vertical bar prefix" do
    assert Tictactoe.get_formatted_number(2, false) == " 02 "
  end

  test "Should format a number < 10 with a vertical bar prefix" do
    assert Tictactoe.get_formatted_number(2, true) == "| 02 "
  end

  test "Should format a number >= 10 without a vertical bar prefix" do
    assert Tictactoe.get_formatted_number(10, false) == " 10 "
  end

  test "Should format a number >= 10 with a vertical bar prefix" do
    assert Tictactoe.get_formatted_number(10, true) == "| 10 "
  end
end
