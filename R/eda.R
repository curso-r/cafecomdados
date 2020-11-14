#' Highchart Correlation Plot
#'
#' @param corr_mat an matrix, usually returned by [stats::cor]
#'
#' @example
#'
#' # hchart_corr(cor(mtcars))
#'
#' @export
hchart_corr <- function(corr_mat) {
  corr_mat%>%
    hchart() %>%
    hc_plotOptions(
      series = list(
        dataLabels = list(
          enabled = TRUE,
          formatter = JS("function(){return Highcharts.numberFormat(this.point.value, 2);}")
        )
      )
    )
}


