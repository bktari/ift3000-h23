(*****************************************************************************)
(** Langages de programmation (IFT-3000)                                     *)

(** Gestion de cours et de programmes.                                       *)

(*****************************************************************************)

(*****************************************************************************)
(* Implantation                                                              *)
(*****************************************************************************)
exception Non_Implante of string

(* ------------------------------------------------------------------------- *)
(* Structures de données                                                     *)
(* ------------------------------------------------------------------------- *)
type cours = num_cours * desc_cours

and desc_cours = {
  titre : titre;
  credit : credit;
  conco : num_cours;
  pre : prealables;
  dept : dept;
  multi : num_cours;
  equiv : num_cours;
  offre : (session * fe) list;
  dom : domaine list;
}

and num_cours = string
and titre = string
and credit = Cr of int | St of int

and prealables =
  | Aucun
  | CP of num_cours
  | CCP of num_cours
  | CRE of int
  | OU of prealables list
  | ET of prealables list

and dept = string
and session = Aut | Hiv | Ete | Annee
and fe = P | H | Y | D | C | A | Z1 | Z3 | ZA | FEX

and domaine =
  | GEN
  | PROG
  | SYS
  | MAT
  | STAT
  | LOG
  | THEO
  | ANA_CON
  | NET
  | BD
  | IA
  | SEC
  | GAME
  | WEB
  | BIO
  | ENT
  | SIO
  | LANG
  | CHM
  | DD
  | ECO
  | ADM
