open Resume_lib
open Multi_string
open Makers

let intro =
  v
    ~fr:
      "Je suis un informaticien passionné, avec des intérêts larges et une \
       spécialisation en programmation fonctionnelle. J'aime le code propre, \
       les abstractions puissantes et les API qui empêchent de faire des \
       erreurs.\n\n\
       J'ai beaucoup contribué à l’écosystème OCaml, voir ma page \
       [software](/software)"
    ~en:
      "I am a passionate dev with wide interests and a focus in functional \
       programming. I like clean code, powerful abstractions, and APIs that \
       forces to do the right thing.\n\n\
       I have made extensive contributions to the OCaml ecosystem, see my \
       [software](/software) page."

let formations =
  let open Formation in
  [ make (I "ENS Paris-Saclay")
      (v ~fr:"Master Parisien de Recherche en Informatique"
         ~en:"Masters in Computer Science Research (MPRI)" )
      (* ~date_start:(I "2020") *)
      ~date_end:(I "2022")
  ; make (I "ENS Paris-Saclay")
      (v ~fr:"Licence d'Informatique" ~en:"Bachelor in Computer Science")
      (*~date_start:(I "2019")*)
      ~date_end:(I "2020")
    (*; make (I "Université Lyon 1 Claude-Bernard")
      (v ~fr:"L2 Informatique - mathématiques"
         ~en:"Second year of Bachelor in Computer Science and Mathematics" )
      ~date_start:(I "2018") ~date_end:(I "2019")
  ; make
      (v ~fr:"Lycée Jean Perrin (Option Informatique au Lycée du Parc)"
         ~en:"Jean-Perrin preparatory school" )
      (v ~fr:"CPGE MPSI" ~en:"First year of Bachelor in engineering")
      ~date_start:(I "2017") ~date_end:(I "2018")
  ; make (I "Lycée La Trinité")
      (v ~fr:"Baccalauréat scientifique"
         ~en:"High school diploma with science focus" )
      ~date_start:(I "2016") ~date_end:(I "2017") ~location:(I "Lyon")
      ~result:(v ~fr:"Mention Très Bien" ~en:"with honours")*)
  ]

let experiences =
  let open Experience in
  [ make
      (v ~fr:"Ingénieur logiciel" ~en:"Software Engineer")
      ~description:begin
        v
          ~fr:
            "Outillage interne. Écriture d'un linter pour OCaml avec \
             possibilité de création de règles customisées. Tableau grafana \
             pour observer les tailles d'éxecutables et autres métriques. \
             Refactorisation du système de déploiement par la CI (buildkite). \
             Écriture d'un parser et printer d'URL pour prévention des \
             attaques Server-Side Request Forgery. Contribution a un PPX \
             générant des requêtes Clickhouse bien typées. Slack bot \
             s'interfaçant avec Github et Buildkite"
          ~en:
            "Worked on internal tooling. Made a linter for OCaml code that \
             allows writing custom rules, grafana charts to observe executable \
             file sizes and other metrics, refactoring of the CI deployment \
             system (buildkite). Wrote a URL parser/printer to prevent \
             Server-Side Request Forgery attacks. Contributed to a ppx for \
             type-safe clickhouse queries. Slack bot integrating with Github \
             and Buildkite."
      end
      (I "Ahrefs") ~location:(I "Remote")
      (v ~fr:"2024 - présent" ~en:"2024 - present")
  ; make
      (v ~fr:"Ingénieur logiciel" ~en:"Software Engineer")
      ~description:begin
        v
          ~fr:
            "Développement de logiciel open-source : contribution aux outils \
             de la plateforme OCaml : odoc, ocamlformat, dune. Ajout d'une \
             barre de recherche dans odoc, contributions du CSS de la barre \
             jusqu'aux algos de la recherche. Coordination et intégration de \
             la fonctionnalité avec le système de build dune.\n\
             Autres contributions dans ocamlformat, odoc et dune."
          ~en:
            "Open-source software development: contribution to the tools of \
             the OCaml platform: odoc, ocamlformat, dune.\n\
             Search bar in odoc: contributions from the CSS to the search \
             algorithms. Coordination and integration of the feature with the \
             dune build system."
      end
      (I "Tarides") ~location:(I "Paris, France")
      (v ~fr:"2022 - 2024" ~en:"2022 - 2024") ]

