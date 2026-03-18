if (!require("httr")) install.packages("httr")
if (!require("jsonlite")) install.packages("jsonlite")

library(httr)
library(jsonlite)

# 1. Definição dos parâmetros da API (Exemplo: São Paulo)
# Latitude e Longitude para São Paulo
lat <- -23.5505
lon <- -46.6333
url <- paste0("https://api.open-meteo.com/v1/forecast?latitude=", lat, 
              "&longitude=", lon, "&current_weather=true")

# 2. Requisição dos dados
response <- GET(url)

# 3. Processamento dos dados
if (status_code(response) == 200) {
  data <- fromJSON(content(response, "text", encoding = "UTF-8"))
  clima_atual <- data$current_weather
  
  # 4. Exibição dos dados no terminal
  cat("\n" , "="*40, "\n")
  cat("   FARMTECH SOLUTIONS - MONITORAMENTO CLIMÁTICO\n")
  cat("="*40, "\n\n")
  
  cat("Localização: São Paulo, Brasil\n")
  cat("Temperatura Atual:", clima_atual$temperature, "°C\n")
  cat("Velocidade do Vento:", clima_atual$windspeed, "km/h\n")
  cat("Horário da Medição:", clima_atual$time, "\n")
  
  cat("   DADOS COLETADOS COM SUCESSO!\n")

  
} else {
  cat("Erro ao conectar com a API Meteorológica.\n")
}

