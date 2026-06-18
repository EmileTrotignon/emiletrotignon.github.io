<%# (cv: Resume.t') (sections: Sections.t) %>
<% let open StdLabels in %>
#import "@preview/neat-cv:1.1.0": cv, cv-with-side, entry, contact-info, social-links

#show: cv.with(
  author: (
    firstname: "<%- cv.firstname %>",
    lastname: "<%- cv.lastname %>",
    email: "<%- cv.email %>",
    position: "<%- cv.position %>",
    github: "EmileTrotignon",
    website: "emiletrotignon.github.io",
  ),
  paper-size: "a4",
  body-font-size: 10pt,
  body-font: "Libertinus Serif",
  heading-font: "Libertinus Serif",
  // Charcoal headings (also tints neat-cv's heading rules / accent elements).
  accent-color: rgb("#603e46"),
  // Match the name/title header background to the accent color.
  header-color: rgb("#503e46"),
  profile-picture: image("files/emile.jpg"),
)

//#set par(spacing: 0.45em)
#set text(weight: 400)

// Blue links (neat-cv renders `link()` in plain body color otherwise).
#show link: set text(fill: rgb("#1a5fb4"))

#cv-with-side[


  = Contact

  #contact-info()
  #social-links()

  = <%- sections.skills %>

<% List.iteri cv.skills ~f:(fun i skill -> if i <> 0 then (%>, <%) ;%><%- skill %><% ) ; %>

  = <%- sections.languages %>

<% List.iteri cv.languages ~f:(fun i language -> if i <> 0 then (%>, <%) ;%><%- language %><% ) ; %>

  #v(1fr)
][

  #text(size: 0.85em)[<%- cv.intro %>]

  = <%- sections.formation %>

<% List.iter cv.formations ~f:begin fun (f: Formation.t') -> %>
  #entry(
    title: [<%- f.diploma %>],
    institution: [<%- f.school %>],
    date: [<%- f.date_start %><% if f.date_start <> "" && f.date_end <> "" then (%> -- <%) ; %><%- f.date_end %>],
  )[]
<% end ; %>

  = <%- sections.experience %>

<% List.iter cv.experiences ~f:(fun (e: Experience.t') -> %>
  #entry(
    title: [<%- e.title %>],
    institution: [<%- e.company %>],
    location: [<%- e.location %>],
    date: [<%- e.date %>],
  )[
<%- e.description %>
  ]
<% ) ; %>

  = <%- sections.internships %>

<% List.iter cv.internships ~f:(fun (e: Experience.t') -> %>
  #entry(
    title: [<%- e.title %>],
    institution: [<%- e.company %>],
    location: [<%- e.location %>],
    date: [<%- e.date %>],
  )[
<%- e.description %>
  ]
<% ) ; %>
]
