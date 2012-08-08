//Maya ASCII 2013 scene
//Name: survive_logo.ma
//Last modified: Fri, Aug 03, 2012 06:09:36 PM
//Codeset: 1252
requires maya "2013";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2013";
fileInfo "version" "2013 x64";
fileInfo "cutIdentifier" "201202220241-825136";
fileInfo "osv" "Microsoft Windows 7 Home Premium Edition, 64-bit Windows 7 Service Pack 1 (Build 7601)\n";
createNode transform -s -n "persp";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -11.366231356527067 9.8211318879398313 25.869010077970579 ;
	setAttr ".r" -type "double3" -29.738352729102594 341.79999999928464 1.6740253970482392e-015 ;
createNode camera -s -n "perspShape" -p "persp";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 19.978744336393689;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	setAttr ".t" -type "double3" -6.5017615963591968 100.1 10.164118411343811 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	setAttr -k off ".v";
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 9.8901679639438367;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -n "imagePlane1" -p "topShape";
createNode imagePlane -n "imagePlaneShape1" -p "imagePlane1";
	setAttr -k off ".v";
	setAttr ".fc" 12;
	setAttr ".imn" -type "string" "M:/My Documents/GitHub/Survive/Assets/General/survive-logo.png";
	setAttr ".cov" -type "short2" 2193 684 ;
	setAttr ".dlc" no;
	setAttr ".ic" -type "double3" 0 -2.8421709430404007e-014 -2.2226664952995633e-014 ;
	setAttr ".w" 30;
	setAttr ".h" 30;
createNode transform -s -n "front";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -1.7231553195294791 0.64366058403819504 100.1 ;
createNode camera -s -n "frontShape" -p "front";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 31.503646503251606;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 100.1 0 0 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "nurbsCube1";
	setAttr ".t" -type "double3" -3.8750087213698121 1.6302980564529872 -2.1511675402774131 ;
createNode transform -n "nurbsCube2";
	setAttr ".t" -type "double3" -1.7188788575071707 1.4583082669771541 -2.3537293603542295 ;
createNode transform -n "group1";
	setAttr ".t" -type "double3" 0 0 8.8972080578729997 ;
	setAttr ".r" -type "double3" 0 -7.6604881275777936 0 ;
createNode transform -n "pCube1" -p "group1";
	setAttr ".t" -type "double3" -11.942462182064382 1.4790896404613849 0.49578298682877664 ;
createNode mesh -n "pCubeShape1" -p "pCube1";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 56 ".pt";
	setAttr ".pt[182]" -type "float3" -0.0089010447 0 -0.066177219 ;
	setAttr ".pt[183]" -type "float3" -0.0089010447 0 -0.066177219 ;
	setAttr ".pt[184]" -type "float3" -0.0089010447 0 -0.066177219 ;
	setAttr ".pt[185]" -type "float3" -0.0089010447 0 -0.066177219 ;
	setAttr ".pt[186]" -type "float3" -0.0089010447 0 -0.066177219 ;
	setAttr ".pt[187]" -type "float3" -0.0089010447 0 -0.066177219 ;
	setAttr ".pt[196]" -type "float3" 0.017802089 0 0.13235445 ;
	setAttr ".pt[197]" -type "float3" 0.17719825 0 0.12775874 ;
	setAttr ".pt[198]" -type "float3" 0.29460478 0 0.061436348 ;
	setAttr ".pt[199]" -type "float3" 0.18484153 0 0.059356261 ;
	setAttr ".pt[204]" -type "float3" 0.18484153 0 0.059356261 ;
	setAttr ".pt[205]" -type "float3" 0.29460478 0 0.061436348 ;
	setAttr ".pt[206]" -type "float3" 0.17719825 0 0.12775874 ;
	setAttr ".pt[207]" -type "float3" 0.017802089 0 0.13235445 ;
	setAttr ".pt[210]" -type "float3" 0.060130328 0 0.0087558907 ;
	setAttr ".pt[211]" -type "float3" 0.060130328 0 0.0087558907 ;
	setAttr ".pt[212]" -type "float3" 0.09074232 0 0.018941928 ;
	setAttr ".pt[213]" -type "float3" 0.14170693 0 0.045774236 ;
	setAttr ".pt[218]" -type "float3" 0.14170693 0 0.045774236 ;
	setAttr ".pt[219]" -type "float3" 0.09074232 0 0.018941928 ;
	setAttr ".pt[220]" -type "float3" 0.060130328 0 0.0087558907 ;
	setAttr ".pt[221]" -type "float3" 0.060130328 0 0.0087558907 ;
	setAttr ".pt[222]" -type "float3" 0.060130328 0 0.0087558907 ;
	setAttr ".pt[223]" -type "float3" -0.0044505224 0 -0.03308861 ;
	setAttr ".pt[228]" -type "float3" -0.0044505224 0 -0.03308861 ;
	setAttr ".pt[229]" -type "float3" 0.060130328 0 0.0087558907 ;
	setAttr ".pt[232]" -type "float3" 0.09074232 0 0.018941928 ;
	setAttr ".pt[237]" -type "float3" 0.09074232 0 0.018941928 ;
	setAttr ".pt[270]" -type "float3" -0.036426507 0 -0.020365935 ;
	setAttr ".pt[271]" -type "float3" -0.0022252612 0 -0.016544305 ;
	setAttr ".pt[272]" -type "float3" -0.0022252612 0 -0.016544305 ;
	setAttr ".pt[273]" -type "float3" 0.2923795 0 0.044892043 ;
	setAttr ".pt[280]" -type "float3" 0.2923795 0 0.044892043 ;
	setAttr ".pt[281]" -type "float3" -0.0022252612 0 -0.016544305 ;
	setAttr ".pt[282]" -type "float3" -0.0022252612 0 -0.016544305 ;
	setAttr ".pt[283]" -type "float3" -0.036426507 0 -0.020365935 ;
	setAttr ".pt[284]" -type "float3" 0.14348076 0 0.06491942 ;
	setAttr ".pt[289]" -type "float3" 0.14348076 0 0.06491942 ;
	setAttr ".pt[292]" -type "float3" 0.021478565 0 -0.028154349 ;
	setAttr ".pt[297]" -type "float3" 0.021478565 0 -0.028154349 ;
	setAttr ".pt[301]" -type "float3" 0.0044505224 0 0.03308861 ;
	setAttr ".pt[302]" -type "float3" 0.018769568 0 0.014319051 ;
	setAttr ".pt[303]" -type "float3" 0.0044505224 0 0.03308861 ;
	setAttr ".pt[304]" -type "float3" 0.0044505224 0 0.03308861 ;
	setAttr ".pt[305]" -type "float3" 0.0044505224 0 0.03308861 ;
	setAttr ".pt[310]" -type "float3" 0.0044505224 0 0.03308861 ;
	setAttr ".pt[311]" -type "float3" 0.0044505224 0 0.03308861 ;
	setAttr ".pt[312]" -type "float3" 0.0044505224 0 0.03308861 ;
	setAttr ".pt[313]" -type "float3" 0.018769568 0 0.014319051 ;
	setAttr ".pt[314]" -type "float3" 0.0044505224 0 0.03308861 ;
	setAttr ".dr" 1;
createNode transform -n "pCube2" -p "group1";
	setAttr ".t" -type "double3" -8.4258261191202166 0.70491287989622309 1.1212352643658865 ;
createNode mesh -n "pCubeShape2" -p "pCube2";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 79 ".pt";
	setAttr ".pt[12]" -type "float3" 0 0.0001351242 0 ;
	setAttr ".pt[13]" -type "float3" 0 0.00093712384 0 ;
	setAttr ".pt[14]" -type "float3" 0 0.00093712384 0 ;
	setAttr ".pt[15]" -type "float3" 0 0.0001351242 0 ;
	setAttr ".pt[16]" -type "float3" 0 0.0001351242 0 ;
	setAttr ".pt[17]" -type "float3" 5.9604645e-008 0.00093712384 5.9604645e-008 ;
	setAttr ".pt[18]" -type "float3" -1.1920929e-007 -0.079265393 0 ;
	setAttr ".pt[19]" -type "float3" 0 -0.080067374 0 ;
	setAttr ".pt[20]" -type "float3" 0 0.0001351242 0 ;
	setAttr ".pt[22]" -type "float3" 1.4901161e-008 0.00093712384 3.5762787e-007 ;
	setAttr ".pt[23]" -type "float3" 0 0.0001351242 0 ;
	setAttr ".pt[51]" -type "float3" 0 0.0001351242 0 ;
	setAttr ".pt[52]" -type "float3" 0 -0.069765449 0 ;
	setAttr ".pt[53]" -type "float3" 1.7881393e-007 -0.068961449 0 ;
	setAttr ".pt[54]" -type "float3" 0 0.00093712384 0 ;
	setAttr ".pt[56]" -type "float3" 0 0.00093712198 0 ;
	setAttr ".pt[57]" -type "float3" 0 0.00093712198 0 ;
	setAttr ".pt[58]" -type "float3" 0 0.00013506459 0 ;
	setAttr ".pt[59]" -type "float3" 0 0.00013506459 0 ;
	setAttr ".pt[60]" -type "float3" 0 -0.0051836474 0 ;
	setAttr ".pt[61]" -type "float3" 0 -0.0059654107 0 ;
	setAttr ".pt[62]" -type "float3" -4.4703484e-008 -0.0051633422 0 ;
	setAttr ".pt[63]" -type "float3" 1.4901161e-008 -0.0043795914 -1.1920929e-007 ;
	setAttr ".pt[64]" -type "float3" 0 0.00093712559 -3.5762787e-007 ;
	setAttr ".pt[65]" -type "float3" 0 0.00013506459 0 ;
	setAttr ".pt[66]" -type "float3" 0 0.00013506459 0 ;
	setAttr ".pt[67]" -type "float3" -0.038071986 -0.064822681 -0.0072450326 ;
	setAttr ".pt[68]" -type "float3" 0 -0.074396059 0 ;
	setAttr ".pt[69]" -type "float3" 4.4703484e-008 -0.073594034 -8.3446503e-007 ;
	setAttr ".pt[70]" -type "float3" -0.03807193 -0.064018704 -0.0072454214 ;
	setAttr ".pt[71]" -type "float3" -1.1920929e-007 0.00093712384 -5.9604645e-008 ;
	setAttr ".pt[72]" -type "float3" 3.7252903e-009 0.00093712559 -5.9604645e-007 ;
	setAttr ".pt[73]" -type "float3" 0 0.00093712198 0 ;
	setAttr ".pt[75]" -type "float3" 0 0.0001351242 0 ;
	setAttr ".pt[76]" -type "float3" 0 0.00013506459 0 ;
	setAttr ".pt[77]" -type "float3" 0 0.00013506459 0 ;
	setAttr ".pt[78]" -type "float3" 0 0.0001351242 0 ;
	setAttr ".pt[79]" -type "float3" -4.4703484e-008 0.00093712384 2.3841858e-007 ;
	setAttr ".pt[81]" -type "float3" 0.0023439666 0 -0.074510284 ;
	setAttr ".pt[84]" -type "float3" 0.0023439666 0 -0.074510284 ;
	setAttr ".pt[88]" -type "float3" 0 0.00093712384 0 ;
	setAttr ".pt[89]" -type "float3" 0 0.0001351242 0 ;
	setAttr ".pt[90]" -type "float3" 0 0.00013506459 0 ;
	setAttr ".pt[91]" -type "float3" -0.024398763 0.00013506459 -0.089462057 ;
	setAttr ".pt[92]" -type "float3" 0 0.0001351242 0 ;
	setAttr ".pt[93]" -type "float3" -1.7881393e-007 0.00093712384 -2.9802322e-007 ;
	setAttr ".pt[94]" -type "float3" -0.024398953 0.00093712384 -0.089461923 ;
	setAttr ".pt[95]" -type "float3" 0 0.00093712198 0 ;
	setAttr ".pt[99]" -type "float3" -0.022765074 0 -0.077315956 ;
	setAttr ".pt[106]" -type "float3" -0.022765074 0 -0.077315956 ;
	setAttr ".pt[108]" -type "float3" 2.9802322e-008 0.00093712384 5.9604645e-007 ;
	setAttr ".pt[109]" -type "float3" 0 0.00013506459 0 ;
	setAttr ".pt[110]" -type "float3" 0 0.00013506459 0 ;
	setAttr ".pt[111]" -type "float3" -0.01306951 0.00013506459 -0.097168796 ;
	setAttr ".pt[112]" -type "float3" 0 0.00013506459 0 ;
	setAttr ".pt[113]" -type "float3" 0 -0.033631805 0 ;
	setAttr ".pt[114]" -type "float3" 0 -0.03860921 0 ;
	setAttr ".pt[115]" -type "float3" -1.8626447e-009 -0.037805177 1.1920929e-007 ;
	setAttr ".pt[116]" -type "float3" 3.7252903e-009 -0.032827795 -8.3446503e-007 ;
	setAttr ".pt[117]" -type "float3" 1.8626451e-009 0.00093712425 3.5762787e-007 ;
	setAttr ".pt[118]" -type "float3" -0.013069505 0.00093712425 -0.097168803 ;
	setAttr ".pt[119]" -type "float3" 5.9604645e-008 0.00093712384 5.9604645e-007 ;
	setAttr ".pt[121]" -type "float3" 0 0.00093712384 0 ;
	setAttr ".pt[122]" -type "float3" 0 0.00031328673 0 ;
	setAttr ".pt[123]" -type "float3" 0.019959403 -0.0030246715 0.10242528 ;
	setAttr ".pt[124]" -type "float3" -0.045210481 -0.0066844462 0.12355649 ;
	setAttr ".pt[125]" -type "float3" 0.01516515 -0.0072644022 0.15871632 ;
	setAttr ".pt[126]" -type "float3" 0.015164902 -0.0080684526 0.15871611 ;
	setAttr ".pt[127]" -type "float3" -0.045210455 -0.0074884994 0.12355639 ;
	setAttr ".pt[128]" -type "float3" 0.019959403 -0.0038266769 0.102425 ;
	setAttr ".pt[129]" -type "float3" 0 -0.00048875762 0 ;
	setAttr ".pt[130]" -type "float3" 0 0.0001351242 0 ;
	setAttr ".pt[133]" -type "float3" 0.012252663 0 0.091095746 ;
	setAttr ".pt[134]" -type "float3" 0.042617913 0 0.087011524 ;
	setAttr ".pt[135]" -type "float3" 0.025215607 0 0.095535107 ;
	setAttr ".pt[136]" -type "float3" 0.025215607 0 0.095535107 ;
	setAttr ".pt[137]" -type "float3" 0.042617913 0 0.087011524 ;
	setAttr ".pt[138]" -type "float3" 0.012252663 0 0.091095746 ;
	setAttr ".dr" 3;
	setAttr ".dsm" 2;
createNode transform -n "pCube3" -p "group1";
	setAttr ".t" -type "double3" -3.9577726441609631 0.70491287989622309 1.1212352643658865 ;
createNode mesh -n "pCubeShape3" -p "pCube3";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt";
	setAttr ".pt[53]" -type "float3" -0.089839257 0 -0.036451444 ;
	setAttr ".pt[54]" -type "float3" -0.089839257 0 -0.036451444 ;
	setAttr ".pt[59]" -type "float3" -0.0079105869 0 0.031398438 ;
	setAttr ".pt[60]" -type "float3" 0.02634543 0 0.10566042 ;
	setAttr ".pt[61]" -type "float3" 0.02634543 0 0.10566042 ;
	setAttr ".pt[62]" -type "float3" -0.0079105869 0 0.031398438 ;
	setAttr ".dr" 1;
createNode mesh -n "polySurfaceShape1" -p "pCube3";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0.09062399 0 1.1479046 0.33228794 
		0 0.82316864 0.09062399 -0.73433292 1.1479046 0.33228794 -0.73433292 0.82316864 -0.27187195 
		-0.73433292 0.52108794 0.13593598 -0.73433292 0.37004793 -0.27187195 0 0.52108794 
		0.13593598 0 0.37004793;
	setAttr -s 8 ".vt[0:7]"  -0.61633325 -0.7049129 0.64053124 0.61633325 -0.7049129 0.64053124
		 -0.61633325 0.7049129 0.64053124 0.61633325 0.7049129 0.64053124 -0.61633325 0.7049129 -0.64053124
		 0.61633325 0.7049129 -0.64053124 -0.61633325 -0.7049129 -0.64053124 0.61633325 -0.7049129 -0.64053124;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
createNode transform -n "pCube4" -p "group1";
	setAttr ".t" -type "double3" 0.86106204146041598 0.70491287989622309 1.1212352643658865 ;
