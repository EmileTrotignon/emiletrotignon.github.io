(lang dune 3.10)

(using directory-targets 0.1)

(generate_opam_files true)

(package
 (name emiletrotignon_github_io)
 (synopsis "Generate my personal website from OCaml code and markdown files")
 (description "Generate my personal website from OCaml code and markdown files")
 (maintainers "Emile Trotignon <emile.trotignon@gmail.com>")
 (authors "Emile Trotignon")
 (homepage "https://emiletrotignon.github.io")
 (bug_reports "https://github.com/emiletrotignon/emiletrotignon.github.io/issues")
 (license "MIT")
 (depends
  (ocaml
   (>= 5.1))
  (ppx_deriving
   (>= 5.2.1))
  (bos
   (>= 0.2.1))
  (rresult
   (>= 0.7.0))
  (cmarkit
   (>= 0.3.0))
  (tyre
   (>= 1.0))
  (tyxml
   (>= 4.6.0))
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
  (embedded_ocaml_templates
   (>= 0.8))
  core
  dune))
