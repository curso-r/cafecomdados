#' Faz predição de desligamento
#'
#' @param novo_funcionario data.frame com as informacoes do funcionario
#'
#' @export
predizer_desligamento <- function(novo_funcionario) {
  predict(modelo_final, new_data = novo_funcionario, type = "prob")
}

#' Iniciar API
#'
#' @param host endereço do host.
#' @param port porta.
#'
#' @export
iniciar_api <- function(
  host = "127.0.0.1",
  port = 7676
) {
  p <- plumber::plumb(system.file("api.R", package = "cafecomdados"))

  p$run(
    host = host,
    port = port,
    swagger = TRUE
  )
}