createNode mesh -n "pCubeShape4" -p "pCube4";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dr" 1;
createNode mesh -n "polySurfaceShape2" -p "pCube4";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0.40780792 0 0.41535991 0.4606719 
		0 0.18879998 0.40780792 -0.73433292 0.41535991 0.4606719 -0.73433292 0.18879998 -1.1932167 
		-0.73433292 -2.8773098 -1.3064971 -0.73433292 -3.1038675 -1.1932167 0 -2.8773098 
		-1.3064971 0 -3.1038675;
	setAttr -s 8 ".vt[0:7]"  -0.61633325 -0.7049129 0.64053124 0.61633325 -0.7049129 0.64053124
		 -0.61633325 0.7049129 0.64053124 0.61633325 0.7049129 0.64053124 -0.61633325 0.7049129 -0.64053124
		 0.61633325 0.7049129 -0.64053124 -0.61633325 -0.7049129 -0.64053124 0.61633325 -0.7049129 -0.64053124;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
createNode transform -n "pCube5" -p "group1";
	setAttr ".t" -type "double3" 4.907105124303218 0.70491287989622309 1.1212352643658865 ;
createNode mesh -n "pCubeShape5" -p "pCube5";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dr" 1;
createNode mesh -n "polySurfaceShape4" -p "pCube5";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0.17369597 0 -0.18124798 
		0.09062399 0 -0.34739193 0.17369597 -0.73433292 -0.18124798 0.09062399 -0.73433292 
		-0.34739193 -0.521088 -0.73433292 -3.6022997 -0.61171234 -0.73433292 -3.7835455 -0.521088 
		0 -3.6022997 -0.61171234 0 -3.7835455;
	setAttr -s 8 ".vt[0:7]"  -0.61633325 -0.7049129 0.64053124 0.61633325 -0.7049129 0.64053124
		 -0.61633325 0.7049129 0.64053124 0.61633325 0.7049129 0.64053124 -0.61633325 0.7049129 -0.64053124
		 0.61633325 0.7049129 -0.64053124 -0.61633325 -0.7049129 -0.64053124 0.61633325 -0.7049129 -0.64053124;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
createNode transform -n "pCube6" -p "group1";
	setAttr ".t" -type "double3" 11.175105942728539 0.70491287989622309 0.067510751324575624 ;
createNode mesh -n "pCubeShape6" -p "pCube6";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dr" 1;
createNode mesh -n "polySurfaceShape3" -p "pCube6";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0.043632746 0 -0.043632749 
		0.63703793 0 -0.32288226 0.043632746 -0.73433292 -0.043632749 0.63703793 -0.73433292 
		-0.32288226 -0.68067074 -0.73433292 -3.4469907 -0.052359663 -0.73433292 -3.743695 
		-0.68067074 0 -3.4469907 -0.052359663 0 -3.743695;
	setAttr -s 8 ".vt[0:7]"  -0.61633325 -0.7049129 0.64053124 0.61633325 -0.7049129 0.64053124
		 -0.61633325 0.7049129 0.64053124 0.61633325 0.7049129 0.64053124 -0.61633325 0.7049129 -0.64053124
		 0.61633325 0.7049129 -0.64053124 -0.61633325 -0.7049129 -0.64053124 0.61633325 -0.7049129 -0.64053124;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
createNode transform -n "pCube8" -p "group1";
	setAttr ".t" -type "double3" 6.9869644871912895 0.70491287989622309 0.20990809501043528 ;
createNode mesh -n "pCubeShape8" -p "pCube8";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 140 ".uvst[0].uvsp[0:139]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25 0.625 0.29035267 0.6653527 0.25 0.33464736 0.25 0.37500003
		 0.29035267 0.33464736 0 0.375 0.9596473 0.625 0.9596473 0.66535264 0 0.625 0 0.66535264
		 0 0.6653527 0.25 0.625 0.25 0.66535264 0.25 0.66535264 0 0.62499994 0 0.62499994
		 0.25 0.66535264 0 0.66535264 0.25 0.6653527 0.25 0.66535264 0 0.39876398 0.5 0.39876398
		 0.75 0.39876398 0.95964724 0.39876398 0 0.39876398 1 0.39876398 0.25 0.39876404 0.29035267
		 0.60020375 0.5 0.60020375 0.75 0.60020375 0.9596473 0.60020375 0 0.60020375 1 0.60020375
		 0.25 0.60020375 0.29035267 0.60020375 0.49471503 0.39876398 0.49471503 0.13028497
		 0.25 0.37500003 0.49471503 0.13028497 0 0.375 0.75528497 0.39876398 0.75528497 0.60020375
		 0.75528497 0.625 0.75528497 0.86971503 0 0.625 0.49471503 0.86971503 0.25 0.60020375
		 0.25604963 0.39876398 0.25604963 0.36895043 0.25 0.37500003 0.25604963 0.3689504
		 0 0.375 0.99395037 0.39876395 0.99395037 0.60020375 0.99395037 0.625 0.99395037 0.63104957
		 0 0.63104951 0 0.63104957 0 0.63104963 0.25 0.63104957 0.25 0.625 0.25604963 0.63104963
		 0.25 0.63104963 0.25 0.625 0.25 0.625 0 0.63104957 0 0.66535264 0 0.66535264 0 0.6653527
		 0.25 0.6653527 0.25 0.6653527 0.25 0.6653527 0.25 0.66535264 0 0.66535264 0 0.63104951
		 0 0.62499994 0 0.62499994 0.25 0.63104957 0.25 0.6653527 0.25 0.66535264 0.25 0.66535264
		 0 0.66535264 0 0.66535264 0 0.66535264 0 0.6653527 0.25 0.6653527 0.25 0.656771 0.25
		 0.625 0.28177103 0.65677106 0.25 0.60020375 0.28177103 0.39876404 0.28177103 0.343229
		 0.25 0.37500003 0.28177103 0.34322897 0 0.375 0.96822894 0.39876395 0.96822894 0.60020375
		 0.96822894 0.625 0.96822894 0.656771 0 0.656771 0 0.656771 0 0.656771 0 0.656771
		 0 0.65677106 0.25 0.65677106 0.25 0.65677106 0.25 0.60020375 0.30361548 0.39876404
		 0.30361548 0.32138455 0.25 0.37500003 0.30361548 0.32138455 0 0.375 0.94638449 0.39876398
		 0.94638443 0.60020375 0.94638449 0.625 0.94638449 0.67861545 0 0.625 0.30361548 0.67861557
		 0.25 0.66535258 0.25 0.66535258 0 0.66535264 0 0.66535258 0 0.66535258 0 0.6653527
		 0.25 0.6653527 0.25 0.6653527 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 112 ".vt[0:111]"  -0.19677192 -0.7049129 1.020630956 0.69185328 -0.7049129 0.90485132
		 -0.19677192 -0.029420018 1.020630956 0.69185328 -0.029420018 0.90485132 -1.80954993 -0.029420018 -3.51784134
		 -0.69016385 -0.029420018 -3.74439907 -1.80954993 -0.7049129 -3.51784134 -0.69016385 -0.7049129 -3.74439907
		 0.80939531 -0.029420018 0.15572584 -0.46694785 -0.029420018 0.31764185 -0.46694779 -0.7049129 0.31764185
		 0.80939531 -0.7049129 0.15572596 2.37694573 -0.7049129 -0.030161023 2.30724168 -0.7049129 0.63256788
		 2.37694573 -0.029420018 -0.030161142 2.30724168 -0.029420018 0.63256788 0.92479444 -0.029420018 0.13881278
		 0.92479444 -0.7049129 0.1388129 1.41476297 -0.7049129 0.79433143 1.41476297 -0.029420018 0.79433143
		 1.017914057 -0.029420733 -3.98167276 1.017914057 -0.70491362 -3.98167276 2.60852742 -0.029420733 -4.18417931
		 2.60852742 -0.70491362 -4.18417883 -1.70314562 -0.029420018 -3.53937697 -1.70314562 -0.7049129 -3.53937697
		 -0.34729961 -0.7049129 0.29610601 0.070991881 -0.7049129 1.0062736273 0.070991881 -0.029420018 1.0062736273
		 -0.34729961 -0.029420018 0.29610598 -0.80119014 -0.029420018 -3.72192788 -0.80119014 -0.7049129 -3.72192788
		 0.60227615 -0.7049129 0.072416797 0.60254925 -0.7049129 0.91983217 0.60254925 -0.029420018 0.91983217
		 0.60227615 -0.029420018 0.072416678 -0.76418078 -0.029420018 -3.62524009 -1.66896629 -0.029420018 -3.44268894
		 -1.7757045 -0.029420018 -3.42115331 -1.7757045 -0.7049129 -3.42115331 -1.66896629 -0.7049129 -3.44268894
		 -0.76418078 -0.7049129 -3.62524009 -0.65280616 -0.7049129 -3.64771128 -0.65280616 -0.029420018 -3.64771128
		 0.6121996 -0.029420018 0.7989561 -0.097807795 -0.029420018 0.82987672 -0.29428115 -0.029420018 0.79829669
		 -0.29428115 -0.7049129 0.79829669 -0.097807795 -0.7049129 0.82987672 0.6121996 -0.7049129 0.79895616
		 0.70683193 -0.7049129 0.78285235 1.33866453 -0.7049129 0.68636584 2.34707499 -0.7049129 0.42743215
		 2.34707522 -0.029420018 0.42743209 1.33866453 -0.029420018 0.68636578 0.70683193 -0.029420018 0.78285229
		 2.13590002 -0.029420018 0.46962559 2.12093568 -0.029420018 0.66372818 2.12093568 -0.7049129 0.66372818
		 2.13589978 -0.7049129 0.46962565 2.2540102 -0.7049129 -0.021434627 2.47548532 -0.70491362 -4.16724062
		 2.47548532 -0.029420733 -4.1672411 2.2540102 -0.029420018 -0.021434747 1.084553123 -0.029420018 0.046867438
		 1.16536736 -0.029420733 -4.00044536591 1.16536736 -0.70491362 -4.00044536591 1.084553123 -0.7049129 0.046867557
		 1.42942238 -0.7049129 0.6721682 1.49749756 -0.7049129 0.77933562 1.49749756 -0.029420018 0.77933562
		 1.42942238 -0.029420018 0.67216814 1.16190755 -0.029420713 -3.88512111 1.014772058 -0.029420713 -3.86660671
		 1.014772058 -0.70491356 -3.86660671 1.16190755 -0.70491356 -3.88512111 2.4692018 -0.70491356 -4.049622059
		 2.60195732 -0.70491356 -4.066327095 2.60195732 -0.029420713 -4.066328049 2.4692018 -0.029420713 -4.049622536
		 1.038619876 -0.029420018 0.28608996 0.78227073 -0.029420018 0.31115657 0.59446347 -0.029420018 0.30265144
		 -0.29958576 -0.029420018 0.45463297 -0.41199023 -0.029420018 0.47464222 -0.4119902 -0.7049129 0.47464222
		 -0.29958576 -0.7049129 0.454633 0.59446347 -0.7049129 0.30265155 0.78227073 -0.7049129 0.31115669
		 1.038619876 -0.7049129 0.28609005 1.19875073 -0.7049129 0.21651919 2.24945545 -0.7049129 0.12052673
		 2.36212206 -0.7049129 0.11077872 2.36212206 -0.029420018 0.11077861 2.24945545 -0.029420018 0.12052663
		 1.19875073 -0.029420018 0.21651909 0.51359504 -0.029420018 -0.16755588 -0.43307388 -0.029420018 0.053463623
		 -0.55188423 -0.029420018 0.074999452 -0.55188423 -0.7049129 0.074999452 -0.43307388 -0.7049129 0.053463623
		 0.51359504 -0.7049129 -0.16755578 0.71450061 -0.7049129 -0.0911116 0.71450061 -0.029420018 -0.09111172
		 0.93119526 -0.029420067 -0.14612427 0.93119526 -0.7049129 -0.14612417 1.090055943 -0.7049129 -0.23284587
		 2.26931834 -0.7049129 -0.30799133 2.39295244 -0.7049129 -0.31728533 2.39295244 -0.029420067 -0.31728551
		 2.26931858 -0.029420067 -0.30799159 1.090055943 -0.029420067 -0.2328459;
	setAttr -s 220 ".ed";
	setAttr ".ed[0:165]"  0 27 0 2 28 0 4 24 0 6 25 0 0 2 0 1 3 1 2 46 0 3 55 1
		 4 6 0 5 7 0 6 39 0 7 42 0 8 103 0 9 98 0 8 35 1 10 85 0 9 10 1 11 88 1 10 26 1 11 8 0
		 11 17 0 1 18 0 12 92 0 8 16 0 12 14 1 3 19 0 15 53 0 13 15 0 16 64 1 17 67 1 16 17 0
		 18 69 0 17 89 1 19 70 0 18 19 1 19 54 1 16 104 0 17 105 0 20 21 0 14 109 0 20 65 0
		 12 108 0 23 22 0 21 66 0 24 30 0 25 31 0 24 25 1 26 32 1 25 40 1 27 33 0 26 86 1
		 28 34 0 27 28 1 29 9 1 28 45 1 29 97 1 30 5 0 31 7 0 30 31 1 32 11 1 31 41 1 33 1 0
		 32 87 1 34 3 0 33 34 1 35 29 1 34 44 1 35 96 1 36 30 1 37 24 1 36 37 1 38 4 0 37 38 1
		 39 99 0 38 39 1 40 100 1 39 40 1 41 101 1 40 41 1 42 102 0 41 42 1 43 5 0 42 43 1
		 43 36 1 44 82 1 45 83 1 44 45 1 46 84 0 45 46 1 47 0 0 46 47 1 48 27 1 47 48 1 49 33 1
		 48 49 1 50 1 1 49 50 1 51 18 1 50 51 1 52 13 0 51 68 1 53 93 0 52 53 1 54 80 1 53 56 1
		 55 81 1 54 55 1 55 44 1 56 71 1 57 15 0 56 57 1 58 13 0 57 58 1 59 52 1 58 59 1 60 12 1
		 59 91 1 61 23 0 60 107 1 62 22 0 61 62 1 63 14 1 62 79 1 63 94 1 64 63 1 65 62 0
		 64 111 1 66 61 0 65 66 1 67 60 1 66 75 1 68 59 1 67 90 1 69 58 0 68 69 1 70 57 0
		 69 70 1 71 54 1 70 71 1 71 95 1 72 65 1 73 20 0 72 73 1 74 21 0 73 74 1 75 106 1
		 74 75 1 76 61 1 75 76 1 77 23 0 76 77 1 78 22 0 77 78 1 79 110 1 78 79 1 79 72 1
		 80 16 1 81 8 1 80 81 1 82 35 1 81 82 1 83 29 1 82 83 1 84 9 0 83 84 1 85 47 0;
	setAttr ".ed[166:219]" 84 85 1 86 48 1 85 86 1 87 49 1 86 87 1 88 50 1 87 88 1
		 89 51 1 88 89 1 90 68 1 89 90 1 91 60 1 90 91 1 92 52 0 91 92 1 93 14 0 92 93 1 94 56 1
		 93 94 1 95 64 1 94 95 1 95 80 1 96 36 1 97 37 1 96 97 1 98 38 0 97 98 1 99 10 0 98 99 1
		 100 26 1 99 100 1 101 32 1 100 101 1 102 11 0 101 102 1 103 43 0 102 103 1 103 96 1
		 104 73 0 105 74 0 104 105 1 106 67 1 105 106 1 107 76 1 106 107 1 108 77 0 107 108 1
		 109 78 0 108 109 1 110 63 1 109 110 1 111 72 1 110 111 1 111 104 1;
	setAttr -s 110 -ch 440 ".fc[0:109]" -type "polyFaces" 
		f 4 0 52 -2 -5
		mu 0 4 0 37 39 2
		f 4 1 54 88 -7
		mu 0 4 2 39 61 63
		f 4 2 46 -4 -9
		mu 0 4 4 34 35 6
		f 4 92 91 -1 -90
		mu 0 4 65 66 38 8
		f 4 -100 102 -27 -28
		mu 0 4 22 71 72 25
		f 4 89 4 6 90
		mu 0 4 64 0 2 62
		f 4 -54 55 192 -14
		mu 0 4 17 40 121 123
		f 4 193 -17 13 194
		mu 0 4 124 18 16 122
		f 4 196 195 -19 -194
		mu 0 4 125 126 36 19
		f 4 -20 -200 202 -13
		mu 0 4 15 21 129 131
		f 4 -96 98 97 -22
		mu 0 4 1 69 70 28
		f 4 19 23 30 -21
		mu 0 4 21 15 26 27
		f 4 -8 25 35 106
		mu 0 4 75 3 29 73
		f 4 -6 21 34 -26
		mu 0 4 3 1 28 29
		f 4 120 119 -43 -118
		mu 0 4 81 82 32 33
		f 4 114 113 99 -112
		mu 0 4 78 79 71 22
		f 4 112 111 27 -110
		mu 0 4 77 78 22 25
		f 4 110 109 26 104
		mu 0 4 76 77 25 72
		f 4 -31 36 206 -38
		mu 0 4 27 26 132 133
		f 4 121 39 216 215
		mu 0 4 83 24 137 138
		f 4 -25 41 214 -40
		mu 0 4 24 23 136 137
		f 4 -116 118 212 -42
		mu 0 4 23 80 135 136
		f 4 44 58 -46 -47
		mu 0 4 34 41 42 35
		f 4 -196 198 197 -48
		mu 0 4 36 126 127 43
		f 4 -92 94 93 -50
		mu 0 4 38 66 67 45
		f 4 -53 49 64 -52
		mu 0 4 39 37 44 46
		f 4 -55 51 66 86
		mu 0 4 61 39 46 60
		f 4 -56 -66 67 190
		mu 0 4 121 40 47 120
		f 4 56 9 -58 -59
		mu 0 4 41 5 7 42
		f 4 -198 200 199 -60
		mu 0 4 43 127 128 20
		f 4 -94 96 95 -62
		mu 0 4 45 67 68 9
		f 4 -65 61 5 -64
		mu 0 4 46 44 1 3
		f 4 107 -67 63 7
		mu 0 4 74 60 46 3
		f 4 203 -68 -15 12
		mu 0 4 130 120 47 14
		f 4 -70 -71 68 -45
		mu 0 4 34 49 48 41
		f 4 -73 69 -3 -72
		mu 0 4 51 49 34 4
		f 4 10 -75 71 8
		mu 0 4 12 52 50 13
		f 4 3 48 -77 -11
		mu 0 4 6 35 54 53
		f 4 -79 -49 45 60
		mu 0 4 55 54 35 42
		f 4 -81 -61 57 11
		mu 0 4 56 55 42 7
		f 4 -83 -12 -10 -82
		mu 0 4 59 57 10 11
		f 4 -69 -84 81 -57
		mu 0 4 41 48 58 5
		f 4 -86 -87 84 162
		mu 0 4 104 61 60 103
		f 4 -89 85 164 -88
		mu 0 4 63 61 104 106
		f 4 165 -91 87 166
		mu 0 4 107 64 62 105
		f 4 168 167 -93 -166
		mu 0 4 108 109 66 65
		f 4 -95 -168 170 169
		mu 0 4 67 66 109 110
		f 4 -97 -170 172 171
		mu 0 4 68 67 110 111
		f 4 -99 -172 174 173
		mu 0 4 70 69 112 113
		f 4 -114 116 180 179
		mu 0 4 71 79 115 116
		f 4 -103 -180 182 -102
		mu 0 4 72 71 116 117
		f 4 183 -105 101 184
		mu 0 4 118 76 72 117
		f 4 -106 -107 103 158
		mu 0 4 102 75 73 100
		f 4 -85 -108 105 160
		mu 0 4 103 60 74 101
		f 4 -36 33 138 137
		mu 0 4 73 29 90 91
		f 4 -35 31 136 -34
		mu 0 4 29 28 89 90
		f 4 -98 100 134 -32
		mu 0 4 28 70 88 89
		f 4 175 -101 -174 176
		mu 0 4 114 88 70 113
		f 4 207 -30 37 208
		mu 0 4 134 87 27 133
		f 4 -39 40 128 -44
		mu 0 4 30 31 85 86
		f 4 28 126 219 -37
		mu 0 4 26 84 139 132
		f 4 187 -104 -138 139
		mu 0 4 119 100 73 91
		f 4 124 -216 218 -127
		mu 0 4 84 83 138 139
		f 4 -129 125 -121 -128
		mu 0 4 86 85 82 81
		f 4 -119 -130 -208 210
		mu 0 4 135 80 87 134
		f 4 -117 -132 -176 178
		mu 0 4 115 79 88 114
		f 4 -135 131 -115 -134
		mu 0 4 89 88 79 78
		f 4 -137 133 -113 -136
		mu 0 4 90 89 78 77
		f 4 -139 135 -111 108
		mu 0 4 91 90 77 76
		f 4 -140 -109 -184 186
		mu 0 4 119 91 76 118
		f 4 -143 140 -41 -142
		mu 0 4 93 92 85 31
		f 4 -145 141 38 -144
		mu 0 4 94 93 31 30
		f 4 130 -147 143 43
		mu 0 4 86 95 94 30
		f 4 -148 -149 -131 127
		mu 0 4 81 96 95 86
		f 4 -151 147 117 -150
		mu 0 4 97 96 81 33
		f 4 -153 149 42 -152
		mu 0 4 98 97 33 32
		f 4 -155 151 -120 122
		mu 0 4 99 98 32 82
		f 4 -156 -123 -126 -141
		mu 0 4 92 99 82 85
		f 4 -158 -159 156 -24
		mu 0 4 15 102 100 26
		f 4 -160 -161 157 14
		mu 0 4 47 103 101 14
		f 4 -162 -163 159 65
		mu 0 4 40 104 103 47
		f 4 -165 161 53 -164
		mu 0 4 106 104 40 17
		f 4 15 -167 163 16
		mu 0 4 18 107 105 16
		f 4 18 50 -169 -16
		mu 0 4 19 36 109 108
		f 4 -171 -51 47 62
		mu 0 4 110 109 36 43
		f 4 -173 -63 59 17
		mu 0 4 111 110 43 20
		f 4 -175 -18 20 32
		mu 0 4 113 112 21 27
		f 4 132 -177 -33 29
		mu 0 4 87 114 113 27
		f 4 -178 -179 -133 129
		mu 0 4 80 115 114 87
		f 4 -181 177 115 22
		mu 0 4 116 115 80 23
		f 4 -183 -23 24 -182
		mu 0 4 117 116 23 24
		f 4 123 -185 181 -122
		mu 0 4 83 118 117 24
		f 4 -186 -187 -124 -125
		mu 0 4 84 119 118 83
		f 4 -157 -188 185 -29
		mu 0 4 26 100 119 84
		f 4 -190 -191 188 70
		mu 0 4 49 121 120 48
		f 4 -193 189 72 -192
		mu 0 4 123 121 49 51
		f 4 73 -195 191 74
		mu 0 4 52 124 122 50
		f 4 76 75 -197 -74
		mu 0 4 53 54 126 125
		f 4 -199 -76 78 77
		mu 0 4 127 126 54 55
		f 4 -201 -78 80 79
		mu 0 4 128 127 55 56
		f 4 -203 -80 82 -202
		mu 0 4 131 129 57 59
		f 4 83 -189 -204 201
		mu 0 4 58 48 120 130
		f 4 -207 204 144 -206
		mu 0 4 133 132 93 94
		f 4 145 -209 205 146
		mu 0 4 95 134 133 94
		f 4 -210 -211 -146 148
		mu 0 4 96 135 134 95
		f 4 -213 209 150 -212
		mu 0 4 136 135 96 97
		f 4 -215 211 152 -214
		mu 0 4 137 136 97 98
		f 4 -217 213 154 153
		mu 0 4 138 137 98 99
		f 4 -219 -154 155 -218
		mu 0 4 139 138 99 92
		f 4 -220 217 142 -205
		mu 0 4 132 139 92 93;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