let internships =
  let open Experience in
  [ make
      (v ~fr:"Stage de recherche en informatique"
         ~en:"Research internship in computer science" )
      ~description:begin
        v
          ~fr:
            "Stage de 4.5 mois supervisé par Vincent Laviron et Pierre \
             Chambart. Généralisation de l'optimisation des appels récursifs \
             en queue modulo constructeurs. [Rapport](/files/report_m2.pdf)."
          ~en:
            "4.5-month internship tutored by Vincent Laviron and Pierre \
             Chambart. Generalization of recursive tail-call optimisation \
             modulo constructors. [Report](/files/report_m2.pdf)."
      end
      (v ~fr:"OCamlpro, équipe Flambda" ~en:"OCamlpro, team Flambda")
      ~location:(I "Paris, France")
      (v ~fr:"Printemps 2022" ~en:"Spring 2022")
  ; make
      (v ~fr:"Stage de recherche en informatique"
         ~en:"Research internship in computer science" )
      ~description:begin
        v
          ~fr:
            "Stage de M1 de 5 mois encadré par François Pottier. Améliorations \
             de Menhir, un générateur de parser LR(1) pour OCaml :\n\
             Augmentation de la sécurité grâce aux GADTs, ce qui autorise des \
             optimisations plus agressives. Nombre d'allocations divisé par 4 \
             et vitesse augmentée de 10%, sur des grammaires variées. "
          ~en:
            "Five-month internship tutored by François Pottier. Improvements \
             to the code generated by Menhir, the LR(1) parser generator for \
             OCaml :\n\
             Typing with GADTs for increased safety, allowing bolder \
             optimisations. The number of allocations was divided by 4, and \
             the speed increased by 10%, across various grammars."
      end
      (v ~fr:"Inria Paris, équipe Cambium" ~en:"Inria Paris, team Cambium")
      ~location:(I "Paris, France")
      (v ~fr:"Printemps 2021" ~en:"Spring 2021")
  ; make
      (v ~fr:"Stage de recherche en géométrie algorithmique"
         ~en:"Research internship in computational geometry" )
      ~description:begin
        v
          ~fr:
            "Stage de 6 semaines encadré par David Coeurjolly et Vincent \
             Nivoliers. Le sujet du stage était d'échantillonner la surface \
             d'une mesh potentiellement défectueuse. Programmation en C++. \
             Outils: Polyscope, LIBIGL.\n\
            \ [Rapport](https://emiletrotignon.github.io/files/rapport.pdf)."
          ~en:
            "Six-week internship tutored by David Coeurjolly and Vincent \
             Nivoliers. My goal during this internship was to uniformly sample \
             the surface of a potentially imperfect mesh. Implementation in \
             C++ with Polyscope and LIBIGL. [Report \
             (french)](/files/rapport.pdf)."
      end
      (v ~fr:"Laboratoire LIRIS" ~en:"LIRIS laboratory")
      ~location:(I "Lyon, France")
      (v ~fr:"Été 2020" ~en:"Summer 2020")
  ; make
      (v ~fr:"Développeur Node.js fullstack" ~en:"Fullstack Node.js developer")
      ~description:begin
        v
          ~fr:
            "Mission  de 6 semaines pour la junior entreprise de l'ENS \
             Paris-Saclay de 6 semaines. Développement d'une plateforme de \
             freelancing. Node.js. Express.js et MangoDB. J'ai notamment mis \
             en place un système pour remplir automatiquement le formulaire de \
             CV en parsant un CV LinkedIn sous format PDF."
          ~en:
            "Six-week mission for the junior enterprise of ENS Paris-Saclay. \
             Website development of a freelancing platform. The stack was \
             Node.js, Express.js, and MangoDB. Parsed LinkedIn resumes in PDF \
             format to auto-fill the resume form."
      end
      (v ~fr:"Junior entreprise de l'ENS Paris-Saclay"
         ~en:"Junior enterprise of ENS Paris-Saclay" )
      (v ~fr:"Mars 2020" ~en:"March 2020")
    (*; make (I "ICPC SWERC 2019-2020") (I "")
            (v ~fr:"Janvier 2020" ~en:"January 2020")
            ~location:(I "Télécom Paris")
            ~description:begin
              v
                ~fr:begin
                  md
                    "Compétition de programmation/algorithmique universitaire.\n\
                     Participation au sein d'une équipe de trois.\n\
                     Classement de mon équipe : 37 sur 95 équipes représentant \
                     des universités de plusieurs pays européens."
                end
                ~en:begin
                  md
                    "University programming/algorithms competition.\n\
                     Participation in teams of three students.\n\
                     Ranked 37th of 95 teams representing universities from \
                     multiple European countries."
                end
            end*)
  ; make
      (v ~fr:"Développeur stagiaire C#" ~en:"Intern C# developer")
      (I "Eternix Ldt.")
      (v ~fr:"Été 2019" ~en:"Summer 2019")
      ~location:(I "Tel Aviv, Israel")
      ~description:begin
        v
          ~fr:begin
            "Stage de 2 mois. Écriture de shaders HLSL, découverte de DirectX, \
             Windows Form, expérience avec OpenCV.\n\
             Expérience extrêmement enrichissante dans une entreprise \
             étrangère."
          end
          ~en:begin
            "Two-month internship. HLSL shaders, introduction to DirectX and \
             OpenCV, Windows Form development.\n\
             Greatly rewarding experience abroad."
          end
      end
  ; make
      (v ~fr:"Développeur front-end" ~en:"Front end developer")
      (I "ENSSIB")
      (v ~fr:"Juillet 2018" ~en:"July 2018")
      ~location:(I "Lyon, France")
      ~description:begin
        v
          ~fr:
            "Intégration graphique du site web de l'ENSSIB: \
             [enssib.fr](http://www.enssib.fr)"
          ~en:
            "Graphical integration of the French school for library curators \
             website's: [enssib.fr](http://www.enssib.fr)"
      end ]

let emile =
  Resume.make ~firstname:(I "Émile") ~lastname:(I "Trotignon") ~intro
    ~formations ~experiences ~internships
    ~languages:[v ~fr:"Anglais" ~en:"English"; v ~fr:"Français" ~en:"French"]
    ~skills:
      [ I "OCaml"
      ; I "git"
      ; I "Unix"
      ; I "SQL"
      ; I "C#"
      ; I "Node.js"
      ; I "C++"
      ; I "Python" ]
    ~phonenumber:(I "+33 7 82 89 83 58") ~email:(I "emile.trotignon@gmail.com")
    ~website:(I "emiletrotignon.github.io")
    ~birthdate:(v ~fr:"30 juillet 1999" ~en:"July 30th, 1999")
