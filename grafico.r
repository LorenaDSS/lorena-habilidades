# 📊 Gráfico de Habilidades

library(ggplot2)
library(plotly)
library(RColorBrewer)
library(gganimate)
library(gifski)

data <- data.frame(
  Habilidade = c("SQL", "Inteligência Emocional", "R", "Dedicação", "Criatividade"),
  Nivel = c(6.5, 8, 7, 9, 8)
)

cores <- brewer.pal(5, "Pastel1")

p <- ggplot(data, aes(x = Habilidade, y = Nivel, fill = Habilidade)) +
  geom_bar(stat = "identity", width = 0.6, show.legend = FALSE) +
  scale_fill_manual(values = cores) +
  theme_minimal() +
  labs(title = "SELECT Habilidades FROM Lorena", x = "Habilidade", y = "Nível") +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 18))

anim <- p + 
  transition_states(Habilidade, transition_length = 2, state_length = 1) +
  enter_fade() + exit_fade()

animate(anim, renderer = gifski_renderer("Gráfico_animado.gif"), width = 800, height = 600, duration = 5)

fig <- ggplotly(p)
htmlwidgets::saveWidget(fig, "Gráfico.html")

ggsave("Gráfico.png", plot = p, width = 8, height = 6)

