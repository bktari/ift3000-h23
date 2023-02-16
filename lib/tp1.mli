(*****************************************************************************)
(** TP1 Hiver 2023 - Langages de programmation (IFT-3000)                    *)

(** Gestion de cours et de programmes - Cohérence d'un programme             *)

(*****************************************************************************)

(*****************************************************************************)
(** Spécification                                                            *)
(*****************************************************************************)

open GcpLib.Gcp

(* ------------------------------------------------------------------------- *)
(** Interface: fonctions exportées et à implanter                            *)
(* ------------------------------------------------------------------------- *)

(**
  Fonctions utilitaires exportées - dans le cadre de la réalisation de votre 
  travail, vous pouvez préciser des signatures de  fonctions, si vous voulez 
  pouvoir les tester dans l'interpréteur.
*)

(* Fonctions exportées et à implanter (vous ne devez modifier cette partie)  *)
(* ------------------------------------------------------------------------  *)
val eq_pr : prealables -> prealables -> bool
(** 
[eq_pr pr pr'] teste si 2 préalables [pr] et [pr'] passés en argument sont
égaux. Notons que [ET [lst]] est égal à [ET [lst']] si les 2 listes comprennent
exactement les mêmes préalables (l'ordre d'apparition de ces préalables
dans chaque liste n'ayant aucune importance; de même pour la possible présence
de [Aucun] dans chaque liste); il en est de même pour [OU [lst]].

Remarque: il n'est pas nécessaire de valider que tous les cours mentionnés
éventuellement dans [pr] ou [pr'] respectent le format ###-$$$$ (autrement 
dit, la fonction [eq_pr] n'est pas censée soulever des exceptions).

Exemples:

[# eq_pr (OU []) (OU []);;
- : bool = true
]

[# eq_pr (ET []) (ET []);;
- : bool = true
]

[# eq_pr (ET []) (OU []);;
- : bool = false
]

[# eq_pr (ET [CP "a"; CP "b"]) (ET [CP "b"; CP "a"]);;
- : bool = true
]

[# eq_pr (
  OU [CP "c"; (ET [CP "a"; CP "b"])]
  ) (
  OU [(ET [CP "b"; CP "a"]); CP "c"]
);;
- : bool = true
]
*)

(* ------------------------------------------------------------------------- *)
val prerequis : cours list -> num_cours -> prealables
(** 
[prerequis bcours c] retourne toutes la chaine de prérequis du cours [c]
considérant une banque de cours [bcours]. Notez que cette chaine de
prérequis peut mentionner un même cours à plusieurs reprises.

@raise Failure si le cours [c] n'est pas défini dans [bcours] (l'exception 
pourrait avoir été soulevée par une autre fonction appelée dans le corps 
de [prerequis]).

Exemples:

[# prerequis bcours "IFT-1004";;
- : Gcp.prealables = Aucun
]

[# prerequis bcours "GIF-1003";;
- : Gcp.prealables = OU [CP "IFT-1004"; CP "GLO-1901"]
]

[# prerequis bcours "IFT-2008";;
- : Gcp.prealables = 
  OU
  [ET [CP "GIF-1003"; OU [CP "IFT-1004"; CP "GLO-1901"]];
    ET [CP "IFT-1006"; OU [CP "IFT-1004"; CP "GLO-1901"]]]
    ]
*)

(* ------------------------------------------------------------------------- *)
val extrait_lc : exigences -> num_cours list
(** 
[extrait_lc e] extrait la liste des cours mentionnés dans une exigence
de programme définie avec le constructeur [CoursOB] ou [PlageCr]
(pour ce dernier cas, on se restreint aux cours définis avec le 
constructeur [Cours]).

Remarque: il n'est pas nécessaire de valider que tous les cours mentionnés
éventuellement dans [e] respectent le format ###-$$$$ (autrement dit, la 
fonction [extrait_lc] n'est pas censée soulever des exceptions).

Exemples:

[# extrait_lc (CoursOB (6, ["IFT-1000"; "A"]));;
- : Gcp.num_cours list = ["IFT-1000"; "A"]
]

[# extrait_lc (PlageCr (6,9, Cours ["IFT-1000"; "IFT-3000"; "MAT-1919"]));;
- : Gcp.num_cours list = ["IFT-1000"; "IFT-3000"; "MAT-1919"]
]

[# extrait_lc (PlageCr (6,9, CoursExclus ["GIF-*"; "FRN-*"; "GEL-1001"]));;
- : Gcp.num_cours list = []
]
*)

(* ------------------------------------------------------------------------- *)
val extrait_lc_exclus : exigences -> num_cours list
(** 
[extrait_lc_exclus e] extrait la liste des cours mentionnés dans
une exigence de programme défini avec le constructeur [PlageCr]
puis [CoursExclus].

Remarque: il n'est pas nécessaire de valider que tous les cours mentionnés
éventuellement dans [e] respectent un des formats requis par la fonction 
[respecte_motif] (définie dans [Gcp]) (autrement dit, la fonction 
[extrait_lc_exclus] n'est pas censée soulever des exceptions).

Exemples:

[# extrait_lc_exclus (PlageCr (6, 9, CoursExclus ["GIF-*"; "A"]));;
- : Gcp.num_cours list = ["GIF-*"; "A"]
]

[# extrait_lc_exclus (PlageCr (3,6, Cours ["IFT-3000"; "MAT-1919"]));;
- : Gcp.num_cours list = []
]

[# extrait_lc_exclus (CoursOB (6, ["IFT-1000"; "IFT-3000"]));;
- : Gcp.num_cours list = []
]
*)

(* ------------------------------------------------------------------------- *)
val verif_e : cours list -> exigences -> (int * int) * bool
(** 
[verif_e bcours e] vérifie que le nombre de crédits mentionnés dans une 
exigence est cohérent:
- pour une exigence de type [CoursOB(n,l)], la fonction vérifie que
  le total de crédits des cours présents dans la liste [l] vaut bien [n];
  il retourne le total de crédits calculé, suivi du même nombre, suivi
  d'une valeur booléenne résultat de la comparaison;
- pour une exigence de type [PlageCr(n1,n2,Cours l)], la fonction vérifie 
  que que la valeur [n2] est bien supérieure ou égale à [n1] et que le 
  total de crédits des cours présents dans la liste [l] est bien plus 
  grand ou égal à [n2]; il retourne [n1] et [n2] suivi du résultat de 
  la comparaison;
- pour une exigence de type [PlageCr(n1,n2,CoursExclus l)], la fonction 
  retourne les 2 valeurs [n1] et [n2] suivies d'un test vérifiant
  que [n2] est bien supérieure ou égale à [n1].

Remarque: le nombre de crédits pour un cours n'est pas nécessairement 3.
Aussi, pour les cours de stage, on doit considérer 0 crédit.

@raise Failure si un des cours de [e] n'est pas dans le bassin de cours. 
(l'exception pourrait avoir été soulevée par une autre fonction appelée 
dans le corps de [verif_e]). 

Exemples:

[# verif_e bcours (PlageCr (6, 9, CoursExclus ["GIF-*"; "FRN-*"]));;
- : ((6, 9), true)
]

[# verif_e bcours (PlageCr (3, 6, Cours ["IFT-1000"; "IFT-3000"]));;
- : ((3, 6), true)
]

[# verif_e bcours (CoursOB (6, ["IFT-1000"; "IFT-3000"]));;
- : ((6, 6), true)
]

[# verif_e bcours (CoursOB (6, ["IFT-1000"; "IFT-2580"]));;
- : ((3, 3), false)
]

[# verif_e bcours (CoursOB (3, ["IFT-1000"; "IFT-2580"]));;
- : ((3, 3), true)
]

*)

(* ------------------------------------------------------------------------- *)
val existe_motif : cours list -> string -> bool
(** 
[existe_motif bcours m] teste si il existe au moins un cours, dans le 
bassin de cours [bcours], qui respecte le motif [m]. 

@raise Failure si le motif [m] ne respecte pas un des formats requis 
par la fonction [respecte_motif] (définie dans [Gcp]) (l'exception 
pourrait avoir été soulevée par une autre fonction appelée dans le 
corps de [existe_motif]).

Exemples:

[# existe_motif bcours "*-3000";;
- : bool = true
]

[# existe_motif bcours "IFT-3000";;
- : bool = true
]

[# existe_motif bcours "allo";;
Exception: Failure "<allo>: mauvais motif!".
]

[# existe_motif bcours "*-1009";;
- : bool = false
]
*)

(* ------------------------------------------------------------------------- *)
val existe_cours : cours list -> num_cours list -> bool
(** 
[existe_cours bcours lc] teste si tous les cours présents dans [lc] sont 
bien définis dans le bassin de cours [bcours]. Notons que les éléments 
de [lc] peuvent soit être des numéros de cours, soit des motifs de cours.

@raise Failure si un des éléments de [lc] ne respecte pas un des formats 
requis par la fonction [respecte_motif] (définie dans [Gcp]). 
(l'exception pourrait avoir été soulevée par une autre fonction appelée 
dans le corps de [existe_cours]). 

Exemples:

[# existe_cours bcours ["GIF-*"; "IFT-1000"];;
- : bool = true
]

[# existe_cours bcours ["*-1009"];;
- : bool = false
]

[# existe_cours bcours ["*.*"; "IFT-1000"];;
Exception: Failure "<*.*>: mauvais motif!".
]
*)

(* ------------------------------------------------------------------------- *)
val verif_conc : cours list -> concentration -> bool
(** 
[verif_conc bcours conc] vérifie que la concentration [conc] est valide.
Plus précisément, étant donné une concentration [conc], toutes les 
exigences qui y sont définies sont vérifiées, et le total des 
minimus et maximums de crédits des exigences doivent borner le nombre 
de crédits de la concentration.

@raise Failure si un des cours présent dans [conc] n'est pas dans le bassin 
de cours (l'exception pourrait avoir été soulevée par une autre fonction 
appelée dans le corps de [verif_conc]). 

Exemples:

[# verif_conc bcours ( "Jeux vidéos",
  ( 6,
    [
      PlageCr
        ( 6,
          6,
          Cours [ "GIF-4104"; "GLO-2003"; "GLO-3004" ] );
    ] ) );;
- : bool = true
]

[# verif_conc bcours ("Jeux vidéos",
  (9,
  [ PlageCr (9, 9, Cours [ "GIF-4104"; "GLO-2003" ]) ]
));;
- : bool = false
]

[# verif_conc bcours (
  "Jeux vidéos",
  (9, [ PlageCr (9, 9, Cours [ "GIF-4104"; "5" ]) ]
));;
Exception: Failure "Cours <5> inexistant!".
]
*)