createNode mesh -n "polySurfaceShape2" -p "pCube8";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0.40780792 0 0.41535991 0.4606719 
		0 0.18879998 0.40780792 -0.73433292 0.41535991 0.4606719 -0.73433292 0.18879998 -1.1932167 
		-0.73433292 -2.8773098 -1.3064971 -0.73433292 -3.1038675 -1.1932167 0 -2.8773098 
		-1.3064971 0 -3.1038675;
	setAttr -s 8 ".vt[0:7]"  -0.61633325 -0.7049129 0.64053124 0.61633325 -0.7049129 0.64053124
		 -0.61633325 0.7049129 0.64053124 0.61633325 0.7049129 0.64053124 -0.61633325 0.7049129 -0.64053124
		 0.61633325 0.7049129 -0.64053124 -0.61633325 -0.7049129 -0.64053124 0.61633325 -0.7049129 -0.64053124;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
createNode lightLinker -s -n "lightLinker1";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode displayLayerManager -n "layerManager";
createNode displayLayer -n "defaultLayer";
createNode renderLayerManager -n "renderLayerManager";
createNode renderLayer -n "defaultRenderLayer";
	setAttr ".g" yes;
createNode polyCube -n "polyCube1";
	setAttr ".w" 2.6554280995242507;
	setAttr ".h" 2.9581792809227698;
	setAttr ".d" 3.0950627497110403;
	setAttr ".cuv" 4;
createNode polyExtrudeFace -n "polyExtrudeFace1";
	setAttr ".ics" -type "componentList" 1 "f[5]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -11.942462182064382 1.4790896404613849 0.49578298682877664 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -12.545576 0.33774808 0.081725463 ;
	setAttr ".rs" 37215;
	setAttr ".lt" -type "double3" -1.2212453270876722e-015 -1.0771717990232937e-017 
		1.5786412176377671 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -13.669445848484365 2.2732197901831341e-008 -0.43066243772795554 ;
	setAttr ".cbx" -type "double3" -11.421705698986379 0.67549612411159243 0.59411336536118631 ;
createNode polyTweak -n "polyTweak1";
	setAttr ".uopa" yes;
	setAttr -s 8 ".tk[0:7]" -type "float3"  1.84847057 0 -1.44920123 0.88726532
		 0 -1.70059252 1.84847057 -2.28268313 -1.44920099 0.88726532 -2.28268313 -1.70059252
		 -0.39926961 -2.28268313 0.62108594 0.29575503 -2.28268313 0.08872655 -0.39926961
		 0 0.62108594 0.29575503 0 0.08872655;
createNode polyExtrudeFace -n "polyExtrudeFace2";
	setAttr ".ics" -type "componentList" 1 "f[7]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -11.942462182064382 1.4790896404613849 0.49578298682877664 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -12.048407 0.33774808 1.3020831 ;
	setAttr ".rs" 56334;
	setAttr ".lt" -type "double3" -0.98449062511154595 3.1834759234663536e-016 2.6197402025306014 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -12.07658023240122 2.2732197901831341e-008 0.57365191037366037 ;
	setAttr ".cbx" -type "double3" -12.02023205759081 0.67549612411159243 2.0305142557115281 ;
createNode polyTweak -n "polyTweak2";
	setAttr ".uopa" yes;
	setAttr -s 8 ".tk";
	setAttr ".tk[0]" -type "float3" -0.5985266 0 -0.020461189 ;
	setAttr ".tk[2]" -type "float3" -0.5985266 0 -0.020461189 ;
	setAttr ".tk[4]" -type "float3" -0.12891433 0 0.064457163 ;
	setAttr ".tk[6]" -type "float3" -0.12891433 0 0.064457163 ;
	setAttr ".tk[8]" -type "float3" 0.70902884 0 0.47268581 ;
	setAttr ".tk[9]" -type "float3" 2.9802322e-008 0 0 ;
	setAttr ".tk[10]" -type "float3" 2.9802322e-008 0 0 ;
	setAttr ".tk[11]" -type "float3" 0.70902884 0 0.47268581 ;
createNode polyExtrudeFace -n "polyExtrudeFace3";
	setAttr ".ics" -type "componentList" 1 "f[12]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -11.942462182064382 1.4790896404613849 0.49578298682877664 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -10.460315 0.33774808 2.67994 ;
	setAttr ".rs" 62555;
	setAttr ".lt" -type "double3" 2.55351295663786e-015 -8.2017353249686648e-017 1.5744821188707445 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -11.423783338089315 2.2732197901831341e-008 2.244361296841594 ;
	setAttr ".cbx" -type "double3" -9.4968454599574486 0.67549612411159243 3.115518466183635 ;
createNode polyTweak -n "polyTweak3";
	setAttr ".uopa" yes;
	setAttr -s 2 ".tk[9:10]" -type "float3"  0.65279692 0 0.21384728 0.65279692
		 0 0.21384728;
createNode polyExtrudeFace -n "polyExtrudeFace4";
	setAttr ".ics" -type "componentList" 1 "f[12]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -11.942462182064382 1.4790896404613849 0.49578298682877664 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -11.238358 0.33774701 3.2648554 ;
	setAttr ".rs" 46133;
	setAttr ".lt" -type "double3" -1.2212453270876722e-015 -5.5511151231257827e-017 
		2.2554373064685209 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -11.340809798260061 -1.0501514080551999e-006 2.6548220073671067 ;
	setAttr ".cbx" -type "double3" -11.135905957241384 0.67549505122798648 3.8748887931794846 ;
createNode polyTweak -n "polyTweak4";
	setAttr ".uopa" yes;
	setAttr -s 6 ".tk";
	setAttr ".tk[9]" -type "float3" 0.056275606 0 0.022510242 ;
	setAttr ".tk[10]" -type "float3" 0.056275606 0 0.022510242 ;
	setAttr ".tk[16]" -type "float3" 0.73158288 0 -1.024217 ;
	setAttr ".tk[17]" -type "float3" 0.73158288 0 -1.024217 ;
	setAttr ".tk[18]" -type "float3" -0.99045134 0 -0.67530745 ;
	setAttr ".tk[19]" -type "float3" -0.99045134 0 -0.67530745 ;
createNode polyExtrudeFace -n "polyExtrudeFace5";
	setAttr ".ics" -type "componentList" 1 "f[18]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -11.942462182064382 1.4790896404613849 0.49578298682877664 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -12.452953 0.33774701 2.8416007 ;
	setAttr ".rs" 43949;
	setAttr ".lt" -type "double3" 6.106226635438361e-016 4.0055881781892898e-017 0.57948480108740219 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -13.565097069759695 -1.0501514080551999e-006 2.6548220073671067 ;
	setAttr ".cbx" -type "double3" -11.34081003667864 0.67549505122798648 3.0283790981263841 ;
createNode polySplitRing -n "polySplitRing1";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[0:3]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -11.942462182064382 1.4790896404613849 0.49578298682877664 1;
	setAttr ".wt" 0.20094591379165649;
	setAttr ".re" 2;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyTweak -n "polyTweak5";
	setAttr ".uopa" yes;
	setAttr -s 4 ".tk";
	setAttr ".tk[16]" -type "float3" -0.22994015 0 0.1297099 ;
	setAttr ".tk[17]" -type "float3" -0.22994018 0 0.12970991 ;
	setAttr ".tk[24]" -type "float3" -0.41271332 0 0.10023037 ;
	setAttr ".tk[25]" -type "float3" -0.41271332 0 0.10023037 ;
createNode polySplitRing -n "polySplitRing2";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 3 "e[28:29]" "e[31]" "e[33]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -11.942462182064382 1.4790896404613849 0.49578298682877664 1;
	setAttr ".wt" 0.38511693477630615;
	setAttr ".re" 33;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing3";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 3 "e[52:53]" "e[55]" "e[57]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -11.942462182064382 1.4790896404613849 0.49578298682877664 1;
	setAttr ".wt" 0.23033231496810913;
	setAttr ".dr" no;
	setAttr ".re" 57;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyTweak -n "polyTweak6";
	setAttr ".uopa" yes;
	setAttr -s 12 ".tk";
	setAttr ".tk[0]" -type "float3" 0.034481212 0 0.14891158 ;
	setAttr ".tk[2]" -type "float3" 0.034481212 0 0.14891158 ;
	setAttr ".tk[4]" -type "float3" -0.09680371 0 0.4207536 ;
	setAttr ".tk[6]" -type "float3" -0.09680371 0 0.4207536 ;
	setAttr ".tk[28]" -type "float3" -0.22291231 0 -0.048663132 ;
	setAttr ".tk[29]" -type "float3" -0.22291231 0 -0.048663132 ;
	setAttr ".tk[30]" -type "float3" -0.32457215 0 -0.24691606 ;
	setAttr ".tk[31]" -type "float3" -0.32457215 0 -0.24691606 ;
	setAttr ".tk[32]" -type "float3" 0.032758996 0 0.3445265 ;
	setAttr ".tk[33]" -type "float3" 0.032758996 0 0.3445265 ;
	setAttr ".tk[34]" -type "float3" 0.17157499 0 0.20549509 ;
	setAttr ".tk[35]" -type "float3" 0.17157499 0 0.20549509 ;
