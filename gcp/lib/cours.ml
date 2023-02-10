open Gcp

(* ------------------------------------------------------------------------- *)
(* Données: bassin de cours                                                  *)
(* ------------------------------------------------------------------------- *)

let bcours : cours list =
  [
    ( "FRN-0100",
      {
        titre = "Français écrit";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "LANG-FLSH";
        multi = "";
        equiv = "";
        offre = [ (Aut, A); (Aut, Z1); (Hiv, D); (Hiv, Z1); (Ete, Z1) ];
        dom = [ LANG ];
      } );
    ( "BIF-1000",
      {
        titre = "Profession de bio-informaticien";
        credit = Cr 1;
        conco = "";
        pre = Aucun;
        dept = "BIOIFT-FSG";
        multi = "";
        equiv = "";
        offre = [ (Aut, A) ];
        dom = [ BIO ];
      } );
    ( "CHM-1000",
      {
        titre = "Structure des atomes et des molécules";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "CHM-FSG";
        multi = "";
        equiv = "";
        offre = [ (Aut, ZA) ];
        dom = [ CHM ];
      } );
    ( "DDU-1000",
      {
        titre = "Fondements du développement durable";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "ScPOL-FSS";
        multi = "";
        equiv = "";
        offre = [ (Aut, Z1); (Ete, Z1); (Hiv, Z1) ];
        dom = [ GEN ];
      } );
    ( "ECN-1000",
      {
        titre = "Principes de microéconomie";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "ECO-FSS";
        multi = "";
        equiv = "GSF-1020";
        offre = [ (Aut, ZA); (Aut, H); (Hiv, Z1); (Ete, Z1) ];
        dom = [ ECO ];
      } );
    ( "ENT-1000",
      {
        titre = "Savoir entreprendre : la passion de créer et d'agir";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "MNG-FSA";
        multi = "";
        equiv = "ENT-1010";
        offre = [ (Hiv, A); (Hiv, Z1); (Aut, A); (Aut, Z1); (Ete, Z1) ];
        dom = [ ENT ];
      } );
    ( "GRH-1000",
      {
        titre = "Gestion des ressources humaines et relations du travail";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "RelInd-FSA";
        multi = "";
        equiv = "RLT-1700";
        offre = [ (Hiv, Z1); (Aut, A) ];
        dom = [ GEN ];
      } );
    ( "IFT-1000",
      {
        titre = "Logique et techniques de preuve";
        credit = Cr 3;
        conco = "";
        pre = OU [ CP "MAT-1310"; CP "MAT-1919" ];
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, Z3); (Aut, A) ];
        dom = [ LOG ];
      } );
    ( "GSO-1000",
      {
        titre = "Opérations et logistique";
        credit = Cr 3;
        conco = "";
        pre =
          OU
            [
              CP "MQT-1102";
              CP "MQT-1100";
              CP "STT-2920";
              CP "MAT-1915";
              CP "STT-1900";
              CP "STT-1000";
            ];
        dept = "OSD-FSA";
        multi = "";
        equiv = "GSO-1100";
        offre = [ (Hiv, A); (Aut, Z1); (Hiv, Z1); (Aut, A); (Ete, Z1) ];
        dom = [ GEN ];
      } );
    ( "MCB-1000",
      {
        titre = "Microbiologie générale";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "BIOIFT-FSG";
        multi = "";
        equiv = "";
        offre = [ (Aut, A) ];
        dom = [ BIO ];
      } );
    ( "MRK-1000",
      {
        titre = "Marketing";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "MRK-FSA";
        multi = "";
        equiv = "MRK-1101";
        offre =
          [ (Hiv, Z1); (Hiv, H); (Aut, Z1); (Aut, H); (Aut, A); (Ete, Z1) ];
        dom = [ ADM ];
      } );
    ( "PHY-1000",
      {
        titre = "Introduction à l'astrophysique";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "PHY-FSG";
        multi = "";
        equiv = "";
        offre = [ (Aut, A) ];
        dom = [ SYS ];
      } );
    ( "RLT-1000",
      {
        titre = "Fondements en relations industrielles";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "RelInd-FSS";
        multi = "";
        equiv = "";
        offre = [ (Hiv, A); (Aut, A) ];
        dom = [ GEN ];
      } );
    ( "SIO-1000",
      {
        titre = "Systèmes et technologies de l'information";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "SIO-FSA";
        multi = "";
        equiv = "SIO-1101";
        offre = [ (Hiv, ZA); (Hiv, H); (Aut, Z3); (Aut, H); (Ete, Z3) ];
        dom = [ SIO ];
      } );
    ( "STT-1000",
      {
        titre = "Probabilités et statistique ";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "MATSTT-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, A); (Hiv, Z3); (Aut, A); (Aut, Z3) ];
        dom = [ STAT ];
      } );
    ( "BCM-1001",
      {
        titre = "Biochimie structurale";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "BIOIFT-FSG";
        multi = "";
        equiv = "";
        offre = [ (Aut, Z1) ];
        dom = [ BIO ];
      } );
    ( "BIF-1001",
      {
        titre = "Introduction à la bio-informatique";
        credit = Cr 3;
        conco = "BCM-1005";
        pre = ET [ CP "BCM-1001"; CP "IFT-1004" ];
        dept = "BIOIFT-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, A) ];
        dom = [ BIO ];
      } );
    ( "GEL-1000",
      {
        titre = "Circuits";
        credit = Cr 3;
        conco = "";
        pre = OU [ CCP "MAT-1900"; CCP "PHY-1002" ];
        dept = "GELGIF-FSG";
        multi = "";
        equiv = "";
        offre = [ (Aut, A) ];
        dom = [ SYS ];
      } );
    ( "GEL-1001",
      {
        titre = "Design I (méthodologie)";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "GELGIF-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, A) ];
        dom = [ ANA_CON ];
      } );
    ( "GIF-1001",
      {
        titre = "Ordinateurs : structure et applications";
        credit = Cr 3;
        conco = "";
        pre = OU [ CCP "IFT-1004"; CCP "GLO-1901" ];
        dept = "GELGIF-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, ZA); (Aut, Z3) ];
        dom = [ SYS ];
      } );
    ( "PHY-1001",
      {
        titre = "Physique mathématique I";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "PHY-FSG";
        multi = "";
        equiv = "";
        offre = [ (Aut, A) ];
        dom = [ MAT ];
      } );
    ( "ACT-1002",
      {
        titre = "Analyse probabiliste des risques actuariels";
        credit = Cr 3;
        conco = "ACT-1003";
        pre = Aucun;
        dept = "ACT-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, A) ];
        dom = [ STAT ];
      } );
    ( "ANI-1002",
      {
        titre = "Animation 3D I";
        credit = Cr 3;
        conco = "";
        pre = CP "ANI-1018";
        dept = "DES-FACH ";
        multi = "";
        equiv = "";
        offre = [ (Aut, A) ];
        dom = [ GAME ];
      } );
    ( "GIF-1002",
      {
        titre = "Circuits logiques";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "GELGIF-FSG";
        multi = "";
        equiv = "";
        offre = [ (Aut, A) ];
        dom = [ SYS ];
      } );
    ( "PHY-1002",
      {
        titre = "Physique mathématique II";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "PHY-FSG";
        multi = "";
        equiv = "";
        offre = [ (Aut, A) ];
        dom = [ MAT ];
      } );
    ( "ACT-1003",
      {
        titre = "Compléments de mathématiques";
        credit = Cr 3;
        conco = "ACT-1002";
        pre = Aucun;
        dept = "ACT-FSG";
        multi = "";
        equiv = "";
        offre = [ (Aut, A) ];
        dom = [ MAT ];
      } );
    ( "BCM-1003",
      {
        titre = "Métabolisme et régulation";
        credit = Cr 3;
        conco = "";
        pre = OU [ CP "BCM-1001"; CP "CHM-1003" ];
        dept = "BIOIFT-FSG";
        multi = "";
        equiv = "";
        offre = [ (Aut, Z1) ];
        dom = [ BIO ];
      } );
    ( "CHM-1003",
      {
        titre = "Chimie organique I";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "CHM-FSG";
        multi = "";
        equiv = "";
        offre = [ (Aut, A) ];
        dom = [ BIO ];
      } );
    ( "GIF-1003",
      {
        titre = "Programmation avancée en C++ pour l'ingénierie";
        credit = Cr 3;
        conco = "";
        pre = OU [ CP "IFT-1004"; CP "GLO-1901" ];
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "IFT-1006";
        offre = [ (Hiv, A); (Aut, ZA) ];
        dom = [ PROG ];
      } );
    ( "GMC-1003",
      {
        titre = "Introduction à la mécanique des fluides";
        credit = Cr 3;
        conco = "";
        pre = OU [ CCP "MAT-1910"; CCP "PHY-1001" ];
        dept = "GMC-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, A) ];
        dom = [ GEN ];
      } );
    ( "IFT-1003",
      {
        titre = "Analyse et conception de systèmes d'information";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, Z3); (Aut, Z3) ];
        dom = [ ANA_CON ];
      } );
    ( "PHY-1003",
      {
        titre = "Mécanique et relativité restreinte";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "PHY-FSG";
        multi = "";
        equiv = "";
        offre = [ (Aut, A) ];
        dom = [ SYS ];
      } );
    ( "CHM-1004",
      {
        titre = "Thermodynamique et cinétique chimique";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "CHM-FSG";
        multi = "";
        equiv = "CHM-1905";
        offre = [ (Hiv, H) ];
        dom = [ BIO ];
      } );
    ( "IFT-1004",
      {
        titre = "Introduction à la programmation";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, Z3); (Hiv, A); (Aut, A); (Aut, Z3); (Ete, Z3) ];
        dom = [ PROG ];
      } );
    ( "SBM-1004",
      {
        titre = "Introduction à la génétique moléculaire";
        credit = Cr 3;
        conco = "";
        pre = CP "BCM-1001";
        dept = "OPH-FMED";
        multi = "";
        equiv = "";
        offre = [ (Hiv, A) ];
        dom = [ GEN ];
      } );
    ( "IFT-1006",
      {
        titre = "Programmation avancée en C++";
        credit = Cr 3;
        conco = "";
        pre = OU [ CP "IFT-1004"; CP "GLO-1901" ];
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "GIF-1003";
        offre = [ (Hiv, Z3); (Ete, Z3) ];
        dom = [ PROG ];
      } );
    ( "ANI-1005",
      {
        titre = "Animation 3D II";
        credit = Cr 3;
        conco = "";
        pre = ET [ CP "ANI-1002"; CP "ANI-1018" ];
        dept = "DES-FACH ";
        multi = "";
        equiv = "";
        offre = [ (Hiv, A) ];
        dom = [ GAME ];
      } );
    ( "BCM-1005",
      {
        titre = "Génétique moléculaire I ";
        credit = Cr 3;
        conco = "";
        pre = CP "BCM-1001";
        dept = "BIOIFT-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, A) ];
        dom = [ BIO ];
      } );
    ( "BIO-1006",
      {
        titre = "Biostatistique";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "BIOIFt-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, A) ];
        dom = [ BIO; STAT ];
      } );
    ( "PHY-1006",
      {
        titre = "Physique quantique";
        credit = Cr 3;
        conco = "";
        pre = OU [ CP "PHY-1002"; CP "MAT-1900" ];
        dept = "PHY-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, A) ];
        dom = [ SYS ];
      } );
    ( "PHY-1007",
      {
        titre = "Électromagnétisme";
        credit = Cr 3;
        conco = "";
        pre = OU [ CP "PHY-1001"; CP "MAT-1910" ];
        dept = "PHY-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, A) ];
        dom = [ SYS ];
      } );
    ( "GPL-1008",
      {
        titre = "Méthodes statistiques pour sciences sociales";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "ECO-FSS";
        multi = "";
        equiv = "";
        offre = [ (Hiv, A) ];
        dom = [ STAT ];
      } );
    ( "ANL-1010",
      {
        titre = "Basic English I";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "LANG-FLSH";
        multi = "";
        equiv = "";
        offre = [ (Hiv, Y); (Aut, A); (Ete, Y) ];
        dom = [ LANG ];
      } );
    ( "ECN-1010",
      {
        titre = "Principes de macroéconomie";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "ECO-FSS";
        multi = "";
        equiv = "GSF-1010";
        offre = [ (Hiv, ZA); (Aut, ZA); (Ete, Z1) ];
        dom = [ PROG ];
      } );
    ( "ENT-1010",
      {
        titre = "Being Entrepreneurial: Passion for creation and action";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "MNG-FSA";
        multi = "";
        equiv = "ENT-1000";
        offre = [ (Hiv, A) ];
        dom = [ ENT ];
      } );
    ( "GSF-1010",
      {
        titre = "Macroéconomie financière";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "ECO-FSS";
        multi = "";
        equiv = "ECN-1010";
        offre = [ (Hiv, A); (Hiv, Z1); (Aut, A); (Aut, Z1); (Ete, Z1) ];
        dom = [ PROG ];
      } );
    ( "ANI-1016",
      {
        titre = "Fondements pratiques en animation I";
        credit = Cr 6;
        conco = "";
        pre = Aucun;
        dept = "DES-FACH";
        multi = "";
        equiv = "";
        offre = [ (Aut, A) ];
        dom = [ GAME ];
      } );
    ( "ANI-1018",
      {
        titre = "Fondements pratiques en animation II";
        credit = Cr 6;
        conco = "";
        pre = CP "ANI-1016";
        dept = "DES-FACH";
        multi = "";
        equiv = "";
        offre = [ (Hiv, A) ];
        dom = [ GAME ];
      } );
    ( "ANL-1020",
      {
        titre = "Basic English II";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "LANG-FLSH";
        multi = "";
        equiv = "";
        offre = [ (Hiv, Y); (Hiv, A); (Aut, A); (Aut, Y); (Ete, Y) ];
        dom = [ LANG ];
      } );
    ( "GSF-1020",
      {
        titre = "Économie de l'entreprise";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "FIN-FSA";
        multi = "";
        equiv = "ECN-1000";
        offre = [ (Hiv, A); (Aut, Z1); (Hiv, Z1); (Aut, A); (Ete, Z1) ];
        dom = [ GEN ];
      } );
    ( "GSO-1100",
      {
        titre = "Operations and Logistics";
        credit = Cr 3;
        conco = "";
        pre = OU [ CP "MQT-1102"; CP "MQT-1100"; CP "STT-2920" ];
        dept = "OSD-FSA";
        multi = "";
        equiv = "GSO-1000";
        offre = [ (Hiv, A); (Hiv, Z1) ];
        dom = [ GEN ];
      } );
    ( "MQT-1100",
      {
        titre = "Probability and Statistics for Business";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "OSD-FSA";
        multi = "";
        equiv = "MQT-1102";
        offre = [ (Aut, Z1) ];
        dom = [ STAT ];
      } );
    ( "STT-1100",
      {
        titre = "Introduction aux principaux logiciels statistiques";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "MATSTT-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, A) ];
        dom = [ STAT ];
      } );
    ( "MRK-1101",
      {
        titre = "Marketing Management";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "MRK-FSA";
        multi = "";
        equiv = "MRK-1000";
        offre = [ (Hiv, Z1); (Aut, Z1) ];
        dom = [ ADM ];
      } );
    ( "SIO-1101",
      {
        titre = "Information Systems and Technologies";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "SIO-FSA";
        multi = "";
        equiv = "SIO-1000";
        offre = [ (Aut, A); (Hiv, ZA) ];
        dom = [ SIO ];
      } );
    ( "MQT-1102",
      {
        titre = "Probabilités et statistique";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "OSD-FSA";
        multi = "";
        equiv = "MQT-1100";
        offre = [ (Hiv, A); (Hiv, Z1); (Aut, A); (Aut, Z1); (Ete, Z1) ];
        dom = [ STAT ];
      } );
    ( "MAT-1110",
      {
        titre = "Calcul des fonctions de plusieurs variables";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "MATSTT-FSG";
        multi = "";
        equiv = "";
        offre = [ (Aut, A) ];
        dom = [ MAT ];
      } );
    ( "GLO-1111",
      {
        titre = "Pratique du génie logiciel";
        credit = Cr 0;
        conco = "";
        pre = Aucun;
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "";
        offre = [ (Aut, ZA) ];
        dom = [ GEN ];
      } );
    ( "IFT-1111",
      {
        titre = "Pratique de l'informatique";
        credit = Cr 0;
        conco = "";
        pre = Aucun;
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "";
        offre = [ (Aut, ZA) ];
        dom = [ GEN ];
      } );
    ( "MAT-1200",
      {
        titre = "Introduction à l'algèbre linéaire";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "MATSTT-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, Z3); (Aut, Z3); (Aut, A) ];
        dom = [ MAT ];
      } );
    ( "MAT-1310",
      {
        titre = "Mathématiques discrètes";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "MATSTT-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, A) ];
        dom = [ MAT ];
      } );
    ( "STT-1500",
      {
        titre = "Probabilités";
        credit = Cr 3;
        conco = "";
        pre = OU [ CP "MAT-1110"; CCP "MAT-1910" ];
        dept = "MATSTT-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, A) ];
        dom = [ STAT ];
      } );
    ( "IFT-1700",
      {
        titre = "Programmation de base en Visual Basic .Net";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "";
        offre = [];
        dom = [ PROG ];
      } );
    ( "RLT-1700",
      {
        titre = "Aspects administratifs et humains de la gestion";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "RelInd-FSA";
        multi = "";
        equiv = "GRH-1000";
        offre = [ (Hiv, Y); (Aut, Y) ];
        dom = [ GEN ];
      } );
    ( "IFT-1701",
      {
        titre = "Introduction à l'algorithmique et à la programmation";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "";
        offre = [ (Aut, A) ];
        dom = [ PROG ];
      } );
    ( "GEL-1799",
      {
        titre = "Dangers de l'électricité";
        credit = Cr 0;
        conco = "";
        pre = Aucun;
        dept = "GELGIF-FSG";
        multi = "";
        equiv = "GEL-4799";
        offre = [ (Aut, Z1); (Hiv, Z1) ];
        dom = [ SYS ];
      } );
    ( "MAT-1900",
      {
        titre = "Mathématiques de l'ingénieur I";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "MATSTT-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, A); (Hiv, Z3); (Aut, A); (Aut, Z3) ];
        dom = [ MAT ];
      } );
    ( "MQT-1900",
      {
        titre = "Méthodes quantitatives pour économistes";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "ECO-FSS";
        multi = "";
        equiv = "";
        offre = [ (Aut, A) ];
        dom = [ STAT ];
      } );
    ( "PHI-1900",
      {
        titre = "Principes de logique";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "PHI-FPHI";
        multi = "";
        equiv = "";
        offre = [ (Hiv, Z1); (Aut, Z1); (Ete, Z1) ];
        dom = [ LOG ];
      } );
    ( "STT-1900",
      {
        titre = "Méthodes statistiques pour ingénieurs";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "MATSTT-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, A); (Hiv, Z3); (Aut, A); (Aut, Z3) ];
        dom = [ STAT ];
      } );
    ( "GLO-1901",
      {
        titre = "Introduction à la programmation avec Python";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "GELGIF-FSG";
        multi = "";
        equiv = "";
        offre = [ (Aut, Z1); (Hiv, Z1) ];
        dom = [ PROG ];
      } );
    ( "IFT-1901",
      {
        titre = "Technologies en géomatique I";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "SGEO-FORE";
        multi = "";
        equiv = "";
        offre = [ (Aut, Z3); (Aut, H) ];
        dom = [ PROG ];
      } );
    ( "IFT-1902",
      {
        titre = "Programmation avec R pour l'analyse de données";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "ACT-FSG";
        multi = "";
        equiv = "IFT-7902";
        offre = [ (Hiv, H) ];
        dom = [ PROG ];
      } );
    ( "BCM-1903",
      {
        titre = "Biochimie et métabolisme";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "BIOIFT-FSG";
        multi = "";
        equiv = "";
        offre = [ (Aut, Z1) ];
        dom = [ BIO ];
      } );
    ( "IFT-1903",
      {
        titre = "Informatique pour l'ingénieur";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "GCV-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, Z3) ];
        dom = [ PROG ];
      } );
    ( "PHY-1903",
      {
        titre = "Physique générale";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "PHY-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, A) ];
        dom = [];
      } );
    ( "CHM-1905",
      {
        titre = "Thermodynamique et cinétique";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "CHM-FSG";
        multi = "";
        equiv = "CHM-1004";
        offre = [ (Hiv, A) ];
        dom = [ BIO ];
      } );
    ( "BIO-1910",
      {
        titre = "Écologie et pollution";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "BIOIFt-FSG";
        multi = "";
        equiv = "";
        offre = [ (Aut, Z1) ];
        dom = [ GEN ];
      } );
    ( "MAT-1910",
      {
        titre = "Mathématiques de l'ingénieur II";
        credit = Cr 3;
        conco = "";
        pre = OU [ CCP "MAT-1900"; CCP "MAT-1920" ];
        dept = "MATSTT-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, A); (Hiv, Z3); (Aut, A) ];
        dom = [ MAT ];
      } );
    ( "MAT-1915",
      {
        titre = "Biostatistique";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "BOI-FORE";
        multi = "";
        equiv = "";
        offre = [ (Hiv, H) ];
        dom = [ BIO ];
      } );
    ( "MAT-1919",
      {
        titre = "Mathématiques pour informaticien";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, ZA); (Aut, A); (Aut, Z3) ];
        dom = [ MAT ];
      } );
    ( "MAT-1920",
      {
        titre = "Mathématiques pour scientifiques";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "MATSTT-FSG";
        multi = "";
        equiv = "";
        offre = [ (Aut, A) ];
        dom = [ MAT ];
      } );
    ( "STT-1920",
      {
        titre = "Méthodes statistiques";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "MATSTT-FSG";
        multi = "";
        equiv = "MQT-1102";
        offre = [ (Aut, A); (Hiv, A) ];
        dom = [ STAT ];
      } );
    ( "ACT-2000",
      {
        titre = "Analyse statistique des risques actuariels";
        credit = Cr 3;
        conco = "";
        pre = CP "ACT-1002";
        dept = "ACT-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, A) ];
        dom = [ STAT ];
      } );
    ( "GLO-2000",
      {
        titre = "Réseaux pour ingénieurs";
        credit = Cr 3;
        conco = "";
        pre = CP "GIF-1001";
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "IFT-2006";
        offre = [ (Aut, A) ];
        dom = [ NET ];
      } );
    ( "STT-2000",
      {
        titre = "Statistique mathématique";
        credit = Cr 3;
        conco = "";
        pre = OU [ CP "STT-1500"; CP "ACT-1002" ];
        dept = "MATSTT-FSG";
        multi = "";
        equiv = "";
        offre = [ (Aut, A) ];
        dom = [ STAT ];
      } );
    ( "GLO-2001",
      {
        titre = "Systèmes d'exploitation pour ingénieurs";
        credit = Cr 3;
        conco = "";
        pre = ET [ CP "GIF-1001"; OU [ CP "GLO-2100"; CP "IFT-2008" ] ];
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "IFT-2001";
        offre = [ (Hiv, A) ];
        dom = [ SYS ];
      } );
    ( "IFT-2001",
      {
        titre = "Systèmes d'exploitation";
        credit = Cr 3;
        conco = "";
        pre = ET [ CP "GIF-1001"; OU [ CP "IFT-2008"; CP "GLO-2100" ] ];
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "GLO-2001";
        offre = [ (Aut, Z3) ];
        dom = [ SYS ];
      } );
    ( "ACT-2002",
      {
        titre = "Méthodes numériques en actuariat";
        credit = Cr 3;
        conco = "";
        pre = ET [ CP "ACT-1002"; CP "IFT-4902" ];
        dept = "ACT-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, H) ];
        dom = [ STAT ];
      } );
    ( "IFT-2002",
      {
        titre = "Informatique théorique";
        credit = Cr 3;
        conco = "";
        pre = OU [ CP "MAT-1919"; CP "MAT-1310" ];
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, A); (Aut, Z3) ];
        dom = [ THEO ];
      } );
    ( "BIO-2003",
      {
        titre = "Biologie moléculaire";
        credit = Cr 3;
        conco = "";
        pre = OU [ CP "BCM-1001"; CP "BCM-1903" ];
        dept = "BIOIFT-FSG";
        multi = "";
        equiv = "";
        offre = [ (Aut, A) ];
        dom = [ BIO ];
      } );
    ( "GLO-2003",
      {
        titre = "Introduction aux processus du génie logiciel";
        credit = Cr 3;
        conco = "";
        pre = OU [ CP "GLO-2004"; CP "IFT-2007" ];
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, ZA) ];
        dom = [ ANA_CON ];
      } );
    ( "IFT-2003",
      {
        titre = "Intelligence artificielle I";
        credit = Cr 3;
        conco = "";
        pre =
          ET
            [
              OU [ CP "IFT-1000"; CP "MAT-1310"; CP "MAT-1919" ];
              OU [ CP "IFT-1004"; CP "GLO-1901" ];
            ];
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "";
        offre = [ (Aut, Z1); (Hiv, A) ];
        dom = [ IA ];
      } );
    ( "GLO-2004",
      {
        titre = "Génie logiciel orienté objet";
        credit = Cr 3;
        conco = "";
        pre = OU [ CP "GIF-1003"; CP "IFT-1006" ];
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "IFT-2007";
        offre = [ (Hiv, A); (Aut, Z3) ];
        dom = [ ANA_CON ];
      } );
    ( "IFT-2004",
      {
        titre = "Modèles et langages des bases de données";
        credit = Cr 3;
        conco = "";
        pre = OU [ CP "IFT-1004"; CP "GLO-1901" ];
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "GLO-2005";
        offre = [ (Aut, Z3); (Ete, Z3) ];
        dom = [ BD ];
      } );
    ( "GLO-2005",
      {
        titre = "Modèles et langages des bases de données pour ingénieurs";
        credit = Cr 3;
        conco = "";
        pre = OU [ CP "IFT-1004"; CP "GLO-1901" ];
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "IFT-2004";
        offre = [ (Hiv, ZA) ];
        dom = [ BD ];
      } );
    ( "IFT-2006",
      {
        titre = "Téléinformatique";
        credit = Cr 3;
        conco = "";
        pre = CP "GIF-1001";
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "GLO-2000";
        offre = [ (Hiv, Z3) ];
        dom = [ NET ];
      } );
    ( "IFT-2007",
      {
        titre = "Analyse et conception des systèmes orientés objets";
        credit = Cr 3;
        conco = "";
        pre = OU [ CP "GIF-1003"; CP "IFT-1006" ];
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "GLO-2004";
        offre = [ (Aut, Z3) ];
        dom = [ ANA_CON ];
      } );
    ( "IFT-2008",
      {
        titre = "Algorithmes et structures de données";
        credit = Cr 3;
        conco = "";
        pre = OU [ CP "GIF-1003"; CP "IFT-1006" ];
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "GLO-2100";
        offre = [ (Hiv, Z3); (Aut, Z3) ];
        dom = [ PROG ];
      } );
    ( "ANL-2010",
      {
        titre = "Intermediate English I";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "LANG-FLSH";
        multi = "";
        equiv = "";
        offre = [ (Hiv, A); (Hiv, Y); (Aut, A); (Aut, Y); (Ete, Y) ];
        dom = [ LANG ];
      } );
    ( "ANL-2011",
      {
        titre = "Intermediate English II";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "LANG-FLSH";
        multi = "";
        equiv = "";
        offre = [ (Hiv, A); (Hiv, Y); (Aut, A); (Aut, Y); (Ete, Y) ];
        dom = [ LANG ];
      } );
    ( "MUS-2012",
      {
        titre = "Musique interactive";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "MUS-FMUS";
        multi = "";
        equiv = "";
        offre = [ (Hiv, H) ];
        dom = [ GAME ];
      } );
    ( "ANL-2020",
      {
        titre = "Intermediate English II";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "LANG-FLSH";
        multi = "";
        equiv = "";
        offre = [ (Hiv, A); (Hiv, Y); (Aut, A); (Aut, Y); (Ete, Y) ];
        dom = [ LANG ];
      } );
    ( "ECN-2080",
      {
        titre = "Introduction à la programmation scientifique pour économiste";
        credit = Cr 3;
        conco = "";
        pre =
          OU
            [
              ET [ CP "GPL-1008"; CP "MQT-1900" ];
              ET [ CP "MAT-1900"; CP "STT-1500" ];
            ];
        dept = "ECO-FSS";
        multi = "";
        equiv = "";
        offre = [ (Aut, H) ];
        dom = [ PROG ];
      } );
    ( "ECN-2090",
      {
        titre = "Logiciels et analyse de données";
        credit = Cr 3;
        conco = "";
        pre =
          ET
            [
              CP "ECN-1000";
              CP "ECN-1010";
              OU [ CCP "GPL-1008"; CCP "STT-1000"; CCP "STT-1500" ];
            ];
        dept = "ECO-FSS";
        multi = "";
        equiv = "";
        offre = [ (Hiv, Y) ];
        dom = [ PROG ];
      } );
    ( "GLO-2100",
      {
        titre = "Algorithmes et structures de données pour ingénieurs";
        credit = Cr 3;
        conco = "";
        pre = OU [ CP "GIF-1003"; CP "IFT-1006" ];
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "IFT-2008";
        offre = [ (Aut, Z3); (Aut, A) ];
        dom = [ PROG ];
      } );
    ( "PHY-2100",
      {
        titre = "Sciences de l'espace";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "PHY-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, A) ];
        dom = [ SYS ];
      } );
    ( "SIO-2100",
      {
        titre = "Stratégies d'affaires électroniques";
        credit = Cr 3;
        conco = "";
        pre =
          OU
            [
              CP "SIO-1000";
              CP "SIO-1101";
              CP "IFT-1004";
              CP "IFT-1903";
              CP "GLO-1901";
            ];
        dept = "SIO-FSA";
        multi = "";
        equiv = "";
        offre = [ (Hiv, Y) ];
        dom = [ ENT ];
      } );
    ( "IFT-2101",
      {
        titre = "Protocoles et technologies Internet";
        credit = Cr 3;
        conco = "";
        pre = OU [ CP "IFT-2006"; CP "GIF-3001"; CP "GLO-2000" ];
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "";
        offre = [ (Ete, Z3) ];
        dom = [ WEB; NET ];
      } );
    ( "IFT-2102",
      {
        titre = "Introduction à la sécurité informatique";
        credit = Cr 3;
        conco = "";
        pre = CRE 18;
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "";
        offre = [ (Ete, Z3) ];
        dom = [ SEC ];
      } );
    ( "SIO-2102",
      {
        titre = "Sécurité, contrôle et gestion du risque ";
        credit = Cr 3;
        conco = "";
        pre = OU [ CP "SIO-1000"; CP "SIO-1101"; CP "IFT-1004"; CP "GLO-1901" ];
        dept = "SIO-FSA";
        multi = "";
        equiv = "";
        offre = [ (Hiv, Z3); (Aut, Z3) ];
        dom = [ SEC ];
      } );
    ( "IFT-2103",
      {
        titre = "Programmation de jeux vidéo";
        credit = Cr 3;
        conco = "";
        pre = ET [ OU [ CP "GIF-1003"; CP "IFT-1006" ]; CP "IFT-3100" ];
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "";
        offre = [ (Aut, Z3) ];
        dom = [ GAME ];
      } );
    ( "SIO-2103",
      {
        titre = "Conception des systèmes d'information organisationnels I";
        credit = Cr 3;
        conco = "";
        pre =
          OU
            [
              CP "SIO-1000";
              CP "SIO-1101";
              CP "IFT-1004";
              CP "IFT-1903";
              CP "GLO-1901";
            ];
        dept = "SIO-FSA";
        multi = "";
        equiv = "";
        offre = [ (Hiv, ZA); (Aut, ZA) ];
        dom = [ SIO; ANA_CON ];
      } );
    ( "SIO-2104",
      {
        titre = "Innovations technologiques dans les organisations";
        credit = Cr 3;
        conco = "";
        pre =
          OU
            [
              CP "SIO-1000";
              CP "SIO-1101";
              CP "IFT-1004";
              CP "IFT-1903";
              CP "GLO-1901";
            ];
        dept = "SIO-FSA";
        multi = "";
        equiv = "";
        offre = [ (Aut, Z3); (Hiv, Y) ];
        dom = [ SIO ];
      } );
    ( "SIO-2105",
      {
        titre = "La fonction conseil en SIO";
        credit = Cr 3;
        conco = "";
        pre = OU [ CP "SIO-1000"; CP "SIO-1101"; CP "IFT-1004" ];
        dept = "SIO-FSA";
        multi = "";
        equiv = "";
        offre = [ (Aut, H) ];
        dom = [ SIO ];
      } );
    ( "SIO-2107",
      {
        titre = "Gestion de projets, applications SIO";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "SIO-FSA";
        multi = "";
        equiv = "";
        offre = [ (Hiv, Z3); (Aut, Z3) ];
        dom = [ SIO ];
      } );
    ( "MAT-2200",
      {
        titre = "Algèbre linéaire avancée";
        credit = Cr 3;
        conco = "";
        pre = CP "MAT-1200";
        dept = "MATSTT-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, A) ];
        dom = [ MAT ];
      } );
    ( "STT-2200",
      {
        titre = "Analyse des données";
        credit = Cr 3;
        conco = "";
        pre =
          ET
            [
              OU [ CP "STT-1000"; CP "ACT-2000"; CP "STT-2920" ];
              OU [ CP "MAT-1200"; CP "ACT-2002" ];
              OU
                [
                  CP "STT-1100";
                  CP "ACT-2002";
                  CP "ECN-2090";
                  CP "GLO-1901";
                  CP "IFT-1004";
                ];
            ];
        dept = "SIO-FSA";
        multi = "";
        equiv = "";
        offre = [ (Aut, A) ];
        dom = [ IA ];
      } );
    ( "GGR-2305",
      {
        titre = "Climatologie";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "GEO-FORE";
        multi = "";
        equiv = "";
        offre = [ (Ete, Z1); (Hiv, Z1) ];
        dom = [ GEN ];
      } );
    ( "IFT-2580",
      {
        titre = "Stage en informatique I";
        credit = St 9;
        conco = "";
        pre = CRE 24;
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "";
        offre = [ (Aut, A); (Hiv, A); (Ete, A) ];
        dom = [];
      } );
    ( "GLO-2580",
      {
        titre = "Stage en génie logiciel I";
        credit = St 9;
        conco = "";
        pre = CRE 24;
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "";
        offre = [ (Aut, A); (Hiv, A); (Ete, A) ];
        dom = [];
      } );
    ( "GLO-2581",
      {
        titre = "Stage en génie logiciel II";
        credit = St 9;
        conco = "";
        pre = CP "GLO-2580";
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "";
        offre = [ (Aut, A); (Hiv, A); (Ete, A) ];
        dom = [];
      } );
    ( "IFT-2585",
      {
        titre = "Stage en informatique et gestion I";
        credit = St 9;
        conco = "";
        pre = CRE 24;
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "";
        offre = [ (Aut, A); (Ete, A) ];
        dom = [];
      } );
    ( "ECN-2901",
      {
        titre = "Analyse économique en ingénierie";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "MMM-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, H); (Ete, H) ];
        dom = [ GEN ];
      } );
    ( "GMN-2901",
      {
        titre = "Santé et sécurité pour ingénieur II";
        credit = Cr 2;
        conco = "";
        pre = Aucun;
        dept = "MMM-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, Y) ];
        dom = [ GEN ];
      } );
    ( "MAT-2910",
      {
        titre = "Analyse numérique pour l'ingénieur";
        credit = Cr 3;
        conco = "";
        pre =
          ET
            [
              OU [ CP "MAT-1110"; CP "MAT-1900"; CP "PHY-1002" ];
              OU
                [
                  CCP "GLO-1901"; CCP "IFT-1004"; CCP "IFT-1903"; CCP "IFT-1901";
                ];
            ];
        dept = "MATSTT-FSG";
        multi = "";
        equiv = "";
        offre = [ (Aut, A); (Hiv, A); (Hiv, Z3) ];
        dom = [ MAT ];
      } );
    ( "PHI-2910",
      {
        titre = "Génie et développement durable";
        credit = Cr 3;
        conco = "";
        pre = CRE 30;
        dept = "PHI-FPHI";
        multi = "";
        equiv = "";
        offre = [ (Hiv, A); (Aut, A); (Ete, H) ];
        dom = [ LOG ];
      } );
    ( "STT-2920",
      {
        titre = "Probabilités pour ingénieurs";
        credit = Cr 3;
        conco = "";
        pre =
          OU
            [
              ET [ CP "MAT-1900"; CP "MAT-1910" ];
              ET [ CP "PHY-1001"; CP "PHY-1002" ];
            ];
        dept = "MATSTT-FSG";
        multi = "";
        equiv = "";
        offre = [ (Aut, A) ];
        dom = [ STAT ];
      } );
    ( "MAT-2930",
      {
        titre = "Algèbre linéaire appliquée";
        credit = Cr 3;
        conco = "";
        pre = OU [ CP "GLO-1901"; CP "IFT-1004"; CP "IFT-1903" ];
        dept = "GELGIF-FSG";
        multi = "";
        equiv = "";
        offre = [ (Aut, A) ];
        dom = [ MAT ];
      } );
    ( "ENT-3000",
      {
        titre = "Portfolio entrepreneurial I";
        credit = Cr 3;
        conco = "";
        pre = ET [ CP "ENT-1000"; CRE 21 ];
        dept = "MNG-FSA";
        multi = "";
        equiv = "";
        offre = [ (Hiv, Z3); (Aut, Z3); (Ete, Z3) ];
        dom = [ ENT ];
      } );
    ( "IFT-3000",
      {
        titre = "Langages de programmation";
        credit = Cr 3;
        conco = "";
        pre =
          ET
            [
              OU [ CP "GIF-1003"; CP "IFT-1006" ];
              OU [ CP "IFT-2008"; CP "GLO-2100" ];
            ];
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, ZA); (Ete, Z3) ];
        dom = [ PROG ];
      } );
    ( "GIF-3000",
      {
        titre = "Architecture des microprocesseurs";
        credit = Cr 3;
        conco = "";
        pre = CP "GLO-2001";
        dept = "GELGIF-FSG";
        multi = "";
        equiv = "";
        offre = [ (Aut, A) ];
        dom = [ SYS ];
      } );
    ( "GIF-3001",
      {
        titre = "Réseaux de transmission de données";
        credit = Cr 3;
        conco = "";
        pre = OU [ CP "GIF-1003"; CP "IFT-1006" ];
        dept = "GELGIF-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, A) ];
        dom = [ NET ];
      } );
    ( "IFT-3001",
      {
        titre = "Conception et analyse d'algorithmes";
        credit = Cr 3;
        conco = "";
        pre =
          ET
            [
              OU [ CP "IFT-2008"; CP "GLO-2100" ];
              OU [ CP "STT-1000"; CP "STT-2920"; CP "STT-2000"; CP "MQT-1102" ];
              OU [ CP "MAT-1310"; CP "MAT-1919" ];
            ];
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, A); (Aut, Z3) ];
        dom = [ THEO; MAT ];
      } );
    ( "GLO-3002",
      {
        titre = "Projet en génie logiciel";
        credit = Cr 3;
        conco = "";
        pre = ET [ CP "GLO-3101"; CP "GLO-4000"; CP "GLO-4002"; CP "GLO-3013" ];
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, Z3) ];
        dom = [ ANA_CON ];
      } );
    ( "IFT-3002",
      {
        titre = "Informatique d'enquête";
        credit = Cr 3;
        conco = "";
        pre = CP "GIF-1001";
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "";
        offre = [ (Ete, Z3) ];
        dom = [ SEC ];
      } );
    ( "GIF-3004",
      {
        titre = "Systèmes embarqués temps réel";
        credit = Cr 3;
        conco = "";
        pre = CP "GLO-2001";
        dept = "GELGIF-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, H) ];
        dom = [ NET ];
      } );
    ( "GLO-3004",
      {
        titre = "Spécification formelle et vérification de logiciels";
        credit = Cr 3;
        conco = "";
        pre = ET [ CP "IFT-2002"; OU [ CP "GIF-1003"; CP "IFT-1006" ] ];
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, Z3) ];
        dom = [ THEO ];
      } );
    ( "ENT-3010",
      {
        titre = "Portfolio entrepreneurial II";
        credit = Cr 3;
        conco = "";
        pre = ET [ CP "ENT-1000"; CP "ENT-3000"; CRE 18 ];
        dept = "MNG-FSA";
        multi = "";
        equiv = "";
        offre = [ (Hiv, Z3); (Aut, Z3); (Ete, Z3) ];
        dom = [ ENT ];
      } );
    ( "GLO-3013",
      {
        titre = "Projet de conception multidisciplinaire";
        credit = Cr 4;
        conco = "";
        pre = ET [ CP "GLO-2004"; CP "GEL-1001"; CCP "GEL-4799"];
        dept = "GELGIF-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, A) ];
        dom = [ SYS ];
      } );
    ( "ANL-3020",
      {
        titre = "Advanced English II";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "LANG-FLSH";
        multi = "";
        equiv = "";
        offre = [ (Hiv, Y); (Hiv, A); (Aut, A); (Aut, Y); (Ete, Y) ];
        dom = [ LANG ];
      } );
    ( "GLO-3100",
      {
        titre = "Cryptographie et sécurité informatique";
        credit = Cr 3;
        conco = "";
        pre = OU [ CP "IFT-2008"; CP "GLO-2100" ];
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "";
        offre = [ (Aut, Z3) ];
        dom = [ SEC ];
      } );
    ( "IFT-3100",
      {
        titre = "Infographie";
        credit = Cr 3;
        conco = "";
        pre = OU [ CP "GIF-1003"; CP "IFT-1006" ];
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, Z3) ];
        dom = [ GAME ];
      } );
    ( "GIF-3101",
      {
        titre = "Informatique mobile et applications";
        credit = Cr 3;
        conco = "";
        pre = ET [ OU [ CP "GIF-1003"; CP "IFT-1006" ]; CRE 57 ];
        dept = "GELGIF-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, A) ];
        dom = [ WEB ];
      } );
    ( "GLO-3101",
      {
        titre = "Gestion de projets informatiques : méthodes et outils";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "";
        offre = [ (Aut, ZA) ];
        dom = [ ANA_CON ];
      } );
    ( "IFT-3101",
      {
        titre = "Compilation et interprétation";
        credit = Cr 3;
        conco = "";
        pre = CP "IFT-2002";
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, A); (Aut, Z3) ];
        dom = [ THEO ];
      } );
    ( "GLO-3102",
      {
        titre = "Développement d'applications Web";
        credit = Cr 3;
        conco = "";
        pre = OU [ CCP "GLO-2004"; CCP "IFT-2007" ];
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, A); (Aut, Z3) ];
        dom = [ WEB ];
      } );
    ( "SIO-3110",
      {
        titre = "Atelier en analyse d'affaires ";
        credit = Cr 3;
        conco = "";
        pre = ET [ CP "SIO-2104"; OU [ CP "SIO-2103"; CP "IFT-1003" ] ];
        dept = "SIO-FSA";
        multi = "";
        equiv = "";
        offre = [ (Hiv, Y); (Aut, H) ];
        dom = [ ENT ];
      } );
    ( "GLO-3112",
      {
        titre = "Développement avancé d'applications Web";
        credit = Cr 3;
        conco = "";
        pre = ET [ CP "GLO-3102"; OU [ CP "IFT-2004"; CP "GLO-2005" ] ];
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, Z3) ];
        dom = [ WEB ];
      } );
    ( "IFT-3113",
      {
        titre = "Projet de jeu vidéo";
        credit = Cr 3;
        conco = "";
        pre = OU [ CP "IFT-2103"; CP "ANI-1018"; CP "MUS-2012" ];
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, ZA) ];
        dom = [ GAME ];
      } );
    ( "IFT-3201",
      {
        titre = "Cyberattaques et tests d'intrusions dans les systèmes d'information";
        credit = Cr 3;
        conco = "";
        pre = OU [ CP "IFT-2006"; CP "GIF-3001"; CP "GLO-2000" ];
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "";
        offre = [ (Aut, Z3) ];
        dom = [ SEC ];
      } );
    ( "GLO-3202",
      {
        titre = "Sécurité des applications Web";
        credit = Cr 3;
        conco = "";
        pre = CP "GLO-3102";
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, ZA) ];
        dom = [ SEC; WEB ];
      } );
    ( "IFT-3333",
      {
        titre = "Projet de recherche";
        credit = Cr 6;
        conco = "";
        pre = CRE 24;
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, Z3); (Aut, Z3); (Ete, Z3) ];
        dom = [];
      } );
    ( "IFT-3580",
      {
        titre = "Stage en informatique II";
        credit = St 9;
        conco = "";
        pre = OU [CP "IFT-2580";CP "IFT-2585"];
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "";
        offre = [ (Aut, A); (Hiv, A); (Ete, A) ];
        dom = [];
      } );
    ( "IFT-3591",
      {
        titre = "Stage en informatique III";
        credit = St 9;
        conco = "";
        pre = CP "IFT-3580";
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "";
        offre = [ (Aut, A); (Hiv, A); (Ete, A) ];
        dom = [];
      } );
    ( "IFT-3592",
      {
        titre = "Stage en informatique IV";
        credit = St 9;
        conco = "";
        pre = CP "IFT-3591";
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "";
        offre = [ (Aut, A); (Hiv, A); (Ete, A) ];
        dom = [];
      } );
    ( "PHI-3900",
      {
        titre = "Éthique et professionnalisme";
        credit = Cr 3;
        conco = "";
        pre = CRE 60;
        dept = "PHI-FPHI";
        multi = "";
        equiv = "";
        offre = [ (Hiv, ZA); (Aut, ZA); (Ete, Z1) ];
        dom = [ LOG ];
      } );
    ( "ANL-3905",
      {
        titre = "English for academic purposes ";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "LANG-FLSH";
        multi = "";
        equiv = "";
        offre = [ (Hiv, A) ];
        dom = [ LANG ];
      } );
    ( "EDC-4000",
      {
        titre = "Rechercher, sélectionner, présenter l'information";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "ENS-FEDU";
        multi = "EDC-7011";
        equiv = "";
        offre = [ (Aut, Z1); (Hiv, Y) ];
        dom = [ GEN ];
      } );
    ( "GLO-4000",
      {
        titre = "Interface personne-machine";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "IFTGLO-FSG";
        multi = "GLO-7006";
        equiv = "";
        offre = [ (Hiv, ZA) ];
        dom = [ GEN ];
      } );
    ( "STT-4000",
      {
        titre = "Statistique mathématique";
        credit = Cr 3;
        conco = "";
        pre = OU [ CP "STT-1500"; CP "ACT-1002" ];
        dept = "MATSTT-FSG";
        multi = "";
        equiv = "";
        offre = [ (Aut, A) ];
        dom = [ STAT ];
      } );
    ( "GLO-4001",
      {
        titre = "Introduction à la robotique mobile";
        credit = Cr 3;
        conco = "";
        pre =
          ET
            [
              OU [ CP "IFT-1004"; CP "GLO-1901" ];
              OU [ CP "STT-1000"; CP "STT-1900"; CP "STT-2920" ];
            ];
        dept = "IFTGLO-FSG";
        multi = "GLO-7021";
        equiv = "";
        offre = [ (Aut, A) ];
        dom = [ SYS ];
      } );
    ( "IFT-4001",
      {
        titre = "Optimisation combinatoire";
        credit = Cr 3;
        conco = "";
        pre = CP "IFT-3001";
        dept = "IFTGLO-FSG";
        multi = "IFT-7020";
        equiv = "";
        offre = [ (Hiv, A) ];
        dom = [ MAT; THEO ];
      } );
    ( "GLO-4002",
      {
        titre = "Qualité et métriques du logiciel";
        credit = Cr 3;
        conco = "";
        pre = ET [ OU [ CP "GLO-2004"; CP "IFT-2007" ]; CP "GLO-2003" ];
        dept = "IFTGLO-FSG";
        multi = "IFT-6002";
        equiv = "";
        offre = [ (Aut, Z3) ];
        dom = [ ANA_CON ];
      } );
    ( "GLO-4003",
      {
        titre = "Architecture logicielle";
        credit = Cr 3;
        conco = "";
        pre = CP "GLO-4002";
        dept = "IFTGLO-FSG";
        multi = "IFT-6003";
        equiv = "";
        offre = [ (Aut, A) ];
        dom = [ ANA_CON ];
      } );
    ( "IFT-4003",
      {
        titre = "Compression de données";
        credit = Cr 3;
        conco = "";
        pre = CP "IFT-3001";
        dept = "IFTGLO-FSG";
        multi = "IFT-7023";
        equiv = "";
        offre = [ (Hiv, A) ];
        dom = [ GEN ];
      } );
    ( "BIF-4007",
      {
        titre = "Traitement de données omiques par apprentissage automatique";
        credit = Cr 3;
        conco = "";
        pre =
          ET
            [
              OU [ CP "STT-1000"; CP "BIO-1006"; CP "STT-1920"; CP "STT-2920" ];
              OU [ CP "IFT-1004"; CP "GLO-1901"; CP "IFT-1902" ];
            ];
        dept = "IFTGLO-FSG";
        multi = "BIF-7007";
        equiv = "";
        offre = [ (Aut, H) ];
        dom = [ PROG; IA; STAT; BIO; MAT ];
      } );
    ( "GLO-4007",
      {
        titre = "Perception 3D pour véhicules autonomes";
        credit = Cr 3;
        conco = "";
        pre = ET [ CP "GLO-4001"; OU [ CP "MAT-1200"; CP "MAT-2930" ] ];
        dept = "IFTGLO-FSG";
        multi = "GLO-7007";
        equiv = "";
        offre = [ (Ete, H) ];
        dom = [ NET; SYS ];
      } );
    ( "GLO-4008",
      {
        titre = "Applications infonuagiques natives et DevOps";
        credit = Cr 3;
        conco = "";
        pre =
          ET
            [
              CCP "GLO-4002";
              OU [ CP "GLO-2000"; CP "IFT-2006" ];
              OU [ CP "GLO-2001"; CP "IFT-2001" ];
            ];
        dept = "IFTGLO-FSG";
        multi = "GLO-7008";
        equiv = "";
        offre = [ (Aut, A) ];
        dom = [ NET; WEB; SYS ];
      } );
    ( "IFT-4021",
      {
        titre = "Programmation et mathématiques pour la science des données";
        credit = Cr 3;
        conco = "";
        pre =
          ET
            [
              OU [ CP "IFT-2008"; CP "GLO-2100" ];
              OU [ CP "MAT-1200"; CP "MAT-2930" ];
            ];
        dept = "IFTGLO-FSG";
        multi = "IFT-7021";
        equiv = "";
        offre = [ (Ete, Z3) ];
        dom = [ PROG; IA; MAT; STAT ];
      } );
    ( "IFT-4022",
      {
        titre = "Traitement automatique de la langue naturelle";
        credit = Cr 3;
        conco = "";
        pre =
          ET
            [
              OU [ CP "IFT-2002"; CP "GLO-2100"; CP "IFT-2008" ];
              OU [ CP "STT-1000"; CP "STT-2920"; CP "STT-1900"; CP "MQT-1102" ];
            ];
        dept = "IFTGLO-FSG";
        multi = "IFT-7022";
        equiv = "";
        offre = [ (Aut, Z3) ];
        dom = [ IA; STAT ];
      } );
    ( "GLO-4027",
      {
        titre = "Analyse et traitement de données massives";
        credit = Cr 3;
        conco = "";
        pre =
          ET
            [
              OU [ CP "IFT-2004"; CP "GLO-2005" ];
              OU [ CP "IFT-2008"; CP "GLO-2100" ];
            ];
        dept = "IFTGLO-FSG";
        multi = "GLO-7027";
        equiv = "";
        offre = [ (Hiv, ZA) ];
        dom = [ BD ];
      } );
    ( "GLO-4030",
      {
        titre = "Apprentissage par réseaux de neurones profonds";
        credit = Cr 3;
        conco = "";
        pre = ET [
          OU [ CP "MAT-1200"; CP "MAT-2930" ];
          OU [ CCP "IFT-4102"; CCP "GIF-4101" ];
        ];
        dept = "IFTGLO-FSG";
        multi = "GLO-7030";
        equiv = "";
        offre = [ (Hiv, A) ];
        dom = [ IA ];
      } );
    ( "GLO-4035",
      {
        titre = "Bases de données avancées";
        credit = Cr 3;
        conco = "";
        pre = OU [ CP "IFT-2004"; CP "GLO-2005" ];
        dept = "IFTGLO-FSG";
        multi = "GLO-7035";
        equiv = "";
        offre = [ (Aut, Z3) ];
        dom = [ BD ];
      } );
    ( "IFT-4100",
      {
        titre = "Aspects pratiques de la chaîne de blocs";
        credit = Cr 3;
        conco = "";
        pre = ET [ CRE 21; OU [ CP "IFT-1004"; CP "GLO-1901" ] ];
        dept = "IFTGLO-FSG";
        multi = "IFT-7100";
        equiv = "";
        offre = [ (Ete, Z3) ];
        dom = [ NET; SEC; WEB ];
      } );
    ( "GIF-4100",
      {
        titre = "Vision numérique";
        credit = Cr 3;
        conco = "";
        pre = ET [ OU [ CP "MAT-1200"; CP "MAT-2930" ]; CRE 78 ];
        dept = "GELGIF-FSG";
        multi = "GIF-7001";
        equiv = "";
        offre = [ (Aut, ZA) ];
        dom = [ GAME; SYS ];
      } );
    ( "GIF-4101",
      {
        titre = "Introduction à l'apprentissage machine ";
        credit = Cr 3;
        conco = "";
        pre =
          ET
            [
              OU [ CP "STT-1000"; CP "STT-1900"; CP "STT-2920" ];
              OU [ CP "MAT-1200"; CP "MAT-1910"; CP "MAT-2930"; CP "PHY-1001" ];
            ];
        dept = "GELGIF-FSG";
        multi = "GIF-7005";
        equiv = "";
        offre = [ (Aut, ZA) ];
        dom = [ IA ];
      } );
    ( "IFT-4102",
      {
        titre = "Techniques avancées en intelligence artificielle";
        credit = Cr 3;
        conco = "";
        pre =
          ET
            [
              OU [ CP "GLO-2100"; CP "IFT-2008" ];
              OU [ CP "STT-1000"; CP "STT-2920"; CP "STT-1900"; CP "MQT-1102"];
            ];
        dept = "IFTGLO-FSG";
        multi = "IFT-7025";
        equiv = "";
        offre = [ (Hiv, ZA) ];
        dom = [ IA ];
      } );
    ( "GIF-4104",
      {
        titre = "Programmation parallèle et distribuée ";
        credit = Cr 3;
        conco = "";
        pre = OU [ CP "GLO-2100"; CP "IFT-2008" ];
        dept = "GELGIF-FSG";
        multi = "GIF-7104";
        equiv = "";
        offre = [ (Hiv, A) ];
        dom = [ PROG; GAME; IA; SYS ];
      } );
    ( "GIF-4105",
      {
        titre = "Photographie algorithmique";
        credit = Cr 3;
        conco = "";
        pre =
          ET
            [
              OU [ CP "GLO-1901"; CP "IFT-1004" ];
              OU [ CP "MAT-1200"; CP "MAT-2930" ]
            ];
        dept = "GELGIF-FSG";
        multi = "GIF-7105";
        equiv = "";
        offre = [ (Hiv, ZA) ];
        dom = [ GAME ];
      } );
    ( "IFT-4201",
      {
        titre = "Apprentissage par renforcement";
        credit = Cr 3;
        conco = "";
        pre = ET
        [
          OU [ CP "GLO-2100"; CP "IFT-2008" ];
          OU [ CP "MAT-1200"; CP "MAT-2930"; CP "PHY-1001" ];
          OU [ CCP "IFT-4102"; CCP "GIF-4101" ];
        ];
        dept = "IFTGLO-FSG";
        multi = "IFT-7201";
        equiv = "";
        offre = [ (Aut, Z3) ];
        dom = [ IA ];
      } );
    ( "GEL-4799",
      {
        titre = "Dangers de l'électricité";
        credit = Cr 0;
        conco = "";
        pre = Aucun;
        dept = "GELGIF-FSG";
        multi = "";
        equiv = "GEL-1799";
        offre = [ (Aut, Z1); (Hiv, Z1) ];
        dom = [ SYS ];
      } );
    ( "BIO-4900",
      {
        titre = "Écologie et environnement";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "BIO-FSG";
        multi = "";
        equiv = "BIO-6901";
        offre = [ (Hiv, A) ];
        dom = [ GEN ];
      } );
    ( "BIO-4902",
      {
        titre = "Écologie intégrative des symbioses végétales";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "BOI-FORE";
        multi = "";
        equiv = "BIO-7904";
        offre = [ (Aut, Z1) ];
        dom = [ GEN ];
      } );
    ( "IFT-4902",
      {
        titre = "Programmation avec R pour l'analyse de données";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "ACT-FSG";
        multi = "IFT-7902";
        equiv = "";
        offre = [ (Hiv, H) ];
        dom = [ STAT ];
      } );
    ( "IFT-6001",
      {
        titre =
          "Introduction à la recherche en informatique : communication et \
           méthodologie";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, H) ];
        dom = [];
      } );
    ( "IFT-6002",
      {
        titre = "Assurance qualité du logiciel";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "IFTGLO-FSG";
        multi = "GLO-4002";
        equiv = "";
        offre = [ (Aut, Z3) ];
        dom = [ ANA_CON ];
      } );
    ( "IFT-6003",
      {
        titre = "Architecture logicielle";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "IFTGLO-FSG";
        multi = "GLO-4003";
        equiv = "";
        offre = [ (Aut, A) ];
        dom = [ ANA_CON ];
      } );
    ( "BIO-6901",
      {
        titre = "Écologie et environnement : actualités";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "BIO-FSG";
        multi = "";
        equiv = "BIO-4900";
        offre = [ (Hiv, A) ];
        dom = [ GEN ];
      } );
    ( "GIF-7001",
      {
        titre = "Vision numérique";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "GELGIF-FSG";
        multi = "GIF-4100";
        equiv = "";
        offre = [ (Aut, ZA) ];
        dom = [ GAME; SYS ];
      } );
    ( "GLO-7001",
      {
        titre = "Conception des systèmes intelligents";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "";
        offre = [ (Aut, A) ];
        dom = [ IA ];
      } );
    ( "IFT-7002",
      {
        titre = "Fondements de l'apprentissage machine";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, A) ];
        dom = [ IA ];
      } );
    ( "IFT-7003",
      {
        titre = "Complexité de calcul et NP-complétude";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, A) ];
        dom = [ THEO ];
      } );
    ( "GIF-7005",
      {
        titre = "Introduction à l'apprentissage machine ";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "GELGIF-FSG";
        multi = "GIF-4101";
        equiv = "";
        offre = [ (Aut, ZA) ];
        dom = [ IA ];
      } );
    ( "GLO-7006",
      {
        titre = "Ingénierie des interfaces personne-machine";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "IFTGLO-FSG";
        multi = "GLO-4000";
        equiv = "";
        offre = [ (Hiv, ZA) ];
        dom = [ GEN ];
      } );
    ( "BIF-7007",
      {
        titre = "Traitement de données omiques par apprentissage automatique";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "IFTGLO-FSG";
        multi = "BIF-4007";
        equiv = "";
        offre = [];
        dom = [ PROG; IA; STAT; BIO; MAT ];
      } );
    ( "GLO-7008",
      {
        titre = "Applications infonuagiques natives et DevOps";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "IFTGLO-FSG";
        multi = "GLO-4008";
        equiv = "";
        offre = [ (Aut, A) ];
        dom = [ NET; WEB; SYS ];
      } );
    ( "IFT-7008",
      {
        titre = "Représentation des connaissances et modélisation";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "";
        offre = [];
        dom = [ IA ];
      } );
    ( "GLO-7007",
      {
        titre = "Perception 3D pour véhicules autonomes";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "IFTGLO-FSG";
        multi = "GLO-4007";
        equiv = "";
        offre = [ (Ete, H) ];
        dom = [ NET; SYS ];
      } );
    ( "IFT-7009",
      {
        titre = "Réseaux mobiles";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "";
        offre = [ (Aut, A) ];
        dom = [ NET; SYS ];
      } );
    ( "IFT-7010",
      {
        titre = "Sécurité et méthodes formelles";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "";
        offre = [ (Aut, Z3) ];
        dom = [ SEC ];
      } );
    ( "EDC-7011",
      {
        titre = "Rechercher, sélectionner, présenter l'information";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "ENS-FEDU";
        multi = "EDC-4000";
        equiv = "";
        offre = [ (Aut, Z1); (Hiv, Y) ];
        dom = [ GEN ];
      } );
    ( "IFT-7012",
      {
        titre = "Théorie algorithmique des graphes";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "";
        offre = [];
        dom = [ MAT ];
      } );
    ( "IFT-7014",
      {
        titre = "Lectures dirigées";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "IFTGLO-FSG";
        multi = "";
        equiv = "";
        offre = [ (Hiv, A); (Aut, A); (Ete, A) ];
        dom = [];
      } );
    ( "IFT-7020",
      {
        titre = "Optimisation combinatoire";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "IFTGLO-FSG";
        multi = "IFT-4001";
        equiv = "";
        offre = [ (Aut, A) ];
        dom = [ THEO ];
      } );
    ( "GLO-7021",
      {
        titre = "Introduction à la robotique mobile";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "IFTGLO-FSG";
        multi = "GLO-4001";
        equiv = "";
        offre = [ (Aut, A) ];
        dom = [ SYS ];
      } );
    ( "IFT-7022",
      {
        titre =
          "Techniques et applications du traitement de la langue naturelle";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "IFTGLO-FSG";
        multi = "IFT-4022";
        equiv = "";
        offre = [ (Aut, Z3) ];
        dom = [ IA ];
      } );
    ( "IFT-7023",
      {
        titre = "Compression de données";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "IFTGLO-FSG";
        multi = "IFT-4003";
        equiv = "";
        offre = [ (Hiv, A) ];
        dom = [];
      } );
    ( "IFT-7021",
      {
        titre = "Programmation et mathématiques pour la science des données";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "IFTGLO-FSG";
        multi = "IFT-4021";
        equiv = "";
        offre = [];
        dom = [ PROG; IA; MAT; STAT ];
      } );
    ( "IFT-7022",
      {
        titre = "Traitement automatique de la langue naturelle";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "IFTGLO-FSG";
        multi = "IFT-4022";
        equiv = "";
        offre = [ (Aut, Z3) ];
        dom = [ IA; STAT ];
      } );
    ( "IFT-7025",
      {
        titre = "Techniques avancées en intelligence artificielle";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "IFTGLO-FSG";
        multi = "IFT-4102";
        equiv = "";
        offre = [ (Hiv, ZA) ];
        dom = [ IA ];
      } );
    ( "GLO-7027",
      {
        titre = "Analyse et traitement de données massives";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "IFTGLO-FSG";
        multi = "GLO-4027";
        equiv = "";
        offre = [ (Hiv, ZA) ];
        dom = [ BD ];
      } );
    ( "GLO-7030",
      {
        titre = "Apprentissage par réseaux de neurones profonds";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "IFTGLO-FSG";
        multi = "GLO-4030";
        equiv = "";
        offre = [ (Hiv, A) ];
        dom = [ IA ];
      } );
    ( "GLO-7035",
      {
        titre = "Bases de données avancées";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "IFTGLO-FSG";
        multi = "GLO-4035";
        equiv = "";
        offre = [ (Aut, Z3) ];
        dom = [ BD ];
      } );
    ( "IFT-7100",
      {
        titre = "Aspects pratiques de la chaîne de blocs";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "IFTGLO-FSG";
        multi = "IFT-4100";
        equiv = "";
        offre = [ (Ete, Z3) ];
        dom = [ NET; SEC; WEB ];
      } );
    ( "GIF-7104",
      {
        titre = "Programmation parallèle et distribuée ";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "GELGIF-FSG";
        multi = "GIF-4104";
        equiv = "";
        offre = [ (Hiv, A) ];
        dom = [ PROG; GAME; IA; SYS ];
      } );
    ( "GIF-7105",
      {
        titre = "Photographie algorithmique";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "GELGIF-FSG";
        multi = "GIF-4105";
        equiv = "";
        offre = [ (Hiv, ZA) ];
        dom = [ GAME ];
      } );
    ( "IFT-7201",
      {
        titre = "Apprentissage par renforcement";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "IFTGLO-FSG";
        multi = "IFT-4201";
        equiv = "";
        offre = [ (Aut, Z3) ];
        dom = [ IA ];
      } );
    ( "IFT-7902",
      {
        titre = "Programmation avec R pour l'analyse de données";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "ACT-FSG";
        multi = "IFT-4902";
        equiv = "";
        offre = [ (Hiv, H) ];
        dom = [ STAT ];
      } );
    ( "BIO-7904",
      {
        titre = "Écologie intégrative des symbioses végétales";
        credit = Cr 3;
        conco = "";
        pre = Aucun;
        dept = "BOI-FORE";
        multi = "";
        equiv = "BIO-4902";
        offre = [ (Aut, Z1) ];
        dom = [ GEN ];
      } );
  ]

