defmodule LogicaClassicaProposicionalComLinguagemTest do
  use ExUnit.Case
  doctest LogicaClassicaProposicional

  # Versão com verificação de átomos e aridades
  @lpc {[:p1, :p2, :p3], %{:nao => 1, :e => 2, :ou => 2, :implica => 2}}

  # Fórmulas atômicas
  test ":p1 é bem formada" do
    assert LogicaClassicaProposicional.formula_bem_formada?(:p1, @lpc) == true
  end

  test "1 não é bem formada" do
    refute LogicaClassicaProposicional.formula_bem_formada?(1, @lpc)
  end

  test "a string p1 não é bem formada" do
    refute LogicaClassicaProposicional.formula_bem_formada?("p1", @lpc)
  end

  test ":p4 não é bem formada, pois não está na linguagem" do
    refute LogicaClassicaProposicional.formula_bem_formada?(:p4, @lpc)
  end

  # Fórmulas com negação
  test "!p1 é bem formada" do
    assert LogicaClassicaProposicional.formula_bem_formada?({:nao, :p1}, @lpc) == true
  end

  test "!!p1 é bem formada" do
    assert LogicaClassicaProposicional.formula_bem_formada?({:nao, {:nao, :p1}}, @lpc) == true
  end

  test "!p1! não é bem formada" do
    refute LogicaClassicaProposicional.formula_bem_formada?({:nao, :p1, :nao}, @lpc)
  end

  # Fórmulas com e
  test "(p1&p2) é bem formada" do
    assert LogicaClassicaProposicional.formula_bem_formada?({:p1, :e, :p2}, @lpc) == true
  end

  test "(p1&(p2&p3)) é bem formada" do
    assert LogicaClassicaProposicional.formula_bem_formada?({:p1, :e, {:p2, :e, :p3}}, @lpc) ==
             true
  end

  test "(p1&p2&p3) não é bem formada" do
    refute LogicaClassicaProposicional.formula_bem_formada?({:p1, :e, :p2, :e, :p3}, @lpc)
  end

  # Fórmulas com ou
  test "(p1|p2) é bem formada" do
    assert LogicaClassicaProposicional.formula_bem_formada?({:p1, :ou, :p2}, @lpc) == true
  end

  test "(p1|(p2|p3)) é bem formada" do
    assert LogicaClassicaProposicional.formula_bem_formada?({:p1, :ou, {:p2, :ou, :p3}}, @lpc) ==
             true
  end

  test "(p1|p2|p3) não é bem formada" do
    refute LogicaClassicaProposicional.formula_bem_formada?({:p1, :ou, :p2, :ou, :p3}, @lpc)
  end

  # Fórmulas com implica
  test "(p1->p2) é bem formada" do
    assert LogicaClassicaProposicional.formula_bem_formada?({:p1, :implica, :p2}, @lpc) == true
  end

  test "(p1->(p2->p3)) é bem formada" do
    assert LogicaClassicaProposicional.formula_bem_formada?(
             {:p1, :implica, {:p2, :implica, :p3}},
             @lpc
           ) == true
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