createNode polySplitRing -n "polySplitRing4";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 3 "e[52:53]" "e[55]" "e[57]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -11.942462182064382 1.4790896404613849 0.49578298682877664 1;
	setAttr ".wt" 0.55505859851837158;
	setAttr ".re" 57;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyTweak -n "polyTweak7";
	setAttr ".uopa" yes;
	setAttr -s 4 ".tk[36:39]" -type "float3"  -0.13904735 0 0.30378613 0.81441557
		 0 -0.15445229 0.81441557 0 -0.15445229 -0.13904735 0 0.30378613;
createNode polySplitRing -n "polySplitRing5";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 10 "e[6:7]" "e[10:11]" "e[14]" "e[18]" "e[56]" "e[59]" "e[70]" "e[74]" "e[78]" "e[82]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -11.942462182064382 1.4790896404613849 0.49578298682877664 1;
	setAttr ".wt" 0.52479666471481323;
	setAttr ".dr" no;
	setAttr ".re" 7;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyTweak -n "polyTweak8";
	setAttr ".uopa" yes;
	setAttr -s 8 ".tk";
	setAttr ".tk[30]" -type "float3" 0 0 0.13405734 ;
	setAttr ".tk[31]" -type "float3" 0 0 0.13405734 ;
	setAttr ".tk[37]" -type "float3" 0.37350976 0 -0.031767204 ;
	setAttr ".tk[38]" -type "float3" 0.37350976 0 -0.031767204 ;
	setAttr ".tk[40]" -type "float3" -0.010160971 0 -0.12665878 ;
	setAttr ".tk[41]" -type "float3" 0.20872438 0 0 ;
	setAttr ".tk[42]" -type "float3" 0.20872438 0 0 ;
	setAttr ".tk[43]" -type "float3" -0.010160971 0 -0.12665878 ;
createNode polySplitRing -n "polySplitRing6";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 9 "e[20:21]" "e[23]" "e[25]" "e[32]" "e[35]" "e[40]" "e[43]" "e[64]" "e[67]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -11.942462182064382 1.4790896404613849 0.49578298682877664 1;
	setAttr ".wt" 0.62241381406784058;
	setAttr ".dr" no;
	setAttr ".re" 21;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyTweak -n "polyTweak9";
	setAttr ".uopa" yes;
	setAttr -s 2 ".tk";
	setAttr ".tk[44]" -type "float3" 0.21508364 0 -0.12802516 ;
	setAttr ".tk[55]" -type "float3" 0.21508364 0 -0.12802516 ;
createNode polySplitRing -n "polySplitRing7";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 9 "e[12:13]" "e[15]" "e[17]" "e[24]" "e[27]" "e[94]" "e[98]" "e[112]" "e[127]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -11.942462182064382 1.4790896404613849 0.49578298682877664 1;
	setAttr ".wt" 0.53605914115905762;
	setAttr ".dr" no;
	setAttr ".re" 17;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyTweak -n "polyTweak10";
	setAttr ".uopa" yes;
	setAttr -s 26 ".tk";
	setAttr ".tk[12]" -type "float3" -0.31818485 0 -0.25291613 ;
	setAttr ".tk[13]" -type "float3" -0.31818485 0 -0.25291613 ;
	setAttr ".tk[14]" -type "float3" 0.048951507 0 -1.0279807 ;
	setAttr ".tk[15]" -type "float3" 0.048951507 0 -1.0279807 ;
	setAttr ".tk[16]" -type "float3" -0.081585862 0 -0.032634344 ;
	setAttr ".tk[17]" -type "float3" -0.081585862 0 -0.032634344 ;
	setAttr ".tk[18]" -type "float3" 1.0524564 0 -0.16317169 ;
	setAttr ".tk[19]" -type "float3" 1.0524564 0 -0.16317169 ;
	setAttr ".tk[20]" -type "float3" 0.024475746 0 0.50583231 ;
	setAttr ".tk[21]" -type "float3" 0.024475746 0 0.50583231 ;
	setAttr ".tk[22]" -type "float3" 0.76690722 0 -0.13053738 ;
	setAttr ".tk[23]" -type "float3" 0.76690722 0 -0.13053738 ;
	setAttr ".tk[24]" -type "float3" 0.024475757 0 0.016317172 ;
	setAttr ".tk[25]" -type "float3" 0.024475757 0 0.016317172 ;
	setAttr ".tk[32]" -type "float3" 0.6200524 0 -0.46503943 ;
	setAttr ".tk[33]" -type "float3" 0.6200524 0 -0.46503943 ;
	setAttr ".tk[56]" -type "float3" -0.76690668 0 -0.38345358 ;
	setAttr ".tk[57]" -type "float3" -0.76690668 0 -0.38345358 ;
	setAttr ".tk[58]" -type "float3" -0.29370904 0 -0.62821096 ;
	setAttr ".tk[59]" -type "float3" 0.37529498 0 -0.30186763 ;
	setAttr ".tk[60]" -type "float3" 0.30186763 0 -0.11422021 ;
	setAttr ".tk[61]" -type "float3" 0.26923329 0 0.089744478 ;
	setAttr ".tk[62]" -type "float3" 0.26923329 0 0.089744478 ;
	setAttr ".tk[63]" -type "float3" 0.30186763 0 -0.11422021 ;
	setAttr ".tk[64]" -type "float3" 0.37529498 0 -0.30186763 ;
	setAttr ".tk[65]" -type "float3" -0.29370904 0 -0.62821096 ;
createNode polySplitRing -n "polySplitRing8";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 26 "e[4:5]" "e[8:9]" "e[16]" "e[19]" "e[22]" "e[26]" "e[30]" "e[34]" "e[38]" "e[42]" "e[46]" "e[50]" "e[54]" "e[58]" "e[62]" "e[66]" "e[72]" "e[75]" "e[80]" "e[83]" "e[96]" "e[107]" "e[110]" "e[120]" "e[138]" "e[147]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -11.942462182064382 1.4790896404613849 0.49578298682877664 1;
	setAttr ".wt" 0.13916601240634918;
	setAttr ".re" 8;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyTweak -n "polyTweak11";
	setAttr ".uopa" yes;
	setAttr -s 16 ".tk";
	setAttr ".tk[14]" -type "float3" 0.032634333 0 0.42424661 ;
	setAttr ".tk[15]" -type "float3" 0.032634333 0 0.42424661 ;
	setAttr ".tk[45]" -type "float3" 0.065268688 0 -0.10606162 ;
	setAttr ".tk[46]" -type "float3" -0.016317172 0 -0.057110105 ;
	setAttr ".tk[53]" -type "float3" -0.016317172 0 -0.057110105 ;
	setAttr ".tk[54]" -type "float3" 0.065268688 0 -0.10606162 ;
	setAttr ".tk[58]" -type "float3" 0.22844033 0 0.29370904 ;
	setAttr ".tk[65]" -type "float3" 0.22844033 0 0.29370904 ;
	setAttr ".tk[66]" -type "float3" -0.13869596 0 0.073427275 ;
	setAttr ".tk[68]" -type "float3" -0.057110105 0 -0.13053738 ;
	setAttr ".tk[69]" -type "float3" 0.15501311 0 0.097903028 ;
	setAttr ".tk[70]" -type "float3" 0.10606162 0 0.11422021 ;
	setAttr ".tk[71]" -type "float3" 0.10606162 0 0.11422021 ;
	setAttr ".tk[72]" -type "float3" 0.15501311 0 0.097903028 ;
	setAttr ".tk[73]" -type "float3" -0.057110105 0 -0.13053738 ;
	setAttr ".tk[75]" -type "float3" -0.13869596 0 0.073427275 ;
createNode polySplitRing -n "polySplitRing9";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 26 "e[4:5]" "e[16]" "e[22]" "e[26]" "e[30]" "e[34]" "e[38]" "e[42]" "e[46]" "e[50]" "e[58]" "e[66]" "e[75]" "e[83]" "e[107]" "e[120]" "e[147:148]" "e[151]" "e[153]" "e[173]" "e[177]" "e[181]" "e[195]" "e[197]" "e[199]" "e[201]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -11.942462182064382 1.4790896404613849 0.49578298682877664 1;
	setAttr ".wt" 0.84547793865203857;
	setAttr ".dr" no;
	setAttr ".re" 148;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing10";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 11 "e[36:37]" "e[39]" "e[41]" "e[48]" "e[51]" "e[118]" "e[122]" "e[164]" "e[172]" "e[220]" "e[228]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -11.942462182064382 1.4790896404613849 0.49578298682877664 1;
	setAttr ".wt" 0.059613749384880066;
	setAttr ".re" 37;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing11";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 12 "e[122]" "e[172]" "e[228]" "e[260]" "e[263]" "e[269]" "e[271]" "e[273]" "e[275]" "e[277]" "e[279]" "e[281]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -11.942462182064382 1.4790896404613849 0.49578298682877664 1;
	setAttr ".wt" 0.93579483032226563;
	setAttr ".dr" no;
	setAttr ".re" 260;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing12";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 9 "e[68:69]" "e[71]" "e[73]" "e[86]" "e[106]" "e[192]" "e[198]" "e[248]" "e[254]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -11.942462182064382 1.4790896404613849 0.49578298682877664 1;
	setAttr ".wt" 0.10691944509744644;
	setAttr ".re" 86;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing13";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 9 "e[68:69]" "e[71]" "e[73]" "e[106]" "e[192]" "e[248]" "e[308]" "e[321]" "e[323]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -11.942462182064382 1.4790896404613849 0.49578298682877664 1;
	setAttr ".wt" 0.90921509265899658;
	setAttr ".dr" no;
	setAttr ".re" 308;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyCube -n "polyCube2";
	setAttr ".w" 1.2326665348027284;
	setAttr ".h" 1.4098257597924462;
	setAttr ".d" 1.281062514342957;
	setAttr ".cuv" 4;
createNode script -n "uiConfigurationScriptNode";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"top\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n"
		+ "                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n"
		+ "                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n"
		+ "                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n"
		+ "            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n"
		+ "            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n"
		+ "            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -shadows 0\n            $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"side\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n"
		+ "                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n"
		+ "                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n"
		+ "                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n"
		+ "            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n"
		+ "            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -dimensions 1\n"
		+ "            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -shadows 0\n            $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"front\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n"
		+ "                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n"
		+ "                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n"
		+ "                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n"
		+ "            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n"
		+ "            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n"
		+ "            -motionTrails 1\n            -clipGhosts 1\n            -shadows 0\n            $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n"
		+ "                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n"
		+ "                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n"
		+ "                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n"
		+ "            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n"
		+ "            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -shadows 0\n            $editorName;\n"
		+ "modelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `outlinerPanel -unParent -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            outlinerEditor -e \n                -showShapes 0\n                -showReferenceNodes 1\n                -showReferenceMembers 1\n                -showAttributes 0\n                -showConnected 0\n                -showAnimCurvesOnly 0\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 1\n                -showAssets 1\n                -showContainedOnly 1\n                -showPublishedAsConnected 0\n                -showContainerContents 1\n                -ignoreDagHierarchy 0\n"
		+ "                -expandConnections 0\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 0\n                -highlightActive 1\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"defaultSetFilter\" \n                -showSetMembers 1\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n"
		+ "                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showReferenceNodes 1\n            -showReferenceMembers 1\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n"
		+ "            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"graphEditor\" -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n"
		+ "                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n"
		+ "                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n"
		+ "                -classicMode 1\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n"
		+ "                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n"
		+ "                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dopeSheetPanel\" -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n"
		+ "                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n"
		+ "                -showPinIcons 0\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n"
		+ "                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n"
		+ "                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n"
		+ "                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"clipEditorPanel\" -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"sequenceEditorPanel\" -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n"
		+ "                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperGraphPanel\" -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n"
		+ "                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n"
		+ "                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperShadePanel\" -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"visorPanel\" -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -ignoreAssets 1\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n"
		+ "                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -island 0\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -syncedSelection 1\n                -extendToShapes 1\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -ignoreAssets 1\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n"
		+ "                -island 0\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -syncedSelection 1\n                -extendToShapes 1\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"createNodePanel\" -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Texture Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"polyTexturePlacementPanel\" -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"renderWindowPanel\" -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"blendShapePanel\" (localizedPanelLabel(\"Blend Shape\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\tblendShapePanel -unParent -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels ;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tblendShapePanel -edit -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynRelEdPanel\" -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"relationshipPanel\" -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"referenceEditorPanel\" -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"componentEditorPanel\" -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynPaintScriptedPanelType\" -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"scriptEditorPanel\" -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-defaultImage \"\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        setFocus `paneLayout -q -p1 $gMainPane`;\n        sceneUIReplacement -deleteRemaining;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 24 -ast 1 -aet 48 ";
	setAttr ".st" 6;
createNode polyExtrudeFace -n "polyExtrudeFace6";
	setAttr ".ics" -type "componentList" 1 "f[0]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -8.4258261191202166 0.70491287989622309 1.1212352643658865 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -8.2830505 0.33774641 2.3940573 ;
	setAttr ".rs" 46183;
	setAttr ".lt" -type "double3" -1.3045120539345589e-015 0 1.0988293247505765 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -9.1400624381853106 -2.1028459529226495e-008 2.1941716800381887 ;
	setAttr ".cbx" -type "double3" -7.4260392653299334 0.67549286170011713 2.5939430127789724 ;
createNode polyTweak -n "polyTweak12";
	setAttr ".uopa" yes;
	setAttr -s 8 ".tk[0:7]" -type "float3"  -0.09790305 0 0.83217645 0.38345358
		 0 0.4324052 -0.09790305 -0.73433292 0.83217645 0.38345358 -0.73433292 0.4324052 -0.60373503
		 -0.73433292 -1.56644702 -0.26923302 -0.73433292 -1.77041113 -0.60373503 0 -1.56644702
		 -0.26923302 0 -1.77041113;
createNode polyExtrudeFace -n "polyExtrudeFace7";
	setAttr ".ics" -type "componentList" 1 "f[7]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -8.4258261191202166 0.70491287989622309 1.1212352643658865 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -7.3458714 0.33774641 2.779263 ;
	setAttr ".rs" 55844;
	setAttr ".lt" -type "double3" -4.163336342344337e-016 -1.1094418097995862e-016 0.90592798721396461 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -7.4260392653299334 -2.1028459529226495e-008 2.1941716800381887 ;
	setAttr ".cbx" -type "double3" -7.2657039629770281 0.67549286170011713 3.3643542657544363 ;
createNode polyTweak -n "polyTweak13";
	setAttr ".uopa" yes;
	setAttr -s 5 ".tk";
	setAttr ".tk[8]" -type "float3" 0.18069234 0 -0.33982688 ;
	setAttr ".tk[9]" -type "float3" -0.089251705 0 0.10007402 ;
	setAttr ".tk[10]" -type "float3" -0.089251705 0 0.10007402 ;
	setAttr ".tk[11]" -type "float3" 0.18069234 0 -0.33982688 ;
createNode polyExtrudeFace -n "polyExtrudeFace8";
	setAttr ".ics" -type "componentList" 1 "f[7]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -8.4258261191202166 0.70491287989622309 1.1212352643658865 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -6.4483299 0.33774641 2.6562841 ;
	setAttr ".rs" 40832;
	setAttr ".lt" -type "double3" 1.3877787807814457e-016 -2.2725806166545137e-017 1.545419136293732 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -6.5284972655130389 -2.1028459529226495e-008 2.0711929927518118 ;
	setAttr ".cbx" -type "double3" -6.3681622015787127 0.67549286170011713 3.2413753400494802 ;
createNode polyExtrudeFace -n "polyExtrudeFace9";
	setAttr ".ics" -type "componentList" 1 "f[14]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -8.4258261191202166 0.70491287989622309 1.1212352643658865 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -5.7629404 0.33774641 1.9662986 ;
	setAttr ".rs" 51263;
	setAttr ".lt" -type "double3" -1.0547118733938987e-015 1.4527508973425442e-018 3.6144009788038538 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -6.5284972655130389 -2.1028459529226495e-008 1.8614041934659231 ;
	setAttr ".cbx" -type "double3" -4.997383640940285 0.67549286170011713 2.0711929927518118 ;
createNode polyExtrudeFace -n "polyExtrudeFace10";
	setAttr ".ics" -type "componentList" 1 "f[2]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -3.9577726441609631 0.70491287989622309 1.1212352643658865 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -4.0257406 0.33774641 0.92627198 ;
	setAttr ".rs" 43344;
	setAttr ".lt" -type "double3" -0.09479273216175943 4.4985991714283691e-017 2.8056421422384257 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -4.8459778147923718 -2.1028459529226495e-008 0.85075194937488918 ;
	setAttr ".cbx" -type "double3" -3.2055034357297192 0.67549286170011713 1.0017919669797171 ;
