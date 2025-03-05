# 📊 Tutorial: Criando e Animando o Gráfico de Habilidades  

Este tutorial explica como gerar um gráfico animado em **R** utilizando `ggplot2`, `plotly` e `gganimate`.  

---

## 🛠️ Pré-requisitos  

Antes de começar, certifique-se de ter **R** e **RStudio** instalados. Além disso, instale as bibliotecas necessárias executando:  

```r
install.packages(c("ggplot2", "plotly", "RColorBrewer", "gganimate", "gifski"))

🔹 Passo 1: Carregar as Bibliotecas

library(ggplot2)
library(plotly)
library(RColorBrewer)
library(gganimate)
library(gifski)

🔹 Passo 2: Criar os Dados

data <- data.frame(
  Habilidade = c("SQL", "Inteligência Emocional", "R", "Dedicação", "Criatividade"),
  Nivel = c(6.5, 8, 7, 9, 8)
)

🔹 Passo 3: Criar o Gráfico Base

cores <- brewer.pal(5, "Pastel1")

p <- ggplot(data, aes(x = Habilidade, y = Nivel, fill = Habilidade)) +
  geom_bar(stat = "identity", width = 0.6, show.legend = FALSE) +
  scale_fill_manual(values = cores) +
  theme_minimal() +
  labs(title = "SELECT Habilidades FROM Lorena", x = "Habilidade", y = "Nível") +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 18))

🔹 Passo 4: Criar a Animação

anim <- p + 
  transition_states(Habilidade, transition_length = 2, state_length = 1) +
  enter_fade() + exit_fade()

Salvar o GIF animado:
animate(anim, renderer = gifski_renderer("Gráfico_animado.gif"), width = 800, height = 600, duration = 5)

🔹 Passo 5: Criar a Versão Interativa

fig <- ggplotly(p)
htmlwidgets::saveWidget(fig, "Gráfico_HTML.html")

🔹 Passo 6: Exportar o Gráfico Estático

ggsave("Gráfico_PNG.png", plot = p, width = 8, height = 6)

📁 Arquivos Gerados
Após rodar o código, os seguintes arquivos serão criados no diretório:

Gráfico_animado.gif → Animação do gráfico
Gráfico_HTML.html → Versão interativa
Gráfico_PNG.png → Versão estática
Agora você tem um gráfico dinâmico e estilizado para apresentar suas habilidades! 🚀
