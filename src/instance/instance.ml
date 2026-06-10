open Resume_lib
open Multi_string
open Makers

let emile =
  Resume.make ~firstname:(I "Émile") ~lastname:(I "Trotignon")
    ~intro:begin
      v
        ~fr:
          "Informaticien, contributeur de la plateforme OCaml : sherlodoc, \
           odoc, ocamlformat."
        ~en:"Passionate dev."
    end
    ~formations:
      Formation.
        [ make (I "École Normale Supérieure Paris-Saclay")
            (v ~fr:"Master Parisien de Recherche en Informatique"
               ~en:"Master's degree in Computer Science Research (MPRI)" )
            ~date_start:(I "2020") ~date_end:(I "2022")
        ; make (I "École Normale Supérieure Paris-Saclay")
            (v ~fr:"L3 Informatique" ~en:"Bachelor in Computer Science")
            ~date_start:(I "2019") ~date_end:(I "2020")
        ; make (I "Université Lyon 1 Claude-Bernard")
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
            ~result:(v ~fr:"Mention Très Bien" ~en:"with honours") ]
    ~experiences:
      Experience.
        [ make
            (v ~fr:"Développeur" ~en:"Developer")
            ~description:begin
              v
                ~fr:begin
                  md
                    "Outillage interne. Écriture d'un linter pour OCaml avec \
                     possibilité de création de règles customisées. Tableau \
                     grafana pour observer les tailles d'éxecutables et autres \
                     métriques. Refactorisation du systeme de déploiement par \
                     la CI (buildkite). Écriture d'un parser et printer d'URL \
                     pour prévention des attaques Server-Side Request Forgery"
                end
                ~en:begin
                  md
                    "Worked on internal tooling. Made a linter for OCaml code \
                     that allows writing custom rules, grafana charts to \
                     observe executable file sizes and other metrics, \
                     refactoring of the CI deployment system (buildkite). \
                     Wrote a URL parser/printer to prevent Server-Side Request \
                     Forgery attacks. "
                end
            end
            (I "Ahrefs") ~location:(I "Remote, Paris, France")
            (v ~fr:"Novembre 2024 - présent" ~en:"November 2024 - present")
        ; make
            (v ~fr:"Développeur" ~en:"Developer")
            ~description:begin
              v
                ~fr:
                  (md
                     "Développement de logiciel open-source : contribution aux \
                      outils de la plateforme OCaml : odoc, ocamlformat, dune. \
                      Ajout d'une barre de recherche dans odoc, contributions \
                      du CSS de la barre jusqu'aux algos de la recherche. \
                      Coordination et intégration de la fonctionnalité avec le \
                      système de build dune.\n\
                      Autres contributions dans ocamlformat, odoc et dune." )
                ~en:
                  (md
                     "Open-source software development: contribution to the \
                      tools of the OCaml platform: odoc, ocamlformat, dune.\n\
                      Search bar in odoc: contributions from the CSS to the \
                      search algorithms. Coordination and integration of the \
                      feature with the dune build system." )
            end
            (I "Tarides") ~location:(I "Paris, France")
            (v ~fr:"Septembre 2022 - présent" ~en:"September 2022 - present")
        ; make
            (v ~fr:"Stage de recherche en informatique"
               ~en:"Research internship in computer science" )
            ~description:begin
              v
                ~fr:
                  (md
                     "Stage de 4.5 mois supervisé par Vincent Laviron et \
                      Pierre Chambart. Généralisation de l'optimisation des \
                      appels récursifs en queue modulo constructeurs." )
                ~en:
                  (md
                     "4.5-month internship tutored by Vincent Laviron and \
                      Pierre Chambart. Generalisation of recursive tail-call \
                      optimisation modulo constructors." )
            end
            (v ~fr:"OCamlpro, équipe Flambda" ~en:"OCamlpro, team Flambda")
            ~location:(I "Paris, France")
            (v ~fr:"Printemps 2022" ~en:"Spring 2022")
        ; make
            (v ~fr:"Stage de recherche en informatique"
               ~en:"Research internship in computer science" )
            ~description:begin
              v
                ~fr:begin
                  md
                    "Stage de M1 de 5 mois encadré par François Pottier. \
                     Améliorations de Menhir, un générateur de parser LR(1) \
                     pour OCaml :\n\
                     Augmentation de la sécurité grâce aux GADTs, ce qui \
                     autorise des optimisations plus agressives. Nombre \
                     d'allocations divisé par 4 et vitesse augmentée de 10%, \
                     sur des grammaires variées. "
                end
                ~en:begin
                  md
                    "Five-month internship tutored by François Pottier. \
                     Improvements to the code generated by Menhir, the LR(1) \
                     parser generator for OCaml :\n\
                     Typing with GADTs for increased safety, allowing bolder \
                     optimisations. The number of allocations was divided by \
                     4, and the speed increased by 10%, across various \
                     grammars."
                end
            end
            (v ~fr:"Inria Paris, équipe Cambium" ~en:"Inria Paris, team Cambium")
            ~location:(I "Paris, France")
            (v ~fr:"Printemps 2021" ~en:"Spring 2021")
        ; make
            (v ~fr:"Stage de recherche en géométrie algorithmique"
               ~en:"Research internship in computational geometry" )
            ~description:begin
              v
                ~fr:begin
                  md
                    "Stage de 6 semaines encadré par David Coeurjolly et \
                     Vincent Nivoliers. Le sujet du stage était \
                     d'échantillonner la surface d'une mesh potentiellement \
                     défectueuse. J'ai beaucoup programmé en C++ pendant ces \
                     six semaines. J'ai utilisé des outils tels que Polyscope \
                     et LIBIGL. Mon rapport de stage est disponible à cette \
                     adresse : \
                     [rapport.pdf](https://emiletrotignon.github.io/files/rapport.pdf)"
                end
                ~en:begin
                  md
                    "Six-week internship tutored by David Coeurjolly and \
                     Vincent Nivoliers. My goal during this internship was to \
                     uniformly sample the surface of a potentially imperfect \
                     mesh. During the six weeks, I spent a good portion of my \
                     time programming in C++ and I used tools such as \
                     Polyscope and LIBIGL. My internship report is available \
                     here: \
                     [emiletrotignon.github.io/files/rapport.pdf](https://emiletrotignon.github.io/files/rapport.pdf) "
                end
            end
            (v ~fr:"Laboratoire LIRIS" ~en:"LIRIS laboratory")
            ~location:(I "Lyon, France")
            (v ~fr:"Été 2020" ~en:"Summer 2020")
        ; make
            (v ~fr:"Développeur Node.js fullstack"
               ~en:"Fullstack Node.js developer" )
            ~description:begin
              v
                ~fr:begin
                  md
                    "Dans le cadre d'un mission pour la junior entreprise de \
                     l'ENS Paris-Saclay de 6 semaines, j'ai participé au \
                     développement du site web d'Expert People, une nouvelle \
                     plateforme de freelancing. Les technologies utilisées \
                     sont Node.js et Express.js. J'ai notamment mis en place \
                     un système pour remplir automatiquement le formulaire de \
                     CV d'un utilisateur avec son CV Linkedin sous format PDF.\n\
                     Le site d'Expert People : \
                     [expertpeople.co](https://expertpeople.co/)"
                end
                ~en:begin
                  md
                    "During a six-week mission for the junior enterprise of \
                     ENS Paris-Saclay, I contributed to the website \
                     development of Expert People, a new freelancing platform. \
                     The technologies used were Node.js and Express.js. One of \
                     my achievements was parsing LinkedIn resumes in PDF \
                     format to auto-fill the resume form.\n\
                     Expert People's website (in French) : \
                     [expertpeople.co](https://expertpeople.co/)"
                end
            end
            (v ~fr:"Junior entreprise de l'ENS Paris-Saclay"
               ~en:"Junior enterprise of ENS Paris-Saclay" )
            (v ~fr:"Mars 2020" ~en:"March 2020")
        ; make (I "ICPC SWERC 2019-2020") (I "")
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
            end
        ; make
            (v ~fr:"Développeur stagiaire C#" ~en:"Intern C# developer")
            (I "Eternix Ldt.")
            (v ~fr:"Été 2019" ~en:"Summer 2019")
            ~location:(I "Tel Aviv, Israel")
            ~description:begin
              v
                ~fr:begin
                  md
                    "Stage de 2 mois. Écriture de shaders HLSL, découverte de \
                     DirectX, Windows Form, expérience avec OpenCV.\n\
                     Expérience extrêmement enrichissante dans une entreprise \
                     étrangère"
                end
                ~en:begin
                  md
                    "Two-month internship. HLSL shaders, introduction to \
                     DirectX and OpenCV, Windows Form development.\n\
                     Greatly rewarding experience abroad."
                end
            end
        ; make
            (v ~fr:"Développeur front-end" ~en:"Front end developer")
            (I
               "École Nationale Supérieure des Sciences de l'Information et \
                des Bibliothèques" )
            (v ~fr:"Juillet 2018" ~en:"July 2018")
            ~location:(I "Lyon, France")
            ~description:begin
              v
                ~fr:begin
                  md
                    " Lors d'un emploi estival d'un mois, j'ai contribué à \
                     l'intégration du nouveau site web de l'ENSSIB. Le nouveau \
                     site est visible ici : [enssib.fr](http://www.enssib.fr)"
                end
                ~en:begin
                  md
                    "For a month, I contributed to the graphical integration \
                     of the new website for ENSSIB, the French school for \
                     library curators. You can see their website here: \
                     [enssib.fr](http://www.enssib.fr)"
                end
            end ]
    ~languages:
      Language.
        [ make (v ~fr:"Anglais" ~en:"English") Strong
        ; make (v ~fr:"Français" ~en:"French") VeryStrong ]
    ~skills:
      [ skill
          (v ~en:"Functional programming" ~fr:"Programmation fonctionnelle")
          VeryStrong
          ~description:begin
            v
              ~fr:begin
                md
                  "J'aime beaucoup les langages de programmation fonctionnels, \
                   ainsi que les systèmes de type avancés. Je programme en \
                   Ocaml depuis le début de mes études, et j'apprécie beaucoup \
                   ce langage. J'ai un peu d'expérience en Scala ainsi qu'en \
                   Rust, et j'ai beaucoup expérimenté avec les fonctionnalités \
                   avancées de C++.\n\
                   J'ai aussi publié deux paquets sur Opam, le gestionnaire de \
                   paquets d'Ocaml, ainsi que contribué à plusieurs d'entre \
                   eux : [software](https://emiletrotignon.github.io/software).\n"
              end
              ~en:begin
                md
                  " I really enjoy functional programming languages, as well \
                   as advanced type systems. I have been programming in OCaml \
                   since my first year of university, and I am very passionate \
                   about this language. I have some experience with Scala and \
                   Rust, and I had a lot of fun exploring advanced C++ \
                   features.\n\n\
                   I also published two packages on Opam, the OCaml package \
                   manager, and contributed to many: \
                   [software](https://emiletrotignon.github.io/software)."
              end
          end
      ; skill (I "Compilation") Strong
          ~description:begin
            v
              ~fr:begin
                md
                  "La compilation des langages de programmation est un sujet \
                   qui m'intéresse beaucoup. Dans ce domaine, j'ai écrit un \
                   type checker pour le système de type f-omega lors d'un \
                   cours de M2. Le code est disponible ici : \
                   [github/f-omega](https://github.com/EmileTrotignon/f-omega).\n\
                  \ Lors d'un cours de M1 j'ai écrit un compilateur pour un  \
                   langage de programmation du style ML vers X86.\n\
                   Le code est disponible ici: \
                   [github/cours-compilation-p7](https://github.com/EmileTrotignon/cours-compilation-p7).\n\
                   J'ai aussi programmé en 2019 un compilateur pour un \
                   sous-ensemble du langage C vers X86: \
                   [github/mcc](https://github.com/EmileTrotignon/mcc)"
              end
              ~en:begin
                md
                  "I am very interested in compilation. In this domain, for a \
                   M2 course, I have written a type checker for the f-omega \
                   type system. The code is available \
                   here:[github/f-omega](https://github.com/EmileTrotignon/f-omega).\n\
                   For a M1 course, I have written a compiler for an ML-style \
                   language to X86. The code is available here: \
                   [github/cours-compilation-p7](https://github.com/EmileTrotignon/cours-compilation-p7).\n\
                   I have also programmed a compiler for a subset of the C \
                   language to X86 in 2019: \
                   [github/mcc](https://github.com/EmileTrotignon/mcc)"
              end
          end
      ; skill
          (v ~fr:"Informatique fondamentale" ~en:"Fundamental Computer Science")
          Strong
          ~description:begin
            v
              ~fr:begin
                md
                  "Durant mes études, j'ai étudié différents aspects de \
                   l'informatique théorique :\n\
                   Sémantique des langages de programmation, théorie du calcul \
                   parallèle en mémoire partagée, langages formels, \
                   calculabilité, logique.\n\
                   Cela m'apporte beaucoup dans ma compréhension de \
                   l'informatique en général, en plus des compétences \
                   spécifiques à chaque domaine."
              end
              ~en:begin
                md
                  "I have studied different aspects of fundamental Computer \
                   Science :\n\
                   Programming languages semantics, theory of parallel \
                   computing with shared memory, formal languages, \
                   calculability, logic.\n\
                   This enhances my understanding of computer science in \
                   general, in addition to the particular skills acquired."
              end
          end
      ; skill (I "Proof assistants and verification") Basic
          ~description:begin
            v
              ~fr:begin
                md
                  "J'ai suivi un cours sur l'assistant de preuve Coq, et \
                   l'outil de vérification Why3. Je ne suis pas autonome avec \
                   ces outils, mais j'aimerai beaucoup en apprendre plus."
              end
              ~en:begin
                md
                  "I have taken a course on the Coq proof assistant, and one \
                   on the Why3 verification framework. I am not fluent with \
                   either of these tools, but I would love to become more \
                   familiar with them."
              end
          end
      ; skill (I "GUIs") Intermediate
          ~description:begin
            v
              ~fr:begin
                md
                  "Expérience avec quelques frameworks d'interfaces graphiques :\n\
                   Qt et Dear ImGUI pour C++, WinForm pour C#, Swing pour \
                   Scala, Tkinter pour Python. J'ai aussi écris le système \
                   d'interface graphique dans \
                   [gamelle](https://github.com/art-w/gamelle/)"
              end
              ~en:begin
                md
                  "I have experience with a few frameworks for programming \
                   GUIs :\n\
                   Qt and Dear ImGUI with C++, WinForm with C#, Swing with \
                   Scala, Tkinter with Python.\n\
                   I also co-authored the UI module in \
                   [gamelle](https://github.com/art-w/gamelle/), a game \
                   library for OCaml."
              end
          end
      ; skill
          (v ~fr:"Développement web" ~en:"Web development")
          Intermediate
          ~description:begin
            v
              ~fr:begin
                md
                  "Front-end : Bonne connaissance de HTML/CSS. J'ai exercé \
                   cette compétence professionnellement lors de l'été 2018.\n\n\
                   Back-end : Expérience professionnelle de développement \
                   d'une application Node.js. Contributions au webdesign des \
                   pages générées par odoc."
              end
              ~en:begin
                md
                  "Front-end : Good knowledge of HTML and CSS. One month \
                   experience during the summer of 2018.\n\n\
                   Back-end : Professional experience developing a Node.js web \
                   app. Contributions to the design of odoc documentation \
                   pages."
              end
          end
      ; skill
          (v ~fr:"Divers" ~en:"Miscellaneous")
          Strong
          ~description:begin
            v
              ~fr:begin
                md
                  "Utilisation d'un système Unix avec la ligne de commande : \
                   manipulation de fichier, Git, SSH.\n\
                   Édition d'image avec GIMP.\n\
                   Rédaction de documents en Latex. "
              end
              ~en:begin
                md
                  "Use of a Unix system with the command line : file \
                   manipulation, Git, SSH.\n\
                   Image editing with GIMP and Inkscape.\n\
                   Typesetting with Latex."
              end
          end ]
    ~phonenumber:(I "+33 7 82 89 83 58") ~email:(I "emile.trotignon@gmail.com")
    ~website:(I "emiletrotignon.github.io")
    ~birthdate:(v ~fr:"30 juillet 1999" ~en:"July 30th, 1999")