createNode polyExtrudeFace -n "polyExtrudeFace11";
	setAttr ".ics" -type "componentList" 1 "f[7]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -3.9577726441609631 0.70491287989622309 1.1212352643658865 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -3.3813152 0.33774641 -0.54181528 ;
	setAttr ".rs" 46924;
	setAttr ".lt" -type "double3" -7.7715611723760958e-016 3.5168146858740604e-017 2.4325279806080826 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -3.5571269112813244 -2.1028459529226495e-008 -1.9343825449297678 ;
	setAttr ".cbx" -type "double3" -3.2055033761250744 0.67549286170011713 0.85075194937488918 ;
createNode polySplitRing -n "polySplitRing14";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 3 "e[20:21]" "e[23]" "e[25]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -3.9577726441609631 0.70491287989622309 1.1212352643658865 1;
	setAttr ".wt" 0.36643067002296448;
	setAttr ".re" 20;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyTweak -n "polyTweak14";
	setAttr ".uopa" yes;
	setAttr -s 4 ".tk[12:15]" -type "float3"  -0.55884808 0 -0.65411657
		 -0.55884808 0 -0.65411657 -0.35494363 0 -0.027300304 -0.35494363 0 -0.027300304;
createNode polySplitRing -n "polySplitRing15";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 7 "e[12:13]" "e[15]" "e[17]" "e[24]" "e[27]" "e[30]" "e[34]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -3.9577726441609631 0.70491287989622309 1.1212352643658865 1;
	setAttr ".wt" 0.57545185089111328;
	setAttr ".dr" no;
	setAttr ".re" 13;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyTweak -n "polyTweak15";
	setAttr ".uopa" yes;
	setAttr -s 4 ".tk";
	setAttr ".tk[14]" -type "float3" 0.022655997 0 0.022655997 ;
	setAttr ".tk[15]" -type "float3" 0.022655997 0 0.022655997 ;
	setAttr ".tk[16]" -type "float3" 0.037759997 0 0.24166395 ;
	setAttr ".tk[19]" -type "float3" 0.037759997 0 0.24166395 ;
createNode polySplitRing -n "polySplitRing16";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 7 "e[12:13]" "e[15]" "e[17]" "e[24]" "e[27]" "e[30]" "e[43]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -3.9577726441609631 0.70491287989622309 1.1212352643658865 1;
	setAttr ".wt" 0.43568006157875061;
	setAttr ".re" 13;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyTweak -n "polyTweak16";
	setAttr ".uopa" yes;
	setAttr -s 8 ".tk[20:27]" -type "float3"  -0.052863993 0 -0.39270392
		 -0.052863993 0 -0.39270392 -0.052863993 0 -0.39270392 -0.052863993 0 -0.39270392
		 -0.052863993 0 -0.39270392 0.37004793 0 -0.34739193 0.37004793 0 -0.34739193 -0.052863993
		 0 -0.39270392;
createNode polyExtrudeFace -n "polyExtrudeFace12";
	setAttr ".ics" -type "componentList" 1 "f[17]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -3.9577726441609631 0.70491287989622309 1.1212352643658865 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -1.9195853 0.33774641 0.31651378 ;
	setAttr ".rs" 44999;
	setAttr ".lt" -type "double3" 1.1102230246251565e-016 0 2.045887861557163 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -2.4881894904362927 -2.1028459529226495e-008 -0.10805283683040257 ;
	setAttr ".cbx" -type "double3" -1.3509811478841076 0.67549286170011713 0.74108041626713161 ;
createNode polyTweak -n "polyTweak17";
	setAttr ".uopa" yes;
	setAttr -s 7 ".tk";
	setAttr ".tk[28]" -type "float3" 0 0 -0.12083197 ;
	setAttr ".tk[31]" -type "float3" 0 0 -0.12083197 ;
	setAttr ".tk[32]" -type "float3" 0 0 -0.13593598 ;
	setAttr ".tk[33]" -type "float3" 0.29452795 0 0.075519986 ;
	setAttr ".tk[34]" -type "float3" 0.29452795 0 0.075519986 ;
	setAttr ".tk[35]" -type "float3" 0 0 -0.13593598 ;
createNode polySplitRing -n "polySplitRing17";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 3 "e[68:69]" "e[71]" "e[73]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -3.9577726441609631 0.70491287989622309 1.1212352643658865 1;
	setAttr ".wt" 0.41220897436141968;
	setAttr ".dr" no;
	setAttr ".re" 73;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyTweak -n "polyTweak18";
	setAttr ".uopa" yes;
	setAttr -s 4 ".tk[36:39]" -type "float3"  -0.91379309 0 0.067967989
		 -0.91379309 0 0.067967989 -0.33983994 0 0.74764866 -0.33983994 0 0.74764866;
createNode polySplitRing -n "polySplitRing18";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 3 "e[76:77]" "e[79]" "e[81]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -3.9577726441609631 0.70491287989622309 1.1212352643658865 1;
	setAttr ".wt" 0.4355461597442627;
	setAttr ".re" 76;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyTweak -n "polyTweak19";
	setAttr ".uopa" yes;
	setAttr -s 4 ".tk[40:43]" -type "float3"  0.120832 0 -0.69478458 0.120832
		 0 -0.69478458 0 0 -0.18879998 0 0 -0.18879998;
createNode polySplitRing -n "polySplitRing19";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 2 "e[6:7]" "e[10:11]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0.86106204146041598 0.70491287989622309 1.1212352643658865 1;
	setAttr ".wt" 0.16141070425510406;
	setAttr ".re" 7;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyExtrudeFace -n "polyExtrudeFace13";
	setAttr ".ics" -type "componentList" 1 "f[4]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0.86106204146041598 0.70491287989622309 1.1212352643658865 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 1.7954472 0.33774641 1.581442 ;
	setAttr ".rs" 43570;
	setAttr ".lt" -type "double3" -3.3306690738754696e-016 2.143260701327357e-017 1.1326609953291036 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" 1.6528271948684665 -2.1028459529226495e-008 1.2123175392796743 ;
	setAttr ".cbx" -type "double3" 1.9380671893943759 0.67549286170011713 1.9505664835622061 ;
createNode polySplitRing -n "polySplitRing20";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 3 "e[20:21]" "e[23]" "e[25]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0.86106204146041598 0.70491287989622309 1.1212352643658865 1;
	setAttr ".wt" 0.13949654996395111;
	setAttr ".re" 23;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyTweak -n "polyTweak20";
	setAttr ".uopa" yes;
	setAttr -s 6 ".tk";
	setAttr ".tk[12]" -type "float3" 0.52863997 0 0.28697595 ;
	setAttr ".tk[13]" -type "float3" 0.17369597 0 0.21145596 ;
	setAttr ".tk[14]" -type "float3" 0.52863997 0 0.28697595 ;
	setAttr ".tk[15]" -type "float3" 0.17369597 0 0.21145596 ;
createNode polyExtrudeFace -n "polyExtrudeFace14";
	setAttr ".ics" -type "componentList" 1 "f[14]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0.86106204146041598 0.70491287989622309 1.1212352643658865 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 2.5031171 0.33774641 1.1432394 ;
	setAttr ".rs" 32813;
	setAttr ".lt" -type "double3" 0.39764721795979752 -2.641587654251599e-016 4.0378206770613527 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" 1.7682264363159153 -2.1028459529226495e-008 1.0910740922143209 ;
	setAttr ".cbx" -type "double3" 3.2380077754844638 0.67549286170011713 1.1954045574118841 ;
createNode polyTweak -n "polyTweak21";
	setAttr ".uopa" yes;
	setAttr -s 7 ".tk";
	setAttr ".tk[1]" -type "float3" -0.38515192 0 0.075519986 ;
	setAttr ".tk[3]" -type "float3" -0.38515192 0 0.075519986 ;
	setAttr ".tk[16]" -type "float3" -0.10572798 0 0 ;
	setAttr ".tk[17]" -type "float3" -0.10572798 0 0 ;
	setAttr ".tk[18]" -type "float3" 0.16614397 0 -0.0075520002 ;
	setAttr ".tk[19]" -type "float3" 0.16614397 0 -0.0075520002 ;
createNode polySplitRing -n "polySplitRing21";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 2 "e[6:7]" "e[10:11]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 11.175105942728539 0.70491287989622309 0.067510751324575624 1;
	setAttr ".wt" 0.76323604583740234;
	setAttr ".dr" no;
	setAttr ".re" 7;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing22";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 3 "e[6:7]" "e[15]" "e[17]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 11.175105942728539 0.70491287989622309 0.067510751324575624 1;
	setAttr ".wt" 0.84653568267822266;
	setAttr ".dr" no;
	setAttr ".re" 7;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing23";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 3 "e[6:7]" "e[23]" "e[25]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 11.175105942728539 0.70491287989622309 0.067510751324575624 1;
	setAttr ".wt" 0.64511567354202271;
	setAttr ".dr" no;
	setAttr ".re" 7;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing24";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 3 "e[6:7]" "e[31]" "e[33]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 11.175105942728539 0.70491287989622309 0.067510751324575624 1;
	setAttr ".wt" 0.54015219211578369;
	setAttr ".dr" no;
	setAttr ".re" 7;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyExtrudeFace -n "polyExtrudeFace15";
	setAttr ".ics" -type "componentList" 3 "f[4]" "f[9]" "f[17]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 11.175105942728539 0.70491287989622309 0.067510751324575624 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 12.083778 0.33774641 -1.9657779 ;
	setAttr ".rs" 34205;
	setAttr ".lt" -type "double3" 2.2204460492503131e-016 2.948356580769605e-017 1.1190972611980605 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" 11.739079548361321 -2.1028459529226495e-008 -4.3167155708494969 ;
	setAttr ".cbx" -type "double3" 12.428477181437035 0.67549286170011713 0.38515972836582013 ;
createNode polySplitRing -n "polySplitRing25";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 3 "e[0:3]" "e[14]" "e[18]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -8.4258261191202166 0.70491287989622309 1.1212352643658865 1;
	setAttr ".wt" 0.073581479489803314;
	setAttr ".re" 2;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyTweak -n "polyTweak22";
	setAttr ".uopa" yes;
	setAttr -s 12 ".tk";
	setAttr ".tk[1]" -type "float3" -0.037759997 0 0.067967989 ;
	setAttr ".tk[3]" -type "float3" -0.037759997 0 0.067967989 ;
	setAttr ".tk[8]" -type "float3" -0.030207984 0 -0.030207997 ;
	setAttr ".tk[11]" -type "float3" -0.030207984 0 -0.030207997 ;
	setAttr ".tk[12]" -type "float3" -0.015103998 0 0.022655999 ;
	setAttr ".tk[13]" -type "float3" -0.015103998 0 0.022655999 ;
	setAttr ".tk[18]" -type "float3" -0.29438424 0.080202527 -0.19250798 ;
	setAttr ".tk[19]" -type "float3" -0.29438424 0.080202527 -0.19250798 ;
	setAttr ".tk[20]" -type "float3" -0.14348798 0 -0.015103998 ;
	setAttr ".tk[21]" -type "float3" -0.14348798 0 -0.015103998 ;
	setAttr ".tk[22]" -type "float3" -0.067967996 0 0.10890043 ;
	setAttr ".tk[23]" -type "float3" -0.067967996 0 0.10890043 ;
createNode polySplitRing -n "polySplitRing26";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 5 "e[44:45]" "e[47]" "e[49]" "e[51]" "e[53]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -8.4258261191202166 0.70491287989622309 1.1212352643658865 1;
	setAttr ".wt" 0.91964256763458252;
	setAttr ".dr" no;
	setAttr ".re" 44;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing27";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 6 "e[6:7]" "e[10:11]" "e[48]" "e[55]" "e[60]" "e[67]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -8.4258261191202166 0.70491287989622309 1.1212352643658865 1;
	setAttr ".wt" 0.95571011304855347;
	setAttr ".dr" no;
	setAttr ".re" 67;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing28";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 11 "e[12:13]" "e[15]" "e[17]" "e[24]" "e[27]" "e[32]" "e[35]" "e[50]" "e[54]" "e[62]" "e[66]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -8.4258261191202166 0.70491287989622309 1.1212352643658865 1;
	setAttr ".wt" 0.12847410142421722;
	setAttr ".re" 66;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing29";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 7 "e[28:29]" "e[31]" "e[33]" "e[40]" "e[43]" "e[100]" "e[104]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -8.4258261191202166 0.70491287989622309 1.1212352643658865 1;
	setAttr ".wt" 0.076063252985477448;
	setAttr ".re" 29;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing30";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 7 "e[104]" "e[108:109]" "e[111]" "e[113]" "e[115]" "e[117]" "e[119]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -8.4258261191202166 0.70491287989622309 1.1212352643658865 1;
	setAttr ".wt" 0.92346549034118652;
	setAttr ".dr" no;
	setAttr ".re" 109;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing31";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 7 "e[36:37]" "e[39]" "e[41]" "e[110]" "e[114]" "e[128]" "e[139]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -8.4258261191202166 0.70491287989622309 1.1212352643658865 1;
	setAttr ".wt" 0.96874713897705078;
	setAttr ".dr" no;
	setAttr ".re" 139;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing32";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 7 "e[0:3]" "e[14]" "e[18]" "e[38]" "e[42]" "e[54]" "e[58]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -3.9577726441609631 0.70491287989622309 1.1212352643658865 1;
	setAttr ".wt" 0.087685972452163696;
	setAttr ".re" 14;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyTweak -n "polyTweak23";
	setAttr ".uopa" yes;
	setAttr -s 10 ".tk";
	setAttr ".tk[24]" -type "float3" 0.11327998 0 0 ;
	setAttr ".tk[27]" -type "float3" 0.11327998 0 0 ;
	setAttr ".tk[28]" -type "float3" 0.015104 0 0.075519986 ;
	setAttr ".tk[31]" -type "float3" 0.015104 0 0.075519986 ;
	setAttr ".tk[32]" -type "float3" 0.052863993 0 0.045311995 ;
	setAttr ".tk[33]" -type "float3" 9.3132257e-010 0 0.098175988 ;
	setAttr ".tk[34]" -type "float3" 9.3132257e-010 0 0.098175988 ;
	setAttr ".tk[35]" -type "float3" 0.052863993 0 0.045311995 ;
	setAttr ".tk[44]" -type "float3" 0.030207999 0 -0.31718394 ;
	setAttr ".tk[45]" -type "float3" 0.030207999 0 -0.31718394 ;
createNode polySplitRing -n "polySplitRing33";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 4 "e[6:7]" "e[10:11]" "e[102]" "e[106]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -3.9577726441609631 0.70491287989622309 1.1212352643658865 1;
	setAttr ".wt" 0.069644853472709656;
	setAttr ".re" 7;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing34";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 9 "e[34]" "e[36:37]" "e[39]" "e[41]" "e[45]" "e[47]" "e[49]" "e[96]" "e[111]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -3.9577726441609631 0.70491287989622309 1.1212352643658865 1;
	setAttr ".wt" 0.78513079881668091;
	setAttr ".dr" no;
	setAttr ".re" 111;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing35";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 15 "e[28:29]" "e[31]" "e[33]" "e[46]" "e[50]" "e[62]" "e[66]" "e[72]" "e[75]" "e[80]" "e[83]" "e[88]" "e[91]" "e[136]" "e[140]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -3.9577726441609631 0.70491287989622309 1.1212352643658865 1;
	setAttr ".wt" 0.08714236319065094;
	setAttr ".re" 140;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing36";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 5 "e[84:85]" "e[87]" "e[89]" "e[156]" "e[160]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -3.9577726441609631 0.70491287989622309 1.1212352643658865 1;
	setAttr ".wt" 0.8770604133605957;
	setAttr ".dr" no;
	setAttr ".re" 89;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyTweak -n "polyTweak24";
	setAttr ".uopa" yes;
	setAttr -s 2 ".tk";
	setAttr ".tk[77]" -type "float3" -0.058890581 0 -0.049075484 ;
	setAttr ".tk[84]" -type "float3" -0.058890581 0 -0.049075484 ;
createNode polySplitRing -n "polySplitRing37";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 16 "e[28:29]" "e[31]" "e[33]" "e[46]" "e[62]" "e[72]" "e[75]" "e[83]" "e[91]" "e[136]" "e[144:145]" "e[147]" "e[159]" "e[161]" "e[178]" "e[186]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -3.9577726441609631 0.70491287989622309 1.1212352643658865 1;
	setAttr ".wt" 0.090937182307243347;
	setAttr ".re" 178;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing38";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 13 "e[38]" "e[54]" "e[92:93]" "e[95]" "e[97]" "e[99]" "e[101]" "e[103]" "e[105]" "e[114]" "e[122]" "e[132]" "e[143]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -3.9577726441609631 0.70491287989622309 1.1212352643658865 1;
	setAttr ".wt" 0.093311257660388947;
	setAttr ".re" 114;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing39";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 3 "e[0:3]" "e[14]" "e[18]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0.86106204146041598 0.70491287989622309 1.1212352643658865 1;
	setAttr ".wt" 0.095055975019931793;
	setAttr ".re" 2;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyTweak -n "polyTweak25";
	setAttr ".uopa" yes;
	setAttr -s 4 ".tk";
	setAttr ".tk[22]" -type "float3" 0.12083197 0 -0.09817598 ;
	setAttr ".tk[23]" -type "float3" 0.12083197 0 -0.09817598 ;
