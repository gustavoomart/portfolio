**FCS** é uma extensão para projetos Flutter que fornece um snippet para **visualizar e utilizar as cores do seu `ColorScheme`** do **Material Design 3** diretamente no VSCode, durante o tempo de desenvolvimento.

Ideal para acelerar o uso consciente de cores em temas do **Material Design 3**, com suporte a snippets para pré-visualização das cores e integração com configurações do `ColorScheme.fromSeed`.

### Funcionalidades

- **Snippet** com preview visual das cores do tema
- Ativação rápida usando `cs.` (ex: `cs.primary`, `cs.secondaryContainer`)
- **Comandos para definir propriedades do tema** diretamente via command palette:
  - `FCS Set All`
  - `FCS Set Seed Color`
  - `FCS Set Brightness`
  - `FCS Set Dynamic Scheme Variant`
  - `FCS Set Contrast Level`
- Sem necessidade de configurar todas as variáveis de uma vez — cada uma pode ser ajustada individualmente
- Visualização de cores no próprio editor antes de selecionar

Em qualquer lugar que use uma cor, digite `cs.` para acionar o snippet:
```dart
Container(
    color: cs. // mostra opções como colorScheme.primary, etc.
)
```

Após a seleção, o snippet é substituído automaticamente pela referência correta:

```dart
Container(
  color: Theme.of(context).colorScheme.primaryContainer,
)
```
Benefícios
- Reduz erros e repetições ao trabalhar com temas
- Aumenta a produtividade e consistência visual
- Útil para times que usam Material You / Material 3 e temas dinâmicos

***A extensão esta dísponivel no MarketPlace do VSCode, e é OpenSource!***