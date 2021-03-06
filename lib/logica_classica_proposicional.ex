defmodule LogicaClassicaProposicional do
  @moduledoc """
  Documentação para LogicaClassicaProposicional.
  """

  @doc """
  Verifica se uma fórmula é bem formada.
  """
  def formula_bem_formada?(_) do
    :error
  end

  @doc """
  Verifica se uma fórmula é bem formada de acordo com uma linguagem.
  """
  def formula_bem_formada?(_, _) do
    :error
  end

  @doc """
  Calcula o tamanho de uma fórmula bem formada
  """
  def tamanho(_) do
    :error
  end

  @doc """
  Verifica se uma fórmula1 é subfórmula de fórmula2.
  """
  def subformula?(_, _) do
    :error
  end

  @doc """
  Verifica se uma fórmula1 é subfórmula própria de fórmula2.
  """
  def subformula_propria?(_, _) do
    :error
  end

  @doc """
  Calcula o conjunto de subfórmulas de uma fórmula.
  """
  def conjunto_subformulas(_) do
    :error
  end

  @doc """
  Calcula o conjunto de subfórmulas próprias de uma fórmula.
  """
  def conjunto_subformulas_proprias(_) do
    :error
  end
end
