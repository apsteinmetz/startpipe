

#' @title start pipe
#'
#' @description Convert variable name to beginning of assignment pipe
#'
#' @param x an RStudioAPI document position.
#'
#' @return code that starts an assignment string
#' @export
#'
#' @importFrom  rstudioapi getActiveDocumentContext modifyRange document_position
#' 
#'
start_pipe = function(x) {

  context <- rstudioapi::getSourceEditorContext()
  if is.null(context$selection) {
    endcol<-context$selection[[1]]$range$end[2]
  }
  for (con in rev(context$selection))
  rstudioapi::modifyRange(con$range, to_snake_case(con$text), context$id)

}


#' @title Pipe Starter
#'
#' @description A function to take all text to the left of the cursor and use it as the pipe starter
#'
#' @param x chr A character string
#'
#' @return code that starts an assignment string
#' @export
#'
#' @examples
#' pipe_starter("myvar")
#'# myvar <- myvar %>% 



pipe_starter = function(x) {
  x <- paste(x," <- ",x," %>% ",sep = "")
  x
}