(* ------------------------------------------------------------------------- *)
val verif_credits : cours list -> programme -> bool
(** 
[verif_credits bcours pgm] vérifie que les totaux de crédits définis dans 
un programme [pgm] sont corrects. Plus précisément, étant donné un [pgm] 
qui est défini par [((_,_, total, _),_,_,(n1,e1),(n2,e2),concs)]:
- les exigences de [e1] sont vérifiées;
- les exigences de [e2] sont vérifiées;
- le total des crédits des cours définis dans [e1] vaut [n1];
- le minimum et le maximum de crédits des cours définis dans [e2] bornent 
  [n2];
- les concentrations sont vérifiées;
- la somme de [n1] et [n2] vaut bien [total].
Le calcul du nombre de crédits se fait comme suit:
- Pour une exigence de type [CoursOB(n,l)], il s'agit simplement de calculer
  la somme des crédits des cours présents dans [l] (qui doit être égale à
  [n]);
- Pour une exigence de type [PlageCr(n1,n2,Cours l)], il s'agit de calculer
  la somme des crédits des cours présents dans [l] (qui doit être comprise
  entre [n1] et [n2]);
- Pour une exigence de type [PlageCr(n1,n2,CoursExclus l)], on ne peut calculer
  de somme de crédits; on peut simplement considérer que la somme est 
  comprise entre [n1] et [n2]; on doit aussi vérifier que [n2] est bien 
  supérieure ou égale à [n1].

@raise Failure si un des éléments de [pgm] ne respecte pas un des 
formats requis par la fonction [respecte_motif] (définie dans [Gcp]). 
(l'exception pourrait avoir été soulevée par une autre fonction appelée 
dans le corps de [verif_credits]). 

Exemples:

[# verif_credits bcours b_ift;;
- : bool = true
]

[# verif_credits bcours b_glo;;
- : bool = true
]

[# verif_credits bcours c_ift;;
- : bool = true
]
*)

