let pattern = Tyre.(compile (const {|\#|} (str "#") <|> const {|\%|} (str "%")))

let latex s = Result.get_ok Tyre.(replace pattern Fun.id s)
