open Resume_lib

let write_all path data =
  Out_channel.with_open_text path (fun oc -> output_string oc data)

let () =
  write_all "fr.tex"
    (Resume_builder.to_latex Instance.emile Multi_string.French) ;
  write_all "en.tex"
    (Resume_builder.to_latex Instance.emile Multi_string.English) ;
  write_all "fr.typ"
    (Resume_builder.to_typst Instance.emile Multi_string.French) ;
  write_all "en.typ"
    (Resume_builder.to_typst Instance.emile Multi_string.English) ;
  write_all "resume.html"
    ( Html.to_string
    @@ Html.resume (Resume_builder.to_html Instance.emile Multi_string.English)
    ) ;
  write_all "index.html"
    ( Html.to_string
    @@ Html.index (Resume_builder.to_html Instance.emile Multi_string.English)
    ) ;
  write_all "software.html"
    ( Html.to_string
    @@ Html.software
         (Resume_builder.to_html Instance.emile Multi_string.English) ) ;
  write_all "404.html"
    ( Html.to_string
    @@ Html.page_404
         (Resume_builder.to_html Instance.emile Multi_string.English) )
