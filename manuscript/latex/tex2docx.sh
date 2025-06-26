pandoc manuscript.tex \
  --from latex \
  --to docx \
  --output manuscript-zotero.docx \
  --lua-filter=zotero.lua \
--citeproc \
--bibliography bibliography.bib