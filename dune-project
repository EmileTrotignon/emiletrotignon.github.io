(lang dune 3.10)

(using directory-targets 0.1)

(package
 (name emiletrotignon_github_io)
 (synopsis
  "Generate my personnal website from OCaml code and markdown files")
 (description
  "Generate my personnal website from OCaml code and markdown files")
 (depends
  (ocaml
   (>= 5.1))
  (ppx_deriving
   (>= 5.2.1))
  (bos
   (>= 0.2.1))
  (cmarkit
   (>= 0.3.0))
  (tyre
   (>= 0.5))
  (tyxml
   (>= 5.1))
  (cmdliner
   (>= 1.3.0))
  (brr
   (>= 0.0.8))
  highlexer
  (ocamlgraph
   (>= 2.2.0))
  (gg
   (>= 1.0.0))
  (vg
   (>= 0.9.5))
  core
  dune))
