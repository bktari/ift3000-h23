(******************************************************************************)
(** TP1 Hiver 2023 - Langages de programmation (IFT-3000)                     *)

(** Gestion de cours et de programmes - Cohérence d'un programme              *)

(******************************************************************************)
(* NOM: _________________             PRÉNOM: _____________________           *)
(* MATRICULE: ___________             PROGRAMME: __________________           *)
(******************************************************************************)

(******************************************************************************)
(* Implantation                                                               *)
(******************************************************************************)

open GcpLib.Gcp
open List

(* -------------------------------------------------------------------------- *)
(* Partie réservée aux fonctions utiles ------------------------------------- *)
(* Vous pouvez ajouter les fonctions et définitions que vous voulez           *)
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
(* Début partie code (implantation) à compléter ----------------------------- *)
(* -------------------------------------------------------------------------- *)

(* -- À IMPLANTER/COMPLÉTER (8 PTS) ----------------------------------------- *)
let eq_pr (pr : prealables) (pr' : prealables) : bool =
  raise (Non_Implante "eq_pr non implanté")

(* -- À IMPLANTER/COMPLÉTER (7 PTS) ---------------------------------------- *)
let prerequis (bcours : cours list) (c : num_cours) : prealables =
  raise (Non_Implante "prerequis non implanté")

(* -- À IMPLANTER/COMPLÉTER (5 PTS) ----------------------------------------- *)
let extrait_lc (e : exigences) : num_cours list =
  raise (Non_Implante "extrait_lc non implanté")

(* -- À IMPLANTER/COMPLÉTER (5 PTS) ----------------------------------------- *)
let extrait_lc_exclus (e : exigences) : num_cours list =
  raise (Non_Implante "extrait_lc_exclus non implanté")

(* -- À IMPLANTER/COMPLÉTER (6 PTS) ----------------------------------------- *)
let verif_e (bcours : cours list) (e : exigences) : (int * int) * bool =
  raise (Non_Implante "verif_e non implanté")

(* -- À IMPLANTER/COMPLÉTER (6 PTS) ----------------------------------------- *)
let existe_motif (bcours : cours list) (pat : num_cours) : bool =
  raise (Non_Implante "existe_motif non implanté")

(* -- À IMPLANTER/COMPLÉTER (6 PTS) ----------------------------------------- *)
let existe_cours (bcours : cours list) (lc : num_cours list) : bool =
  raise (Non_Implante "existe_cours non implanté")

(* -- À IMPLANTER/COMPLÉTER (10 PTS) ----------------------------------------- *)
let verif_conc (bcours : cours list) (conc : concentration) : bool =
  raise (Non_Implante "verif_conc non implanté")

(* -- À IMPLANTER/COMPLÉTER (15 PTS) ---------------------------------------- *)
let verif_credits (bcours : cours list) (pgm : programme) : bool =
  raise (Non_Implante "verif_credits non implanté")

(* -- À IMPLANTER/COMPLÉTER (12 PTS) ---------------------------------------- *)
let coherence_cours_conc (lconc : concentration list) (lc_ob : num_cours list)
    (lc_op : num_cours list) (lc_exclus : num_cours list) : bool =
  raise (Non_Implante "coherence_cours_conc non implanté")

(* -- À IMPLANTER/COMPLÉTER (10 PTS) ---------------------------------------- *)
let verif_pre (bcours : cours list) (lc1 : num_cours list)
    (lc2 : num_cours list) : bool =
  raise (Non_Implante "verif_pre non implanté")

(* -- À IMPLANTER/COMPLÉTER (10 PTS) ---------------------------------------- *)
let coherence_pgm (bcours : cours list) (pgm : programme) : bool =
  raise (Non_Implante "coherence_pgm non implanté")