type programme =
  desc_pgm
  * (* type + domaine savoir + #crédits *)
    titre
  * (* titre du programme *)
  session list
  * (* session d'admission *)
  (int * (string * exigences) list)
  * (* activités de formation obligatoire *)
  (int * (string * exigences) list)
  * (* activités de formation à option *)
  concentration list (* liste de concentrations *)

and desc_pgm = type_pro * string * int * int
and type_pro = Bacc | Cert | MP | Mast | MM | Doct

and exigences =
  | CoursOB of int * num_cours list
  | PlageCr of int * int * exigences_ext

and exigences_ext = Cours of num_cours list | CoursExclus of num_cours list
and concentration = string * (int * exigences list)

type choix = Min | Max | Plein | Interv of int * int

(* Tp1 (Hiver 2021) *)
(* ---------------- *)

(* ------------------------------------------------------------------------- *)
(* Partie réservée aux fonctions utiles ------------------------------------ *)
(* ------------------------------------------------------------------------- *)
open List

let ( ++ ) l1 l2 =
  fold_left (fun acc x -> if mem x acc then acc else acc @ [ x ]) l1 l2

let ( -- ) l1 l2 =
  fold_left (fun acc x -> if mem x l2 then acc else acc @ [ x ]) [] l1

let explode s = init (String.length s) (String.get s)
let eql l1 l2 = fast_sort Stdlib.compare l1 = fast_sort Stdlib.compare l2
let est_alpha c = match c with 'A' .. 'Z' | 'a' .. 'z' -> true | _ -> false
let est_num c = match c with '0' .. '9' -> true | _ -> false

let completer_lfe lfe =
  if mem FEX lfe || lfe = [] then [ A; Z1; Z3; ZA; P; H; Y; D; C ]
  else
    (* pour compatibilité entre anciens et nouveaux codes *)
    let lfe = if mem A lfe then P :: lfe else lfe in
    let lfe = if mem P lfe then A :: lfe else lfe in
    let lfe = if mem D lfe then Z1 :: Z3 :: lfe else lfe in
    let lfe = if mem Z1 lfe then D :: lfe else lfe in
    let lfe = if mem Z3 lfe then D :: lfe else lfe in
    let lfe = if mem C lfe then ZA :: lfe else lfe in
    let lfe = if mem ZA lfe then C :: lfe else lfe in
    sort_uniq Stdlib.compare lfe

let completer_ls ls = if mem Annee ls || ls = [] then [ Aut; Hiv; Ete ] else ls

(* ------------------------------------------------------------------------- *)
(* Début partie code (implantation) ---------------------------------------- *)
(* ------------------------------------------------------------------------- *)

(* ret_descr : cours list -> num_cours -> desc_cours                         *)
let ret_descr bcours c =
  try assoc c bcours
  with _ -> failwith (Printf.sprintf "Cours <%s> inexistant!" c)

(* ret_descr : cours list -> num_cours -> num_cours -> bool                  *)
let nc_eq bcours nc1 nc2 =
  nc1 = nc2
  || (let { equiv; _ } = ret_descr bcours nc1 in
      nc2 = equiv)
  ||
  let { equiv; _ } = ret_descr bcours nc2 in
  nc1 = equiv

(* ret_sig_num_motif : string -> string * string                             *)
let ret_sig_num_motif pat =
  match String.split_on_char '-' pat with
  | [ s; n ]
    when (s = "*" || (String.length s = 3 && for_all est_alpha (explode s)))
         && (n = "*" || n = "I"
            || (String.length n = 2 && est_num n.[0] && n.[1] = '*')
            || (String.length n = 4 && for_all est_num (explode n))) ->
      (s, n)
  | _ -> failwith (Printf.sprintf "<%s>: mauvais motif!" pat)

(* ret_sig_num : num_cours -> string * string                                *)
let ret_sig_num c =
  match String.split_on_char '-' c with
  | [ s; n ]
    when String.length s = 3
         && String.length n = 4
         && for_all est_alpha (explode s)
         && for_all est_num (explode n) ->
      (s, n)
  | _ -> failwith (Printf.sprintf "<%s>: numéro de cours incorrect!" c)

(* respecte_motif : num_cours -> string -> bool                              *)
let respecte_motif c pat =
  let aux (s, n) (s', n') =
    match (s', n') with
    | _ when n' = "*" -> s' = "*" || s = s'
    | _ when n'.[0] = 'I' ->
        (s' = "*" || s = s') && n.[0] >= '1' && n.[0] <= '4'
    | _ when String.length n' = 2 -> (s' = "*" || s = s') && n.[0] = n'.[0]
    | _ -> (s' = "*" || s = s') && n = n'
  in
  aux (ret_sig_num c) (ret_sig_num_motif pat)

(* pr2str : prealables -> string                                             *)
let pr2str pr =
  let rec lpr2str c l =
    match l with
    | [] -> ""
    | [ pr ] -> pr2str' pr
    | pr :: reste -> pr2str' pr ^ c ^ lpr2str c reste
  and pr2str' pr =
    match pr with
    | Aucun -> ""
    | CRE n -> string_of_int n ^ " crédits"
    | CP c -> c
    | CCP c -> c ^ "*"
    | OU l -> "(" ^ lpr2str " OU " l ^ ")"
    | ET l -> "(" ^ lpr2str " ET " l ^ ")"
  in
  match pr with
  | OU l -> lpr2str " OU " l
  | ET l -> lpr2str " ET " l
  | _ -> pr2str' pr

(* existe_pr : prealables -> prealables -> bool                             *)
let rec existe_pr pr pr' =
  match (pr, pr') with
  | Aucun, Aucun -> true
  | CRE n, CRE n' -> n = n'
  | CP c, CP c' | CCP c, CCP c' | CP c, CCP c' -> c = c'
  | CP _, OU l
  | CP _, ET l
  | CCP _, OU l
  | CCP _, ET l
  | CRE _, OU l
  | CRE _, ET l
  | OU _, ET l
  | ET _, OU l ->
      exists (existe_pr pr) l
  | OU l1, OU l2 | ET l1, ET l2 ->
      for_all (fun pr1' -> exists (existe_pr pr1') l2) l1
      || exists (existe_pr pr) l2
  | _ -> false

(* lc_dans_pr : prealables -> num_cours list                                 *)
let rec lc_dans_pr pr =
  match pr with
  | Aucun | CRE _ -> []
  | CP c -> [ c ]
  | CCP c -> [ c ]
  | OU l | ET l -> fold_left (fun acc pr -> acc ++ lc_dans_pr pr) [] l

(* respecte_pr: num_cours list -> int -> num_cours list -> prealables -> bool*)
let respecte_pr lco tcr lc pr =
  let rec aux pr =
    match pr with
    | Aucun -> true
    | CP c -> mem c lco
    | CCP c -> mem c lco || mem c lc
    | CRE n -> tcr >= n
    | OU l -> exists aux l
    | ET l -> for_all aux l
  in
  aux pr

(* total_cr : cours list -> num_cours list -> int                            *)
let total_cr ?(avec_stage = false) bcours lc =
  fold_left
    (fun acc c ->
      let ncr =
        match ret_descr bcours c with
        | { credit = Cr n; _ } -> n
        | { credit = St n; _ } -> if avec_stage then n else 0
      in
      acc + ncr)
    0 lc

(* lc_absents : cours list -> num_cours list                                 *)
let lc_absents bcours =
  fold_left
    (fun acc (_, { conco = cc; pre = pr; multi = mc; equiv = eq; _ }) ->
      acc
      ++ filter
           (fun c' -> not (mem_assoc c' bcours))
           (lc_dans_pr pr ++ filter (( <> ) "") [ cc; mc; eq ]))
    [] bcours

(* ret_bcours_lmot : string list -> cours list -> cours list                 *)
let ret_bcours_lmot lmot bcours =
  filter (fun (c, _) -> exists (respecte_motif c) lmot) bcours

(* ret_bcours_lses_lfe : session list -> fe list -> cours list -> cours list *)
let ret_bcours_lses_lfe ls lfe bcours =
  let ls = completer_ls ls and lfe = completer_lfe lfe in
  filter
    (fun (_, { offre = l; _ }) ->
      exists (fun (s, fe) -> mem s ls && mem fe lfe) l)
    bcours

(* ret_bcours_ldom : domaine list -> cours list -> cours list                *)
let ret_bcours_ldom ld bcours =
  filter (fun (_, { dom = l; _ }) -> exists (fun dom -> mem dom l) ld) bcours

(* ret_bcours_pr : prealables -> cours list -> cours list                    *)
let ret_bcours_pr pr bcours =
  filter (fun (_, { pre = pr'; _ }) -> existe_pr pr pr') bcours

(* ret_bcours_admissibles : num_cours list -> int -> cours list ->
                            cours list *)
let ret_bcours_admissibles lco tcr bcours =
  let respecte_pr' = respecte_pr lco tcr [] in
  let bc =
    filter
      (fun (c, { pre = pr; equiv = c'; _ }) ->
        (not (mem c' lco)) && (not (mem c lco)) && respecte_pr' pr)
      bcours
  in
  filter
    (fun (_, { conco = c'; _ }) ->
      c' = "" || mem c' lco || exists (fun (c, _) -> c = c') bc)
    bc

(* Tp2 (Hiver 2021) *)
(* ---------------- *)

(* ------------------------------------------------------------------------- *)
(* Partie réservée aux fonctions utiles ------------------------------------ *)
(* ------------------------------------------------------------------------- *)
let _min = 3
let _max = 18
let _plein = 12

let vers_interv ch =
  match ch with
  | Min -> Interv (_min, _min)
  | Max -> Interv (_max, _max)
  | Plein -> Interv (_plein, _plein)
  | _ -> ch

let rec respecte_interv bcours ch lc =
  match ch with
  | Interv (n1, n2) ->
      let tcr = total_cr ~avec_stage:true bcours lc in
      tcr >= n1 && tcr <= n2
  | _ -> respecte_interv bcours (vers_interv ch) lc

let rec cnm n l =
  match (n, l) with
  | 0, _ -> [ [] ]
  | 1, [] -> []
  | 1, _ -> map (fun x -> [ x ]) l
  | _, [] -> []
  | n, h :: t ->
      if n > length l then []
      else if n = length l then [ l ]
      else map (fun x -> h :: x) (cnm (n - 1) t) @ cnm n t

let construit_liste_choix eq1 eq2 l =
  let rec elimine_doublons eq l =
    match l with
    | [] -> []
    | e :: r ->
        let l' = elimine_doublons eq r in
        if exists (eq e) r then l' else e :: l'
  in
  let rec construit_n_liste_choix n acc =
    match n with
    | 0 -> acc
    | _ -> construit_n_liste_choix (n - 1) (acc @ cnm n l)
  in
  let lres = construit_n_liste_choix (length l) [] in
  let lres' = map (elimine_doublons eq1) lres in
  elimine_doublons eq2 lres'

(* ------------------------------------------------------------------------- *)
(* Début partie code (implantation) ---------------------------------------- *)
(* ------------------------------------------------------------------------- *)

(* respecte_regle : cours list -> num_cours list -> exigences ->
                    int * exigences * num_cours list *)
let respecte_regle bcours lc regle =
  let respecte_regle_e n1 n2 regle_e =
    match regle_e with
    | Cours l ->
        let lc, lc' = partition (fun nc -> exists (respecte_motif nc) l) lc in
        let tcr = total_cr bcours lc in
        (min n2 tcr, max 0 (n1 - tcr), max 0 (n2 - tcr), Cours (l -- lc), lc')
    | CoursExclus l ->
        let lc', lc = partition (fun nc -> exists (respecte_motif nc) l) lc in
        let tcr = total_cr bcours lc in
        (min n2 tcr, max 0 (n1 - tcr), max 0 (n2 - tcr), CoursExclus l, lc')
  in
  match regle with
  | CoursOB (n, l) ->
      let lc, lc' = partition (fun nc -> exists (( = ) nc) l) lc in
      let tcr = total_cr bcours lc in
      (min n tcr, CoursOB (max 0 (n - tcr), l -- lc), lc')
  | PlageCr (n1, n2, regle_e) ->
      let tcr, n1', n2', regle_e', lc' = respecte_regle_e n1 n2 regle_e in
      (tcr, PlageCr (n1', n2', regle_e'), lc')

(* conc_obtenues : cours list -> programme -> num_cours list -> string list  *)
let conc_obtenues bcours (_, _, _, _, _, lconc) lco =
  let rec respecte_regles n n' l_regles =
    match l_regles with
    | [] -> n' >= n
    | regle :: reste ->
        let tcr, _, _ = respecte_regle bcours lco regle in
        respecte_regles n (n' + tcr) reste
  in
  lconc
  |> filter (fun (_, (n, l_regles)) -> respecte_regles n 0 l_regles)
  |> map fst

(* ou_en_suis_je : cours list -> programme -> num_cours list ->
                   (string * int * exigences) list * (int * int) *
                   (string * int * exigences) list * (int * int) *
                   num_cours list *)
let ou_en_suis_je bcours (_, _, _, (n1, regle1), (n2, regle2), _) lco =
  let result1, tcr1, lc1 =
    fold_left
      (fun (acc, n, lco) (str, regle) ->
        let tcr, regle', lc = respecte_regle bcours lco regle in
        (acc @ [ (str, tcr, regle') ], n + tcr, lc))
      ([], 0, lco) regle1
  in
  let result2, tcr2, lc2 =
    fold_left
      (fun (acc, n, lco) (str, regle) ->
        let tcr, regle', lc = respecte_regle bcours lco regle in
        (acc @ [ (str, tcr, regle') ], n + tcr, lc))
      ([], 0, lc1) regle2
  in
  (result1, (n1, tcr1), result2, (n2, tcr2), lc2)

(* respecte_conco : cours list -> num_cours list -> num_cours list -> bool   *)
let cours_respect_conco bcours lco lc nc =
  let { conco = nc'; _ } = ret_descr bcours nc in
  nc' = "" || mem nc' lco || mem nc' lc

let respecte_conco bcours lco lc =
  let cours_respect_conco' = cours_respect_conco bcours lco lc in
  for_all cours_respect_conco' lc

(* choix_cours_admissibles : cours list -> num_cours list -> session
                             -> fe list -> choix -> num_cours list ->
                             num_cours list list *)
let respect_conco_ccp bcours lco lc =
  let cours_respect_conco' = cours_respect_conco bcours lco in
  let respecte_pr' = respecte_pr lco (total_cr bcours lco) in
  let rec aux lc =
    let lc' =
      lc
      |> filter (cours_respect_conco' lc)
      |> filter (fun c ->
             let { pre = pr; _ } = ret_descr bcours c in
             respecte_pr' lc pr)
    in
    if eql lc lc' then lc else aux lc'
  in
  aux lc <> []

let choix_cours_admissibles_aux bcours lco session lfe ch lc =
  match vers_interv ch with
  | Interv (a, b) as interv when a >= 0 && b >= a && b <= _max ->
      let tcr = total_cr bcours lco
      and ls = if session = Annee then [ Aut; Hiv; Ete ] else [ session ]
      and lfe = if mem FEX lfe || lfe = [] then [ A; Z1; Z3; ZA; H ] else lfe in
      let lca =
        filter
          (fun c ->
            let { pre = pr; equiv = c'; offre = l; _ } = ret_descr bcours c in
            exists (fun (s, fe) -> mem s ls && mem fe lfe) l
            && (not (mem c' lco))
            && (not (mem c lco))
            && respecte_pr lco tcr lc pr)
          lc
      in
      construit_liste_choix (nc_eq bcours) eql lca
      |> filter (respecte_interv bcours interv)
  | _ -> []

let choix_cours_admissibles bcours lco session lfe ch lc =
  choix_cours_admissibles_aux bcours lco session lfe ch lc
  |> filter (respect_conco_ccp bcours lco)

(* planifier_session : cours list -> programme -> num_cours list -> session
                       -> fe list -> choix -> string list ->num_cours list ->
                       (num_cours list * string list) list *)
let filtre_ch_max bcours lch a max_tcr =
  let total_cr' = total_cr bcours
  and total_cr_avec_stage' = total_cr ~avec_stage:true bcours in
  let l1, max_tcr1, max_tcr2, inclus_stage =
    fold_left
      (fun (acc, acc1, acc2, inclus_stage) l ->
        let size1 = total_cr_avec_stage' l in
        let size2 = total_cr' l in
        let max2 = max acc2 size2 in
        let inclus_stage = inclus_stage || size1 <> size2 in
        let acc2' =
          if max2 > max_tcr then acc2
          else if max_tcr - max2 < max_tcr - acc2 then max2
          else acc2
        in
        (acc @ [ (l, size1, size2) ], max acc1 size1, acc2', inclus_stage))
      ([], 0, 0, false) lch
  in
  ( fold_left
      (fun acc (l, size1, size2) ->
        if size1 <> size2 then
          if size1 >= a && size1 = max_tcr1 then acc @ [ l ] else acc
        else if size2 >= a && size2 = max_tcr2 then acc @ [ l ]
        else acc)
      [] l1,
    min max_tcr1 max_tcr2,
    inclus_stage )

let ret_lc_regles bcours lpat lc_hp l_regles =
  fold_left
    (fun acc (_, _, regle) ->
      match regle with
      | CoursOB (_, l) when l <> [] ->
          acc ++ filter (fun nc -> exists (respecte_motif nc) lpat) l
      | PlageCr (_, n, Cours l) when n > 0 ->
          acc ++ filter (fun nc -> exists (respecte_motif nc) lpat) l
      | PlageCr (_, n, CoursExclus _) when n > 0 ->
          let _, _, lc = respecte_regle bcours lc_hp regle in
          acc ++ (lc_hp -- lc)
      | _ -> acc)
    [] l_regles

let planifier_session bcours ((_, _, _, (n1, _), (n2, _), _) as pgm) lco sess
    lfe ch lpat lc_hp =
  let ch_c_admissibles = choix_cours_admissibles_aux bcours lco sess lfe in
  let conc_obtenues' = conc_obtenues bcours pgm in
  match vers_interv ch with
  | Interv (a, b) as interv when a >= 0 && b >= a && b <= _max ->
      let res1, (_, tcr1), res2, (_, tcr2), _ = ou_en_suis_je bcours pgm lco in
      let lc_ob = ret_lc_regles bcours lpat lc_hp res1 in
      if tcr1 >= n1 && lc_ob = [] && tcr2 >= n2 then []
        (* Plus rien à faire: programme d'études terminé! *)
      else
        let c_obtenues = conc_obtenues' lco in
        let l1 = ch_c_admissibles (Interv (0, b)) lc_ob in
        let l1, tcr_ob, in_st = filtre_ch_max bcours l1 0 (n1 - tcr1) in
        let l =
          if tcr_ob >= b || n2 - tcr2 <= 0 then l1
          else
            let lc_op = ret_lc_regles bcours lpat lc_hp res2 in
            let tcr_op = min (b - tcr_ob) (n2 - tcr2) in
            let l2 = ch_c_admissibles (Interv (0, tcr_op)) lc_op in
            concat
              (map
                 (fun lcob -> map (fun lcop -> lcob ++ lcop) ([] :: l2))
                 (if l1 = [] || (in_st && tcr_ob = 0) then [] :: l1 else l1))
        in
        l
        |> filter (respecte_interv bcours interv)
        |> filter (respect_conco_ccp bcours lco)
        |> map (fun lc -> (lc, conc_obtenues' (lco ++ lc) -- c_obtenues))
  | _ -> []

(* Exemples d'utilisation des différentes fonctions des Tps de l'H-21
   (copier-coller dans l'interpréteur chaque expression à tester/évaluer,
    ou allez-y avec le raccourci Shift-Retour en sélectionnant au
    préalable l'expression)

open List;;

ret_sig_num "IFT-3000";;

respecte_motif "IFT-3000" "*-*";;
respecte_motif "IFT-3000" "*-3000";;
respecte_motif "IFT-3000" "IFT-I";;

existe_pr Aucun (CP "IFT-1004");;
existe_pr (CP "IFT-1004") (OU[CRE 12; CP "GIF-1003"; CP "IFT-1004"]);;

total_cr bcours ["IFT-1111"; "GLO-1111"];;
total_cr bcours ["IFT-1004"; "BIF-1000"; "IFT-1111"];;
total_cr bcours ["IFT-2580"];;

lc_dans_pr (CRE 24);;
lc_dans_pr (ET[OU[CP "GIF-1003"; CRE 12]; CP "IFT-1004"]);;

lc_absents bcours;;

respecte_pr ["IFT-1004"] 12 [] Aucun;;
respecte_pr ["IFT-1004"] 12 [] (OU[CP "GLO-1901";CRE 12]);;
respecte_pr ["IFT-1004"] 12 [] (ET[CP "GLO-1901";CRE 12]);;

bcours
  |> ret_bcours_lmot ["GLO-6*"; "GLO-7*"]
  |> map fst;;

bcours
  |> ret_bcours_lses_lfe [Ete] [Z3;ZA]
  |> map fst;;

bcours
  |> ret_bcours_lmot ["IFT-3*"]
  |> ret_bcours_lses_lfe [Ete] []
  |> map fst;;

bcours
  |> ret_bcours_lmot ["MAT-*"]
  |> ret_bcours_ldom [IA]
  |> map fst;;

bcours
  |> ret_bcours_pr Aucun
  |> map fst;;

bcours
  |> ret_bcours_pr (CRE 24)
  |> map fst;;

bcours
  |> ret_bcours_pr (OU[CP "IFT-1004"; CP "GLO-1901"])
  |> map fst;;

bcours
  |> ret_bcours_lses_lfe [Ete] []
  |> ret_bcours_pr (CP "GIF-1003")
  |> map fst;;

bcours
  |> ret_bcours_admissibles ["GLO-1901"; "MAT-1919"] 6
  |> map fst;;

bcours
  |> ret_bcours_lmot ["IFT-I"; "GLO-I"]
  |> ret_bcours_admissibles ["IFT-1004"; "GIF-1003"; "MAT-1919"; "IFT-1003"] 12
  |> map fst;;

bcours
  |> ret_bcours_lses_lfe [Ete] []
  |> ret_bcours_lmot ["IFT-*"]
  |> ret_bcours_admissibles ["IFT-1004"; "GIF-1003"; "MAT-1919"; "IFT-1003"] 24
  |> map fst;;

conc_obtenues bcours b_ift
 ["GIF-1001"; "IFT-1004"; "IFT-1111"; "MAT-1200"; "MAT-1919";
  "GIF-1003"; "IFT-1000"; "IFT-1003"; "STT-1000"; "IFT-2002";
  "IFT-3000"; "IFT-3001"; "IFT-3101";
  "GLO-2000";"GLO-2001";"GLO-2100";"GLO-2004";"IFT-2004";
  "IFT-2580"; "IFT-3580";
  "ANL-2020";"BIF-1001"; "PHY-1903"; "MAT-1110";
  "GLO-4002"; "IFT-3201";"IFT-4102"; "GLO-4027";"GLO-4035";
  "GLO-4030"; "GLO-3102"; "GLO-4000"; "IFT-2103"
 ];;

ou_en_suis_je bcours b_ift
 ["GIF-1001";"IFT-1004";"IFT-1111";"MAT-1200";"IFT-1000";"STT-1000";"IFT-2002";"IFT-3101";
  "GLO-2000";"GLO-2100";"GLO-2004";"IFT-2580";
  "ANL-2020";"PHY-1903";
  "GLO-4002";"IFT-3201";"GLO-4027";"GLO-4035";"GLO-4030";"GLO-3102";"GLO-4000";"GEL-1001"
 ];;

choix_cours_admissibles
  bcours ["IFT-1004";"MAT-1919";"IFT-1003";"GIF-1001"] Hiv [] (Interv(9,12))
  ["GIF-1003";"GLO-2005";"IFT-2004";"IFT-2002";"IFT-1000";"IFT-3000";"IFT-1111"];;

planifier_session
  bcours b_ift ["IFT-1004";"MAT-1919";"IFT-1003";"GIF-1001"] Hiv [] Plein
  ["IFT-*";"GLO-*";"GIF-*"] [];;
 
*)
