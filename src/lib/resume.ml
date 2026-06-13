open StdLabels

type t =
  { intro: Cmarkit.Doc.t Multi_string.t
  ; formations: Formation.t list
  ; experiences: Experience.t list
  ; internships: Experience.t list
  ; skills: string Multi_string.t list
  ; languages: string Multi_string.t list
  ; firstname: string Multi_string.t
  ; lastname: string Multi_string.t
  ; phonenumber: string Multi_string.t
  ; email: string Multi_string.t
  ; website: string Multi_string.t
  ; birthdate: string Multi_string.t }

type t' =
  { intro: string
  ; formations: Formation.t' list
  ; experiences: Experience.t' list
  ; internships: Experience.t' list
  ; skills: string list
  ; languages: string list
  ; firstname: string
  ; lastname: string
  ; phonenumber: string
  ; email: string
  ; website: string
  ; birthdate: string }

let to_t' ?(escaper = Fun.id) language model
    ({ intro
     ; formations
     ; experiences
     ; internships
     ; skills
     ; languages
     ; firstname
     ; lastname
     ; phonenumber
     ; email
     ; website
     ; birthdate } :
      t ) : t' =
  { intro= model (Multi_string.to_string language intro)
  ; formations= List.map ~f:(Formation.to_t' ~escaper language model) formations
  ; experiences=
      List.map ~f:(Experience.to_t' ~escaper language model) experiences
  ; internships=
      List.map ~f:(Experience.to_t' ~escaper language model) internships
  ; skills= List.map ~f:(fun skill -> escaper (Multi_string.to_string language skill)) skills
  ; languages= List.map ~f:(fun l -> escaper (Multi_string.to_string language l)) languages
  ; firstname= escaper (Multi_string.to_string language firstname)
  ; lastname= escaper (Multi_string.to_string language lastname)
  ; phonenumber= escaper (Multi_string.to_string language phonenumber)
  ; email= escaper (Multi_string.to_string language email)
  ; website= escaper (Multi_string.to_string language website)
  ; birthdate= escaper (Multi_string.to_string language birthdate) }

let make ~intro ~formations ~experiences ~internships ~skills ~languages
    ~firstname ~lastname ~phonenumber ~email ~website ~birthdate : t =
  { intro= Multi_string.map Cmarkit.Doc.of_string intro
  ; formations
  ; experiences
  ; internships
  ; skills
  ; languages
  ; firstname
  ; lastname
  ; phonenumber
  ; email
  ; website
  ; birthdate }
