defmodule LogicaClassicaProposicionalSubformulaTest do
  use ExUnit.Case
  doctest LogicaClassicaProposicional

  test "p1 é uma subfórmula de p1" do
    assert LogicaClassicaProposicional.subformula?(:p1, :p1) == true
  end

  test "p1 é uma subfórmula de !(p1)" do
    assert LogicaClassicaProposicional.subformula?(:p1, {:nao, :p1}) == true
  end

  test "p2 não é uma subfórmula de !(p1)" do
    refute LogicaClassicaProposicional.subformula?(:p2, {:nao, :p1})
  end

  test "(p2&p1) é uma subfórmula de !(p2&p1)" do
    assert LogicaClassicaProposicional.subformula?({:p2, :e, :p1}, {:nao, {:p2, :e, :p1}}) == true
  end

  test "(p1&p2) não é uma subfórmula de !(p2&p1)" do
    refute LogicaClassicaProposicional.subformula?({:p1, :e, :p2}, {:nao, {:p2, :e, :p1}})
  end

  test "(p2&p1) é uma subfórmula de (p3&(p2&p1))" do
    assert LogicaClassicaProposicional.subformula?({:p2, :e, :p1}, {:p3, :e, {:p2, :e, :p1}}) ==
             true
  end

  test "(p2&p1) é uma subfórmula de (p3->(p2&p1))" do
    assert LogicaClassicaProposicional.subformula?(
             {:p2, :e, :p1},
             {:p3, :implica, {:p2, :e, :p1}}
           ) == true
  end

  test "(p2&p1) é uma subfórmula de (p3|(p2&p1))" do
    assert LogicaClassicaProposicional.subformula?({:p2, :e, :p1}, {:p3, :ou, {:p2, :e, :p1}}) ==
             true
  end

  test "p1 não é uma subfórmula própria de p1" do
    refute LogicaClassicaProposicional.subformula_propria?(:p1, :p1)
  end

  test "p1 é uma subfórmula própria de !p1" do
    assert LogicaClassicaProposicional.subformula_propria?(:p1, {:nao, :p1}) == true
  end

  test "(p1&p2) não é uma subfórmula própria de (p1&p2)" do
    refute LogicaClassicaProposicional.subformula_propria?({:p1, :e, :p2}, {:p1, :e, :p2})
  end
end
