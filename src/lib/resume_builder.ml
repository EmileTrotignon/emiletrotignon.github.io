open Resume

let latex_url text = "\\url{" ^ text ^ "}"

let make_full_url url =
  if String.starts_with ~prefix:"/" url then
    "https://emiletrotignon.github.io" ^ url
  else url

let strip_scheme url =
  if String.starts_with ~prefix:"https://" url then
    String.sub url 8 (String.length url - 8)
  else if String.starts_with ~prefix:"http://" url then
    String.sub url 7 (String.length url - 7)
  else url

let latex_link_renderer () =
  let base = Cmarkit_latex.renderer () in
  let inline c = function
    | Cmarkit.Inline.Link (link, _meta) -> (
      match Cmarkit.Inline.Link.reference link with
      | `Ref _ ->
          false
      | `Inline (link_def, _) -> (
        match Cmarkit.Link_definition.dest link_def with
        | None ->
            false
        | Some (url, _) ->
            let full_url = make_full_url url in
            let display_url = strip_scheme full_url in
            Cmarkit_renderer.Context.string c {|\href{|} ;
            Cmarkit_renderer.Context.string c full_url ;
            Cmarkit_renderer.Context.string c "}{" ;
            Cmarkit_renderer.Context.inline c (Cmarkit.Inline.Link.text link) ;
            Cmarkit_renderer.Context.string c {| \mbox{(|} ;
            Cmarkit_latex.latex_escaped_string c display_url ;
            Cmarkit_renderer.Context.string c ")}" ;
            Cmarkit_renderer.Context.string c "}" ;
            true ) )
    | _ ->
        false
  in
  Cmarkit_renderer.compose base (Cmarkit_renderer.make ~inline ())

let to_latex (resume : t) language =
  let renderer = latex_link_renderer () in
  let md_printer = Cmarkit_renderer.doc_to_string renderer in
  let escaper = Escapers.latex in
  let open Multi_string in
  match language with
  | French ->
      Templates.latex (to_t' ~escaper language md_printer resume) Sections.fr
  | English ->
      Templates.latex (to_t' ~escaper language md_printer resume) Sections.en

let html_escaper_pattern = Tyre.(compile (const "<br>" (str "\n")))

let to_html (resume : t) language =
  let md_printer = Cmarkit_html.of_doc ~safe:false in
  let escaper s = Result.get_ok Tyre.(replace html_escaper_pattern Fun.id s) in
  Multi_string.(
    match language with
    | French ->
        to_t' ~escaper language md_printer resume
    | English ->
        to_t' ~escaper language md_printer resume )
