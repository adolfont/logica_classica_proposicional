defmodule LogicaClassicaProposicionalConjuntoSubformulaTest do
  use ExUnit.Case
  doctest LogicaClassicaProposicional

  test "O conjunto de subfórmulas de p1 é p1" do
    assert LogicaClassicaProposicional.conjunto_subformulas(:p1) == MapSet.new([:p1])
  end

  test "O conjunto de subfórmulas de !p1 é {p1, !p1}" do
    assert LogicaClassicaProposicional.conjunto_subformulas({:nao, :p1}) ==
             MapSet.new([:p1, {:nao, :p1}])
  end

  test "O conjunto de subfórmulas de (p1&p2) é {p1, p2, (p1&p2) }" do
    assert LogicaClassicaProposicional.conjunto_subformulas({:p1, :e, :p2}) ==
             MapSet.new([:p1, :p2, {:p1, :e, :p2}])
  end

  test "O conjunto de subfórmulas de (p1&p1) é {p1, (p1&p1) }" do
    assert LogicaClassicaProposicional.conjunto_subformulas({:p1, :e, :p1}) ==
             MapSet.new([:p1, {:p1, :e, :p1}])
  end

  test "O conjunto de subfórmulas de (((p1&p1)->!(p2|p3))->(p2|p3)) é
  {p1, p2, ...}" do
    f1 = {:p1, :e, :p1}
    f2 = {:p2, :ou, :p3}
    f3 = {f1, :implica, {:nao, f2}}
    f4 = {f3, :implica, f2}

    subformulas_p4 = [
      :p1,
      :p2,
      :p3,
      {:nao, {:p2, :ou, :p3}},
      {:p1, :e, :p1},
      {:p2, :ou, :p3},
      {{:p1, :e, :p1}, :implica, {:nao, {:p2, :ou, :p3}}},
      {{{:p1, :e, :p1}, :implica, {:nao, {:p2, :ou, :p3}}}, :implica, {:p2, :ou, :p3}}
    ]

    assert LogicaClassicaProposicional.conjunto_subformulas(f4) == MapSet.new(subformulas_p4)
  end

  test "O conjunto de subfórmulas próprias de (p1&p1) é {p1}" do
    assert LogicaClassicaProposicional.conjunto_subformulas_proprias({:p1, :e, :p1}) ==
             MapSet.new([:p1])
  end
end
