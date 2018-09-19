

#' @title start pipe
#'
#' @description Convert variable name to beginning of assignment pipe
#'
#' @param x an RStudioAPI document position.
#'
#' @return
#' @export
#'
#' @importFrom  rstudioapi getSourceEditorContext insertText document_range
#' 
#'
start_pipe = function() {

  context <- rstudioapi::getSourceEditorContext()
  if (context$selection[[1]]$text=="") {
    cursorpos <- context$selection[[1]]$range$end
    endcol<-cursorpos[2]
    endrow<- cursorpos[1]
    #take whole line before endcol
    startcol <- 1 #1-based index
    setSelectionRanges(document_range(c(endrow,1),c(endrow,endcol))) %>% 
      trimws()
    varname<-rstudioapi::getSourceEditorContext()$selection[[1]]$text %>% trimws()
    insertText(cursorpos,pipe_starter(varname))
    
  }
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