(* ------------------------------------------------------------------------- *)
(* Autres données                                                            *)
(* ------------------------------------------------------------------------- *)

let fac =
  [
    ("FLSH", "Faculté des lettres et des sciences humaines");
    ("FSG", "Faculté des sciences et de génie");
    ("FPHI", "Faculté de philosophie");
    ("FMUS", "Faculté de musique");
    ("FSS", "Faculté des sciences sociales");
    ("FSA", "Faculté des sciences de l'administration");
    ("FMED", "Faculté de médecine");
    ("FACH", "Faculté d'aménagement, d'architecture, d'art et de design");
    ("FORE", "Faculté de foresterie, de géographie et de géomatique");
    ("FEDU", "Faculté des sciences de l'éducation");
  ]

let dept =
  [
    ("DES", "École de design");
    ("LANG", "École de langues");
    ("MUS", "Musique");
    ( "BIOIFT",
      "Département de biochimie, de microbiologie et de bio-informatique" );
    ("CHM", "Département de chimie");
    ("GMC", "Département de génie mécanique");
    ("GCV", "Département de génie civil et de génie des eaux");
    ("PHY", "Département de physique, de génie physique et d'optique");
    ("ACT", "École d'actuariat");
    ("ScPOL", "Département de science politique");
    ("RelInd", "Département des relations industrielles");
    ("ECO", "Département d'économique");
    ("PHI", "Philosophie");
    ("FIN", "Département de finance, assurance et immobilier");
    ("SGEO", "Département des sciences géomatiques");
    ("GEO", "Département de géographie");
    ("MNG", "Département de management");
    ("MRK", "Département de marketing");
    ("IFTGLO", "Département d'informatique et de génie logiciel");
    ("GELGIF-FSG", "Département de génie électrique et génie informatique");
    ("MMM", "Département de génie des mines, de la métallurgie et des matériaux");
    ("MATSTT-FSG", "Département de mathématiques et de statistique");
    ("OSD", "Département d'opérations et systèmes de décision");
    ("SIO", "Département de systèmes d'information organisationnels");
    ("BOI", "Département des sciences du bois et de la forêt");
    ("ENS", "Département d'études sur l'enseignement et l'apprentissage");
    ( "OPH",
      "Département d'ophtalmologie et d'oto-rhino-laryngologie  \n\
      \     - chirurgie cervico-faciale" );
  ]