createNode polySplitRing -n "polySplitRing40";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 5 "e[14]" "e[44:45]" "e[47]" "e[49]" "e[51]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0.86106204146041598 0.70491287989622309 1.1212352643658865 1;
	setAttr ".wt" 0.89039653539657593;
	setAttr ".dr" no;
	setAttr ".re" 44;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing41";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 5 "e[10:13]" "e[48]" "e[55]" "e[60]" "e[67]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0.86106204146041598 0.70491287989622309 1.1212352643658865 1;
	setAttr ".wt" 0.97479116916656494;
	setAttr ".dr" no;
	setAttr ".re" 67;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing42";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 11 "e[6:7]" "e[15]" "e[17]" "e[22]" "e[26]" "e[32]" "e[35]" "e[50]" "e[54]" "e[62]" "e[66]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0.86106204146041598 0.70491287989622309 1.1212352643658865 1;
	setAttr ".wt" 0.14991846680641174;
	setAttr ".re" 66;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing43";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 7 "e[28:29]" "e[31]" "e[33]" "e[40]" "e[43]" "e[100]" "e[104]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0.86106204146041598 0.70491287989622309 1.1212352643658865 1;
	setAttr ".wt" 0.083641998469829559;
	setAttr ".re" 104;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing44";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 7 "e[28:29]" "e[31]" "e[33]" "e[40]" "e[43]" "e[100]" "e[108]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0.86106204146041598 0.70491287989622309 1.1212352643658865 1;
	setAttr ".wt" 0.10116367787122726;
	setAttr ".re" 28;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing45";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 7 "e[36:37]" "e[39]" "e[41]" "e[118]" "e[122]" "e[126]" "e[130]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0.86106204146041598 0.70491287989622309 1.1212352643658865 1;
	setAttr ".wt" 0.9716295599937439;
	setAttr ".dr" no;
	setAttr ".re" 126;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing46";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 2 "e[6:7]" "e[10:11]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 4.907105124303218 0.70491287989622309 1.1212352643658865 1;
	setAttr ".wt" 0.96873283386230469;
	setAttr ".dr" no;
	setAttr ".re" 6;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing47";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 3 "e[6:7]" "e[13]" "e[15]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 4.907105124303218 0.70491287989622309 1.1212352643658865 1;
	setAttr ".wt" 0.029062893241643906;
	setAttr ".re" 6;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing48";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 5 "e[0:3]" "e[16]" "e[19]" "e[24]" "e[27]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 4.907105124303218 0.70491287989622309 1.1212352643658865 1;
	setAttr ".wt" 0.91198635101318359;
	setAttr ".dr" no;
	setAttr ".re" 27;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing49";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 8 "e[19]" "e[27]" "e[29]" "e[31]" "e[33]" "e[35]" "e[37]" "e[39]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 4.907105124303218 0.70491287989622309 1.1212352643658865 1;
	setAttr ".wt" 0.097247123718261719;
	setAttr ".re" 27;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing50";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 9 "e[0:3]" "e[14]" "e[18]" "e[22]" "e[26]" "e[30]" "e[34]" "e[38]" "e[42]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 11.175105942728539 0.70491287989622309 0.067510751324575624 1;
	setAttr ".wt" 0.94438660144805908;
	setAttr ".dr" no;
	setAttr ".re" 22;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing51";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 5 "e[10:13]" "e[56]" "e[59]" "e[86]" "e[90]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 11.175105942728539 0.70491287989622309 0.067510751324575624 1;
	setAttr ".wt" 0.10473665595054626;
	setAttr ".re" 90;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing52";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 7 "e[12:13]" "e[59]" "e[86]" "e[92]" "e[97]" "e[99]" "e[103]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 11.175105942728539 0.70491287989622309 0.067510751324575624 1;
	setAttr ".wt" 0.88378995656967163;
	setAttr ".dr" no;
	setAttr ".re" 92;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing53";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 7 "e[52:53]" "e[55]" "e[57]" "e[96]" "e[100]" "e[112]" "e[116]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 11.175105942728539 0.70491287989622309 0.067510751324575624 1;
	setAttr ".wt" 0.87880104780197144;
	setAttr ".dr" no;
	setAttr ".re" 112;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing54";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 16 "e[14]" "e[22]" "e[30]" "e[38]" "e[73]" "e[75]" "e[77]" "e[79]" "e[81]" "e[83]" "e[85]" "e[87]" "e[94]" "e[102]" "e[110]" "e[118]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 11.175105942728539 0.70491287989622309 0.067510751324575624 1;
	setAttr ".wt" 0.064789019525051117;
	setAttr ".re" 38;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing55";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 9 "e[23]" "e[25]" "e[28:29]" "e[64]" "e[67]" "e[70]" "e[82]" "e[150]" "e[170]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 11.175105942728539 0.70491287989622309 0.067510751324575624 1;
	setAttr ".wt" 0.91071045398712158;
	setAttr ".dr" no;
	setAttr ".re" 28;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing56";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 9 "e[28:29]" "e[67]" "e[82]" "e[150]" "e[173]" "e[175]" "e[179]" "e[185]" "e[187]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 11.175105942728539 0.70491287989622309 0.067510751324575624 1;
	setAttr ".wt" 0.13097375631332397;
	setAttr ".re" 28;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing57";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 7 "e[60:61]" "e[63]" "e[65]" "e[188]" "e[191]" "e[208]" "e[211]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 11.175105942728539 0.70491287989622309 0.067510751324575624 1;
	setAttr ".wt" 0.10309324413537979;
	setAttr ".re" 211;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing58";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 9 "e[6:7]" "e[39]" "e[41]" "e[46]" "e[50]" "e[74]" "e[78]" "e[142]" "e[146]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 11.175105942728539 0.70491287989622309 0.067510751324575624 1;
	setAttr ".wt" 0.88110727071762085;
	setAttr ".dr" no;
	setAttr ".re" 7;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing59";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 9 "e[6:7]" "e[50]" "e[78]" "e[146]" "e[229]" "e[231]" "e[235]" "e[241]" "e[243]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 11.175105942728539 0.70491287989622309 0.067510751324575624 1;
	setAttr ".wt" 0.12075742334127426;
	setAttr ".re" 7;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing60";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 7 "e[44:45]" "e[47]" "e[49]" "e[244]" "e[247]" "e[264]" "e[267]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 11.175105942728539 0.70491287989622309 0.067510751324575624 1;
	setAttr ".wt" 0.091614395380020142;
	setAttr ".re" 267;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing61";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 7 "e[6:7]" "e[55]" "e[67]" "e[73]" "e[75]" "e[77]" "e[79]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -8.4258261191202166 0.70491287989622309 1.1212352643658865 1;
	setAttr ".wt" 0.030462641268968582;
	setAttr ".re" 67;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing62";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 7 "e[36:37]" "e[39]" "e[41]" "e[110]" "e[139]" "e[147]" "e[149]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -8.4258261191202166 0.70491287989622309 1.1212352643658865 1;
	setAttr ".wt" 0.03127652034163475;
	setAttr ".re" 37;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing63";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 11 "e[44:45]" "e[47]" "e[49]" "e[51]" "e[53]" "e[70]" "e[78]" "e[86]" "e[94]" "e[158]" "e[166]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -8.4258261191202166 0.70491287989622309 1.1212352643658865 1;
	setAttr ".wt" 0.57581359148025513;
	setAttr ".dr" no;
	setAttr ".re" 44;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyTweak -n "polyTweak26";
	setAttr ".uopa" yes;
	setAttr -s 25 ".tk";
	setAttr ".tk[8]" -type "float3" 0.010580376 0 -0.026450939 ;
	setAttr ".tk[11]" -type "float3" 0.010580376 0 -0.026450939 ;
	setAttr ".tk[18]" -type "float3" -0.037031315 0 -0.026450939 ;
	setAttr ".tk[19]" -type "float3" -0.037031315 0 -0.026450939 ;
	setAttr ".tk[27]" -type "float3" 0.49198696 0 0.12167432 ;
	setAttr ".tk[28]" -type "float3" 0.49198696 0 0.12167432 ;
	setAttr ".tk[33]" -type "float3" -0.2380583 0 0.047611691 ;
	setAttr ".tk[34]" -type "float3" -0.2380583 0 0.047611691 ;
	setAttr ".tk[44]" -type "float3" -0.2380583 0 0.047611691 ;
	setAttr ".tk[45]" -type "float3" 0.037030987 0 -0.042321593 ;
	setAttr ".tk[46]" -type "float3" -0.23805866 0 -0.34386167 ;
	setAttr ".tk[47]" -type "float3" -0.2380586 0 -0.34386173 ;
	setAttr ".tk[48]" -type "float3" 0.037030987 0 -0.042321593 ;
	setAttr ".tk[49]" -type "float3" -0.2380583 0 0.047611691 ;
	setAttr ".tk[52]" -type "float3" 0.13754487 0 -0.39676377 ;
	setAttr ".tk[53]" -type "float3" 0.13754487 0 -0.39676377 ;
	setAttr ".tk[60]" -type "float3" 0.22747794 0 -0.015870564 ;
	setAttr ".tk[61]" -type "float3" 0.22747794 0 -0.015870564 ;
	setAttr ".tk[62]" -type "float3" 0.22747794 0 -0.015870564 ;
	setAttr ".tk[63]" -type "float3" 0.22747794 0 -0.015870564 ;
	setAttr ".tk[67]" -type "float3" -0.037031315 0 -0.015870564 ;
	setAttr ".tk[68]" -type "float3" -0.26979938 0 0.2116074 ;
	setAttr ".tk[69]" -type "float3" -0.26979938 0 0.2116074 ;
	setAttr ".tk[70]" -type "float3" -0.037031315 0 -0.015870564 ;
createNode polySplitRing -n "polySplitRing64";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 11 "e[108:109]" "e[111]" "e[113]" "e[115]" "e[117]" "e[119]" "e[135]" "e[142]" "e[150]" "e[178]" "e[186]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -8.4258261191202166 0.70491287989622309 1.1212352643658865 1;
	setAttr ".wt" 0.4770057201385498;
	setAttr ".re" 109;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing65";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 15 "e[12:13]" "e[15]" "e[17]" "e[24]" "e[27]" "e[30]" "e[59]" "e[100]" "e[108]" "e[150]" "e[166]" "e[196]" "e[212]" "e[234]" "e[250]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -3.9577726441609631 0.70491287989622309 1.1212352643658865 1;
	setAttr ".wt" 0.86312127113342285;
	setAttr ".dr" no;
	setAttr ".re" 250;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyTweak -n "polyTweak27";
	setAttr ".uopa" yes;
	setAttr -s 53 ".tk";
	setAttr ".tk[0]" -type "float3" -0.010580376 0 -0.12696451 ;
	setAttr ".tk[2]" -type "float3" -0.010580376 0 -0.12696451 ;
	setAttr ".tk[9]" -type "float3" -0.010580376 0 -0.037031315 ;
	setAttr ".tk[10]" -type "float3" -0.010580376 0 -0.037031315 ;
	setAttr ".tk[14]" -type "float3" -0.026450939 0 0.058192067 ;
	setAttr ".tk[15]" -type "float3" -0.026450939 0 0.058192067 ;
	setAttr ".tk[17]" -type "float3" -0.047611691 0 -0.063482255 ;
	setAttr ".tk[18]" -type "float3" -0.047611691 0 -0.063482255 ;
	setAttr ".tk[25]" -type "float3" -0.021160752 0 -0.12696451 ;
	setAttr ".tk[26]" -type "float3" -0.021160752 0 -0.12696451 ;
	setAttr ".tk[33]" -type "float3" 0.11638413 0 0.037031315 ;
	setAttr ".tk[34]" -type "float3" 0.11638413 0 0.037031315 ;
	setAttr ".tk[53]" -type "float3" 0.095223382 0 -0.058192067 ;
	setAttr ".tk[54]" -type "float3" 0.095223382 0 -0.058192067 ;
	setAttr ".tk[59]" -type "float3" -0.074062631 0 -0.11109395 ;
	setAttr ".tk[60]" -type "float3" -0.10580376 0 -0.20102704 ;
	setAttr ".tk[61]" -type "float3" -0.10580376 0 -0.20102704 ;
	setAttr ".tk[62]" -type "float3" -0.074062631 0 -0.11109395 ;
	setAttr ".tk[68]" -type "float3" -0.010580376 0 -0.037031315 ;
	setAttr ".tk[69]" -type "float3" -0.047611691 0 -0.063482255 ;
	setAttr ".tk[70]" -type "float3" 0.089933194 0 0.11638413 ;
	setAttr ".tk[71]" -type "float3" 0.089933194 0 0.11638413 ;
	setAttr ".tk[72]" -type "float3" -0.047611691 0 -0.063482255 ;
	setAttr ".tk[73]" -type "float3" -0.010580376 0 -0.037031315 ;
	setAttr ".tk[74]" -type "float3" -0.081251077 0 0.063482255 ;
	setAttr ".tk[75]" -type "float3" -0.021160752 0 -0.12696451 ;
	setAttr ".tk[76]" -type "float3" 0.074334845 0 0.037031315 ;
	setAttr ".tk[77]" -type "float3" -0.025229577 0 0 ;
	setAttr ".tk[84]" -type "float3" -0.025229577 0 0 ;
	setAttr ".tk[85]" -type "float3" 0.074334845 0 0.037031315 ;
	setAttr ".tk[86]" -type "float3" -0.021160752 0 -0.12696451 ;
	setAttr ".tk[87]" -type "float3" -0.081251077 0 0.063482255 ;
	setAttr ".tk[88]" -type "float3" -0.36502266 0 0.037031315 ;
	setAttr ".tk[89]" -type "float3" -0.36502266 0 0.037031315 ;
	setAttr ".tk[90]" -type "float3" 0 0 -0.033639435 ;
	setAttr ".tk[91]" -type "float3" 0 0 0.033639435 ;
	setAttr ".tk[92]" -type "float3" 0 0 0.033639435 ;
	setAttr ".tk[93]" -type "float3" 0 0 0.033639435 ;
	setAttr ".tk[94]" -type "float3" 0 0 0.033639435 ;
	setAttr ".tk[95]" -type "float3" 0 0 -0.033639435 ;
	setAttr ".tk[96]" -type "float3" 0 0 -0.033639435 ;
	setAttr ".tk[99]" -type "float3" 0.033639435 0 0 ;
	setAttr ".tk[102]" -type "float3" -0.047611691 0 -0.063482255 ;
	setAttr ".tk[103]" -type "float3" -0.047611691 0 -0.063482255 ;
	setAttr ".tk[104]" -type "float3" -0.047611691 0 -0.063482255 ;
	setAttr ".tk[105]" -type "float3" -0.047611691 0 -0.063482255 ;
	setAttr ".tk[108]" -type "float3" 0.033639435 0 0 ;
	setAttr ".tk[111]" -type "float3" 0 0 -0.033639435 ;
	setAttr ".tk[121]" -type "float3" -0.010580376 0 -0.037031315 ;
	setAttr ".tk[122]" -type "float3" -0.010580376 0 -0.037031315 ;
	setAttr ".tk[123]" -type "float3" -0.010580376 0 -0.037031315 ;
	setAttr ".tk[124]" -type "float3" -0.010580376 0 -0.037031315 ;
