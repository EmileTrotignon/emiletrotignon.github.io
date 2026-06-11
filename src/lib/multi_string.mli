type 'string t = I of 'string | V of {french: 'string; english: 'string}

type language = French | English

val to_string : language -> 'string t -> 'string

val map : ('a -> 'b) -> 'a t -> 'b t

val i : 'string -> 'string t

val v : fr:'string -> en:'string -> 'string t
(** [v ~fr ~en] *)