(* ------------------------------------------------------------------------- *)
val coherence_cours_conc :
  concentration list ->
  num_cours list ->
  num_cours list ->
  num_cours list ->
  bool
(** 
[coherence_cours_conc lconc lc_ob lc_op lc_exclus] vérifie que les cours
dans les concentrations [lconc] ne se retrouvent pas dans des cours
obligatoires, représentés par la liste [lc_ob], mais plutôt dans les cours
optionnels (donc membre de la liste [lc_op]) ou hors discipline (donc, non
membre de la liste [lc_exclus] si celle-ci n'est pas vide; ; si elle est vide, 
aucun cours ne pourrait être considéré comme hors discipline).

@raise Failure si un des éléments de [lconc] ou [lc_exclus] ne respecte 
pas un des formats requis par la fonction [respecte_motif] (définie dans 
[Gcp]). (l'exception pourrait avoir été soulevée par une autre fonction 
appelée dans le corps de [coherence_cours_conc]). 

Exemple: Voir exemples dans `testeur.ml`
*)

(* ------------------------------------------------------------------------- *)
val verif_pre : cours list -> num_cours list -> num_cours list -> bool
(** 
[verif_pre bcours lc1 lc2] vérifie que les préalables des cours de la liste
[lc1] sont satisfiables par la liste de cours [lc2]. La liste [lc2] ne 
comprenant que des numéros de cours, un préalable de type [CRE _] ou [Aucun] 
est toujours satisfait.

@raise Failure si un des cours présent dans [lc1] n'est pas dans le bassin 
de cours (l'exception pourrait avoir été soulevée par une autre fonction 
appelée dans le corps de [verif_pre]). 

Exemples:

[# verif_pre bcours
  [ "IFT-3000"; "GLO-3004" ]
  [ "IFT-2002"; "GIF-1003"; "IFT-1006"; "IFT-2008"; "GLO-2100" ];;
- : bool = true
]

[# verif_pre bcours
  [ "IFT-3000"; "GLO-3004" ]
  [ "IFT-2002"; "GLO-2100" ];;
- : bool = false
]
*)

