# Lógica Clássica Proposicional


O objetivo deste projeto é fornecer testes automatizados (em Elixir) para que alunos da disciplina Introdução à Lógica para Computação desenvolvam o código que passe nos testes.

As funcionalidades a serem implementadas são:
1. Verificação de sintaxe de fórmulas (verificar se uma fórmula é bem formada)
  - Inicialmente, sem receber como entrada uma linguagem.
  - Num segundo momento, recebendo como entrada uma linguagem, para verificar se os átomos da fórmula fazem parte da linguagem, se os conectivos fazem parte da linguagem, e se a aridade dos conectivos está correta.
2. Cálculo do tamanho (complexidade) de uma fórmula bem formada (fbf)
3. Subfórmulas
  - Verificar se uma fbf f1 é subfórmula de uma fbf f2
  - Verificar se uma fbf f1 é subfórmula própria de uma fbf f2
  - Calcular todas as subfórmulas de uma fbf f
  - Calcular todas as subfórmulas próprias de uma fbf f

## Representação de fórmulas

Seja P um conjunto de fórmula atômicas:

P={p1, p2, p3}

Seja uma linguagem L(P) com os conectivos:
- ! ("nao") de aridade 1
- & ("e") de aridade 2
- -> ("implica") de aridade 2
- | ("ou") de aridade 2

### Fórmulas atômicas


São representadas como átomos: :p1, :p2, :p3

### Fórmulas com negação

- {:nao, :p1}
- {:nao,  {:nao, :p2}}

### Fórmulas com "e"
- {:p1, :e, :p2}
- {:p1, :e, {:p2, :e, :p3}}

### Fórmulas com "ou"
- {:p1, :ou, :p2}
- {:p1, :ou, {:p2, :ou, :p3}}

### Fórmulas com "implica"
- {:p1, :implica, :p2}
- {:p1, :implica, {:p2, :implica, :p3}}

### Fórmula com vários conectivos
- {{:nao, :p1}, :implica, {{:nao, :p2}, :ou, {:p3, :e, :p4}}}
