open Resume

let latex_url text = "\\url{" ^ text ^ "}"

let latex_link_transform doc =
  let inline _m = function
    | Cmarkit.Inline.Link (link, meta) -> (
      match Cmarkit.Inline.Link.reference link with
      | `Ref _ ->
          `Default
      | `Inline (link_def, meta') -> (
        match Cmarkit.Link_definition.dest link_def with
        | None ->
            `Default
        | Some (url, url_meta) ->
            let original_text = Cmarkit.Inline.Link.text link in
            let full_url =
              if String.starts_with ~prefix:"http" url then url
              else "emiletrotignon.github.io" ^ url
            in
            let url_suffix =
              Cmarkit.Inline.Text (" (" ^ full_url ^ ")", Cmarkit.Meta.none)
            in
            let new_text =
              Cmarkit.Inline.Inlines
                ([original_text; url_suffix], Cmarkit.Meta.none)
            in
            let full_link_def =
              Cmarkit.Link_definition.(
                make ~layout:(layout link_def)
                  ~defined_label:(defined_label link_def)
                  ?label:(label link_def)
                  ~dest:(full_url, url_meta)
                  ?title:(title link_def) () )
            in
            let new_link =
              Cmarkit.Inline.Link.make new_text (`Inline (full_link_def, meta'))
            in
            Cmarkit.Mapper.ret (Cmarkit.Inline.Link (new_link, meta)) ) )
    | _ ->
        `Default
  in
  Cmarkit.Mapper.(map_doc (make ~inline ()) doc)

let to_latex (resume : t) language =
  let md_printer doc = Cmarkit_latex.of_doc (latex_link_transform doc) in
  let escaper = Escapers.latex in
  Multi_string.(
    match language with
    | French ->
        Templates.latex_fr (to_t' ~escaper language md_printer resume)
    | English ->
        Templates.latex_en (to_t' ~escaper language md_printer resume) )

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