(* ------------------------------------------------------------------------- *)
val coherence_pgm : cours list -> programme -> bool
(** 
[coherence_pgm bours pgm] teste la cohérence d'un programme [pgm], étant 
donné un bassin de cours [bcours]:
- tous les cours mentionnés dans [pgm] existent dans [bcours]; 
- les différents sous-totaux de crédits sont cohérents; 
- tous les cours mentionnés dans les concentrations de [pgm] ne sont pas 
  mentionnés dans partie obligatoire du programme, mais plutôt dans la 
  partie optionnel ou hors-discipline; 
- tous les préalables des cours obligatoires se retrouvent dans la partie
  obligatoire du programme; 
- tous les préalables de cours optionnels se retrouvent soit dans la partie
  obligatoire du programme, soit dans la partie optionnelle.

@raise Failure étant donné que cette fonction fait appel à plusieurs autres
fonctions du Tp qui soulèvent des exceptions; par exemple, si un des cours 
présent dans [pgm] n'est pas dans le bassin de cours, une exception sera 
forcément soulevée (donc, comme pour les autres fonctions, la fonction 
[coherence_pgm] n'est pas censée soulever des exceptions). 

Exemples:

[# coherence_pgm bcours b_ift;;
- : bool = true 
]

[# coherence_pgm bcours b_glo;;
- : bool = true 
]

[# coherence_pgm bcours c_ift;;
- : bool = true 
]
*)
