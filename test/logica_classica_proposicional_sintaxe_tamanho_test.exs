defmodule LogicaClassicaProposicionalTamanhoTest do
  use ExUnit.Case
  doctest LogicaClassicaProposicional

  test "O tamanho de p1 é 1" do
    assert LogicaClassicaProposicional.tamanho(:p1) == 1
  end

  test "O tamanho de !p1 é 2" do
    assert LogicaClassicaProposicional.tamanho({:nao, :p1}) == 2
  end

  test "O tamanho de (p1&p2) é 3" do
    assert LogicaClassicaProposicional.tamanho({:p1, :e, :p2}) == 3
  end

  test "O tamanho de ((p1&p2)->!!p1) é 7" do
    assert LogicaClassicaProposicional.tamanho({{:p1, :e, :p2}, :implica, {:nao, {:nao, :p1}}}) ==
             7
  end

  test "O tamanho de um átomo que não seja uma fórmula bem formada lança uma exceção" do
    assert_raise ArithmeticError, fn ->
      LogicaClassicaProposicional.tamanho("p1")
    end
  end

  test "O tamanho de uma fórmula que não seja uma fórmula bem formada lança uma exceção" do
    assert_raise ArithmeticError, fn ->
      LogicaClassicaProposicional.tamanho({{:p1, :e, "p2", :ou}, :implica, {:nao, {:nao, :p1}}})
    end
  end
end
