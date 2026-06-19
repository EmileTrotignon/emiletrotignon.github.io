open Tyxml
open Html

let breadcrumbs bc =
  ul
    ~a:[a_id "breadcrumbs"]
    (List.map
       (fun (path, name) ->
         li [a ~a:[a_href ("/" ^ String.concat "/" path)] [txt name]] )
       bc )

let contact (cv : Resume.t') (sections : Sections.t) =
  section
    [ p
        [ a
            ~a:[a_href "https://github.com/EmileTrotignon"]
            [ img ~src:"/icons/github-icon.svg" ~alt:"Github icon"
                ~a:[a_class ["icon"]]
                ()
            ; txt "Github: EmileTrotignon" ] ]
    ; p
        [ a
            ~a:[a_href {%eml|mailto:<%- cv.email %>|}]
            [ span
                ~a:[a_class ["icon"]]
                [i ~a:[a_class ["fas"; "fa-envelope"; "fa-lg"]] []]
            ; txt cv.email ] ]
    ; p [txt {%eml|<%= sections.born %> <%=cv.birthdate%>|}] ]

let navmenu current =
  let navmenu_item ?id name url =
    a
      ~a:
        ( [ a_href url
          ; a_class
              ( "button"
              :: (if String.equal name current then ["current"] else []) ) ]
        @ match id with None -> [] | Some id -> [a_id id] )
      [txt name]
  in
  section
    ~a:[a_id "navmenu"]
    [ navmenu_item "Index" "/"
    ; navmenu_item "Software" "/software"
    ; navmenu_item "Resume" "/resume"
    ; navmenu_item ~id:"blog-navlink" "Blog" "/blog" ]

let sidebar items = nav ~a:[a_id "sidebar"] items

let page (cv : Resume.t') content =
  html
    ~a:[a_lang "en"]
    (head
       (title
          (txt {%eml|<%- cv.firstname %> <%- cv.lastname %>'s personal page|}) )
       [ meta ~a:[a_charset "utf-8"] ()
       ; meta
           ~a:
             [a_name "viewport"; a_content "width=device-width, initial-scale=1"]
           ()
       ; link ~rel:[`Stylesheet] ~href:"/style.css" ()
       ; link ~rel:[`Stylesheet]
           ~href:
             "https://fonts.googleapis.com/css2?family=Spectral:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
           ()
       ; link ~rel:[`Stylesheet]
           ~href:
             "https://fonts.googleapis.com/css2?family=Fira+Sans&display=swap"
           ()
       ; script
           ~a:
             [ a_src "https://kit.fontawesome.com/0c027fe19b.js"
             ; a_crossorigin `Anonymous ]
           (txt "") ] )
    (body
       [ header
           [ canvas
               ~a:
                 [ Unsafe.string_attrib "resize" "true"
                 ; a_id "voronoi"
                 ; a_style "user-select: none;"
                 ; Unsafe.string_attrib "data-paper-scope" "1" ]
               []
           ; h1
               [ a
                   ~a:[a_href "/"]
                   [txt {%eml|<%- cv.firstname %> <%- cv.lastname %>|}] ] ]
       ; div ~a:[a_id "body"] content
       ; script ~a:[a_src "/highlight.js"] (txt "")
       ; script ~a:[a_src "/voronoi.js"] (txt "") ] )

let md str : [> `P] elt =
  Unsafe.data (Cmarkit_html.of_doc ~safe:false (Cmarkit.Doc.of_string str))

let resume (cv : Resume.t') (sections : Sections.t) =
  let _icon_of_string s =
    let icon_of_filename filename =
      img
        ~a:[a_class ["icon"]]
        ~src:{%eml|icons/<%- filename %>|} ~alt:filename ()
    in
    match String.lowercase_ascii s with
    | "ocaml" ->
        Some (icon_of_filename "ocaml-icon.svg")
    | "c++" | "cpp" ->
        Some (icon_of_filename "cpp-icon.svg")
    | "c#" ->
        Some (icon_of_filename "c-sharp-icon.svg")
    | "python" ->
        Some (icon_of_filename "python-icon.svg")
    | _ ->
        None
  in
  let breadcrumbs = breadcrumbs @@ Breadcrumbs.of_string_list ["resume"] in
  let formation
      ({school; diploma; description; location; date_start; date_end; result} :
        Formation.t' ) =
    div
      ~a:[a_class ["item"]]
      [ h3 [txt school]
      ; div
          ~a:[a_class ["subtitle"]]
          ( (if location <> "" then [txt (location ^ ", ")] else [])
          @ [txt date_start]
          @ (if date_start <> "" && date_end <> "" then [txt " - "] else [])
          @ [txt date_end] )
      ; p [txt (diploma ^ (if result <> "" then " - " else "") ^ result)]
      ; md description ]
  in
  let experience ({title; description; company; location; date} : Experience.t')
      =
    div
      ~a:[a_class ["item"]]
      [ h3 [txt company; span ~a:[a_class ["job_title"]] [txt " - "; txt title]]
      ; div ~a:[a_class ["subtitle"]] ([txt location] @ [txt (", " ^ date)])
      ; md description ]
  in
  page cv
    [ sidebar
        [ navmenu "Resume"
        ; contact cv sections
        ; section
            ~a:[a_id "skills"]
            [ h2 [txt sections.skills]
            ; p [txt (String.concat ", " cv.skills)]
            ; h2 [txt sections.languages]
            ; p [txt (String.concat ", " cv.languages)] ] ]
    ; breadcrumbs
    ; article
        ~a:[a_id "content"]
        [ h1 [txt "Resume"]
        ; p
            ~a:[a_class ["hint"]]
            [ txt "Download this in "
            ; a ~a:[a_href "/files/resume_en.pdf"] [txt "pdf format"]
            ; txt ", or in "
            ; a ~a:[a_href "/files/resume_fr.pdf"] [txt "French"]
            ; txt "." ]
        ; md cv.intro
        ; section
            ([h2 [txt sections.formation]] @ List.map formation cv.formations)
        ; section
            ([h2 [txt sections.experience]] @ List.map experience cv.experiences)
        ; section
            ( [h2 [txt sections.internships]]
            @ List.map experience cv.internships ) ] ]

let index cv sections =
  let breadcrumbs = breadcrumbs @@ Breadcrumbs.of_string_list [] in
  page cv
    [ sidebar [navmenu "Index"; contact cv sections]
    ; breadcrumbs
    ; article
        ~a:[a_id "content"]
        [ section
            [ p [txt "Welcome to my home page"]
            ; md
                {|I used to be a student in computer science at ENS Paris-Saclay, nowadays I am a dev at Ahrefs,
where I work on internal tooling.

I have wide interests, I have worked on development tools, 2D game libraries,
regexp libraries. Most of my work has been in OCaml, but I started programming
at 12 in python, and during my studies I tried a bunch of languages, C++, JS,
Scala, Rust.

You can check some of my projects out on my
[github](https://github.com/EmileTrotignon) or on my [software](/software) page,
and my [resume](/resume) on this website.|}
            ] ] ]

type software = {url: string; name: string; description: string}

let software cv sections =
  let one_software {url; name; description} =
    let description_html =
      let s =
        Cmarkit_html.of_doc ~safe:false (Cmarkit.Doc.of_string description)
        |> String.trim
      in
      let s =
        if String.starts_with ~prefix:"<p>" s then
          String.sub s 3 (String.length s - 3)
        else s
      in
      if String.ends_with ~suffix:"</p>" s then
        String.sub s 0 (String.length s - 4)
      else s
    in
    li [a ~a:[a_href url] [txt name]; txt ", "; Unsafe.data description_html]
  in
  let breadcrumbs = breadcrumbs @@ Breadcrumbs.of_string_list ["software"] in
  let creations =
    [ { url= "https://github.com/EmileTrotignon/ppx_format"
      ; name= "ppx_format"
      ; description=
          {|syntax extension for printf style format string with string interpolation : `printf [%i "n={%d n}"]`|}
      }
    ; { url= "https://github.com/EmileTrotignon/gamelle"
      ; name= "gamelle"
      ; description=
          "an OCaml 2D game library with browser and native backends." }
    ; { url= "https://github.com/ahrefs/cure2"
      ; name= "Cure2"
      ; description=
          {|Combinators for generating and composing Re2 regex. `"^.*"` becomes `start + rep any`|}
      }
    ; { url= "https://github.com/EmileTrotignon/embedded_ocaml_templates"
      ; name= "ocaml_embedded_templates"
      ; description= "a template engine that uses OCaml as its logic." }
    ; { url= "https://github.com/EmileTrotignon/highlexer"
      ; name= "highlexer"
      ; description= "an accurate code highlighter for OCaml." } ]
  in
  let contributions =
    [ { url= "https://github.com/ocaml-ppx/ocamlformat"
      ; name= "ocamlformat"
      ; description= "the OCaml code formatter." }
    ; { url= "https://github.com/ocaml/odoc"
      ; name= "odoc"
      ; description= "the modern OCaml documentation generator." }
    ; { url= "https://github.com/art-w/sherlodoc"
      ; name= "sherlodoc"
      ; description= "a search engine for OCaml documentation." }
    ; { url= "https://github.com/ocaml/dune"
      ; name= "dune"
      ; description= "the OCaml build system." }
    ; { url= "https://gallium.inria.fr/~fpottier/menhir/"
      ; name= "menhir"
      ; description= "the OCaml LR1 parser generator." } ]
  in
  page cv
    [ sidebar [navmenu "Software"; contact cv sections]
    ; breadcrumbs
    ; article
        ~a:[a_id "content"]
        [ section
            [ p [txt "I am responsible for the following projects:"]
            ; ul (List.map one_software creations)
            ; p [txt "I have also contributed to the following projects:"]
            ; ul (List.map one_software contributions) ] ] ]

let page_404 cv sections=
  page cv
    [ sidebar [navmenu "Error 404"; contact cv sections]
    ; article
        ~a:[a_id "content"]
        [section [h1 [txt "Error 404 : page was not found."]]] ]

let to_string ty = Format.asprintf "%a" (Tyxml_html.pp ()) ty

let blog cv blog bc sections =
  (*
    <%# (cv: Resume.t') (blog: string) breadcrumbs %>
<%- page_top cv %>
    <%- Components.sidebar_top %>
        <%- Components.navmenu "Blog" %>
        <%- Components.contact cv %>
    <%- Components.sidebar_bot %>
    <%- Components.breadcrumbs breadcrumbs %>
    <div id="content-wrapper">
        <article id="content">
            <%- blog %>
        </article>
    </div>

<%- page_bot %>*)
  page cv
    [ sidebar [navmenu "Blog"; contact cv sections]
    ; breadcrumbs bc
    ; article ~a:[a_id "content"] [Unsafe.data blog] ]
