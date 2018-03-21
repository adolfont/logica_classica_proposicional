defmodule LogicaClassicaProposicionalTest do
  use ExUnit.Case
  doctest LogicaClassicaProposicional

  # Versão sem verificar átomos e aridades

  # Fórmulas atômicas
  test ":p1 é bem formada" do
    assert LogicaClassicaProposicional.formula_bem_formada?(:p1) == true
  end

  test "1 não é bem formada" do
    refute LogicaClassicaProposicional.formula_bem_formada?(1)
  end

  test "a string p1 não é bem formada" do
    refute LogicaClassicaProposicional.formula_bem_formada?("p1")
  end

  # Fórmulas com negação
  test "!p1 é bem formada" do
    assert LogicaClassicaProposicional.formula_bem_formada?({:nao, :p1}) == true
  end

  test "!!p1 é bem formada" do
    assert LogicaClassicaProposicional.formula_bem_formada?({:nao, {:nao, :p1}}) == true
  end

  test "!p1! não é bem formada" do
    refute LogicaClassicaProposicional.formula_bem_formada?({:nao, :p1, :nao})
  end

  # Fórmulas com e
  test "(p1&p2) é bem formada" do
    assert LogicaClassicaProposicional.formula_bem_formada?({:p1, :e, :p2}) == true
  end

  test "(p1&(p2&p3)) é bem formada" do
    assert LogicaClassicaProposicional.formula_bem_formada?({:p1, :e, {:p2, :e, :p3}}) == true
  end

  test "(p1&p2&p3) não é bem formada" do
    refute LogicaClassicaProposicional.formula_bem_formada?({:p1, :e, :p2, :e, :p3})
  end

  # Fórmulas com ou
  test "(p1|p2) é bem formada" do
    assert LogicaClassicaProposicional.formula_bem_formada?({:p1, :ou, :p2}) == true
  end

  test "(p1|(p2|p3)) é bem formada" do
    assert LogicaClassicaProposicional.formula_bem_formada?({:p1, :ou, {:p2, :ou, :p3}}) == true
  end

  test "(p1|p2|p3) não é bem formada" do
    refute LogicaClassicaProposicional.formula_bem_formada?({:p1, :ou, :p2, :ou, :p3})
  end

  # Fórmulas com implica
  test "(p1->p2) é bem formada" do
    assert LogicaClassicaProposicional.formula_bem_formada?({:p1, :implica, :p2}) == true
  end

  test "(p1->(p2->p3)) é bem formada" do
    assert LogicaClassicaProposicional.formula_bem_formada?({:p1, :implica, {:p2, :implica, :p3}}) ==
             true
  end

  test "(p1->p2->p3) não é bem formada" do
    refute LogicaClassicaProposicional.formula_bem_formada?({:p1, :implica, :p2, :implica, :p3})
  end

  # Fórmulas com vários conectivos
  test "(!p1->(!p2|(p3&p4))) é bem formada" do
    assert LogicaClassicaProposicional.formula_bem_formada?(
             {{:nao, :p1}, :implica, {{:nao, :p2}, :ou, {:p3, :e, :p4}}}
           ) == true
  end

  test "(!p1->(!p2|p3&p4)) não é bem formada" do
    refute LogicaClassicaProposicional.formula_bem_formada?(
             {{:nao, :p1}, :implica, {{:nao, :p2}, :ou, :p3, :e, :p4}}
           )
  end
end
