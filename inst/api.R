library(plumber)
library(cafecomdados)

#* @apiTitle API do Café com Dados

#* Teste de conexão
#*
#* @get /teste
teste <- function(msg = "") {
  list(teste = "Sucesso! o R Está funcionando, Café com Dados em Produção.", R = paste0("2 + 2 = ", 2+2), mensagem = msg)
}

#* Predizer desligamento
#*
#* @param nivel_satisfacao  Nível de Satisfação. Entre 0 e 1.
#* @param ultima_avaliacao  Nota da última avaliação.
#* @param atuacao_projetos  Quantidade de projetos que atuou.
#* @param horas_trabalhadas  Quantidade de horas trabalhadas no último mês.
#* @param tempo_empresa  Tempo de empresa.
#* @param licenca_medica  Foi afastado por licença médica.
#* @param promocao_ultimos_3_anos Recebeu promoção nos últimos 3 anos.
#* @param area Área na empresa.
#* @param salario Nível do salário. String.
#*
#* @get /desligamento
#*
desligamento <- function(
  res,
  nivel_satisfacao = 0.5,
  ultima_avaliacao = 0.9,
  atuacao_projetos = 4,
  horas_trabalhadas = 220,
  tempo_empresa = 1,
  licenca_medica = "não licenciado",
  promocao_ultimos_3_anos = "não promovido",
  area = "comercial",
  salario = "baixo"
) {

  # monta data.frame
  novo_funcionario <- data.frame(
    nivel_satisfacao = as.numeric(nivel_satisfacao),
    ultima_avaliacao = as.numeric(ultima_avaliacao),
    atuacao_projetos = as.numeric(atuacao_projetos),
    horas_trabalhadas = as.numeric(horas_trabalhadas),
    tempo_empresa = as.numeric(tempo_empresa),
    licenca_medica = licenca_medica,
    promocao_ultimos_3_anos = promocao_ultimos_3_anos,
    area = area,
    salario = salario
  )

  predizer_desligamento(novo_funcionario)
}


