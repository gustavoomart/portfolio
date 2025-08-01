Componente para Unity que aplica um **efeito de digitação estilo máquina de escrever** a textos do **TextMeshPro**, com suporte completo a **rich text**, tempo personalizado, aleatoriedade, múltiplos métodos de reprodução e efeitos adicionais como cursor(Caret) piscante.

Ideal para diálogos, cutscenes, tutoriais e interfaces narrativas em jogos.

### Funcionalidades

- **Animação de digitação tipo typewriter**
- **Suporte nativo a Rich Text** (`<b>`, `<i>`, `<color>`, etc.)
- **Temporização customizável**
- **Suporte a múltiplas mensagens assíncronas**
- **Cursor piscante opcional** (caret)
- Controle total sobre início, pausa e reinício da animação

### Exemplo de uso

```csharp
typingEffect.PlayTextsSequentially(
	2f,
	"Hello <color=red>World</color>!",
	"Hello <color=yellow>Again</color>!"
);
```
Totalmente compatível com Unity + TextMeshPro, com foco em flexibilidade, clareza visual e fácil integração em jogos narrativos ou educacionais.