(* -------------------------------------------------------------------------- *)
(* ----------------------- TP1 - IFT-3000 - Hiver 2023 ---------------------- *)
(* -------------------------------------------------------------------------- *)
(** Fichier permettant de tester les fonctions implantées du TP               *)
(* -------------------------------------------------------------------------- *)

open GcpLib
open Gcp
open Cours
open Programmes
open Tp1

(******************************************************************************)
(* JEUX DE DONNÉES
   Un jeu de données est composé d'un tuple comprenant les éléments suivants:
   - le nom de la fonction à tester;
   - une fonction qui permet de préciser comment le testeur doit agir avec les
     données et le résultat attendu pour chaque test;
   - une liste de tuples comprenant chaque donnée à tester, le résultat attendu,
     une chaine de caractères précisant le code testé (fonction et arguments);
   - en option, une même liste de tuples qui concernent les cas qui devraient
     soulever une exception, précédée par le code à utiliser pour lancer le test
     et donc, en théorie, provoquer une exception.
*)
(******************************************************************************)

(* -------------------------------------------------------------------------- *)
let jeu_eq_pr =
  ( "eq_pr", 
    (fun (pr, pr') res -> eq_pr pr pr' = res),
    [
      ((CRE 12, CRE 13), false, {| eq_pr (CRE 12) (CRE 13) |});
      ((CRE 12, CRE 12), true, {| eq_pr (CRE 12) (CRE 12) |});
      ((CP "A", CP "a"), false, {| eq_pr (CP "A") (CP "a") |});
      ((CP "IFT-", CP "IFT-"), true, {| eq_pr (CP "IFT-") (CP "IFT-") |});
      ((CP "a", CCP "a"), false, {| eq_pr (CP "a") (CCP "a") |});
      ((CP "a", CRE 12), false, {| eq_pr (CP "a") (CRE 12) |});
      ((Aucun, Aucun), true, {| eq_pr Aucun Aucun |});
      ((Aucun, CRE 1), false, {| eq_pr Aucun (CRE 1) |});
      ((CP "a", Aucun), false, {| eq_pr (CP "a") Aucun |});
      ((OU [], OU []), true, {| eq_pr (OU []) (OU []) |});
      ((ET [], ET []), true, {| eq_pr (ET []) (ET []) |});
      ((ET [], OU []), false, {| eq_pr (ET []) (OU []) |});
      ((OU [], ET []), false, {| eq_pr (OU []) (ET []) |});
      ((OU [CP "a"; CP "b"; Aucun], OU [CP "a"; CP "b"]), 
        true, {| eq_pr (OU [CP "a"; CP "b"; Aucun]) (OU [CP "a"; CP "b"]) |});
      ( (OU [ CP "a" ], OU [ CP "a" ]),
        true,
        {|eq_pr (OU [CP "a"]) (OU [CP "a"])|} );
      ( (OU [ CP "a" ], OU [ CP "b" ]),
        false,
        {|eq_pr (OU [CP "a"]) (OU [CP "b"])|} );
      ( (ET [ CP "a"; CP "b" ], ET [ CP "b"; CP "a" ]),
        true,
        {|eq_pr (ET [CP "a"; CP "b"]) (ET [CP "b"; CP "a"])|} );
      ( ( OU [ CP "a"; ET [ CP "b"; CRE 10 ] ],
          OU [ ET [ CRE 10; CP "b" ]; CP "a" ] ),
        true,
        {|eq_pr (OU [CP "a"; ET[CP "b"; CRE 10]]) (OU [ET[CRE 10;CP "b"]; CP "a"])|}
      );
      ( ( OU [ CP "a"; ET [ CP "b"; CRE 10 ] ],
          OU [ ET [ CRE 10; CP "b" ]; CP "a" ] ),
        true,
        {|eq_pr (OU [CP "a"; ET[CP "b"; CRE 10]]) (OU [ET[CRE 10;CP "b"]; CP "a"])|}
      );
    ],
    (* ---- Cas devant soulever une exception! ---- *)
    None )

(* -------------------------------------------------------------------------- *)
let jeu_prerequis =
  let prerequis' = prerequis bcours in
  ( "prerequis",
    (fun pr res -> prerequis' pr = res),
    [
      ("IFT-1004", Aucun, {|prerequis bcours "IFT-1004"|});
      ( "GIF-1003",
        OU [ CP "IFT-1004"; CP "GLO-1901" ],
        {|prerequis bcours "GIF-1003"|} );
      ( "IFT-2008",
        OU
          [
            ET [ CP "GIF-1003"; OU [ CP "IFT-1004"; CP "GLO-1901" ] ];
            ET [ CP "IFT-1006"; OU [ CP "IFT-1004"; CP "GLO-1901" ] ];
          ],
        {|prerequis bcours "IFT-2008"|} );
      ( "IFT-4100",
        ET [ CRE 21; OU [ CP "IFT-1004"; CP "GLO-1901" ] ],
        {|prerequis bcours "IFT-4100"|} );
      ( "STT-4000",
        OU
          [
            ET
              [
                CP "STT-1500";
                OU
                  [
                    CP "MAT-1110";
                    ET [ CCP "MAT-1910"; OU [ CCP "MAT-1900"; CCP "MAT-1920" ] ];
                  ];
              ];
            CP "ACT-1002";
          ],
        {|prerequis bcours "STT-4000"|} );
    ],
    (* ---- Cas devant soulever une exception! ---- *)
    Some
      ( (fun pr -> prerequis' pr),
        [
          ("IFT-*", {|prerequis bcours "IFT-*"|});
          ("IFT-4101", {|prerequis bcours "IFT-4101"|});
        ] ) )

(* -------------------------------------------------------------------------- *)
let jeu_extrait_lc =
  ( "extrait_lc",
    (fun ch res -> eql (extrait_lc ch) res),
    [
      ( CoursOB (3, []),
        [],
        {|extrait_lc (CoursOB (3, []))|} );
      ( PlageCr (6, 9, Cours []),
        [],
        {|extrait_lc (PlageCr (6,9, Cours []))|} );
      ( PlageCr (6, 9, CoursExclus []),
        [],
        {|extrait_lc (PlageCr (6,9, CoursExclus []))|} );
      ( CoursOB (6, [ "IFT-1000"; "IFT-3000" ]),
        [ "IFT-1000"; "IFT-3000" ],
        {|extrait_lc (CoursOB (6, ["IFT-1000"; "IFT-3000"]))|} );
      ( PlageCr (6, 9, Cours [ "A"; "B"; "C" ]),
        [ "A"; "B"; "C" ],
        {|extrait_lc (PlageCr (6,9, Cours ["A"; "B"; "C"]))|} );
      ( PlageCr (6, 9, CoursExclus [ "GIF-*"; "FRN-*"; "C" ]),
        [],
        {|extrait_lc (PlageCr (6,9, CoursExclus ["GIF-*"; "FRN-*"; "C"]))|} );
      ( CoursOB (6, [ "IFT-1000"; "IFT-3000"; "GIF-*" ]),
        [ "IFT-1000"; "IFT-3000"; "GIF-*" ],
        {|extrait_lc (CoursOB (6, ["IFT-1000"; "IFT-3000"; "GIF-*"]))|} );
      ( PlageCr (6, 9, Cours [ "a"; "b"; "" ]),
        [ "a"; "b"; "" ],
        {|extrait_lc (PlageCr (6, 9, Cours [ "a"; "b"; "" ]))|} );
    ],
    (* ---- Cas devant soulever une exception! ---- *)
    None )

(* -------------------------------------------------------------------------- *)
let jeu_extrait_lc_exclus =
  ( "extrait_lc_exclus",
    (fun ch res -> eql (extrait_lc_exclus ch) res),
    [
      ( CoursOB (3, []),
        [],
        {|extrait_lc_exclus (CoursOB (3, []))|} );
      ( PlageCr (6, 9, Cours []),
        [],
        {|extrait_lc_exclus (PlageCr (6,9, Cours []))|} );
      ( PlageCr (6, 9, CoursExclus []),
        [],
        {|extrait_lc_exclus (PlageCr (6,9, CoursExclus []))|} );
      ( PlageCr (6, 9, CoursExclus [ "GIF-*"; ""; "C" ]),
        [ "GIF-*"; ""; "C" ],
        {|extrait_lc_exclus (PlageCr (6,9, CoursExclus ["GIF-*"; ""; "C"]))|} );
      ( PlageCr (6, 9, Cours [ "A"; "B"; "C" ]),
        [],
        {|extrait_lc_exclus (PlageCr (6,9, Cours ["A"; "B"; "C"]))|} );
      ( CoursOB (6, [ "IFT-1000"; "IFT-3000" ]),
        [],
        {|extrait_lc_exclus (CoursOB (6, ["IFT-1000"; "IFT-3000"]))|} );
      ( PlageCr (6, 9, CoursExclus [ "IFT-1000"; "IFT-3000" ]),
        [ "IFT-1000"; "IFT-3000" ],
        {|extrait_lc_exclus (PlageCr (6,9, CoursExclus [ "IFT-1000"; "IFT-3000" ]))|}
      );
    ],
    (* ---- Cas devant soulever une exception! ---- *)
    None )

(* -------------------------------------------------------------------------- *)
let jeu_verif_e =
  let verif_e' = verif_e bcours in
  ( "verif_e",
    (fun ch res -> verif_e' ch = res),
    [
      ( PlageCr (6, 9, CoursExclus [ "GIF-*"; "FRN-*" ]),
        ((6, 9), true),
        {|verif_e bcours (PlageCr (6,9, CoursExclus ["GIF-*"; "FRN-*"]))|}
      );
      ( PlageCr (9, 6, CoursExclus [ "GIF-*"; "FRN-*" ]),
        ((9, 6), false),
        {|verif_e bcours (PlageCr (9,6, CoursExclus ["GIF-*"; "FRN-*"]))|}
      );
      ( PlageCr (6, 6, CoursExclus [ "GIF-*"; "FRN-*" ]),
        ((6, 6), true),
        {|verif_e bcours (PlageCr (6,6, CoursExclus ["GIF-*"; "FRN-*"]))|}
      );
      ( PlageCr (3, 6, Cours [ "IFT-1000"; "IFT-3000"; "MAT-1919" ]),
        ((3, 6), true),
        {|verif_e bcours (PlageCr (3, 6, Cours [ "IFT-1000"; "IFT-3000"; "MAT-1919" ]))|}
      );
      ( PlageCr (9, 6, Cours [ "IFT-1000"; "IFT-3000"; "MAT-1919" ]),
        ((9, 6), false),
        {|verif_e bcours (PlageCr (9, 6, Cours [ "IFT-1000"; "IFT-3000"; "MAT-1919" ]))|}
      );
      ( PlageCr (6, 9, Cours [ "IFT-1000"; "IFT-3000"; "MAT-1919" ]),
        ((6, 9), true),
        {|verif_e bcours (PlageCr (6,9, Cours ["IFT-1000"; "IFT-3000"; "MAT-1919"]))|}
      );
      ( CoursOB (6, [ "IFT-1000"; "IFT-3000" ]),
        ((6, 6), true),
        {|verif_e bcours (CoursOB (6, ["IFT-1000"; "IFT-3000"]))|} );
      ( CoursOB (6, [ "BIF-1000"; "IFT-3000" ]),
        ((4, 4), false),
        {|verif_e bcours (CoursOB (6, [ "BIF-1001"; "IFT-3000" ]))|} );
      ( PlageCr (6, 9, Cours [ "IFT-1111"; "IFT-3000" ]),
        ((6, 9), false),
        {|verif_e bcours (PlageCr (6,9, Cours ["IFT-1111"; "IFT-3000"]))|} );
      ( CoursOB (6, [ "IFT-1111"; "IFT-3000" ]),
        ((3, 3), false),
        {|verif_e bcours (CoursOB (6, ["IFT-1111"; "IFT-3000"]))|} );
      ( CoursOB (6, ["IFT-1000"; "IFT-2580"]),
        ((3, 3), false),
        {|verif_e bcours (CoursOB (6, ["IFT-1000"; "IFT-2580"]))|} );
      ( CoursOB (3, [ "IFT-1000"; "IFT-2580" ]),
        ((3, 3), true),
        {|verif_e bcours (CoursOB (3, ["IFT-1000"; "IFT-2580"]))|} );
    ],
    (* ---- Cas devant soulever une exception! ---- *)
    Some
      ( (fun ch -> verif_e' ch),
        [
          ( PlageCr (6, 9, Cours [ "A"; "B"; "C" ]),
            {|verif_e bcours (PlageCr (6,9, Cours ["A"; "B"; "C"]))|} );
          ( CoursOB (3, [ "IFT-4101" ]),
            {|verif_e bcours (CoursOB (3, [ "IFT-4101" ]))|} );
        ] ) )

(* -------------------------------------------------------------------------- *)
let jeu_existe_motif =
  let existe_motif' = existe_motif bcours in
  ( "existe_motif",
    (fun pat res -> existe_motif' pat = res),
    [
      ("GIF-*", true, {|existe_motif bcours "GIF-*"|});
      ("*-3000", true, {|existe_motif bcours "*-3000"|});
      ("IFT-3000", true, {|existe_motif bcours "IFT-3000"|});
      ("*-1009", false, {|existe_motif bcours "*-1009"|});
      ("GCP-*", false, {|existe_motif bcours "GCP-*"|});
    ],
    (* ---- Cas devant soulever une exception! ---- *)
    Some
      ( (fun pat -> existe_motif' pat),
        [
          ("allo", {|existe_motif bcours "allo"|});
          ("", {|existe_motif bcours ""|});
        ] ) )

(* -------------------------------------------------------------------------- *)
let jeu_existe_cours =
  let existe_cours' = existe_cours bcours in
  ( "existe_cours",
    (fun lp res -> existe_cours' lp = res),
    [
      ([], true, {|existe_cours bcours []|});
      ( [ "GIF-*"; "IFT-1000" ],
        true,
        {|existe_cours bcours ["GIF-*"; "IFT-1000"]|} );
      ([ "*-1009" ], false, {|existe_cours bcours ["*-1009"]|});
      ([ "IFT-4101" ], false, {|existe_cours bcours ["IFT-4101"]|});
      ( [ "GIF-*"; "IFT-1000"; "IFT-3000"; "GOO-8888" ],
        false,
        {|existe_cours bcours [ "GIF-*"; "IFT-1000"; "IFT-3000"; "GOO-8888" ]|}
      );
    ],
    (* ---- Cas devant soulever une exception! ---- *)
    Some
      ( (fun lp -> existe_cours' lp),
        [ ([ "*.*"; "IFT-1000" ], {|existe_cours bcours ["*.*"; "IFT-1000"]|}) ]
      ) )

(* -------------------------------------------------------------------------- *)
let jeu_verif_conc =
  let c1 =
    ( "Bio-informatique",
      ( 12,
        [
          PlageCr (3, 6, Cours [ "IFT-4001"; "IFT-4102" ]);
          PlageCr
            ( 6,
              9,
              Cours
                [
                  "BCM-1001";
                  "BCM-1003";
                  "BCM-1005";
                  "BIF-1000";
                  "BIF-1001";
                  "BIF-4007";
                ] );
        ] ) )
  and c2 =
    ( "Génie logiciel",
      ( 9,
        [
          PlageCr
            ( 12,
              12,
              Cours
                [
                  "GIF-4104";
                  "GLO-2003";
                  "GLO-3004";
                  "GLO-3100";
                  "GLO-3101";
                  "GLO-3102";
                  "GLO-3112";
                  "GLO-4000";
                  "GLO-4002";
                  "GLO-4003";
                  "GLO-4035";
                  "IFT-3201";
                  "GLO-4008";
                ] );
        ] ) )
  and c3 =
    ( "Jeux vidéos",
      ( 9,
        [
          PlageCr
            ( 9,
              9,
              Cours
                [
                  "GIF-4104";
                  "GLO-2003";
                  "GLO-3004";
                  "GLO-3100";
                  "GLO-3101";
                  "GLO-3102";
                  "GLO-3112";
                  "GLO-4000";
                  "GLO-4002";
                  "GLO-4003";
                  "GLO-4035";
                  "IFT-3201";
                  "GLO-4008";
                ] );
        ] ) )
  and c4 =
    ("Jeux vidéos", (9, [ PlageCr (9, 9, Cours [ "GIF-4104"; "GLO-2003" ]) ]))
  and c5 =
    ("Jeux vidéos", (9, [ PlageCr (9, 9, Cours [ "GIF-4104"; "5" ]) ]))
  and c_vide =
    ("Vide", (0, [ ]))
  and c_vide' =
    ("Vide'", (1, [ ]))
  in
  let verif_conc' = verif_conc bcours in
  ( "verif_conc",
    (fun conc res -> verif_conc' conc = res),
    [
      (c1, true, {|verif_conc bcours c1|});
      (c2, false, {|verif_conc bcours c2|});
      (c3, true, {|verif_conc bcours c3|});
      (c4, false, {|verif_conc bcours c4|});
      (c_vide, true, {|verif_conc bcours c_vide|});
      (c_vide', false, {|verif_conc bcours c_vide'|});
    ],
    (* ---- Cas devant soulever une exception! ---- *)
    Some ((fun conc -> verif_conc' conc), [ (c5, {|verif_conc bcours c5|}) ]) )

(* -------------------------------------------------------------------------- *)
let jeu_verif_credits =
  let p1 : programme =
    ( (Bacc, "XYZ", 15, 1),
      "XYZ",
      [],
      ( 9,
        [
          ("OB", CoursOB (6, [ "IFT-1003"; "STT-1000" ]));
          ("R1", PlageCr (3, 3, Cours [ "GLO-2100"; "IFT-2008" ]));
        ] ),
      ( 6,
        [
          ("R2", PlageCr (3, 3, Cours [ "GLO-2100"; "IFT-2008" ]));
          ("R3", PlageCr (3, 3, CoursExclus [ "*-IFT" ]));
        ] ),
      [] )
  and p2 : programme =
    ( (Bacc, "XYZ", 15, 1),
      "XYZ",
      [],
      ( 9,
        [
          ("OB", CoursOB (6, [ "IFT-1003"; "STT-1000" ]));
          ("R1", PlageCr (3, 3, Cours [ "GLO-2100"; "IFT-2008" ]));
        ] ),
      ( 6,
        [
          ("R2", PlageCr (3, 3, Cours [ "GLO-2100"; "ABC" ]));
          ("R3", PlageCr (3, 3, CoursExclus [ "*-IFT" ]));
        ] ),
      [] )
  and p3 : programme =
    ( (Bacc, "FAUX", 15, 1),
      "FAUX",
      [],
      ( 48,
        [
          ("OB", CoursOB (6, [ "IFT-1003"; "STT-1000" ]));
          ("R1", PlageCr (3, 3, Cours [ "GLO-2100"; "IFT-2008" ]));
        ] ),
      ( 6,
        [
          ("R2", PlageCr (3, 3, Cours [ "GLO-2100"; "IFT-3000" ]));
          ("R3", PlageCr (3, 3, CoursExclus [ "*-IFT" ]));
        ] ),
      [] )
  and p4 : programme =
    ( (Bacc, "FAUX", 15, 1),
      "FAUX",
      [],
      ( 6,
        [
          ("OB", CoursOB (3, [ "IFT-1003"; "STT-1000" ]));
          ("R1", PlageCr (3, 3, Cours [ "GLO-2100"; "IFT-2008" ]));
        ] ),
      ( 6,
        [
          ("R2", PlageCr (3, 3, Cours [ "GLO-2100"; "IFT-3000" ]));
          ("R3", PlageCr (3, 3, CoursExclus [ "*-IFT" ]));
        ] ),
      [] )
  and p5 : programme =
    ( (Bacc, "FAUX", 15, 1),
      "FAUX",
      [],
      ( 6,
        [
          ("OB", CoursOB (3, [ "IFT-1003"; "STT-1000" ]));
          ("R1", PlageCr (3, 3, Cours [ "GLO-2100"; "IFT-2008" ]));
        ] ),
      ( 9,
        [
          ("R2", PlageCr (3, 3, Cours [ "GLO-2100"; "IFT-3000" ]));
          ("R3", PlageCr (3, 3, CoursExclus [ "*-IFT" ]));
        ] ),
      [] )
  and p_vide : programme =
    ( (Bacc, "Fictif", 0,0), "Vide", [], (0, []), (0, []), [] )
  and p_mp : programme =
    ( (MP, "MicroPgm", 6,0), "Fictif", [], 
        (3, [("R1", CoursOB(3,["IFT-1004"]))]), 
        (3, [("R2", PlageCr(3,3, Cours ["GIF-1003"]))]), [] )
  in
  let verif_credits' = verif_credits bcours in
  ( "verif_credits",
    (fun pgm res -> verif_credits' pgm = res),
    [
      (b_ift, true, {|verif_credits bcours b_ift|});
      (b_glo, true, {|verif_credits bcours b_glo|});
      (c_ift, true, {|verif_credits bcours c_ift|});
      (p1, true, {|verif_credits bcours p1|});
      (p3, false, {|verif_credits bcours p3|});
      (p4, false, {|verif_credits bcours p4|});
      (p5, false, {|verif_credits bcours p5|});
      (p_vide, true, {|verif_credits bcours p_vide|});
      (p_mp, true, {|verif_credits bcours p_mp|});
    ],
    (* ---- Cas devant soulever une exception! ---- *)
    Some ((fun pgm -> verif_credits' pgm), [ (p2, {|verif_credits bcours p2|}) ])
  )

(* -------------------------------------------------------------------------- *)
let jeu_coherence_cours_conc =
  let l_vide : concentration list = [ ]
  and c_vide : concentration list = [ ("C", (0, [ ])) ]
  and c0 : concentration list = [ ("C0", (9, [ CoursOB (6, [ "A" ]) ])) ]
  and cl : concentration list =
    [ ("C1", (9, [ CoursOB (6, [ "GLO-4027"; "GIF-4104" ]) ])) ]
  and cl' : concentration list =
    [
      ( "C2",
        ( 9,
          [
            PlageCr
              ( 9,
                9,
                Cours
                  [
                    "GIF-4100";
                    "GIF-4104";
                    "IFT-2103";
                    "IFT-3100";
                    "IFT-3113";
                    "IFT-4102";
                  ] );
          ] ) );
      ( "C3",
        ( 12,
          [
            CoursOB (6, [ "GLO-4027"; "GLO-4035" ]);
            PlageCr
              ( 6,
                6,
                Cours
                  [
                    "GIF-4101";
                    "GIF-4104";
                    "GLO-4030";
                    "IFT-4001";
                    "IFT-4102";
                    "STT-2200";
                  ] );
          ] ) );
    ]
  and l1 = []
  and l2 =
    [
      "GLO-4027";
      "GLO-4035";
      "GIF-4100";
      "GIF-4104";
      "IFT-2103";
      "IFT-3100";
      "IFT-3113";
      "GIF-4101";
      "GLO-4030";
      "IFT-4001";
      "IFT-4102";
      "STT-2200";
    ]
  and l3 = [ "GIF-*"; "GLO-*"; "IFT-*"; "GEL-1001" ]
  and l3' = [ "IFT-#" ]
  and l1' = [ "GIF-1001"; "IFT-1004"; "IFT-1111"; "MAT-1200"; "MAT-1919" ]
  and l2' =
    [
      "GLO-4027";
      "GLO-4035";
      "GIF-4100";
      "GIF-4104";
      "IFT-2103";
      "IFT-3100";
      "IFT-3113";
      "GIF-4101";
      "GLO-4030";
      "IFT-4001";
      "IFT-4102";
    ]
  in

  ( "coherence_cours_conc",
    (fun (conc, l1, l2, l3) res -> coherence_cours_conc conc l1 l2 l3 = res),
    [
      ((cl', l1', l2, l3), true, {|coherence_cours_conc cl' l1' l2 l3|});
      ((cl', l1', l2', []), false, {|coherence_cours_conc cl' l1' l2' []|});
      ((cl', l1', l2', l3), true, {|coherence_cours_conc cl' l1' l2' l3|});
      ( (cl, l1, [ "A"; "GLO-4027"; "GIF-4104" ], []),
        true,
        {|coherence_cours_conc cl l1 ["A";"GLO-4027";"GIF-4104"] []|} );
      ( (cl, l1, [ "A"; "GLO-4027" ], [ "IFT-*" ]),
        true,
        {|coherence_cours_conc cl l1 ["A";"GLO-4027"] ["IFT-*"]|} );
      ((l_vide, l1', l2, l3), true, {|coherence_cours_conc l_vide l1' l2 l3|});
      ((c_vide, l1', l2, l3), true, {|coherence_cours_conc c_vide l1' l2 l3|});
    ],
    (* ---- Cas devant soulever une exception! ---- *)
    Some
      ( (fun (conc, l1, l2, l3) -> coherence_cours_conc conc l1 l2 l3),
        [
          ((c0, [], [], l3), {|coherence_cours_conc c0 [] [] l3|});
          ((cl, [], [], l3'), {|coherence_cours_conc c1 [] [] l3'|});
        ] ) )

(* -------------------------------------------------------------------------- *)
let jeu_verif_pre =
  let lc1 = [ "IFT-3000"; "GLO-3004" ]
  and lc2 = [ "IFT-2002"; "GIF-1003"; "IFT-1006"; "IFT-2008"; "GLO-2100" ]
  and lc2' = [ "IFT-2002"; "GIF-1003"; "IFT-2008"; "GLO-2100" ]
  and lc2'' = [ "A"; "IFT-2002"; "GIF-1003"; "IFT-2008"; "GLO-2100"; "B" ]
  and lc1' = [ "IFT-3000"; "GLO-3004"; "B" ] in
  let verif_pre' = verif_pre bcours in
  ( "verif_pre",
    (fun (lc1, lc2) res -> verif_pre' lc1 lc2 = res),
    [
      (([], []), true, {|verif_pre bcours [] []|});
      (([], ["IFT-3000"]), true, {|verif_pre bcours [] ["IFT-3000"]|});
      ((["IFT-3000"], []), false, {|verif_pre bcours ["IFT-3000"] []|});
      ((["IFT-1004"], []), true, {|verif_pre bcours ["IFT-1004"] []|});
      ((lc1, lc2), true, {|verif_pre bcours lc1 lc2|});
      ((lc1, lc2'), true, {|verif_pre bcours lc1 lc2'|});
      ((lc1, lc2''), true, {|verif_pre bcours lc1 lc2''|});
      ((lc2', lc2), false, {|verif_pre bcours lc2' lc2|});
      ((lc2, lc2), false, {|verif_pre bcours lc2 lc2|});
      ((lc2, lc2'), false, {|verif_pre bcours lc2 lc2'|});
      ((lc2, lc2''), false, {|verif_pre bcours lc2 lc2''|});
    ],
    (* ---- Cas devant soulever une exception! ---- *)
    Some
      ( (fun (lc1, lc2) -> verif_pre' lc1 lc2),
        [ ((lc1', lc2), {|verif_pre bcours lc1' lc2|}) ] ) )

(* -------------------------------------------------------------------------- *)
let jeu_coherence_pgm =
  let coherence_pgm' = coherence_pgm bcours in
  let (tp, nom, tcr, ta), t, sl, (n1, ch1), (n2, ch2), concs = b_ift in
  let _, _, _, (_, ch_ob_c), _, _ = c_ift in
  let b_ift_mauvais_total =
    ((tp, nom, tcr + 12, ta), t, sl, (n1, ch1), (n2, ch2), concs)
  in
  let b_ift_annees_non_considerees =
    ((tp, nom, tcr, 0), t, sl, (n1, ch1), (n2, ch2), concs)
  in
  let b_ift_sans_concentrations =
    ((tp, nom, tcr, ta), t, sl, (n1, ch1), (n2, ch2), [])
  in
  let b_ift_lc_op_non_valide =
    ((tp, nom, tcr, ta), t, sl, (n1, ch1), (0, ch2), concs)
  in
  let b_ift_avec_ob_de_c_donc_non_valide =
    ((tp, nom, tcr, ta), t, sl, (n1, ch_ob_c), (n2, ch2), concs)
  in
  let cours_inexistant =
    ( (tp, nom, tcr, ta),
      t,
      sl,
      (n1, ch_ob_c),
      (n2, [ ("R", CoursOB (3, [ "A" ])) ]),
      concs )
  and p_vide : programme =
    ( (Bacc, "Fictif", 0,0), "Vide", [], (0, []), (0, []), [] )
  and p_mp : programme =
    ( (MP, "MicroPgm", 6,0), "Fictif", [], 
        (3, [("R1", CoursOB(3,["IFT-1004"]))]), 
        (3, [("R2", PlageCr(3,3, Cours ["GIF-1003"]))]), [] )
  in
  ( "coherence_pgm",
    (fun pgm res -> coherence_pgm' pgm = res),
    [
      (b_ift, true, {|coherence_pgm bcours b_ift|});
      (b_glo, true, {|coherence_pgm bcours b_glo|});
      (c_ift, true, {|coherence_pgm bcours c_ift|});
      (b_ift_mauvais_total, false, {|coherence_pgm bcours b_ift_mauvais_total|});
      ( b_ift_annees_non_considerees,
        true,
        {|coherence_pgm bcours b_ift_annees_non_considerees|} );
      ( b_ift_sans_concentrations,
        true,
        {|coherence_pgm bcours b_ift_annees_concentrations|} );
      ( b_ift_lc_op_non_valide,
        false,
        {|coherence_pgm bcours b_ift_lc_op_non_valide|} );
      ( b_ift_avec_ob_de_c_donc_non_valide,
        false,
        {|coherence_pgm bcours b_ift_avec_ob_de_c_donc_non_valide|} );
      (p_vide, true, {|coherence_pgm bcours p_vide|});
      (p_mp, true, {|coherence_pgm bcours p_mp|});
    ],
    (* ---- Cas devant soulever une exception! ---- *)
    Some
      ( (fun pgm -> coherence_pgm' pgm),
        [ (cours_inexistant, {|coherence_pgm bcours cours_inexistant|}) ] ) )

(*****************************************************************************)
(* ------------------------------------------------------------------------- *)
(* -- Test générique--------------------------------------------------------
   La fonction testg a comme signature (donc, extrêmement générique):
      'a * ('b -> 'c -> bool) * ('b * 'c * string) list *
      (('d -> 'e) * ('d * string) list) option ->
      'a * bool * string List.t * bool * bool
   Elle prend comme argument le nom de la fonction à tester, la fonction à
   utiliser pour comparer le résultat obtenu avec chaque jeu de test et le
   résultat attendu, un jeu de données (comme décrit au début du fichier), et
   éventuellement celui concernant les cas d'exceptions, et retourne un 5-uplet
   formé du nom de la fonction, du résultat obtenu pour le test en question,
   des commentaires éventuels issus du test, d'un booléen qui précise si la
   fonction testée est non implantée et d'un booléen qui précise si une
   exception a été soulevée durant le test de la fonction en question.
*)
(* ------------------------------------------------------------------------- *)

(* La fonction suivante permet de tester n'importe quelle autre fonction
   en prenant soin de limiter le temps d'exécution à un #sec fixé (par défaut,
   3 sec.; on peut évidemment ajuster cette valeur).
   (version fonctionnelle que sous Linux/Unix (donc, sous WSL et MacOS))

   À cause de l'utilisation du module Unix, il faut charger la librairie au
   préalable:
   - (en mode interpréteur) #require "unix";;
   - (en mode compilation) ... -package unix ...
   Avec l'outil «dune», il faut simplement mentionner le nom de cette librairie
   dans le fichier «dune» (voir celui qui est dans le présent dossier).
*)
exception Timeout

let call_with_timeout ?(time_in_seconds = 3) f =
  Sys.set_signal Sys.sigalrm (Sys.Signal_handle (fun _ -> raise Timeout));
  try
    ignore (Unix.alarm time_in_seconds);
    let result = f () in
    ignore (Unix.alarm 0);
    result
  with exn ->
    ignore (Unix.alarm 0);
    raise exn

let testg (nom_f, f, jeu_donnees, jeu_donnees_exception_op) =
  let comment_l = ref [] in
  let ok = ref true in
  let excep = ref false in

  try
    List.iter
      (fun (p, res, cas_test) ->
        match call_with_timeout (fun () -> f p res) with
        | true -> ()
        | false ->
            ok := false;
            comment_l := !comment_l @ [ cas_test ^ " --> incorrect!" ]
        | exception Non_Implante s ->
            ok := false;
            raise (Non_Implante s)
        | exception e ->
            ok := false;
            excep := true;
            comment_l :=
              !comment_l
              @ [
                cas_test ^ " - Exception soulevée: «" ^ Printexc.to_string e
                  ^ "»";
                ])
      jeu_donnees;
    (match jeu_donnees_exception_op with
    | None -> ()
    | Some (f', jeu_donnees_exception) ->
        List.iter
          (fun (p, cas_test) ->
            try
              ignore (call_with_timeout (fun () -> f' p));
              ok := false;
              comment_l :=
                !comment_l
                @ [ cas_test ^ " --> incorrect! Devrait soulever exception!" ]
            with
            | Failure _ -> ()
            | Timeout ->
                ok := false;
                excep := true;
                comment_l :=
                  !comment_l @ [ cas_test ^ " - Exception soulevée: «Timeout»" ]
            | e ->
                ok := false;
                excep := true;
                comment_l :=
                  !comment_l
                  @ [
                    cas_test
                      ^ " --> incorrect! Devrait soulever exception «Failure»"
                      ^ " et non «" ^ Printexc.to_string e ^ "»";
                    ])
          jeu_donnees_exception);
    (nom_f, !ok, !comment_l, false, !excep)
  with Non_Implante _ ->
    (nom_f, !ok, !comment_l @ [ "Fonction non implantée!" ], true, !excep)

(* -------------------------------------------------------------------------- *)
(* -- TESTE TOUT ------------------------------------------------------------
   La fonction test a comme signature:
     unit -> (string * bool * string list * bool * bool) list
   Elle effectue les n tests permettant de tester chacune des fonctions du Tp,
   et retourne une liste de 5-uplet:
   - nom de la fonction testée
   - un booléen qui précise le résultat du test pour cette fonction
   - les commentaires éventuels issus des tests
   - un booléen qui précise si la fonction est non implantée
   - un booléen qui précise si une exception a été soulevée
*)
(* -------------------------------------------------------------------------- *)
let tests () =
  [
    testg jeu_eq_pr;
    testg jeu_prerequis;
    testg jeu_extrait_lc;
    testg jeu_extrait_lc_exclus;
    testg jeu_verif_e;
    testg jeu_existe_motif;
    testg jeu_existe_cours;
    testg jeu_verif_conc;
    testg jeu_verif_credits;
    testg jeu_coherence_cours_conc;
    testg jeu_verif_pre;
    testg jeu_coherence_pgm;
  ]

(* -------------------------------------------------------------------------- *)
(* -- CORRIGE ---------------------------------------------------------------
   Le type de cette fonction est unit -> unit
   Elle appelle la fonction «tests», récupère les résultats des tests et
   affiche seulement le nom de chaque fonction testée, le résultat obtenu et
   les éventuels commentaires.
*)
(* -------------------------------------------------------------------------- *)
let corrige () =
  print_endline "Resultats:";
  print_endline "----------\n";
  List.iter
    (fun (nom_f, ok, comment, _, _) ->
      Printf.printf "%s : %s\n" nom_f (if ok then "OK" else "");
      List.iter (fun c -> print_endline ("\t" ^ c)) comment)
    (tests ())
;;

corrige ()

(* Avec version du corrigé:

    dune runtest

    Resultats:
    ----------

    eq_pr : OK
    prerequis : OK
    extrait_lc : OK
    extrait_lc_exclus : OK
    verif_e : OK
    existe_motif : OK
    existe_cours : OK
    verif_conc : OK
    verif_credits : OK
    coherence_cours_conc : OK
    verif_pre : OK
    coherence_pgm : OK

   Avec version remise et donc non complétée:

    dune runtest

    Resultats:
    ----------

     eq_pr :
             Fonction non implantée!
     prerequis :
             Fonction non implantée!
     extrait_lc :
             Fonction non implantée!
     extrait_lc_exclus :
             Fonction non implantée!
     verif_e :
             Fonction non implantée!
     existe_motif :
             Fonction non implantée!
     existe_cours :
             Fonction non implantée!
     verif_conc :
             Fonction non implantée!
     verif_credits :
             Fonction non implantée!
     coherence_cours_conc :
             Fonction non implantée!
     verif_pre :
             Fonction non implantée!
     coherence_pgm :
             Fonction non implantée!
*)
