" my filetype file
if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  " Setting filetype for R
  au! BufNewFile,BufRead *.R,*.Rout,*.r,*.Rhistory,*.Rt,*.Rout.save,*.Rout.fail setf r

  " Setting filetype for Javascript
  au! BufNewFile,BufRead *.js,*.json,*.gs setf javascript

  " Setting filetype for .txt
  au! BufNewFile,BufRead *.txt setf txt

  " Setting filetype for tex
  au! BufNewFile,BufRead *.tex setf tex

  " Setting filetype for plists
  au! BufNewFile,BufRead *.plist setf plist
  "
  " Treat .rss files as XML
  au! BufNewFile,BufRead *.rss setf xml

  " Recognize tmux conf files
  au! BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux

  " Setting filetype for json
  au! BufRead,BufNewFile *.json setf json
augroup END
