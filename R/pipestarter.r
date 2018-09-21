

#' @title start pipe
#'
#' @description Convert variable name to beginning of assignment pipe
#'
#' @param
#' @return
#' @export
#'
#' @importFrom  rstudioapi getSourceEditorContext insertText document_range setSelectionRanges
#' 
#'
start_pipe = function() {

  context <- rstudioapi::getSourceEditorContext()
  cursorpos <- context$selection[[1]]$range$end
  endcol<-cursorpos[2]
  endrow<- cursorpos[1]
  if (context$selection[[1]]$text=="") {
    #take whole line before endcol
    startcol <- 1 #1-based index
    rstudioapi::setSelectionRanges(rstudioapi::document_range(c(endrow,1),c(endrow,endcol)))
    context <- rstudioapi::getSourceEditorContext()
  }
  varname<-trimws(context$selection[[1]]$text)
  rstudioapi::insertText(cursorpos,pipe_starter(varname))
  #deselct text
  endrange <- rstudioapi::getSourceEditorContext()$selection[[1]]$range$end
  rstudioapi::setSelectionRanges(rstudioapi::document_range(endrange,endrange))
  
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
#'<- myvar %>% 


pipe_starter = function(x) {
  x <- paste(" <- ",x," %>% ",sep = "")
  x
}