createNode polySplitRing -n "polySplitRing66";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 15 "e[15]" "e[17]" "e[22]" "e[32]" "e[50]" "e[62]" "e[84:85]" "e[87]" "e[101]" "e[103]" "e[105]" "e[116]" "e[123]" "e[132]" "e[139]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0.86106204146041598 0.70491287989622309 1.1212352643658865 1;
	setAttr ".wt" 0.7498289942741394;
	setAttr ".dr" no;
	setAttr ".re" 103;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing67";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 7 "e[52:53]" "e[55]" "e[57]" "e[96]" "e[112]" "e[131]" "e[133]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 11.175105942728539 0.70491287989622309 0.067510751324575624 1;
	setAttr ".wt" 0.13194385170936584;
	setAttr ".re" 112;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing68";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 7 "e[60:61]" "e[63]" "e[65]" "e[188]" "e[208]" "e[212]" "e[225]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 11.175105942728539 0.70491287989622309 0.067510751324575624 1;
	setAttr ".wt" 0.86597651243209839;
	setAttr ".dr" no;
	setAttr ".re" 225;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing69";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 7 "e[44:45]" "e[47]" "e[49]" "e[244]" "e[264]" "e[268]" "e[281]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 11.175105942728539 0.70491287989622309 0.067510751324575624 1;
	setAttr ".wt" 0.86445450782775879;
	setAttr ".dr" no;
	setAttr ".re" 281;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing70";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 6 "e[10:11]" "e[102]" "e[112:113]" "e[115]" "e[232]" "e[251]";
	setAttr ".ix" -type "matrix" 0.99107536258614604 0 0.13330275944157816 0 0 1 0 0
		 -0.13330275944157816 0 0.99107536258614604 0 -4.0719147130685363 0.70491287989622309 9.480854689339747 1;
	setAttr ".wt" 0.089174762368202209;
	setAttr ".re" 251;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyTweak -n "polyTweak28";
	setAttr ".uopa" yes;
	setAttr -s 4 ".tk";
	setAttr ".tk[132]" -type "float3" -0.070531949 0 -0.12577984 ;
	setAttr ".tk[135]" -type "float3" -0.070531957 0 -0.12577984 ;
createNode polySplitRing -n "polySplitRing71";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 7 "e[68:69]" "e[71]" "e[73]" "e[152]" "e[164]" "e[194]" "e[214]";
	setAttr ".ix" -type "matrix" 0.99107536258614604 0 0.13330275944157816 0 0 1 0 0
		 -0.13330275944157816 0 0.99107536258614604 0 -4.0719147130685363 0.70491287989622309 9.480854689339747 1;
	setAttr ".wt" 0.31103876233100891;
	setAttr ".re" 69;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing72";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 7 "e[12:13]" "e[55]" "e[67]" "e[73]" "e[75]" "e[77]" "e[79]";
	setAttr ".ix" -type "matrix" 0.99107536258614604 0 0.13330275944157816 0 0 1 0 0
		 -0.13330275944157816 0 0.99107536258614604 0 0.70391362022636883 0.70491287989622309 10.123218650225866 1;
	setAttr ".wt" 0.064898550510406494;
	setAttr ".re" 67;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyTweak -n "polyTweak29";
	setAttr ".uopa" yes;
	setAttr -s 31 ".tk";
	setAttr ".tk[0]" -type "float3" 0.011753385 0 -0.035260156 ;
	setAttr ".tk[2]" -type "float3" 0.011753385 0 -0.035260156 ;
	setAttr ".tk[8]" -type "float3" 0.017630078 0 0.064643621 ;
	setAttr ".tk[11]" -type "float3" 0.017630078 0 0.064643621 ;
	setAttr ".tk[16]" -type "float3" 0.017630078 0 0.064643621 ;
	setAttr ".tk[17]" -type "float3" 0.017630078 0 0.064643621 ;
	setAttr ".tk[27]" -type "float3" 0.1939308 0 -0.035260156 ;
	setAttr ".tk[28]" -type "float3" 0.1939308 0 -0.035260156 ;
	setAttr ".tk[32]" -type "float3" -0.064643621 0 -0.04113685 ;
	setAttr ".tk[35]" -type "float3" -0.064643621 0 -0.04113685 ;
	setAttr ".tk[45]" -type "float3" 0.058766928 0 -0.099903762 ;
	setAttr ".tk[46]" -type "float3" -0.047013544 0 -0.14691728 ;
	setAttr ".tk[47]" -type "float3" -0.047013544 0 -0.14691728 ;
	setAttr ".tk[48]" -type "float3" 0.058766928 0 -0.099903762 ;
	setAttr ".tk[52]" -type "float3" 0.029383462 0 -0.10578045 ;
	setAttr ".tk[53]" -type "float3" 0.029383462 0 -0.10578045 ;
	setAttr ".tk[56]" -type "float3" -0.099903762 0 -0.076397002 ;
	setAttr ".tk[57]" -type "float3" -0.11165714 0 0.017630078 ;
	setAttr ".tk[58]" -type "float3" -0.11165714 0 0.017630078 ;
	setAttr ".tk[59]" -type "float3" -0.099903762 0 -0.076397002 ;
	setAttr ".tk[64]" -type "float3" 0.04113685 0 -0.017630078 ;
	setAttr ".tk[67]" -type "float3" 0.04113685 0 -0.017630078 ;
	setAttr ".tk[80]" -type "float3" 0.02350677 0 0.058766931 ;
	setAttr ".tk[81]" -type "float3" 0.011753385 0 0.047013544 ;
	setAttr ".tk[82]" -type "float3" -0.058766931 0 0.017630078 ;
	setAttr ".tk[87]" -type "float3" -0.058766931 0 0.017630078 ;
	setAttr ".tk[88]" -type "float3" 0.011753385 0 0.047013544 ;
	setAttr ".tk[89]" -type "float3" 0.02350677 0 0.058766931 ;
	setAttr ".tk[90]" -type "float3" 0.058766931 0 0 ;
	setAttr ".tk[95]" -type "float3" 0.058766931 0 0 ;
createNode polySplitRing -n "polySplitRing73";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 7 "e[36:37]" "e[39]" "e[41]" "e[118]" "e[126]" "e[145]" "e[153]";
	setAttr ".ix" -type "matrix" 0.99107536258614604 0 0.13330275944157816 0 0 1 0 0
		 -0.13330275944157816 0 0.99107536258614604 0 0.70391362022636883 0.70491287989622309 10.123218650225866 1;
	setAttr ".wt" 0.071137882769107819;
	setAttr ".re" 36;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing74";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 11 "e[44:45]" "e[47]" "e[49]" "e[162]" "e[166]" "e[218]" "e[222]" "e[276]" "e[283]" "e[300]" "e[307]";
	setAttr ".ix" -type "matrix" 0.99107536258614604 0 0.13330275944157816 0 0 1 0 0
		 -0.13330275944157816 0 0.99107536258614604 0 -11.901969277489258 1.4790896404613849 7.796603197912499 1;
	setAttr ".wt" 0.17009088397026062;
	setAttr ".re" 283;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing75";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 21 "e[6:7]" "e[18]" "e[59]" "e[70]" "e[78]" "e[95]" "e[97]" "e[99]" "e[101]" "e[103]" "e[105]" "e[132]" "e[144]" "e[156]" "e[194]" "e[212]" "e[250]" "e[310]" "e[318]" "e[330]" "e[338]";
	setAttr ".ix" -type "matrix" 0.99107536258614604 0 0.13330275944157816 0 0 1 0 0
		 -0.13330275944157816 0 0.99107536258614604 0 -11.901969277489258 1.4790896404613849 7.796603197912499 1;
	setAttr ".wt" 0.85496360063552856;
	setAttr ".dr" no;
	setAttr ".re" 310;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing76";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 19 "e[64]" "e[108:109]" "e[111]" "e[115]" "e[117]" "e[119]" "e[121]" "e[123]" "e[125]" "e[136]" "e[140]" "e[170]" "e[182]" "e[226]" "e[238]" "e[264]" "e[272]" "e[288]" "e[296]";
	setAttr ".ix" -type "matrix" 0.99107536258614604 0 0.13330275944157816 0 0 1 0 0
		 -0.13330275944157816 0 0.99107536258614604 0 -11.901969277489258 1.4790896404613849 7.796603197912499 1;
	setAttr ".wt" 0.77500218152999878;
	setAttr ".dr" no;
	setAttr ".re" 121;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyTweak -n "polyTweak30";
	setAttr ".uopa" yes;
	setAttr -s 39 ".tk";
	setAttr ".tk[37]" -type "float3" -0.2316025 0 0.037218165 ;
	setAttr ".tk[38]" -type "float3" -0.2316025 0 0.037218165 ;
	setAttr ".tk[45]" -type "float3" -0.081127167 0 -0.061890807 ;
	setAttr ".tk[46]" -type "float3" 0.17040877 0 -0.041121177 ;
	setAttr ".tk[49]" -type "float3" -0.37482995 0 -0.12552385 ;
	setAttr ".tk[50]" -type "float3" -0.37482995 0 -0.12552385 ;
	setAttr ".tk[53]" -type "float3" 0.17040877 0 -0.041121177 ;
	setAttr ".tk[54]" -type "float3" -0.081127167 0 -0.061890807 ;
	setAttr ".tk[67]" -type "float3" -0.27903143 0 -0.089874007 ;
	setAttr ".tk[68]" -type "float3" 0.003206061 0 0.023836326 ;
	setAttr ".tk[73]" -type "float3" 0.003206061 0 0.023836326 ;
	setAttr ".tk[74]" -type "float3" -0.27903143 0 -0.089874007 ;
	setAttr ".tk[79]" -type "float3" -0.37482995 0 -0.12552385 ;
	setAttr ".tk[101]" -type "float3" -0.2316025 0 0.037218165 ;
	setAttr ".tk[107]" -type "float3" -0.37482995 0 -0.12552385 ;
	setAttr ".tk[129]" -type "float3" -0.2316025 0 0.037218165 ;
	setAttr ".tk[166]" -type "float3" 0.20260872 0 -0.027251508 ;
	setAttr ".tk[171]" -type "float3" 0.20260872 0 -0.027251508 ;
	setAttr ".tk[172]" -type "float3" 0.2018072 0 -0.03321059 ;
	setAttr ".tk[173]" -type "float3" 0.2018072 0 -0.03321059 ;
	setAttr ".tk[174]" -type "float3" 0.2018072 0 -0.03321059 ;
	setAttr ".tk[175]" -type "float3" 0.2018072 0 -0.03321059 ;
	setAttr ".tk[196]" -type "float3" 0.020874184 0 -0.16054669 ;
	setAttr ".tk[197]" -type "float3" -0.15469222 0 -0.11266492 ;
	setAttr ".tk[198]" -type "float3" -0.24442686 0 -0.058127142 ;
	setAttr ".tk[199]" -type "float3" -0.42285079 0 -0.076596797 ;
	setAttr ".tk[200]" -type "float3" -0.52906913 0 -0.18971458 ;
	setAttr ".tk[201]" -type "float3" -0.52906913 0 -0.18971458 ;
	setAttr ".tk[202]" -type "float3" -0.52906913 0 -0.18971458 ;
	setAttr ".tk[203]" -type "float3" -0.52906913 0 -0.18971458 ;
	setAttr ".tk[204]" -type "float3" -0.42285079 0 -0.076596797 ;
	setAttr ".tk[205]" -type "float3" -0.24442686 0 -0.058127142 ;
	setAttr ".tk[206]" -type "float3" -0.15469222 0 -0.11266492 ;
	setAttr ".tk[207]" -type "float3" 0.020874184 0 -0.16054669 ;
createNode polySplitRing -n "polySplitRing77";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 16 "e[98]" "e[127:129]" "e[131]" "e[135]" "e[137]" "e[139]" "e[141]" "e[145]" "e[152]" "e[178]" "e[208]" "e[234]" "e[396]" "e[404]" "e[422]" "e[434]";
	setAttr ".ix" -type "matrix" 0.99107536258614604 0 0.13330275944157816 0 0 1 0 0
		 -0.13330275944157816 0 0.99107536258614604 0 -11.901969277489258 1.4790896404613849 7.796603197912499 1;
	setAttr ".wt" 0.86820018291473389;
	setAttr ".dr" no;
	setAttr ".re" 131;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing78";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 21 "e[20:21]" "e[23]" "e[25]" "e[32]" "e[35]" "e[40]" "e[43]" "e[67]" "e[113]" "e[134]" "e[142]" "e[168]" "e[184]" "e[224]" "e[240]" "e[262]" "e[274]" "e[286]" "e[298]" "e[458]" "e[474]";
	setAttr ".ix" -type "matrix" 0.99107536258614604 0 0.13330275944157816 0 0 1 0 0
		 -0.13330275944157816 0 0.99107536258614604 0 -11.901969277489258 1.4790896404613849 7.796603197912499 1;
	setAttr ".wt" 0.1063687652349472;
	setAttr ".re" 67;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing79";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 19 "e[12:13]" "e[15]" "e[17]" "e[24]" "e[27]" "e[94]" "e[112]" "e[133]" "e[143]" "e[150]" "e[180]" "e[206]" "e[236]" "e[394]" "e[406]" "e[424]" "e[432]" "e[500]" "e[508]";
	setAttr ".ix" -type "matrix" 0.99107536258614604 0 0.13330275944157816 0 0 1 0 0
		 -0.13330275944157816 0 0.99107536258614604 0 -11.901969277489258 1.4790896404613849 7.796603197912499 1;
	setAttr ".wt" 0.82732731103897095;
	setAttr ".dr" no;
	setAttr ".re" 133;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing80";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 24 "e[10:11]" "e[14]" "e[56]" "e[74]" "e[82]" "e[84:85]" "e[87]" "e[89]" "e[91]" "e[93]" "e[130]" "e[146]" "e[154]" "e[196]" "e[210]" "e[252]" "e[320]" "e[327]" "e[340]" "e[347]" "e[480]" "e[488]" "e[546]" "e[554]";
	setAttr ".ix" -type "matrix" 0.99107536258614604 0 0.13330275944157816 0 0 1 0 0
		 -0.13330275944157816 0 0.99107536258614604 0 -11.901969277489258 1.4790896404613849 7.796603197912499 1;
	setAttr ".wt" 0.89741295576095581;
	setAttr ".dr" no;
	setAttr ".re" 546;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing81";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 18 "e[12:13]" "e[15]" "e[17]" "e[24]" "e[27]" "e[32]" "e[35]" "e[50]" "e[62]" "e[84:85]" "e[116]" "e[123]" "e[130]" "e[138]" "e[198]" "e[206]" "e[222]" "e[230]";
	setAttr ".ix" -type "matrix" 0.99107536258614604 0 0.13330275944157816 0 0 1 0 0
		 -0.13330275944157816 0 0.99107536258614604 0 -8.5000924308180696 0.70491287989622309 8.8852508317951457 1;
	setAttr ".wt" 0.11733465641736984;
	setAttr ".re" 15;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyTweak -n "polyTweak31";
	setAttr ".uopa" yes;
	setAttr -s 22 ".tk";
	setAttr ".tk[20]" -type "float3" 0.010580376 0 0.026450939 ;
	setAttr ".tk[21]" -type "float3" 0.010580376 0 0.026450939 ;
	setAttr ".tk[30]" -type "float3" -0.074062631 0 -0.031741127 ;
	setAttr ".tk[31]" -type "float3" -0.074062631 0 -0.031741127 ;
	setAttr ".tk[36]" -type "float3" -0.043199282 0 -0.052735962 ;
	setAttr ".tk[41]" -type "float3" -0.043199282 0 -0.052735962 ;
	setAttr ".tk[64]" -type "float3" -0.031741127 0 -0.015870564 ;
	setAttr ".tk[65]" -type "float3" -0.031741127 0 -0.015870564 ;
	setAttr ".tk[72]" -type "float3" -0.031741127 0 -0.015870564 ;
	setAttr ".tk[74]" -type "float3" 0.010580376 0 0.026450939 ;
	setAttr ".tk[75]" -type "float3" 0.010580376 0 0.026450939 ;
	setAttr ".tk[77]" -type "float3" -0.031741127 0 -0.015870564 ;
	setAttr ".tk[96]" -type "float3" 0.021160752 0 -0.058192067 ;
	setAttr ".tk[97]" -type "float3" 0.021160752 0 -0.058192067 ;
	setAttr ".tk[98]" -type "float3" 0.021160752 0 -0.058192067 ;
	setAttr ".tk[107]" -type "float3" 0.021160752 0 -0.058192067 ;
	setAttr ".tk[108]" -type "float3" -0.058192067 0 -0.031741127 ;
	setAttr ".tk[109]" -type "float3" -0.058192067 0 -0.031741127 ;
	setAttr ".tk[110]" -type "float3" -0.058192067 0 -0.031741127 ;
	setAttr ".tk[119]" -type "float3" -0.058192067 0 -0.031741127 ;
select -ne :time1;
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :renderPartition;
	setAttr -s 2 ".st";
select -ne :initialShadingGroup;
	setAttr -s 7 ".dsm";
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultShaderList1;
	setAttr -s 2 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
select -ne :defaultRenderingList1;
select -ne :renderGlobalsList1;
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
select -ne :defaultHardwareRenderGlobals;
	setAttr ".fn" -type "string" "im";
	setAttr ".res" -type "string" "ntsc_4d 646 485 1.333";
