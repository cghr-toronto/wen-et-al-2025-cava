pandoc manuscript/latex/manuscript.tex \
  --from latex \
  --to docx \
  --output manuscript/latex/manuscript-zotero.docx \
  --lua-filter=manuscript/latex/zotero.lua \
--citeproc \
--bibliography manuscript/latex/bibliography.bib