connectAttr "imagePlaneShape1.msg" ":topShape.ip" -na;
connectAttr "polySplitRing80.out" "pCubeShape1.i";
connectAttr "polySplitRing81.out" "pCubeShape2.i";
connectAttr "polySplitRing71.out" "pCubeShape3.i";
connectAttr "polySplitRing73.out" "pCubeShape4.i";
connectAttr "polySplitRing49.out" "pCubeShape5.i";
connectAttr "polySplitRing69.out" "pCubeShape6.i";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "polyTweak1.out" "polyExtrudeFace1.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace1.mp";
connectAttr "polyCube1.out" "polyTweak1.ip";
connectAttr "polyTweak2.out" "polyExtrudeFace2.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace2.mp";
connectAttr "polyExtrudeFace1.out" "polyTweak2.ip";
connectAttr "polyTweak3.out" "polyExtrudeFace3.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace3.mp";
connectAttr "polyExtrudeFace2.out" "polyTweak3.ip";
connectAttr "polyTweak4.out" "polyExtrudeFace4.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace4.mp";
connectAttr "polyExtrudeFace3.out" "polyTweak4.ip";
connectAttr "polyExtrudeFace4.out" "polyExtrudeFace5.ip";
connectAttr "pCubeShape1.wm" "polyExtrudeFace5.mp";
connectAttr "polyTweak5.out" "polySplitRing1.ip";
connectAttr "pCubeShape1.wm" "polySplitRing1.mp";
connectAttr "polyExtrudeFace5.out" "polyTweak5.ip";
connectAttr "polySplitRing1.out" "polySplitRing2.ip";
connectAttr "pCubeShape1.wm" "polySplitRing2.mp";
connectAttr "polyTweak6.out" "polySplitRing3.ip";
connectAttr "pCubeShape1.wm" "polySplitRing3.mp";
connectAttr "polySplitRing2.out" "polyTweak6.ip";
connectAttr "polyTweak7.out" "polySplitRing4.ip";
connectAttr "pCubeShape1.wm" "polySplitRing4.mp";
connectAttr "polySplitRing3.out" "polyTweak7.ip";
connectAttr "polyTweak8.out" "polySplitRing5.ip";
connectAttr "pCubeShape1.wm" "polySplitRing5.mp";
connectAttr "polySplitRing4.out" "polyTweak8.ip";
connectAttr "polyTweak9.out" "polySplitRing6.ip";
connectAttr "pCubeShape1.wm" "polySplitRing6.mp";
connectAttr "polySplitRing5.out" "polyTweak9.ip";
connectAttr "polyTweak10.out" "polySplitRing7.ip";
connectAttr "pCubeShape1.wm" "polySplitRing7.mp";
connectAttr "polySplitRing6.out" "polyTweak10.ip";
connectAttr "polyTweak11.out" "polySplitRing8.ip";
connectAttr "pCubeShape1.wm" "polySplitRing8.mp";
connectAttr "polySplitRing7.out" "polyTweak11.ip";
connectAttr "polySplitRing8.out" "polySplitRing9.ip";
connectAttr "pCubeShape1.wm" "polySplitRing9.mp";
connectAttr "polySplitRing9.out" "polySplitRing10.ip";
connectAttr "pCubeShape1.wm" "polySplitRing10.mp";
connectAttr "polySplitRing10.out" "polySplitRing11.ip";
connectAttr "pCubeShape1.wm" "polySplitRing11.mp";
connectAttr "polySplitRing11.out" "polySplitRing12.ip";
connectAttr "pCubeShape1.wm" "polySplitRing12.mp";
connectAttr "polySplitRing12.out" "polySplitRing13.ip";
connectAttr "pCubeShape1.wm" "polySplitRing13.mp";
connectAttr "polyTweak12.out" "polyExtrudeFace6.ip";
connectAttr "pCubeShape2.wm" "polyExtrudeFace6.mp";
connectAttr "polyCube2.out" "polyTweak12.ip";
connectAttr "polyTweak13.out" "polyExtrudeFace7.ip";
connectAttr "pCubeShape2.wm" "polyExtrudeFace7.mp";
connectAttr "polyExtrudeFace6.out" "polyTweak13.ip";
connectAttr "polyExtrudeFace7.out" "polyExtrudeFace8.ip";
connectAttr "pCubeShape2.wm" "polyExtrudeFace8.mp";
connectAttr "polyExtrudeFace8.out" "polyExtrudeFace9.ip";
connectAttr "pCubeShape2.wm" "polyExtrudeFace9.mp";
connectAttr "polySurfaceShape1.o" "polyExtrudeFace10.ip";
connectAttr "pCubeShape3.wm" "polyExtrudeFace10.mp";
connectAttr "polyExtrudeFace10.out" "polyExtrudeFace11.ip";
connectAttr "pCubeShape3.wm" "polyExtrudeFace11.mp";
connectAttr "polyTweak14.out" "polySplitRing14.ip";
connectAttr "pCubeShape3.wm" "polySplitRing14.mp";
connectAttr "polyExtrudeFace11.out" "polyTweak14.ip";
connectAttr "polyTweak15.out" "polySplitRing15.ip";
connectAttr "pCubeShape3.wm" "polySplitRing15.mp";
connectAttr "polySplitRing14.out" "polyTweak15.ip";
connectAttr "polyTweak16.out" "polySplitRing16.ip";
connectAttr "pCubeShape3.wm" "polySplitRing16.mp";
connectAttr "polySplitRing15.out" "polyTweak16.ip";
connectAttr "polyTweak17.out" "polyExtrudeFace12.ip";
connectAttr "pCubeShape3.wm" "polyExtrudeFace12.mp";
connectAttr "polySplitRing16.out" "polyTweak17.ip";
connectAttr "polyTweak18.out" "polySplitRing17.ip";
connectAttr "pCubeShape3.wm" "polySplitRing17.mp";
connectAttr "polyExtrudeFace12.out" "polyTweak18.ip";
connectAttr "polyTweak19.out" "polySplitRing18.ip";
connectAttr "pCubeShape3.wm" "polySplitRing18.mp";
connectAttr "polySplitRing17.out" "polyTweak19.ip";
connectAttr "|group1|pCube4|polySurfaceShape2.o" "polySplitRing19.ip";
connectAttr "pCubeShape4.wm" "polySplitRing19.mp";
connectAttr "polySplitRing19.out" "polyExtrudeFace13.ip";
connectAttr "pCubeShape4.wm" "polyExtrudeFace13.mp";
connectAttr "polyTweak20.out" "polySplitRing20.ip";
connectAttr "pCubeShape4.wm" "polySplitRing20.mp";
connectAttr "polyExtrudeFace13.out" "polyTweak20.ip";
connectAttr "polyTweak21.out" "polyExtrudeFace14.ip";
connectAttr "pCubeShape4.wm" "polyExtrudeFace14.mp";
connectAttr "polySplitRing20.out" "polyTweak21.ip";
connectAttr "polySurfaceShape3.o" "polySplitRing21.ip";
connectAttr "pCubeShape6.wm" "polySplitRing21.mp";
connectAttr "polySplitRing21.out" "polySplitRing22.ip";
connectAttr "pCubeShape6.wm" "polySplitRing22.mp";
connectAttr "polySplitRing22.out" "polySplitRing23.ip";
connectAttr "pCubeShape6.wm" "polySplitRing23.mp";
connectAttr "polySplitRing23.out" "polySplitRing24.ip";
connectAttr "pCubeShape6.wm" "polySplitRing24.mp";
connectAttr "polySplitRing24.out" "polyExtrudeFace15.ip";
connectAttr "pCubeShape6.wm" "polyExtrudeFace15.mp";
connectAttr "polyTweak22.out" "polySplitRing25.ip";
connectAttr "pCubeShape2.wm" "polySplitRing25.mp";
connectAttr "polyExtrudeFace9.out" "polyTweak22.ip";
connectAttr "polySplitRing25.out" "polySplitRing26.ip";
connectAttr "pCubeShape2.wm" "polySplitRing26.mp";
connectAttr "polySplitRing26.out" "polySplitRing27.ip";
connectAttr "pCubeShape2.wm" "polySplitRing27.mp";
connectAttr "polySplitRing27.out" "polySplitRing28.ip";
connectAttr "pCubeShape2.wm" "polySplitRing28.mp";
connectAttr "polySplitRing28.out" "polySplitRing29.ip";
connectAttr "pCubeShape2.wm" "polySplitRing29.mp";
connectAttr "polySplitRing29.out" "polySplitRing30.ip";
connectAttr "pCubeShape2.wm" "polySplitRing30.mp";
connectAttr "polySplitRing30.out" "polySplitRing31.ip";
connectAttr "pCubeShape2.wm" "polySplitRing31.mp";
connectAttr "polyTweak23.out" "polySplitRing32.ip";
connectAttr "pCubeShape3.wm" "polySplitRing32.mp";
connectAttr "polySplitRing18.out" "polyTweak23.ip";
connectAttr "polySplitRing32.out" "polySplitRing33.ip";
connectAttr "pCubeShape3.wm" "polySplitRing33.mp";
connectAttr "polySplitRing33.out" "polySplitRing34.ip";
connectAttr "pCubeShape3.wm" "polySplitRing34.mp";
connectAttr "polySplitRing34.out" "polySplitRing35.ip";
connectAttr "pCubeShape3.wm" "polySplitRing35.mp";
connectAttr "polyTweak24.out" "polySplitRing36.ip";
connectAttr "pCubeShape3.wm" "polySplitRing36.mp";
connectAttr "polySplitRing35.out" "polyTweak24.ip";
connectAttr "polySplitRing36.out" "polySplitRing37.ip";
connectAttr "pCubeShape3.wm" "polySplitRing37.mp";
connectAttr "polySplitRing37.out" "polySplitRing38.ip";
connectAttr "pCubeShape3.wm" "polySplitRing38.mp";
connectAttr "polyTweak25.out" "polySplitRing39.ip";
connectAttr "pCubeShape4.wm" "polySplitRing39.mp";
connectAttr "polyExtrudeFace14.out" "polyTweak25.ip";
connectAttr "polySplitRing39.out" "polySplitRing40.ip";
connectAttr "pCubeShape4.wm" "polySplitRing40.mp";
connectAttr "polySplitRing40.out" "polySplitRing41.ip";
connectAttr "pCubeShape4.wm" "polySplitRing41.mp";
connectAttr "polySplitRing41.out" "polySplitRing42.ip";
connectAttr "pCubeShape4.wm" "polySplitRing42.mp";
connectAttr "polySplitRing42.out" "polySplitRing43.ip";
connectAttr "pCubeShape4.wm" "polySplitRing43.mp";
connectAttr "polySplitRing43.out" "polySplitRing44.ip";
connectAttr "pCubeShape4.wm" "polySplitRing44.mp";
connectAttr "polySplitRing44.out" "polySplitRing45.ip";
connectAttr "pCubeShape4.wm" "polySplitRing45.mp";
connectAttr "polySurfaceShape4.o" "polySplitRing46.ip";
connectAttr "pCubeShape5.wm" "polySplitRing46.mp";
connectAttr "polySplitRing46.out" "polySplitRing47.ip";
connectAttr "pCubeShape5.wm" "polySplitRing47.mp";
connectAttr "polySplitRing47.out" "polySplitRing48.ip";
connectAttr "pCubeShape5.wm" "polySplitRing48.mp";
connectAttr "polySplitRing48.out" "polySplitRing49.ip";
connectAttr "pCubeShape5.wm" "polySplitRing49.mp";
connectAttr "polyExtrudeFace15.out" "polySplitRing50.ip";
connectAttr "pCubeShape6.wm" "polySplitRing50.mp";
connectAttr "polySplitRing50.out" "polySplitRing51.ip";
connectAttr "pCubeShape6.wm" "polySplitRing51.mp";
connectAttr "polySplitRing51.out" "polySplitRing52.ip";
connectAttr "pCubeShape6.wm" "polySplitRing52.mp";
connectAttr "polySplitRing52.out" "polySplitRing53.ip";
connectAttr "pCubeShape6.wm" "polySplitRing53.mp";
connectAttr "polySplitRing53.out" "polySplitRing54.ip";
connectAttr "pCubeShape6.wm" "polySplitRing54.mp";
connectAttr "polySplitRing54.out" "polySplitRing55.ip";
connectAttr "pCubeShape6.wm" "polySplitRing55.mp";
connectAttr "polySplitRing55.out" "polySplitRing56.ip";
connectAttr "pCubeShape6.wm" "polySplitRing56.mp";
connectAttr "polySplitRing56.out" "polySplitRing57.ip";
connectAttr "pCubeShape6.wm" "polySplitRing57.mp";
connectAttr "polySplitRing57.out" "polySplitRing58.ip";
connectAttr "pCubeShape6.wm" "polySplitRing58.mp";
connectAttr "polySplitRing58.out" "polySplitRing59.ip";
connectAttr "pCubeShape6.wm" "polySplitRing59.mp";
connectAttr "polySplitRing59.out" "polySplitRing60.ip";
connectAttr "pCubeShape6.wm" "polySplitRing60.mp";
connectAttr "polySplitRing31.out" "polySplitRing61.ip";
connectAttr "pCubeShape2.wm" "polySplitRing61.mp";
connectAttr "polySplitRing61.out" "polySplitRing62.ip";
connectAttr "pCubeShape2.wm" "polySplitRing62.mp";
connectAttr "polyTweak26.out" "polySplitRing63.ip";
connectAttr "pCubeShape2.wm" "polySplitRing63.mp";
connectAttr "polySplitRing62.out" "polyTweak26.ip";
connectAttr "polySplitRing63.out" "polySplitRing64.ip";
connectAttr "pCubeShape2.wm" "polySplitRing64.mp";
connectAttr "polyTweak27.out" "polySplitRing65.ip";
connectAttr "pCubeShape3.wm" "polySplitRing65.mp";
connectAttr "polySplitRing38.out" "polyTweak27.ip";
connectAttr "polySplitRing45.out" "polySplitRing66.ip";
connectAttr "pCubeShape4.wm" "polySplitRing66.mp";
connectAttr "polySplitRing60.out" "polySplitRing67.ip";
connectAttr "pCubeShape6.wm" "polySplitRing67.mp";
connectAttr "polySplitRing67.out" "polySplitRing68.ip";
connectAttr "pCubeShape6.wm" "polySplitRing68.mp";
connectAttr "polySplitRing68.out" "polySplitRing69.ip";
connectAttr "pCubeShape6.wm" "polySplitRing69.mp";
connectAttr "polyTweak28.out" "polySplitRing70.ip";
connectAttr "pCubeShape3.wm" "polySplitRing70.mp";
connectAttr "polySplitRing65.out" "polyTweak28.ip";
connectAttr "polySplitRing70.out" "polySplitRing71.ip";
connectAttr "pCubeShape3.wm" "polySplitRing71.mp";
connectAttr "polyTweak29.out" "polySplitRing72.ip";
connectAttr "pCubeShape4.wm" "polySplitRing72.mp";
connectAttr "polySplitRing66.out" "polyTweak29.ip";
connectAttr "polySplitRing72.out" "polySplitRing73.ip";
connectAttr "pCubeShape4.wm" "polySplitRing73.mp";
connectAttr "polySplitRing13.out" "polySplitRing74.ip";
connectAttr "pCubeShape1.wm" "polySplitRing74.mp";
connectAttr "polySplitRing74.out" "polySplitRing75.ip";
connectAttr "pCubeShape1.wm" "polySplitRing75.mp";
connectAttr "polyTweak30.out" "polySplitRing76.ip";
connectAttr "pCubeShape1.wm" "polySplitRing76.mp";
connectAttr "polySplitRing75.out" "polyTweak30.ip";
connectAttr "polySplitRing76.out" "polySplitRing77.ip";
connectAttr "pCubeShape1.wm" "polySplitRing77.mp";
connectAttr "polySplitRing77.out" "polySplitRing78.ip";
connectAttr "pCubeShape1.wm" "polySplitRing78.mp";
connectAttr "polySplitRing78.out" "polySplitRing79.ip";
connectAttr "pCubeShape1.wm" "polySplitRing79.mp";
connectAttr "polySplitRing79.out" "polySplitRing80.ip";
connectAttr "pCubeShape1.wm" "polySplitRing80.mp";
connectAttr "polyTweak31.out" "polySplitRing81.ip";
connectAttr "pCubeShape2.wm" "polySplitRing81.mp";
connectAttr "polySplitRing64.out" "polyTweak31.ip";
connectAttr "pCubeShape1.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape2.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape3.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape4.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape5.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape6.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape8.iog" ":initialShadingGroup.dsm" -na;
connectAttr "imagePlaneShape1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
// End of survive_logo.ma
