//Maya ASCII 2022 scene
//Name: anim_rig_male_jog.002.ma
//Last modified: Tue, Oct 25, 2022 10:21:45 AM
//Codeset: 1252
file -rdi 1 -ns "rig_male_character_v003" -rfn "rig_male_character_v001RN" -op
		 "v=0;" -typ "mayaAscii" "D:/PlasticSCM/YTAvatar/Art/rigging_sample_files/rig_male_character.003.ma";
file -r -ns "rig_male_character_v003" -dr 1 -rfn "rig_male_character_v001RN" -op
		 "v=0;" -typ "mayaAscii" "D:/PlasticSCM/YTAvatar/Art/rigging_sample_files/rig_male_character.003.ma";
requires maya "2022";
requires "mtoa" "4.2.1";
requires "stereoCamera" "10.0";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2022";
fileInfo "version" "2022";
fileInfo "cutIdentifier" "202102181415-29bfc1879c";
fileInfo "osv" "Windows 10 Pro v2009 (Build: 19044)";
fileInfo "UUID" "A51133F7-4EF1-7743-AA5A-0D998AEC7092";
createNode transform -s -n "persp";
	rename -uid "1605D1B9-4303-B7BC-249A-098BE63CD5E5";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 175.01978685695678 147.55698820997381 241.99680864476693 ;
	setAttr ".r" -type "double3" -13.538352729603055 37.800000000000161 0 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "02A79E25-4429-572C-2E87-87BF0D9C0976";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 265.8224972306848;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
	setAttr ".ai_translator" -type "string" "perspective";
createNode transform -s -n "top";
	rename -uid "CA85A9CA-4D41-DCFD-434A-9A9DBF1CA570";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -90 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "0A108A4C-4A4B-7D92-42AF-069ACD6C7508";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -s -n "front";
	rename -uid "BFE4C56D-482A-2180-2927-A9AB9EDB19AC";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "D82A78E8-46A0-7E4B-6EC2-25A88DD1DCEB";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -s -n "side";
	rename -uid "7A1D9FEA-4748-7CBD-3F5D-4C9B7619A2F9";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 0 0 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "C5907F0E-4A2C-CC0D-BA28-09B4D160E261";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode lightLinker -s -n "lightLinker1";
	rename -uid "6415E074-4EDD-FCFC-1B0C-5D9AB9D26A19";
	setAttr -s 26 ".lnk";
	setAttr -s 26 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "C5C3C42D-4755-D034-1B6E-B8A75974A7F1";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "DE1CED37-418C-48AB-46E6-9089DF02B4CF";
createNode displayLayerManager -n "layerManager";
	rename -uid "87B39FCB-4A48-FEF2-C3D6-009A4519977A";
createNode displayLayer -n "defaultLayer";
	rename -uid "FA1AD8D4-401C-78BD-1D10-94B2FBB0F5A1";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "F94A1393-48EB-AF06-B1FE-43B70C98965E";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "D8E249EA-46BC-8952-185F-1486F8169B73";
	setAttr ".g" yes;
createNode reference -n "rig_male_character_v001RN";
	rename -uid "37FCD14F-493B-E7D5-D919-C7952E68957B";
	setAttr -s 2 ".fn";
	setAttr ".fn[0]" -type "string" "D:/PlasticSCM/YTAvatar/Art/rigging_sample_files/rig_male_character.003.ma";
	setAttr ".fn[1]" -type "string" "D:/PlasticSCM/YTAvatar/Art/rigging_sample_files/rig_male_character.v001.ma";
	setAttr -s 485 ".phl";
	setAttr ".phl[1]" 0;
	setAttr ".phl[2]" 0;
	setAttr ".phl[3]" 0;
	setAttr ".phl[4]" 0;
	setAttr ".phl[5]" 0;
	setAttr ".phl[6]" 0;
	setAttr ".phl[7]" 0;
	setAttr ".phl[8]" 0;
	setAttr ".phl[9]" 0;
	setAttr ".phl[10]" 0;
	setAttr ".phl[11]" 0;
	setAttr ".phl[12]" 0;
	setAttr ".phl[13]" 0;
	setAttr ".phl[14]" 0;
	setAttr ".phl[15]" 0;
	setAttr ".phl[16]" 0;
	setAttr ".phl[17]" 0;
	setAttr ".phl[18]" 0;
	setAttr ".phl[19]" 0;
	setAttr ".phl[20]" 0;
	setAttr ".phl[21]" 0;
	setAttr ".phl[22]" 0;
	setAttr ".phl[23]" 0;
	setAttr ".phl[24]" 0;
	setAttr ".phl[25]" 0;
	setAttr ".phl[26]" 0;
	setAttr ".phl[27]" 0;
	setAttr ".phl[28]" 0;
	setAttr ".phl[29]" 0;
	setAttr ".phl[30]" 0;
	setAttr ".phl[31]" 0;
	setAttr ".phl[32]" 0;
	setAttr ".phl[33]" 0;
	setAttr ".phl[34]" 0;
	setAttr ".phl[35]" 0;
	setAttr ".phl[36]" 0;
	setAttr ".phl[37]" 0;
	setAttr ".phl[38]" 0;
	setAttr ".phl[39]" 0;
	setAttr ".phl[40]" 0;
	setAttr ".phl[41]" 0;
	setAttr ".phl[42]" 0;
	setAttr ".phl[43]" 0;
	setAttr ".phl[44]" 0;
	setAttr ".phl[45]" 0;
	setAttr ".phl[46]" 0;
	setAttr ".phl[47]" 0;
	setAttr ".phl[48]" 0;
	setAttr ".phl[49]" 0;
	setAttr ".phl[50]" 0;
	setAttr ".phl[51]" 0;
	setAttr ".phl[52]" 0;
	setAttr ".phl[53]" 0;
	setAttr ".phl[54]" 0;
	setAttr ".phl[55]" 0;
	setAttr ".phl[56]" 0;
	setAttr ".phl[57]" 0;
	setAttr ".phl[58]" 0;
	setAttr ".phl[59]" 0;
	setAttr ".phl[60]" 0;
	setAttr ".phl[61]" 0;
	setAttr ".phl[62]" 0;
	setAttr ".phl[63]" 0;
	setAttr ".phl[64]" 0;
	setAttr ".phl[65]" 0;
	setAttr ".phl[66]" 0;
	setAttr ".phl[67]" 0;
	setAttr ".phl[68]" 0;
	setAttr ".phl[69]" 0;
	setAttr ".phl[70]" 0;
	setAttr ".phl[71]" 0;
	setAttr ".phl[72]" 0;
	setAttr ".phl[73]" 0;
	setAttr ".phl[74]" 0;
	setAttr ".phl[75]" 0;
	setAttr ".phl[76]" 0;
	setAttr ".phl[77]" 0;
	setAttr ".phl[78]" 0;
	setAttr ".phl[79]" 0;
	setAttr ".phl[80]" 0;
	setAttr ".phl[81]" 0;
	setAttr ".phl[82]" 0;
	setAttr ".phl[83]" 0;
	setAttr ".phl[84]" 0;
	setAttr ".phl[85]" 0;
	setAttr ".phl[86]" 0;
	setAttr ".phl[87]" 0;
	setAttr ".phl[88]" 0;
	setAttr ".phl[89]" 0;
	setAttr ".phl[90]" 0;
	setAttr ".phl[91]" 0;
	setAttr ".phl[92]" 0;
	setAttr ".phl[93]" 0;
	setAttr ".phl[94]" 0;
	setAttr ".phl[95]" 0;
	setAttr ".phl[96]" 0;
	setAttr ".phl[97]" 0;
	setAttr ".phl[98]" 0;
	setAttr ".phl[99]" 0;
	setAttr ".phl[100]" 0;
	setAttr ".phl[101]" 0;
	setAttr ".phl[102]" 0;
	setAttr ".phl[103]" 0;
	setAttr ".phl[104]" 0;
	setAttr ".phl[105]" 0;
	setAttr ".phl[106]" 0;
	setAttr ".phl[107]" 0;
	setAttr ".phl[108]" 0;
	setAttr ".phl[109]" 0;
	setAttr ".phl[110]" 0;
	setAttr ".phl[111]" 0;
	setAttr ".phl[112]" 0;
	setAttr ".phl[113]" 0;
	setAttr ".phl[114]" 0;
	setAttr ".phl[115]" 0;
	setAttr ".phl[116]" 0;
	setAttr ".phl[117]" 0;
	setAttr ".phl[118]" 0;
	setAttr ".phl[119]" 0;
	setAttr ".phl[120]" 0;
	setAttr ".phl[121]" 0;
	setAttr ".phl[122]" 0;
	setAttr ".phl[123]" 0;
	setAttr ".phl[124]" 0;
	setAttr ".phl[125]" 0;
	setAttr ".phl[126]" 0;
	setAttr ".phl[127]" 0;
	setAttr ".phl[128]" 0;
	setAttr ".phl[129]" 0;
	setAttr ".phl[130]" 0;
	setAttr ".phl[131]" 0;
	setAttr ".phl[132]" 0;
	setAttr ".phl[133]" 0;
	setAttr ".phl[134]" 0;
	setAttr ".phl[135]" 0;
	setAttr ".phl[136]" 0;
	setAttr ".phl[137]" 0;
	setAttr ".phl[138]" 0;
	setAttr ".phl[139]" 0;
	setAttr ".phl[140]" 0;
	setAttr ".phl[141]" 0;
	setAttr ".phl[142]" 0;
	setAttr ".phl[143]" 0;
	setAttr ".phl[144]" 0;
	setAttr ".phl[145]" 0;
	setAttr ".phl[146]" 0;
	setAttr ".phl[147]" 0;
	setAttr ".phl[148]" 0;
	setAttr ".phl[149]" 0;
	setAttr ".phl[150]" 0;
	setAttr ".phl[151]" 0;
	setAttr ".phl[152]" 0;
	setAttr ".phl[153]" 0;
	setAttr ".phl[154]" 0;
	setAttr ".phl[155]" 0;
	setAttr ".phl[156]" 0;
	setAttr ".phl[157]" 0;
	setAttr ".phl[158]" 0;
	setAttr ".phl[159]" 0;
	setAttr ".phl[160]" 0;
	setAttr ".phl[161]" 0;
	setAttr ".phl[162]" 0;
	setAttr ".phl[163]" 0;
	setAttr ".phl[164]" 0;
	setAttr ".phl[165]" 0;
	setAttr ".phl[166]" 0;
	setAttr ".phl[167]" 0;
	setAttr ".phl[168]" 0;
	setAttr ".phl[169]" 0;
	setAttr ".phl[170]" 0;
	setAttr ".phl[171]" 0;
	setAttr ".phl[172]" 0;
	setAttr ".phl[173]" 0;
	setAttr ".phl[174]" 0;
	setAttr ".phl[175]" 0;
	setAttr ".phl[176]" 0;
	setAttr ".phl[177]" 0;
	setAttr ".phl[178]" 0;
	setAttr ".phl[179]" 0;
	setAttr ".phl[180]" 0;
	setAttr ".phl[181]" 0;
	setAttr ".phl[182]" 0;
	setAttr ".phl[183]" 0;
	setAttr ".phl[184]" 0;
	setAttr ".phl[185]" 0;
	setAttr ".phl[186]" 0;
	setAttr ".phl[187]" 0;
	setAttr ".phl[188]" 0;
	setAttr ".phl[189]" 0;
	setAttr ".phl[190]" 0;
	setAttr ".phl[191]" 0;
	setAttr ".phl[192]" 0;
	setAttr ".phl[193]" 0;
	setAttr ".phl[194]" 0;
	setAttr ".phl[195]" 0;
	setAttr ".phl[196]" 0;
	setAttr ".phl[197]" 0;
	setAttr ".phl[198]" 0;
	setAttr ".phl[199]" 0;
	setAttr ".phl[200]" 0;
	setAttr ".phl[201]" 0;
	setAttr ".phl[202]" 0;
	setAttr ".phl[203]" 0;
	setAttr ".phl[204]" 0;
	setAttr ".phl[205]" 0;
	setAttr ".phl[206]" 0;
	setAttr ".phl[207]" 0;
	setAttr ".phl[208]" 0;
	setAttr ".phl[209]" 0;
	setAttr ".phl[210]" 0;
	setAttr ".phl[211]" 0;
	setAttr ".phl[212]" 0;
	setAttr ".phl[213]" 0;
	setAttr ".phl[214]" 0;
	setAttr ".phl[215]" 0;
	setAttr ".phl[216]" 0;
	setAttr ".phl[217]" 0;
	setAttr ".phl[218]" 0;
	setAttr ".phl[219]" 0;
	setAttr ".phl[220]" 0;
	setAttr ".phl[221]" 0;
	setAttr ".phl[222]" 0;
	setAttr ".phl[223]" 0;
	setAttr ".phl[224]" 0;
	setAttr ".phl[225]" 0;
	setAttr ".phl[226]" 0;
	setAttr ".phl[227]" 0;
	setAttr ".phl[228]" 0;
	setAttr ".phl[229]" 0;
	setAttr ".phl[230]" 0;
	setAttr ".phl[231]" 0;
	setAttr ".phl[232]" 0;
	setAttr ".phl[233]" 0;
	setAttr ".phl[234]" 0;
	setAttr ".phl[235]" 0;
	setAttr ".phl[236]" 0;
	setAttr ".phl[237]" 0;
	setAttr ".phl[238]" 0;
	setAttr ".phl[239]" 0;
	setAttr ".phl[240]" 0;
	setAttr ".phl[241]" 0;
	setAttr ".phl[242]" 0;
	setAttr ".phl[243]" 0;
	setAttr ".phl[244]" 0;
	setAttr ".phl[245]" 0;
	setAttr ".phl[246]" 0;
	setAttr ".phl[247]" 0;
	setAttr ".phl[248]" 0;
	setAttr ".phl[249]" 0;
	setAttr ".phl[250]" 0;
	setAttr ".phl[251]" 0;
	setAttr ".phl[252]" 0;
	setAttr ".phl[253]" 0;
	setAttr ".phl[254]" 0;
	setAttr ".phl[255]" 0;
	setAttr ".phl[256]" 0;
	setAttr ".phl[257]" 0;
	setAttr ".phl[258]" 0;
	setAttr ".phl[259]" 0;
	setAttr ".phl[260]" 0;
	setAttr ".phl[261]" 0;
	setAttr ".phl[262]" 0;
	setAttr ".phl[263]" 0;
	setAttr ".phl[264]" 0;
	setAttr ".phl[265]" 0;
	setAttr ".phl[266]" 0;
	setAttr ".phl[267]" 0;
	setAttr ".phl[268]" 0;
	setAttr ".phl[269]" 0;
	setAttr ".phl[270]" 0;
	setAttr ".phl[271]" 0;
	setAttr ".phl[272]" 0;
	setAttr ".phl[273]" 0;
	setAttr ".phl[274]" 0;
	setAttr ".phl[275]" 0;
	setAttr ".phl[276]" 0;
	setAttr ".phl[277]" 0;
	setAttr ".phl[278]" 0;
	setAttr ".phl[279]" 0;
	setAttr ".phl[280]" 0;
	setAttr ".phl[281]" 0;
	setAttr ".phl[282]" 0;
	setAttr ".phl[283]" 0;
	setAttr ".phl[284]" 0;
	setAttr ".phl[285]" 0;
	setAttr ".phl[286]" 0;
	setAttr ".phl[287]" 0;
	setAttr ".phl[288]" 0;
	setAttr ".phl[289]" 0;
	setAttr ".phl[290]" 0;
	setAttr ".phl[291]" 0;
	setAttr ".phl[292]" 0;
	setAttr ".phl[293]" 0;
	setAttr ".phl[294]" 0;
	setAttr ".phl[295]" 0;
	setAttr ".phl[296]" 0;
	setAttr ".phl[297]" 0;
	setAttr ".phl[298]" 0;
	setAttr ".phl[299]" 0;
	setAttr ".phl[300]" 0;
	setAttr ".phl[301]" 0;
	setAttr ".phl[302]" 0;
	setAttr ".phl[303]" 0;
	setAttr ".phl[304]" 0;
	setAttr ".phl[305]" 0;
	setAttr ".phl[306]" 0;
	setAttr ".phl[307]" 0;
	setAttr ".phl[308]" 0;
	setAttr ".phl[309]" 0;
	setAttr ".phl[310]" 0;
	setAttr ".phl[311]" 0;
	setAttr ".phl[312]" 0;
	setAttr ".phl[313]" 0;
	setAttr ".phl[314]" 0;
	setAttr ".phl[315]" 0;
	setAttr ".phl[316]" 0;
	setAttr ".phl[317]" 0;
	setAttr ".phl[318]" 0;
	setAttr ".phl[319]" 0;
	setAttr ".phl[320]" 0;
	setAttr ".phl[321]" 0;
	setAttr ".phl[322]" 0;
	setAttr ".phl[323]" 0;
	setAttr ".phl[324]" 0;
	setAttr ".phl[325]" 0;
	setAttr ".phl[326]" 0;
	setAttr ".phl[327]" 0;
	setAttr ".phl[328]" 0;
	setAttr ".phl[329]" 0;
	setAttr ".phl[330]" 0;
	setAttr ".phl[331]" 0;
	setAttr ".phl[332]" 0;
	setAttr ".phl[333]" 0;
	setAttr ".phl[334]" 0;
	setAttr ".phl[335]" 0;
	setAttr ".phl[336]" 0;
	setAttr ".phl[337]" 0;
	setAttr ".phl[338]" 0;
	setAttr ".phl[339]" 0;
	setAttr ".phl[340]" 0;
	setAttr ".phl[341]" 0;
	setAttr ".phl[342]" 0;
	setAttr ".phl[343]" 0;
	setAttr ".phl[344]" 0;
	setAttr ".phl[345]" 0;
	setAttr ".phl[346]" 0;
	setAttr ".phl[347]" 0;
	setAttr ".phl[348]" 0;
	setAttr ".phl[349]" 0;
	setAttr ".phl[350]" 0;
	setAttr ".phl[351]" 0;
	setAttr ".phl[352]" 0;
	setAttr ".phl[353]" 0;
	setAttr ".phl[354]" 0;
	setAttr ".phl[355]" 0;
	setAttr ".phl[356]" 0;
	setAttr ".phl[357]" 0;
	setAttr ".phl[358]" 0;
	setAttr ".phl[359]" 0;
	setAttr ".phl[360]" 0;
	setAttr ".phl[361]" 0;
	setAttr ".phl[362]" 0;
	setAttr ".phl[363]" 0;
	setAttr ".phl[364]" 0;
	setAttr ".phl[365]" 0;
	setAttr ".phl[366]" 0;
	setAttr ".phl[367]" 0;
	setAttr ".phl[368]" 0;
	setAttr ".phl[369]" 0;
	setAttr ".phl[370]" 0;
	setAttr ".phl[371]" 0;
	setAttr ".phl[372]" 0;
	setAttr ".phl[373]" 0;
	setAttr ".phl[374]" 0;
	setAttr ".phl[375]" 0;
	setAttr ".phl[376]" 0;
	setAttr ".phl[377]" 0;
	setAttr ".phl[378]" 0;
	setAttr ".phl[379]" 0;
	setAttr ".phl[380]" 0;
	setAttr ".phl[381]" 0;
	setAttr ".phl[382]" 0;
	setAttr ".phl[383]" 0;
	setAttr ".phl[384]" 0;
	setAttr ".phl[385]" 0;
	setAttr ".phl[386]" 0;
	setAttr ".phl[387]" 0;
	setAttr ".phl[388]" 0;
	setAttr ".phl[389]" 0;
	setAttr ".phl[390]" 0;
	setAttr ".phl[391]" 0;
	setAttr ".phl[392]" 0;
	setAttr ".phl[393]" 0;
	setAttr ".phl[394]" 0;
	setAttr ".phl[395]" 0;
	setAttr ".phl[396]" 0;
	setAttr ".phl[397]" 0;
	setAttr ".phl[398]" 0;
	setAttr ".phl[399]" 0;
	setAttr ".phl[400]" 0;
	setAttr ".phl[401]" 0;
	setAttr ".phl[402]" 0;
	setAttr ".phl[403]" 0;
	setAttr ".phl[404]" 0;
	setAttr ".phl[405]" 0;
	setAttr ".phl[406]" 0;
	setAttr ".phl[407]" 0;
	setAttr ".phl[408]" 0;
	setAttr ".phl[409]" 0;
	setAttr ".phl[410]" 0;
	setAttr ".phl[411]" 0;
	setAttr ".phl[412]" 0;
	setAttr ".phl[413]" 0;
	setAttr ".phl[414]" 0;
	setAttr ".phl[415]" 0;
	setAttr ".phl[416]" 0;
	setAttr ".phl[417]" 0;
	setAttr ".phl[418]" 0;
	setAttr ".phl[419]" 0;
	setAttr ".phl[420]" 0;
	setAttr ".phl[421]" 0;
	setAttr ".phl[422]" 0;
	setAttr ".phl[423]" 0;
	setAttr ".phl[424]" 0;
	setAttr ".phl[425]" 0;
	setAttr ".phl[426]" 0;
	setAttr ".phl[427]" 0;
	setAttr ".phl[428]" 0;
	setAttr ".phl[429]" 0;
	setAttr ".phl[430]" 0;
	setAttr ".phl[431]" 0;
	setAttr ".phl[432]" 0;
	setAttr ".phl[433]" 0;
	setAttr ".phl[434]" 0;
	setAttr ".phl[435]" 0;
	setAttr ".phl[436]" 0;
	setAttr ".phl[437]" 0;
	setAttr ".phl[438]" 0;
	setAttr ".phl[439]" 0;
	setAttr ".phl[440]" 0;
	setAttr ".phl[441]" 0;
	setAttr ".phl[442]" 0;
	setAttr ".phl[443]" 0;
	setAttr ".phl[444]" 0;
	setAttr ".phl[445]" 0;
	setAttr ".phl[446]" 0;
	setAttr ".phl[447]" 0;
	setAttr ".phl[448]" 0;
	setAttr ".phl[449]" 0;
	setAttr ".phl[450]" 0;
	setAttr ".phl[451]" 0;
	setAttr ".phl[452]" 0;
	setAttr ".phl[453]" 0;
	setAttr ".phl[454]" 0;
	setAttr ".phl[455]" 0;
	setAttr ".phl[456]" 0;
	setAttr ".phl[457]" 0;
	setAttr ".phl[458]" 0;
	setAttr ".phl[459]" 0;
	setAttr ".phl[460]" 0;
	setAttr ".phl[461]" 0;
	setAttr ".phl[462]" 0;
	setAttr ".phl[463]" 0;
	setAttr ".phl[464]" 0;
	setAttr ".phl[465]" 0;
	setAttr ".phl[466]" 0;
	setAttr ".phl[467]" 0;
	setAttr ".phl[468]" 0;
	setAttr ".phl[469]" 0;
	setAttr ".phl[470]" 0;
	setAttr ".phl[471]" 0;
	setAttr ".phl[472]" 0;
	setAttr ".phl[473]" 0;
	setAttr ".phl[474]" 0;
	setAttr ".phl[475]" 0;
	setAttr ".phl[476]" 0;
	setAttr ".phl[477]" 0;
	setAttr ".phl[478]" 0;
	setAttr ".phl[479]" 0;
	setAttr ".phl[480]" 0;
	setAttr ".phl[481]" 0;
	setAttr ".phl[482]" 0;
	setAttr ".phl[483]" 0;
	setAttr ".phl[484]" 0;
	setAttr ".phl[485]" 0;
	setAttr ".ed" -type "dataReferenceEdits" 
		"rig_male_character_v001RN"
		"rig_male_character_v001RN" 0
		"rig_male_character_v001RN" 2231
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt" 
		"side" " 2"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt" 
		"side" " 0"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt" 
		"type" " 1"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:lf_hip_jnt" 
		"side" " 1"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:lf_hip_jnt" 
		"type" " 2"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:lf_hip_jnt|rig_male_character_v003:lf_knee_jnt" 
		"side" " 1"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:lf_hip_jnt|rig_male_character_v003:lf_knee_jnt" 
		"type" " 3"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:lf_hip_jnt|rig_male_character_v003:lf_knee_jnt|rig_male_character_v003:lf_ankle_jnt" 
		"side" " 1"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:lf_hip_jnt|rig_male_character_v003:lf_knee_jnt|rig_male_character_v003:lf_ankle_jnt" 
		"type" " 4"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:lf_hip_jnt|rig_male_character_v003:lf_knee_jnt|rig_male_character_v003:lf_ankle_jnt|rig_male_character_v003:lf_ball_jnt" 
		"side" " 1"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:lf_hip_jnt|rig_male_character_v003:lf_knee_jnt|rig_male_character_v003:lf_ankle_jnt|rig_male_character_v003:lf_ball_jnt" 
		"type" " 5"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:rt_hip_jnt" 
		"side" " 2"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:rt_hip_jnt" 
		"type" " 2"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:rt_hip_jnt|rig_male_character_v003:rt_knee_jnt" 
		"side" " 2"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:rt_hip_jnt|rig_male_character_v003:rt_knee_jnt" 
		"type" " 3"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:rt_hip_jnt|rig_male_character_v003:rt_knee_jnt|rig_male_character_v003:rt_ankle_jnt" 
		"side" " 2"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:rt_hip_jnt|rig_male_character_v003:rt_knee_jnt|rig_male_character_v003:rt_ankle_jnt" 
		"type" " 4"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:rt_hip_jnt|rig_male_character_v003:rt_knee_jnt|rig_male_character_v003:rt_ankle_jnt|rig_male_character_v003:rt_ball_jnt" 
		"side" " 2"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:rt_hip_jnt|rig_male_character_v003:rt_knee_jnt|rig_male_character_v003:rt_ankle_jnt|rig_male_character_v003:rt_ball_jnt" 
		"type" " 5"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt" 
		"side" " 0"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt" 
		"type" " 6"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt" 
		"side" " 0"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt" 
		"type" " 6"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt" 
		"side" " 0"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt" 
		"type" " 6"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:cn_neckBase_jnt" 
		"side" " 0"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:cn_neckBase_jnt" 
		"type" " 7"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:cn_neckBase_jnt|rig_male_character_v003:cn_neckMid_jnt" 
		"side" " 0"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:cn_neckBase_jnt|rig_male_character_v003:cn_neckMid_jnt" 
		"type" " 7"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:cn_neckBase_jnt|rig_male_character_v003:cn_neckMid_jnt|rig_male_character_v003:cn_head_jnt" 
		"side" " 0"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:cn_neckBase_jnt|rig_male_character_v003:cn_neckMid_jnt|rig_male_character_v003:cn_head_jnt" 
		"type" " 8"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt" 
		"side" " 1"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt" 
		"type" " 9"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt" 
		"side" " 1"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt" 
		"type" " 10"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt" 
		"side" " 1"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt" 
		"type" " 11"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt" 
		"side" " 1"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt" 
		"type" " 12"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_thumb01_jnt" 
		"side" " 1"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_thumb01_jnt" 
		"type" " 14"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_thumb01_jnt|rig_male_character_v003:lf_thumb02_jnt" 
		"side" " 1"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_thumb01_jnt|rig_male_character_v003:lf_thumb02_jnt" 
		"type" " 14"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_thumb01_jnt|rig_male_character_v003:lf_thumb02_jnt|rig_male_character_v003:lf_thumb03_jnt" 
		"side" " 1"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_thumb01_jnt|rig_male_character_v003:lf_thumb02_jnt|rig_male_character_v003:lf_thumb03_jnt" 
		"type" " 14"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_index01_jnt" 
		"side" " 1"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_index01_jnt" 
		"type" " 19"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_index01_jnt|rig_male_character_v003:lf_index02_jnt" 
		"side" " 1"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_index01_jnt|rig_male_character_v003:lf_index02_jnt" 
		"type" " 19"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_index01_jnt|rig_male_character_v003:lf_index02_jnt|rig_male_character_v003:lf_index03_jnt" 
		"side" " 1"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_index01_jnt|rig_male_character_v003:lf_index02_jnt|rig_male_character_v003:lf_index03_jnt" 
		"type" " 19"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_middle01_jnt" 
		"side" " 1"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_middle01_jnt" 
		"type" " 20"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_middle01_jnt|rig_male_character_v003:lf_middle02_jnt" 
		"side" " 1"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_middle01_jnt|rig_male_character_v003:lf_middle02_jnt" 
		"type" " 20"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_middle01_jnt|rig_male_character_v003:lf_middle02_jnt|rig_male_character_v003:lf_middle03_jnt" 
		"side" " 1"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_middle01_jnt|rig_male_character_v003:lf_middle02_jnt|rig_male_character_v003:lf_middle03_jnt" 
		"type" " 20"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_ring01_jnt" 
		"side" " 1"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_ring01_jnt" 
		"type" " 21"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_ring01_jnt|rig_male_character_v003:lf_ring02_jnt" 
		"side" " 1"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_ring01_jnt|rig_male_character_v003:lf_ring02_jnt" 
		"type" " 21"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_ring01_jnt|rig_male_character_v003:lf_ring02_jnt|rig_male_character_v003:lf_ring03_jnt" 
		"side" " 1"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_ring01_jnt|rig_male_character_v003:lf_ring02_jnt|rig_male_character_v003:lf_ring03_jnt" 
		"type" " 21"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_pinky01_jnt" 
		"side" " 1"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_pinky01_jnt" 
		"type" " 22"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_pinky01_jnt|rig_male_character_v003:lf_pinky02_jnt" 
		"side" " 1"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_pinky01_jnt|rig_male_character_v003:lf_pinky02_jnt" 
		"type" " 22"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_pinky01_jnt|rig_male_character_v003:lf_pinky02_jnt|rig_male_character_v003:lf_pinky03_jnt" 
		"side" " 1"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_pinky01_jnt|rig_male_character_v003:lf_pinky02_jnt|rig_male_character_v003:lf_pinky03_jnt" 
		"type" " 22"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_forearm_jnt" 
		"side" " 1"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_forearm_jnt" 
		"type" " 11"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt" 
		"side" " 2"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt" 
		"type" " 9"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt" 
		"side" " 2"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt" 
		"type" " 10"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt" 
		"side" " 2"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt" 
		"type" " 11"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt" 
		"side" " 2"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt" 
		"type" " 12"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_thumb01_jnt" 
		"side" " 2"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_thumb01_jnt" 
		"type" " 14"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_thumb01_jnt|rig_male_character_v003:rt_thumb02_jnt" 
		"side" " 2"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_thumb01_jnt|rig_male_character_v003:rt_thumb02_jnt" 
		"type" " 14"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_thumb01_jnt|rig_male_character_v003:rt_thumb02_jnt|rig_male_character_v003:rt_thumb03_jnt" 
		"side" " 2"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_thumb01_jnt|rig_male_character_v003:rt_thumb02_jnt|rig_male_character_v003:rt_thumb03_jnt" 
		"type" " 14"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_index01_jnt" 
		"side" " 2"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_index01_jnt" 
		"type" " 19"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_index01_jnt|rig_male_character_v003:rt_index02_jnt" 
		"side" " 2"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_index01_jnt|rig_male_character_v003:rt_index02_jnt" 
		"type" " 19"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_index01_jnt|rig_male_character_v003:rt_index02_jnt|rig_male_character_v003:rt_index03_jnt" 
		"side" " 2"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_index01_jnt|rig_male_character_v003:rt_index02_jnt|rig_male_character_v003:rt_index03_jnt" 
		"type" " 19"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_middle01_jnt" 
		"side" " 2"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_middle01_jnt" 
		"type" " 20"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_middle01_jnt|rig_male_character_v003:rt_middle02_jnt" 
		"side" " 2"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_middle01_jnt|rig_male_character_v003:rt_middle02_jnt" 
		"type" " 20"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_middle01_jnt|rig_male_character_v003:rt_middle02_jnt|rig_male_character_v003:rt_middle03_jnt" 
		"side" " 2"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_middle01_jnt|rig_male_character_v003:rt_middle02_jnt|rig_male_character_v003:rt_middle03_jnt" 
		"type" " 20"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_ring01_jnt" 
		"side" " 2"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_ring01_jnt" 
		"type" " 21"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_ring01_jnt|rig_male_character_v003:rt_ring02_jnt" 
		"side" " 2"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_ring01_jnt|rig_male_character_v003:rt_ring02_jnt" 
		"type" " 21"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_ring01_jnt|rig_male_character_v003:rt_ring02_jnt|rig_male_character_v003:rt_ring03_jnt" 
		"side" " 2"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_ring01_jnt|rig_male_character_v003:rt_ring02_jnt|rig_male_character_v003:rt_ring03_jnt" 
		"type" " 21"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_pinky01_jnt" 
		"side" " 2"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_pinky01_jnt" 
		"type" " 22"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_pinky01_jnt|rig_male_character_v003:rt_pinky02_jnt" 
		"side" " 2"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_pinky01_jnt|rig_male_character_v003:rt_pinky02_jnt" 
		"type" " 22"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_pinky01_jnt|rig_male_character_v003:rt_pinky02_jnt|rig_male_character_v003:rt_pinky03_jnt" 
		"side" " 2"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_pinky01_jnt|rig_male_character_v003:rt_pinky02_jnt|rig_male_character_v003:rt_pinky03_jnt" 
		"type" " 22"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_forearm_jnt" 
		"side" " 2"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_forearm_jnt" 
		"type" " 11"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl" 
		"spineInfluenceSwitch" " -k 1 0"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_elbow_ik_offsetGrp|rig_male_character_v003:right_elbow_ik_overrideGrp|rig_male_character_v003:right_elbow_ik_twistOverrideGrp|rig_male_character_v003:right_elbow_ik_wristOffsetGrp|rig_male_character_v003:right_elbow_ik_wristOffsetDriver|rig_male_character_v003:right_elbow_ik_ctrlGrp|rig_male_character_v003:right_elbow_ik_ctrl" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:neckBase_switch_ctrl_grp|rig_male_character_v003:neckBase_ctrlGrp|rig_male_character_v003:neckBase_ctrlOffsetGrp|rig_male_character_v003:neckBase_ctrl|rig_male_character_v003:neckMid_ctrlGrp|rig_male_character_v003:neckMid_ctrlOffsetGrp|rig_male_character_v003:neckMid_ctrl|rig_male_character_v003:head_ctrlGrp|rig_male_character_v003:head_ctrlOffsetGrp|rig_male_character_v003:head_ctrl" 
		"showOffsetCtrl" " -k 1 1"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:neckBase_switch_ctrl_grp|rig_male_character_v003:neckBase_ctrlGrp|rig_male_character_v003:neckBase_ctrlOffsetGrp|rig_male_character_v003:neckBase_ctrl|rig_male_character_v003:neckMid_ctrlGrp|rig_male_character_v003:neckMid_ctrlOffsetGrp|rig_male_character_v003:neckMid_ctrl|rig_male_character_v003:head_ctrlGrp|rig_male_character_v003:head_ctrlOffsetGrp|rig_male_character_v003:head_ctrl" 
		"eyeCtrlVisibility" " -k 1 1"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:neckBase_switch_ctrl_grp|rig_male_character_v003:neckBase_ctrlGrp|rig_male_character_v003:neckBase_ctrlOffsetGrp|rig_male_character_v003:neckBase_ctrl|rig_male_character_v003:neckMid_ctrlGrp|rig_male_character_v003:neckMid_ctrlOffsetGrp|rig_male_character_v003:neckMid_ctrl|rig_male_character_v003:head_ctrlGrp|rig_male_character_v003:head_ctrlOffsetGrp|rig_male_character_v003:head_ctrl" 
		"sideGUICtrlVisibility" " -k 1 1"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:neckBase_switch_ctrl_grp|rig_male_character_v003:neckBase_ctrlGrp|rig_male_character_v003:neckBase_ctrlOffsetGrp|rig_male_character_v003:neckBase_ctrl|rig_male_character_v003:neckMid_ctrlGrp|rig_male_character_v003:neckMid_ctrlOffsetGrp|rig_male_character_v003:neckMid_ctrl|rig_male_character_v003:head_ctrlGrp|rig_male_character_v003:head_ctrlOffsetGrp|rig_male_character_v003:head_ctrl" 
		"facialCtrlsVisibility" " -k 1 1"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:neckBase_switch_ctrl_grp|rig_male_character_v003:neckBase_ctrlGrp|rig_male_character_v003:neckBase_ctrlOffsetGrp|rig_male_character_v003:neckBase_ctrl|rig_male_character_v003:neckMid_ctrlGrp|rig_male_character_v003:neckMid_ctrlOffsetGrp|rig_male_character_v003:neckMid_ctrl|rig_male_character_v003:head_ctrlGrp|rig_male_character_v003:head_ctrlOffsetGrp|rig_male_character_v003:head_ctrl|rig_male_character_v003:head_offsetCtrl" 
		"rotate" " -type \"double3\" 9.51562017040420827 0 0"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:rig_setup_grp|rig_male_character_v003:controller_joints_grp|rig_male_character_v003:spine01_jnt" 
		"side" " 0"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:rig_setup_grp|rig_male_character_v003:controller_joints_grp|rig_male_character_v003:spine01_jnt" 
		"type" " 6"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:rig_setup_grp|rig_male_character_v003:controller_joints_grp|rig_male_character_v003:spine03_jnt" 
		"side" " 0"
		2 "|rig_male_character_v003:rig_grp|rig_male_character_v003:rig_setup_grp|rig_male_character_v003:controller_joints_grp|rig_male_character_v003:spine03_jnt" 
		"type" " 6"
		2 "rig_male_character_v003:maleChar" "ReferenceTx" " 0"
		2 "rig_male_character_v003:maleChar" "ReferenceTy" " 0"
		2 "rig_male_character_v003:maleChar" "ReferenceTz" " 0"
		2 "rig_male_character_v003:maleChar" "ReferenceRx" " 0"
		2 "rig_male_character_v003:maleChar" "ReferenceRy" " 0"
		2 "rig_male_character_v003:maleChar" "ReferenceRz" " 0"
		2 "rig_male_character_v003:maleChar" "ReferenceSx" " 1"
		2 "rig_male_character_v003:maleChar" "ReferenceSy" " 1"
		2 "rig_male_character_v003:maleChar" "ReferenceSz" " 1"
		2 "rig_male_character_v003:maleChar" "ReferenceRotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "ReferenceRotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "ReferenceRotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "ReferenceRotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "ReferenceJointOrientx" " 0"
		2 "rig_male_character_v003:maleChar" "ReferenceJointOrienty" " 0"
		2 "rig_male_character_v003:maleChar" "ReferenceJointOrientz" " 0"
		2 "rig_male_character_v003:maleChar" "ReferenceMinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "ReferenceMinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "ReferenceMinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "ReferenceMaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "ReferenceMaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "ReferenceMaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "ReferenceMinRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "ReferenceMinRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "ReferenceMinRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "ReferenceMaxRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "ReferenceMaxRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "ReferenceMaxRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "HipsTx" " -0.32542087974139761"
		2 "rig_male_character_v003:maleChar" "HipsTy" " 100.51792870810767511"
		2 "rig_male_character_v003:maleChar" "HipsTz" " 0.36097235184404419"
		2 "rig_male_character_v003:maleChar" "HipsRx" " 96.46320806164548856"
		2 "rig_male_character_v003:maleChar" "HipsRy" " -19.14923373818584906"
		2 "rig_male_character_v003:maleChar" "HipsRz" " 83.61673312762093246"
		2 "rig_male_character_v003:maleChar" "HipsSx" " 1"
		2 "rig_male_character_v003:maleChar" "HipsSy" " 1.00000000000000022"
		2 "rig_male_character_v003:maleChar" "HipsSz" " 1"
		2 "rig_male_character_v003:maleChar" "HipsRotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "HipsRotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "HipsRotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "HipsRotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "HipsJointOrientx" " 90"
		2 "rig_male_character_v003:maleChar" "HipsJointOrienty" " 0"
		2 "rig_male_character_v003:maleChar" "HipsJointOrientz" " 90"
		2 "rig_male_character_v003:maleChar" "HipsMinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "HipsMinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "HipsMinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "HipsMaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "HipsMaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "HipsMaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "HipsMinRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "HipsMinRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "HipsMinRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "HipsMaxRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "HipsMaxRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "HipsMaxRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "LeftUpLegTx" " 7.27906616496117298"
		
		2 "rig_male_character_v003:maleChar" "LeftUpLegTy" " 97.99186742854654142"
		
		2 "rig_male_character_v003:maleChar" "LeftUpLegTz" " -1.7873349450913103"
		
		2 "rig_male_character_v003:maleChar" "LeftUpLegRx" " 91.40083117607609609"
		
		2 "rig_male_character_v003:maleChar" "LeftUpLegRy" " 14.96432915398987973"
		
		2 "rig_male_character_v003:maleChar" "LeftUpLegRz" " -92.41925031769238785"
		
		2 "rig_male_character_v003:maleChar" "LeftUpLegSx" " 1"
		2 "rig_male_character_v003:maleChar" "LeftUpLegSy" " 1.00000000000000022"
		
		2 "rig_male_character_v003:maleChar" "LeftUpLegSz" " 1"
		2 "rig_male_character_v003:maleChar" "LeftUpLegRotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "LeftUpLegRotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "LeftUpLegRotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "LeftUpLegRotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "LeftUpLegJointOrientx" " 0"
		2 "rig_male_character_v003:maleChar" "LeftUpLegJointOrienty" " 184.8496958952087823"
		
		2 "rig_male_character_v003:maleChar" "LeftUpLegJointOrientz" " 1.95486850579177185"
		
		2 "rig_male_character_v003:maleChar" "LeftUpLegMinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "LeftUpLegMinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "LeftUpLegMinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "LeftUpLegMaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "LeftUpLegMaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "LeftUpLegMaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "LeftUpLegMinRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "LeftUpLegMinRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "LeftUpLegMinRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "LeftUpLegMaxRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "LeftUpLegMaxRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "LeftUpLegMaxRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "LeftLegTx" " 5.59666571948919511"
		2 "rig_male_character_v003:maleChar" "LeftLegTy" " 58.17079077256129693"
		2 "rig_male_character_v003:maleChar" "LeftLegTz" " -12.44028812795543537"
		
		2 "rig_male_character_v003:maleChar" "LeftLegRx" " 91.644773016329097"
		2 "rig_male_character_v003:maleChar" "LeftLegRy" " 39.20379228669234095"
		2 "rig_male_character_v003:maleChar" "LeftLegRz" " -91.71844945108577463"
		
		2 "rig_male_character_v003:maleChar" "LeftLegSx" " 1"
		2 "rig_male_character_v003:maleChar" "LeftLegSy" " 1.00000000000000022"
		2 "rig_male_character_v003:maleChar" "LeftLegSz" " 1"
		2 "rig_male_character_v003:maleChar" "LeftLegRotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "LeftLegRotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "LeftLegRotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "LeftLegRotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "LeftLegJointOrientx" " -0.082794888809287412"
		
		2 "rig_male_character_v003:maleChar" "LeftLegJointOrienty" " -7.1528171297368714e-07"
		
		2 "rig_male_character_v003:maleChar" "LeftLegJointOrientz" " -0.00028661979188568805"
		
		2 "rig_male_character_v003:maleChar" "LeftLegMinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "LeftLegMinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "LeftLegMinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "LeftLegMaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "LeftLegMaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "LeftLegMaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "LeftLegMinRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "LeftLegMinRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "LeftLegMinRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "LeftLegMaxRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "LeftLegMaxRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "LeftLegMaxRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "LeftFootTx" " 4.58329597496615371"
		2 "rig_male_character_v003:maleChar" "LeftFootTy" " 24.39362333078237555"
		
		2 "rig_male_character_v003:maleChar" "LeftFootTz" " -40.00439345826376325"
		
		2 "rig_male_character_v003:maleChar" "LeftFootRx" " 81.71392831850712923"
		
		2 "rig_male_character_v003:maleChar" "LeftFootRy" " -0.55567932880521675"
		
		2 "rig_male_character_v003:maleChar" "LeftFootRz" " -93.91601558670929251"
		
		2 "rig_male_character_v003:maleChar" "LeftFootSx" " 1"
		2 "rig_male_character_v003:maleChar" "LeftFootSy" " 1.00000000000000022"
		2 "rig_male_character_v003:maleChar" "LeftFootSz" " 1.00000000000000022"
		2 "rig_male_character_v003:maleChar" "LeftFootRotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "LeftFootRotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "LeftFootRotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "LeftFootRotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "LeftFootJointOrientx" " -4.18094033061777104"
		
		2 "rig_male_character_v003:maleChar" "LeftFootJointOrienty" " -2.46107426826131626"
		
		2 "rig_male_character_v003:maleChar" "LeftFootJointOrientz" " 60.54538283209589622"
		
		2 "rig_male_character_v003:maleChar" "LeftFootMinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "LeftFootMinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "LeftFootMinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "LeftFootMaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "LeftFootMaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "LeftFootMaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "LeftFootMinRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "LeftFootMinRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "LeftFootMinRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "LeftFootMaxRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "LeftFootMaxRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "LeftFootMaxRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "RightUpLegTx" " -8.49778804012423095"
		
		2 "rig_male_character_v003:maleChar" "RightUpLegTy" " 99.16569754564206107"
		
		2 "rig_male_character_v003:maleChar" "RightUpLegTz" " -0.095447326046883885"
		
		2 "rig_male_character_v003:maleChar" "RightUpLegRx" " -103.80179396488092891"
		
		2 "rig_male_character_v003:maleChar" "RightUpLegRy" " 50.05462441433633103"
		
		2 "rig_male_character_v003:maleChar" "RightUpLegRz" " 82.75930975281745816"
		
		2 "rig_male_character_v003:maleChar" "RightUpLegSx" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "RightUpLegSy" " 1.00000000000000022"
		
		2 "rig_male_character_v003:maleChar" "RightUpLegSz" " 1.00000000000000022"
		
		2 "rig_male_character_v003:maleChar" "RightUpLegRotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "RightUpLegRotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "RightUpLegRotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "RightUpLegRotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "RightUpLegJointOrientx" " 179.99999999999997158"
		
		2 "rig_male_character_v003:maleChar" "RightUpLegJointOrienty" " -4.84969589520880007"
		
		2 "rig_male_character_v003:maleChar" "RightUpLegJointOrientz" " 1.95486850579174254"
		
		2 "rig_male_character_v003:maleChar" "RightUpLegMinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "RightUpLegMinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "RightUpLegMinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "RightUpLegMaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "RightUpLegMaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "RightUpLegMaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "RightUpLegMinRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "RightUpLegMinRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "RightUpLegMinRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "RightUpLegMaxRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "RightUpLegMaxRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "RightUpLegMaxRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "RightLegTx" " -11.8363423449211389"
		
		2 "rig_male_character_v003:maleChar" "RightLegTy" " 72.88841154828411106"
		
		2 "rig_male_character_v003:maleChar" "RightLegTz" " 31.53353186367807126"
		
		2 "rig_male_character_v003:maleChar" "RightLegRx" " -99.58214344278160013"
		
		2 "rig_male_character_v003:maleChar" "RightLegRy" " -22.24471770973116946"
		
		2 "rig_male_character_v003:maleChar" "RightLegRz" " 97.14685450110461318"
		
		2 "rig_male_character_v003:maleChar" "RightLegSx" " 1.00000000000000022"
		2 "rig_male_character_v003:maleChar" "RightLegSy" " 1.00000000000000044"
		2 "rig_male_character_v003:maleChar" "RightLegSz" " 1.00000000000000022"
		2 "rig_male_character_v003:maleChar" "RightLegRotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "RightLegRotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "RightLegRotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "RightLegRotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "RightLegJointOrientx" " -0.082794888809328199"
		
		2 "rig_male_character_v003:maleChar" "RightLegJointOrienty" " -7.1528168742985748e-07"
		
		2 "rig_male_character_v003:maleChar" "RightLegJointOrientz" " -0.00028661979192663771"
		
		2 "rig_male_character_v003:maleChar" "RightLegMinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "RightLegMinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "RightLegMinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "RightLegMaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "RightLegMaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "RightLegMaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "RightLegMinRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "RightLegMinRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "RightLegMinRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "RightLegMaxRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "RightLegMaxRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "RightLegMaxRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "RightFootTx" " -6.8146646547353118"
		
		2 "rig_male_character_v003:maleChar" "RightFootTy" " 32.83902791642427843"
		
		2 "rig_male_character_v003:maleChar" "RightFootTz" " 15.02494363895639395"
		
		2 "rig_male_character_v003:maleChar" "RightFootRx" " -96.31699307140766564"
		
		2 "rig_male_character_v003:maleChar" "RightFootRy" " 37.90848432684963143"
		
		2 "rig_male_character_v003:maleChar" "RightFootRz" " 89.29843871201413208"
		
		2 "rig_male_character_v003:maleChar" "RightFootSx" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "RightFootSy" " 1.00000000000000022"
		
		2 "rig_male_character_v003:maleChar" "RightFootSz" " 1.00000000000000022"
		
		2 "rig_male_character_v003:maleChar" "RightFootRotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "RightFootRotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "RightFootRotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "RightFootRotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "RightFootJointOrientx" " -4.18094033061774883"
		
		2 "rig_male_character_v003:maleChar" "RightFootJointOrienty" " -2.46107426826138243"
		
		2 "rig_male_character_v003:maleChar" "RightFootJointOrientz" " 60.54538283209591043"
		
		2 "rig_male_character_v003:maleChar" "RightFootMinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "RightFootMinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "RightFootMinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "RightFootMaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "RightFootMaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "RightFootMaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "RightFootMinRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "RightFootMinRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "RightFootMinRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "RightFootMaxRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "RightFootMaxRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "RightFootMaxRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "SpineTx" " 0.33539468050002857"
		2 "rig_male_character_v003:maleChar" "SpineTy" " 106.4248046875"
		2 "rig_male_character_v003:maleChar" "SpineTz" " 2.42489302158355713"
		2 "rig_male_character_v003:maleChar" "SpineRx" " 96.46320806164548856"
		2 "rig_male_character_v003:maleChar" "SpineRy" " -19.14923373818584906"
		2 "rig_male_character_v003:maleChar" "SpineRz" " 83.61673312762093246"
		2 "rig_male_character_v003:maleChar" "SpineSx" " 1"
		2 "rig_male_character_v003:maleChar" "SpineSy" " 1.00000000000000022"
		2 "rig_male_character_v003:maleChar" "SpineSz" " 1"
		2 "rig_male_character_v003:maleChar" "SpineRotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "SpineRotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "SpineRotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "SpineRotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "SpineJointOrientx" " 0"
		2 "rig_male_character_v003:maleChar" "SpineJointOrienty" " 0"
		2 "rig_male_character_v003:maleChar" "SpineJointOrientz" " 0"
		2 "rig_male_character_v003:maleChar" "SpineMinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "SpineMinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "SpineMinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "SpineMaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "SpineMaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "SpineMaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "SpineMinRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "SpineMinRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "SpineMinRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "SpineMaxRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "SpineMaxRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "SpineMaxRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "LeftArmTx" " 13.25377249925281298"
		2 "rig_male_character_v003:maleChar" "LeftArmTy" " 144.57262266224961422"
		
		2 "rig_male_character_v003:maleChar" "LeftArmTz" " 20.33307707432372879"
		2 "rig_male_character_v003:maleChar" "LeftArmRx" " -37.85512392859729403"
		
		2 "rig_male_character_v003:maleChar" "LeftArmRy" " -28.38478075697861769"
		
		2 "rig_male_character_v003:maleChar" "LeftArmRz" " -37.30625533993608656"
		
		2 "rig_male_character_v003:maleChar" "LeftArmSx" " 1.00000000000000044"
		2 "rig_male_character_v003:maleChar" "LeftArmSy" " 1.00000000000000067"
		2 "rig_male_character_v003:maleChar" "LeftArmSz" " 1.00000000000000022"
		2 "rig_male_character_v003:maleChar" "LeftArmRotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "LeftArmRotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "LeftArmRotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "LeftArmRotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "LeftArmJointOrientx" " 0"
		2 "rig_male_character_v003:maleChar" "LeftArmJointOrienty" " 44.83643073882608832"
		
		2 "rig_male_character_v003:maleChar" "LeftArmJointOrientz" " -0.18094974751397327"
		
		2 "rig_male_character_v003:maleChar" "LeftArmMinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "LeftArmMinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "LeftArmMinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "LeftArmMaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "LeftArmMaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "LeftArmMaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "LeftArmMinRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "LeftArmMinRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "LeftArmMinRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "LeftArmMaxRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "LeftArmMaxRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "LeftArmMaxRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "LeftForeArmTx" " 32.88655965652542079"
		
		2 "rig_male_character_v003:maleChar" "LeftForeArmTy" " 129.61305916690628237"
		
		2 "rig_male_character_v003:maleChar" "LeftForeArmTz" " 33.67048240759768163"
		
		2 "rig_male_character_v003:maleChar" "LeftForeArmRx" " 40.48838626272746666"
		
		2 "rig_male_character_v003:maleChar" "LeftForeArmRy" " -23.08093228177691003"
		
		2 "rig_male_character_v003:maleChar" "LeftForeArmRz" " -160.69395654017884567"
		
		2 "rig_male_character_v003:maleChar" "LeftForeArmSx" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "LeftForeArmSy" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "LeftForeArmSz" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "LeftForeArmRotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "LeftForeArmRotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "LeftForeArmRotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "LeftForeArmRotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "LeftForeArmJointOrientx" " 0.53487634191207523"
		
		2 "rig_male_character_v003:maleChar" "LeftForeArmJointOrienty" " 0.032083538687130542"
		
		2 "rig_male_character_v003:maleChar" "LeftForeArmJointOrientz" " -3.43256561947285821"
		
		2 "rig_male_character_v003:maleChar" "LeftForeArmMinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "LeftForeArmMinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "LeftForeArmMinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "LeftForeArmMaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "LeftForeArmMaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "LeftForeArmMaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "LeftForeArmMinRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "LeftForeArmMinRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "LeftForeArmMinRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "LeftForeArmMaxRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "LeftForeArmMaxRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "LeftForeArmMaxRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandTx" " 14.43629538227710896"
		
		2 "rig_male_character_v003:maleChar" "LeftHandTy" " 123.14968366230355912"
		
		2 "rig_male_character_v003:maleChar" "LeftHandTz" " 42.00141158412320408"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRx" " 51.8415051303322727"
		2 "rig_male_character_v003:maleChar" "LeftHandRy" " -45.72568632189499027"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRz" " 164.48786138749412089"
		
		2 "rig_male_character_v003:maleChar" "LeftHandSx" " 1.00000000000000067"
		2 "rig_male_character_v003:maleChar" "LeftHandSy" " 1.00000000000000044"
		2 "rig_male_character_v003:maleChar" "LeftHandSz" " 1.00000000000000022"
		2 "rig_male_character_v003:maleChar" "LeftHandRotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandRotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandRotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandRotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandJointOrientx" " -0.6748969202193944"
		
		2 "rig_male_character_v003:maleChar" "LeftHandJointOrienty" " 10.58073408196255549"
		
		2 "rig_male_character_v003:maleChar" "LeftHandJointOrientz" " 3.43710875312097519"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "LeftHandMinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "LeftHandMinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "LeftHandMaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "LeftHandMaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "LeftHandMaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "LeftHandMinRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandMinRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandMinRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandMaxRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandMaxRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandMaxRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "RightArmTx" " -10.0983541529336005"
		
		2 "rig_male_character_v003:maleChar" "RightArmTy" " 148.58754023918427833"
		
		2 "rig_male_character_v003:maleChar" "RightArmTz" " 8.44465691450153066"
		2 "rig_male_character_v003:maleChar" "RightArmRx" " 86.60698934487142253"
		
		2 "rig_male_character_v003:maleChar" "RightArmRy" " -71.12875036720932087"
		
		2 "rig_male_character_v003:maleChar" "RightArmRz" " 53.85547754407264875"
		
		2 "rig_male_character_v003:maleChar" "RightArmSx" " 1.00000000000000022"
		2 "rig_male_character_v003:maleChar" "RightArmSy" " 1.00000000000000022"
		2 "rig_male_character_v003:maleChar" "RightArmSz" " 1.00000000000000044"
		2 "rig_male_character_v003:maleChar" "RightArmRotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "RightArmRotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "RightArmRotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "RightArmRotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "RightArmJointOrientx" " 0"
		2 "rig_male_character_v003:maleChar" "RightArmJointOrienty" " 44.83643073882608121"
		
		2 "rig_male_character_v003:maleChar" "RightArmJointOrientz" " -0.18094974751396925"
		
		2 "rig_male_character_v003:maleChar" "RightArmMinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "RightArmMinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "RightArmMinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "RightArmMaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "RightArmMaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "RightArmMaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "RightArmMinRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "RightArmMinRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "RightArmMinRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "RightArmMaxRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "RightArmMaxRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "RightArmMaxRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "RightForeArmTx" " -15.45065559093648844"
		
		2 "rig_male_character_v003:maleChar" "RightForeArmTy" " 141.25967071506272532"
		
		2 "rig_male_character_v003:maleChar" "RightForeArmTz" " -18.10296915850589272"
		
		2 "rig_male_character_v003:maleChar" "RightForeArmRx" " 88.92805317889178696"
		
		2 "rig_male_character_v003:maleChar" "RightForeArmRy" " 30.48084183399756597"
		
		2 "rig_male_character_v003:maleChar" "RightForeArmRz" " 50.6078572120145509"
		
		2 "rig_male_character_v003:maleChar" "RightForeArmSx" " 1.00000000000000067"
		
		2 "rig_male_character_v003:maleChar" "RightForeArmSy" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "RightForeArmSz" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "RightForeArmRotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "RightForeArmRotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "RightForeArmRotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "RightForeArmRotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "RightForeArmJointOrientx" " 0.53487634191206368"
		
		2 "rig_male_character_v003:maleChar" "RightForeArmJointOrienty" " 0.032083538687146064"
		
		2 "rig_male_character_v003:maleChar" "RightForeArmJointOrientz" " -3.43256561947286354"
		
		2 "rig_male_character_v003:maleChar" "RightForeArmMinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "RightForeArmMinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "RightForeArmMinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "RightForeArmMaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "RightForeArmMaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "RightForeArmMaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "RightForeArmMinRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "RightForeArmMinRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "RightForeArmMinRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "RightForeArmMaxRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "RightForeArmMaxRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "RightForeArmMaxRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandTx" " -27.07305527142079882"
		
		2 "rig_male_character_v003:maleChar" "RightHandTy" " 127.1063730520554742"
		
		2 "rig_male_character_v003:maleChar" "RightHandTz" " -7.32355142948287607"
		
		2 "rig_male_character_v003:maleChar" "RightHandRx" " 109.21950839079477191"
		
		2 "rig_male_character_v003:maleChar" "RightHandRy" " 23.98627435498822891"
		
		2 "rig_male_character_v003:maleChar" "RightHandRz" " 74.86699946833499553"
		
		2 "rig_male_character_v003:maleChar" "RightHandSx" " 1.00000000000000067"
		
		2 "rig_male_character_v003:maleChar" "RightHandSy" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "RightHandSz" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "RightHandRotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandRotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandRotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandRotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandJointOrientx" " -0.67489692021938974"
		
		2 "rig_male_character_v003:maleChar" "RightHandJointOrienty" " 10.58073408196254306"
		
		2 "rig_male_character_v003:maleChar" "RightHandJointOrientz" " 3.43710875312097119"
		
		2 "rig_male_character_v003:maleChar" "RightHandMinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "RightHandMinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "RightHandMinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "RightHandMaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "RightHandMaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "RightHandMaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "RightHandMinRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandMinRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandMinRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandMaxRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandMaxRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandMaxRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "HeadTx" " 1.08415537228558501"
		2 "rig_male_character_v003:maleChar" "HeadTy" " 155.62093564921647726"
		2 "rig_male_character_v003:maleChar" "HeadTz" " 24.91674393938313159"
		2 "rig_male_character_v003:maleChar" "HeadRx" " 97.79165270198980409"
		2 "rig_male_character_v003:maleChar" "HeadRy" " -19.74700116867742139"
		2 "rig_male_character_v003:maleChar" "HeadRz" " 81.24960108538130044"
		2 "rig_male_character_v003:maleChar" "HeadSx" " 1.00000000000000022"
		2 "rig_male_character_v003:maleChar" "HeadSy" " 1.00000000000000044"
		2 "rig_male_character_v003:maleChar" "HeadSz" " 1.00000000000000044"
		2 "rig_male_character_v003:maleChar" "HeadRotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "HeadRotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "HeadRotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "HeadRotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "HeadJointOrientx" " 0"
		2 "rig_male_character_v003:maleChar" "HeadJointOrienty" " 0"
		2 "rig_male_character_v003:maleChar" "HeadJointOrientz" " -12.58434857114797545"
		
		2 "rig_male_character_v003:maleChar" "HeadMinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "HeadMinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "HeadMinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "HeadMaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "HeadMaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "HeadMaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "HeadMinRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "HeadMinRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "HeadMinRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "HeadMaxRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "HeadMaxRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "HeadMaxRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "LeftToeBaseTx" " 3.62913681616282346"
		
		2 "rig_male_character_v003:maleChar" "LeftToeBaseTy" " 10.45493019747859265"
		
		2 "rig_male_character_v003:maleChar" "LeftToeBaseTz" " -39.86888935484046925"
		
		2 "rig_male_character_v003:maleChar" "LeftToeBaseRx" " 80.24998150739311598"
		
		2 "rig_male_character_v003:maleChar" "LeftToeBaseRy" " -31.6833110611183919"
		
		2 "rig_male_character_v003:maleChar" "LeftToeBaseRz" " -88.83968835631814898"
		
		2 "rig_male_character_v003:maleChar" "LeftToeBaseSx" " 1"
		2 "rig_male_character_v003:maleChar" "LeftToeBaseSy" " 1"
		2 "rig_male_character_v003:maleChar" "LeftToeBaseSz" " 1.00000000000000022"
		
		2 "rig_male_character_v003:maleChar" "LeftToeBaseRotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "LeftToeBaseRotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "LeftToeBaseRotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "LeftToeBaseRotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "LeftToeBaseJointOrientx" " 0"
		2 "rig_male_character_v003:maleChar" "LeftToeBaseJointOrienty" " 0"
		2 "rig_male_character_v003:maleChar" "LeftToeBaseJointOrientz" " 31.49611359080594397"
		
		2 "rig_male_character_v003:maleChar" "LeftToeBaseMinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "LeftToeBaseMinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "LeftToeBaseMinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "LeftToeBaseMaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "LeftToeBaseMaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "LeftToeBaseMaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "LeftToeBaseMinRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "LeftToeBaseMinRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "LeftToeBaseMinRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "LeftToeBaseMaxRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "LeftToeBaseMaxRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "LeftToeBaseMaxRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "RightToeBaseTx" " -6.94964265534472503"
		
		2 "rig_male_character_v003:maleChar" "RightToeBaseTy" " 21.81606614550659629"
		
		2 "rig_male_character_v003:maleChar" "RightToeBaseTz" " 23.60935055283351858"
		
		2 "rig_male_character_v003:maleChar" "RightToeBaseRx" " -104.01973806537129974"
		
		2 "rig_male_character_v003:maleChar" "RightToeBaseRy" " 69.00004123559953939"
		
		2 "rig_male_character_v003:maleChar" "RightToeBaseRz" " 80.06739776695117428"
		
		2 "rig_male_character_v003:maleChar" "RightToeBaseSx" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "RightToeBaseSy" " 1.00000000000000022"
		
		2 "rig_male_character_v003:maleChar" "RightToeBaseSz" " 1"
		2 "rig_male_character_v003:maleChar" "RightToeBaseRotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "RightToeBaseRotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "RightToeBaseRotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "RightToeBaseRotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "RightToeBaseJointOrientx" " 0"
		2 "rig_male_character_v003:maleChar" "RightToeBaseJointOrienty" " 0"
		2 "rig_male_character_v003:maleChar" "RightToeBaseJointOrientz" " 31.49611359080592621"
		
		2 "rig_male_character_v003:maleChar" "RightToeBaseMinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "RightToeBaseMinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "RightToeBaseMinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "RightToeBaseMaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "RightToeBaseMaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "RightToeBaseMaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "RightToeBaseMinRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "RightToeBaseMinRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "RightToeBaseMinRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "RightToeBaseMaxRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "RightToeBaseMaxRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "RightToeBaseMaxRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "LeftShoulderTx" " 4.06627962200445481"
		
		2 "rig_male_character_v003:maleChar" "LeftShoulderTy" " 143.61297060585474128"
		
		2 "rig_male_character_v003:maleChar" "LeftShoulderTz" " 13.39305180348422297"
		
		2 "rig_male_character_v003:maleChar" "LeftShoulderRx" " -61.90620510981435132"
		
		2 "rig_male_character_v003:maleChar" "LeftShoulderRy" " -36.9171802702588181"
		
		2 "rig_male_character_v003:maleChar" "LeftShoulderRz" " 5.96303579728572508"
		
		2 "rig_male_character_v003:maleChar" "LeftShoulderSx" " 1.00000000000000022"
		
		2 "rig_male_character_v003:maleChar" "LeftShoulderSy" " 1.00000000000000067"
		
		2 "rig_male_character_v003:maleChar" "LeftShoulderSz" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "LeftShoulderRotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "LeftShoulderRotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "LeftShoulderRotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "LeftShoulderRotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "LeftShoulderJointOrientx" " -167.56418526089871079"
		
		2 "rig_male_character_v003:maleChar" "LeftShoulderJointOrienty" " -90"
		2 "rig_male_character_v003:maleChar" "LeftShoulderJointOrientz" " 0"
		2 "rig_male_character_v003:maleChar" "LeftShoulderMinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "LeftShoulderMinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "LeftShoulderMinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "LeftShoulderMaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "LeftShoulderMaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "LeftShoulderMaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "LeftShoulderMinRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "LeftShoulderMinRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "LeftShoulderMinRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "LeftShoulderMaxRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "LeftShoulderMaxRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "LeftShoulderMaxRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "RightShoulderTx" " -0.56916863665628958"
		
		2 "rig_male_character_v003:maleChar" "RightShoulderTy" " 143.82450850098530282"
		
		2 "rig_male_character_v003:maleChar" "RightShoulderTz" " 12.91713500343642806"
		
		2 "rig_male_character_v003:maleChar" "RightShoulderRx" " 136.80082262785165881"
		
		2 "rig_male_character_v003:maleChar" "RightShoulderRy" " -22.77376851452856954"
		
		2 "rig_male_character_v003:maleChar" "RightShoulderRz" " -26.55754197582512433"
		
		2 "rig_male_character_v003:maleChar" "RightShoulderSx" " 1.00000000000000022"
		
		2 "rig_male_character_v003:maleChar" "RightShoulderSy" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "RightShoulderSz" " 1.00000000000000022"
		
		2 "rig_male_character_v003:maleChar" "RightShoulderRotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "RightShoulderRotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "RightShoulderRotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "RightShoulderRotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "RightShoulderJointOrientx" " 12.43581473910131052"
		
		2 "rig_male_character_v003:maleChar" "RightShoulderJointOrienty" " -90"
		2 "rig_male_character_v003:maleChar" "RightShoulderJointOrientz" " 0"
		2 "rig_male_character_v003:maleChar" "RightShoulderMinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "RightShoulderMinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "RightShoulderMinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "RightShoulderMaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "RightShoulderMaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "RightShoulderMaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "RightShoulderMinRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightShoulderMinRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightShoulderMinRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightShoulderMaxRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightShoulderMaxRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightShoulderMaxRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "NeckTx" " 1.66865632951105303"
		2 "rig_male_character_v003:maleChar" "NeckTy" " 150.0458962636030833"
		2 "rig_male_character_v003:maleChar" "NeckTz" " 16.74564084623631999"
		2 "rig_male_character_v003:maleChar" "NeckRx" " 80.86302038742171305"
		2 "rig_male_character_v003:maleChar" "NeckRy" " -50.02050279571530922"
		2 "rig_male_character_v003:maleChar" "NeckRz" " 94.41312014659895624"
		2 "rig_male_character_v003:maleChar" "NeckSx" " 1.00000000000000022"
		2 "rig_male_character_v003:maleChar" "NeckSy" " 1.00000000000000022"
		2 "rig_male_character_v003:maleChar" "NeckSz" " 1.00000000000000022"
		2 "rig_male_character_v003:maleChar" "NeckRotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "NeckRotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "NeckRotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "NeckRotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "NeckJointOrientx" " 0"
		2 "rig_male_character_v003:maleChar" "NeckJointOrienty" " 0"
		2 "rig_male_character_v003:maleChar" "NeckJointOrientz" " 25.02016331024927709"
		
		2 "rig_male_character_v003:maleChar" "NeckMinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "NeckMinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "NeckMinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "NeckMaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "NeckMaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "NeckMaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "NeckMinRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "NeckMinRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "NeckMinRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "NeckMaxRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "NeckMaxRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "NeckMaxRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "Spine1Tx" " 0.91177099031439168"
		2 "rig_male_character_v003:maleChar" "Spine1Ty" " 110.88668134360538886"
		2 "rig_male_character_v003:maleChar" "Spine1Tz" " 4.70395681169645119"
		2 "rig_male_character_v003:maleChar" "Spine1Rx" " 88.76492373568800076"
		2 "rig_male_character_v003:maleChar" "Spine1Ry" " -29.99986827269672318"
		2 "rig_male_character_v003:maleChar" "Spine1Rz" " 87.33865391079061169"
		2 "rig_male_character_v003:maleChar" "Spine1Sx" " 0.99999999999999989"
		2 "rig_male_character_v003:maleChar" "Spine1Sy" " 1"
		2 "rig_male_character_v003:maleChar" "Spine1Sz" " 0.99999999999999989"
		2 "rig_male_character_v003:maleChar" "Spine1RotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "Spine1RotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "Spine1RotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "Spine1RotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "Spine1JointOrientx" " 90"
		2 "rig_male_character_v003:maleChar" "Spine1JointOrienty" " -6.31679171459102751"
		
		2 "rig_male_character_v003:maleChar" "Spine1JointOrientz" " 90"
		2 "rig_male_character_v003:maleChar" "Spine1MinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "Spine1MinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "Spine1MinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "Spine1MaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "Spine1MaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "Spine1MaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "Spine1MinRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "Spine1MinRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "Spine1MinRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "Spine1MaxRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "Spine1MaxRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "Spine1MaxRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "Spine2Tx" " 1.08769832432692182"
		2 "rig_male_character_v003:maleChar" "Spine2Ty" " 114.40398600949085051"
		2 "rig_male_character_v003:maleChar" "Spine2Tz" " 6.56189885685040597"
		2 "rig_male_character_v003:maleChar" "Spine2Rx" " 83.52396806671681873"
		2 "rig_male_character_v003:maleChar" "Spine2Ry" " -25.23124261308570127"
		2 "rig_male_character_v003:maleChar" "Spine2Rz" " 90.15734015068217388"
		2 "rig_male_character_v003:maleChar" "Spine2Sx" " 1"
		2 "rig_male_character_v003:maleChar" "Spine2Sy" " 1.00000000000000022"
		2 "rig_male_character_v003:maleChar" "Spine2Sz" " 1.00000000000000022"
		2 "rig_male_character_v003:maleChar" "Spine2RotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "Spine2RotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "Spine2RotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "Spine2RotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "Spine2JointOrientx" " 0"
		2 "rig_male_character_v003:maleChar" "Spine2JointOrienty" " 0"
		2 "rig_male_character_v003:maleChar" "Spine2JointOrientz" " -0.24527307594769346"
		
		2 "rig_male_character_v003:maleChar" "Spine2MinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "Spine2MinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "Spine2MinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "Spine2MaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "Spine2MaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "Spine2MaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "Spine2MinRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "Spine2MinRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "Spine2MinRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "Spine2MaxRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "Spine2MaxRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "Spine2MaxRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "Spine3Tx" " 1.05349382380361445"
		2 "rig_male_character_v003:maleChar" "Spine3Ty" " 117.91902304087652453"
		2 "rig_male_character_v003:maleChar" "Spine3Tz" " 8.45743338562469482"
		2 "rig_male_character_v003:maleChar" "Spine3Rx" " 83.88211439839909644"
		2 "rig_male_character_v003:maleChar" "Spine3Ry" " -16.79770338111095285"
		2 "rig_male_character_v003:maleChar" "Spine3Rz" " 89.16134112454525962"
		2 "rig_male_character_v003:maleChar" "Spine3Sx" " 1"
		2 "rig_male_character_v003:maleChar" "Spine3Sy" " 1"
		2 "rig_male_character_v003:maleChar" "Spine3Sz" " 1"
		2 "rig_male_character_v003:maleChar" "Spine3RotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "Spine3RotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "Spine3RotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "Spine3RotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "Spine3JointOrientx" " 90"
		2 "rig_male_character_v003:maleChar" "Spine3JointOrienty" " 9.6898245593669543"
		
		2 "rig_male_character_v003:maleChar" "Spine3JointOrientz" " 90"
		2 "rig_male_character_v003:maleChar" "Spine3MinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "Spine3MinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "Spine3MinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "Spine3MaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "Spine3MaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "Spine3MaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "Spine3MinRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "Spine3MinRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "Spine3MinRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "Spine3MaxRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "Spine3MaxRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "Spine3MaxRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "Spine4Tx" " 1.12099580816885958"
		2 "rig_male_character_v003:maleChar" "Spine4Ty" " 122.53031698840925401"
		2 "rig_male_character_v003:maleChar" "Spine4Tz" " 9.84961256387757977"
		2 "rig_male_character_v003:maleChar" "Spine4Rx" " 83.96238984514974391"
		2 "rig_male_character_v003:maleChar" "Spine4Ry" " -14.06714150165452537"
		2 "rig_male_character_v003:maleChar" "Spine4Rz" " 88.85975528465031914"
		2 "rig_male_character_v003:maleChar" "Spine4Sx" " 1.00000000000000022"
		2 "rig_male_character_v003:maleChar" "Spine4Sy" " 1.00000000000000044"
		2 "rig_male_character_v003:maleChar" "Spine4Sz" " 1.00000000000000022"
		2 "rig_male_character_v003:maleChar" "Spine4RotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "Spine4RotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "Spine4RotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "Spine4RotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "Spine4JointOrientx" " 0"
		2 "rig_male_character_v003:maleChar" "Spine4JointOrienty" " 0"
		2 "rig_male_character_v003:maleChar" "Spine4JointOrientz" " -11.2304920509570394"
		
		2 "rig_male_character_v003:maleChar" "Spine4MinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "Spine4MinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "Spine4MinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "Spine4MaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "Spine4MaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "Spine4MaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "Spine4MinRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "Spine4MinRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "Spine4MinRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "Spine4MaxRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "Spine4MaxRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "Spine4MaxRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "Neck1Tx" " 1.42252714999485552"
		2 "rig_male_character_v003:maleChar" "Neck1Ty" " 153.23508308037523307"
		2 "rig_male_character_v003:maleChar" "Neck1Tz" " 20.56043921942260511"
		2 "rig_male_character_v003:maleChar" "Neck1Rx" " 77.831937308236121"
		2 "rig_male_character_v003:maleChar" "Neck1Ry" " -61.05044413038119444"
		2 "rig_male_character_v003:maleChar" "Neck1Rz" " 98.07209781713936536"
		2 "rig_male_character_v003:maleChar" "Neck1Sx" " 1.00000000000000022"
		2 "rig_male_character_v003:maleChar" "Neck1Sy" " 1.00000000000000022"
		2 "rig_male_character_v003:maleChar" "Neck1Sz" " 1.00000000000000022"
		2 "rig_male_character_v003:maleChar" "Neck1RotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "Neck1RotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "Neck1RotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "Neck1RotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "Neck1JointOrientx" " 0"
		2 "rig_male_character_v003:maleChar" "Neck1JointOrienty" " 0"
		2 "rig_male_character_v003:maleChar" "Neck1JointOrientz" " 0"
		2 "rig_male_character_v003:maleChar" "Neck1MinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "Neck1MinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "Neck1MinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "Neck1MaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "Neck1MaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "Neck1MaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "Neck1MinRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "Neck1MinRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "Neck1MinRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "Neck1MaxRLimitEnablex" " 0"
		2 "rig_male_character_v003:maleChar" "Neck1MaxRLimitEnabley" " 0"
		2 "rig_male_character_v003:maleChar" "Neck1MaxRLimitEnablez" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandThumb1Tx" " 10.98766104234583985"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb1Ty" " 124.91420613503504455"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb1Tz" " 42.42123979597878503"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb1Rx" " -131.2951355993413074"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb1Ry" " -10.74952706638948996"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb1Rz" " 162.59923046429236138"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb1Sx" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb1Sy" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb1Sz" " 1"
		2 "rig_male_character_v003:maleChar" "LeftHandThumb1RotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandThumb1RotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandThumb1RotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandThumb1RotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandThumb1JointOrientx" " 161.64949722421883394"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb1JointOrienty" " 27.79080955741854453"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb1JointOrientz" " -38.79052348456320942"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb1MinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "LeftHandThumb1MinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "LeftHandThumb1MinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "LeftHandThumb1MaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "LeftHandThumb1MaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "LeftHandThumb1MaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "LeftHandThumb1MinRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb1MinRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb1MinRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb1MaxRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb1MaxRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb1MaxRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb2Tx" " 6.47594635111135286"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb2Ty" " 126.32815836282001953"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb2Tz" " 43.31885520234317255"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb2Rx" " -119.40110844378244792"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb2Ry" " -28.9304439838405294"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb2Rz" " 169.52818370423855754"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb2Sx" " 1.00000000000000067"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb2Sy" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb2Sz" " 1"
		2 "rig_male_character_v003:maleChar" "LeftHandThumb2RotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandThumb2RotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandThumb2RotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandThumb2RotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandThumb2JointOrientx" " 13.60998418704468271"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb2JointOrienty" " 6.35358095937291267"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb2JointOrientz" " -13.82392659055594031"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb2MinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "LeftHandThumb2MinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "LeftHandThumb2MinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "LeftHandThumb2MaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "LeftHandThumb2MaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "LeftHandThumb2MaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "LeftHandThumb2MinRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb2MinRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb2MinRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb2MaxRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb2MaxRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb2MaxRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb3Tx" " 2.95474319053970769"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb3Ty" " 126.97898338473750357"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb3Tz" " 45.29807059595648866"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb3Rx" " -121.6751038076407383"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb3Ry" " -38.90991411678081136"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb3Rz" " 171.68554169234039364"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb3Sx" " 1.00000000000000089"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb3Sy" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb3Sz" " 1"
		2 "rig_male_character_v003:maleChar" "LeftHandThumb3RotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandThumb3RotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandThumb3RotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandThumb3RotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandThumb3JointOrientx" " -1.08418697368326544"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb3JointOrienty" " 3.51545274647804096"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb3JointOrientz" " -5.13573296835223747"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb3MinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "LeftHandThumb3MinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "LeftHandThumb3MinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "LeftHandThumb3MaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "LeftHandThumb3MaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "LeftHandThumb3MaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "LeftHandThumb3MinRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb3MinRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb3MinRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb3MaxRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb3MaxRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandThumb3MaxRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex1Tx" " 5.79454044915792288"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex1Ty" " 127.62827040767562892"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex1Tz" " 48.13231365961763686"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex1Rx" " 130.37871452330352895"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex1Ry" " -38.74191231913492572"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex1Rz" " -175.87554398264694555"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex1Sx" " 1.00000000000000067"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex1Sy" " 1.00000000000000022"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex1Sz" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex1RotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandIndex1RotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandIndex1RotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandIndex1RotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandIndex1JointOrientx" " 87.77227743642671953"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex1JointOrienty" " 9.66822844795767367"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex1JointOrientz" " -6.9932093921640508"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex1MinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "LeftHandIndex1MinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "LeftHandIndex1MinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "LeftHandIndex1MaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "LeftHandIndex1MaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "LeftHandIndex1MaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "LeftHandIndex1MinRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex1MinRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex1MinRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex1MaxRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex1MaxRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex1MaxRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex2Tx" " 2.96353319999976339"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex2Ty" " 127.42412665717365883"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex2Tz" " 50.4096782197345803"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex2Rx" " 123.65724498242244067"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex2Ry" " -28.7773471152597935"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex2Rz" " -164.289671796601084"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex2Sx" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex2Sy" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex2Sz" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex2RotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandIndex2RotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandIndex2RotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandIndex2RotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandIndex2JointOrientx" " -0.071308192615708976"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex2JointOrienty" " 1.73208173134499943"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex2JointOrientz" " -1.20793002937403648"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex2MinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "LeftHandIndex2MinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "LeftHandIndex2MinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "LeftHandIndex2MaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "LeftHandIndex2MaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "LeftHandIndex2MaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "LeftHandIndex2MinRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex2MinRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex2MinRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex2MaxRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex2MaxRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex2MaxRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex3Tx" " 0.69589125755959014"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex3Ty" " 126.78628016693365055"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex3Tz" " 51.70349067806087362"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex3Rx" " 121.28271327334748264"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex3Ry" " -19.66032571830097098"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex3Rz" " -158.41481708195900069"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex3Sx" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex3Sy" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex3Sz" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex3RotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandIndex3RotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandIndex3RotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandIndex3RotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandIndex3JointOrientx" " 0.0025176383989601067"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex3JointOrienty" " -0.36744088109860906"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex3JointOrientz" " 1.31067960833133212"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex3MinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "LeftHandIndex3MinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "LeftHandIndex3MinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "LeftHandIndex3MaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "LeftHandIndex3MaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "LeftHandIndex3MaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "LeftHandIndex3MinRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex3MinRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex3MinRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex3MaxRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex3MaxRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandIndex3MaxRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle1Tx" " 6.75797373555383629"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle1Ty" " 126.02534870307165704"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle1Tz" " 49.70793022781550974"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle1Rx" " 129.70778410684098958"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle1Ry" " -34.38079157674292929"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle1Rz" " -176.81457647296485902"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle1Sx" " 1.00000000000000067"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle1Sy" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle1Sz" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle1RotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle1RotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle1RotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle1RotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle1JointOrientx" " 90"
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle1JointOrienty" " 3.25877605748199972"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle1JointOrientz" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle1MinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle1MinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle1MinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle1MaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle1MaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle1MaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle1MinRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle1MinRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle1MinRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle1MaxRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle1MaxRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle1MaxRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle2Tx" " 3.43879142342181998"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle2Ty" " 125.84062466832058647"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle2Tz" " 51.98250206044713195"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle2Rx" " 121.93794072596953981"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle2Ry" " -4.64469715745767786"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle2Rz" " -154.58031793572573065"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle2Sx" " 1.00000000000000022"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle2Sy" " 1.00000000000000089"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle2Sz" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle2RotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle2RotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle2RotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle2RotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle2JointOrientx" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle2JointOrienty" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle2JointOrientz" " -11.81373630715679113"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle2MinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle2MinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle2MinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle2MaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle2MaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle2MaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle2MinRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle2MinRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle2MinRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle2MaxRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle2MaxRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle2MaxRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle3Tx" " 0.65212724701155045"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle3Ty" " 124.51624594973297633"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle3Tz" " 52.23316728269811193"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle3Rx" " 122.8566971429836201"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle3Ry" " 13.62884362776883407"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle3Rz" " -143.03747965507781714"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle3Sx" " 1.00000000000000022"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle3Sy" " 1.00000000000000111"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle3Sz" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle3RotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle3RotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle3RotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle3RotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle3JointOrientx" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle3JointOrienty" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle3JointOrientz" " 5.0570713670817975"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle3MinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle3MinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle3MinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle3MaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle3MaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle3MaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle3MinRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle3MinRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle3MinRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle3MaxRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle3MaxRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandMiddle3MaxRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing1Tx" " 8.16106918662037373"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing1Ty" " 123.65838726582479978"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing1Tz" " 50.21912408424787344"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing1Rx" " 116.53495616329416862"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing1Ry" " -30.29784376236765908"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing1Rz" " 179.93834584147845135"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing1Sx" " 1.00000000000000067"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing1Sy" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing1Sz" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing1RotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandRing1RotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandRing1RotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandRing1RotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandRing1JointOrientx" " 90.16593166073884902"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing1JointOrienty" " 3.20240225819697466"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing1JointOrientz" " 3.53804041125453583"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing1MinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "LeftHandRing1MinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "LeftHandRing1MinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "LeftHandRing1MaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "LeftHandRing1MaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "LeftHandRing1MaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "LeftHandRing1MinRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing1MinRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing1MinRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing1MaxRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing1MaxRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing1MaxRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing2Tx" " 4.52797460924564454"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing2Ty" " 123.66229672438100806"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing2Tz" " 52.3419509614942271"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing2Rx" " 112.74314852182340019"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing2Ry" " 3.85687061357128469"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing2Rz" " -164.30699533130601253"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing2Sx" " 1.00000000000000022"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing2Sy" " 1.00000000000000067"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing2Sz" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing2RotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandRing2RotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandRing2RotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandRing2RotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandRing2JointOrientx" " 4.2583566242640734e-07"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing2JointOrienty" " -1.0834436464359494e-05"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing2JointOrientz" " -7.50720606304790206"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing2MinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "LeftHandRing2MinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "LeftHandRing2MinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "LeftHandRing2MaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "LeftHandRing2MaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "LeftHandRing2MaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "LeftHandRing2MinRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing2MinRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing2MinRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing2MaxRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing2MaxRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing2MaxRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing3Tx" " 2.2838670167760351"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing3Ty" " 123.03180215262511865"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing3Tz" " 52.1848023190268222"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing3Rx" " 115.73789405550975573"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing3Ry" " 27.34636577515965428"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing3Rz" " -153.43528428533934971"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing3Sx" " 1.00000000000000022"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing3Sy" " 1.00000000000000089"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing3Sz" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing3RotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandRing3RotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandRing3RotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandRing3RotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandRing3JointOrientx" " 4.5733491615985934e-07"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing3JointOrienty" " 1.3550993681441293e-05"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing3JointOrientz" " 0.23740373232323425"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing3MinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "LeftHandRing3MinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "LeftHandRing3MinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "LeftHandRing3MaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "LeftHandRing3MaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "LeftHandRing3MaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "LeftHandRing3MinRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing3MinRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing3MinRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing3MaxRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing3MaxRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandRing3MaxRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky1Tx" " 9.2059995435450066"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky1Ty" " 121.60268370214471645"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky1Tz" " 50.84638081072223059"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky1Rx" " 113.0497631793758444"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky1Ry" " -22.78995295547447242"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky1Rz" " 179.42865710238538668"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky1Sx" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky1Sy" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky1Sz" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky1RotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandPinky1RotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandPinky1RotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandPinky1RotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandPinky1JointOrientx" " 89.99990457087361051"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky1JointOrienty" " 6.41127656165067439"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky1JointOrientz" " 5.16534559157238427"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky1MinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "LeftHandPinky1MinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "LeftHandPinky1MinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "LeftHandPinky1MaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "LeftHandPinky1MaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "LeftHandPinky1MaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "LeftHandPinky1MinRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky1MinRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky1MinRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky1MaxRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky1MaxRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky1MaxRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky2Tx" " 6.37748523369874931"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky2Ty" " 121.63089005770443407"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky2Tz" " 52.03485424044072261"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky2Rx" " 113.80513281372364531"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky2Ry" " 0.36682435524000762"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky2Rz" " -169.52161568173838191"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky2Sx" " 1.00000000000000022"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky2Sy" " 1.00000000000000067"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky2Sz" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky2RotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandPinky2RotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandPinky2RotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandPinky2RotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandPinky2JointOrientx" " 2.99857624596256533"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky2JointOrienty" " 0.0027330989826123524"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky2JointOrientz" " 3.21755720552598312"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky2MinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "LeftHandPinky2MinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "LeftHandPinky2MinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "LeftHandPinky2MaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "LeftHandPinky2MaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "LeftHandPinky2MaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "LeftHandPinky2MinRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky2MinRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky2MinRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky2MaxRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky2MaxRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky2MaxRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky3Tx" " 4.4157542804578469"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky3Ty" " 121.26807017757793972"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky3Tz" " 52.02208148927297771"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky3Rx" " 119.15511324609889243"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky3Ry" " 34.05631023247601519"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky3Rz" " -152.33453953268360692"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky3Sx" " 1.00000000000000022"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky3Sy" " 1.00000000000000089"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky3Sz" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky3RotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandPinky3RotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandPinky3RotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandPinky3RotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "LeftHandPinky3JointOrientx" " 3.7987777727069915e-07"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky3JointOrienty" " -8.670964107127542e-06"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky3JointOrientz" " -3.77528526456964153"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky3MinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "LeftHandPinky3MinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "LeftHandPinky3MinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "LeftHandPinky3MaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "LeftHandPinky3MaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "LeftHandPinky3MaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "LeftHandPinky3MinRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky3MinRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky3MinRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky3MaxRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky3MaxRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeftHandPinky3MaxRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb1Tx" " -26.00235680325526388"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb1Ty" " 124.85117753460541223"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb1Tz" " -4.33180076087114685"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb1Rx" " 59.7593613894310991"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb1Ry" " -38.5929457034798773"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb1Rz" " -73.48652543072206811"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb1Sx" " 1.00000000000000067"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb1Sy" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb1Sz" " 1.00000000000000067"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb1RotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandThumb1RotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandThumb1RotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandThumb1RotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandThumb1JointOrientx" " -161.64949722421883394"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb1JointOrienty" " -27.79080955741849834"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb1JointOrientz" " 141.20947651543679058"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb1MinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "RightHandThumb1MinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "RightHandThumb1MinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "RightHandThumb1MaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "RightHandThumb1MaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "RightHandThumb1MaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "RightHandThumb1MinRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb1MinRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb1MinRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb1MaxRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb1MaxRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb1MaxRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb2Tx" " -24.9331939186971141"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb2Ty" " 121.24485876686362928"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb2Tz" " -1.32981817480931319"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb2Rx" " 55.30816068962929677"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb2Ry" " -23.53934929412357491"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb2Rz" " -92.12190579176001393"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb2Sx" " 1.00000000000000089"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb2Sy" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb2Sz" " 1.00000000000000067"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb2RotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandThumb2RotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandThumb2RotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandThumb2RotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandThumb2JointOrientx" " -13.60998418704468627"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb2JointOrienty" " -6.35358095937288514"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb2JointOrientz" " -13.82392659055600781"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb2MinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "RightHandThumb2MinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "RightHandThumb2MinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "RightHandThumb2MaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "RightHandThumb2MaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "RightHandThumb2MaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "RightHandThumb2MinRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb2MinRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb2MinRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb2MaxRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb2MaxRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb2MaxRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb3Tx" " -25.0720760897260142"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb3Ty" " 117.49647181497560666"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb3Tz" " 0.3042092065326385"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb3Rx" " 59.87883241711256233"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb3Ry" " -14.61476248687479185"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb3Rz" " -102.47382320033950975"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb3Sx" " 1.00000000000000089"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb3Sy" " 1.00000000000000067"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb3Sz" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb3RotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandThumb3RotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandThumb3RotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandThumb3RotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandThumb3JointOrientx" " 1.08418697368327477"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb3JointOrienty" " -3.51545274647811157"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb3JointOrientz" " -5.13573296835224991"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb3MinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "RightHandThumb3MinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "RightHandThumb3MinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "RightHandThumb3MaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "RightHandThumb3MaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "RightHandThumb3MaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "RightHandThumb3MinRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb3MinRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb3MinRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb3MaxRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb3MaxRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandThumb3MaxRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex1Tx" " -28.35961575677845303"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex1Ty" " 118.29385620656296396"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex1Tz" " -0.042759111016359874"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex1Rx" " 157.79105306277685372"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex1Ry" " -14.95163603198990643"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex1Rz" " -96.13830997440875592"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex1Sx" " 1.00000000000000089"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex1Sy" " 1.00000000000000067"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex1Sz" " 1.00000000000000067"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex1RotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandIndex1RotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandIndex1RotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandIndex1RotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandIndex1JointOrientx" " -87.77227742811605538"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex1JointOrienty" " -9.66822892822446534"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex1JointOrientz" " 173.00679058888411532"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex1MinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "RightHandIndex1MinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "RightHandIndex1MinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "RightHandIndex1MaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "RightHandIndex1MaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "RightHandIndex1MaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "RightHandIndex1MinRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex1MinRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex1MinRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex1MaxRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex1MaxRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex1MaxRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex2Tx" " -28.7355610680527036"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex2Ty" " 114.79817005060726842"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex2Tz" " 0.89612825034433219"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex2Rx" " 155.98807398365326549"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex2Ry" " -9.05259504747629151"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex2Rz" " -86.53582817488440071"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex2Sx" " 1.00000000000000067"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex2Sy" " 1.00000000000000089"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex2Sz" " 1.00000000000000067"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex2RotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandIndex2RotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandIndex2RotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandIndex2RotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandIndex2JointOrientx" " 0.071308187486652894"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex2JointOrienty" " -1.73208173145292998"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex2JointOrientz" " -1.20792954858895873"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex2MinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "RightHandIndex2MinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "RightHandIndex2MinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "RightHandIndex2MaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "RightHandIndex2MaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "RightHandIndex2MaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "RightHandIndex2MinRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex2MinRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex2MinRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex2MaxRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex2MaxRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex2MaxRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex3Tx" " -28.5751894425298687"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex3Ty" " 112.14893135102011001"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex3Tz" " 1.31899236076526538"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex3Rx" " 154.97076311619670719"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex3Ry" " -6.08953380871995709"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex3Rz" " -79.10354499858122779"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex3Sx" " 1.00000000000000067"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex3Sy" " 1.00000000000000089"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex3Sz" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex3RotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandIndex3RotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandIndex3RotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandIndex3RotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandIndex3JointOrientx" " -0.0025176383989956893"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex3JointOrienty" " 0.36744088109852469"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex3JointOrientz" " 1.31067960833138142"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex3MinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "RightHandIndex3MinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "RightHandIndex3MinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "RightHandIndex3MaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "RightHandIndex3MaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "RightHandIndex3MaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "RightHandIndex3MinRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex3MinRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex3MinRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex3MaxRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex3MaxRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandIndex3MaxRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle1Tx" " -29.65086570405165034"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle1Ty" " 117.54519103375567113"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle1Tz" " -1.97984540003351661"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle1Rx" " 154.70291382827531379"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle1Ry" " -14.62994907103770004"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle1Rz" " -86.94937509958293731"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle1Sx" " 1.00000000000000067"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle1Sy" " 1.00000000000000067"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle1Sz" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle1RotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandMiddle1RotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandMiddle1RotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandMiddle1RotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandMiddle1JointOrientx" " 90"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle1JointOrienty" " 183.25877605748200949"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle1JointOrientz" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandMiddle1MinRLimitx" " -360"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle1MinRLimity" " -360"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle1MinRLimitz" " -360"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle1MaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "RightHandMiddle1MaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "RightHandMiddle1MaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "RightHandMiddle1MinRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle1MinRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle1MinRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle1MaxRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle1MaxRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle1MaxRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle2Tx" " -29.44345273085648174"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle2Ty" " 113.65331428512226353"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle2Tz" " -0.96247307684837735"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle2Rx" " 151.10983841515903237"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle2Ry" " 2.382330212606107"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle2Rz" " -54.52149682139869924"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle2Sx" " 1.00000000000000067"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle2Sy" " 1.00000000000000089"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle2Sz" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle2RotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandMiddle2RotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandMiddle2RotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandMiddle2RotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandMiddle2JointOrientx" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandMiddle2JointOrienty" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandMiddle2JointOrientz" " -11.8137363071567556"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle2MinRLimitx" " -360"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle2MinRLimity" " -360"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle2MinRLimitz" " -360"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle2MaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "RightHandMiddle2MaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "RightHandMiddle2MaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "RightHandMiddle2MinRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle2MinRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle2MinRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle2MaxRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle2MaxRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle2MaxRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle3Tx" " -27.64836749211169575"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle3Ty" " 111.1346993125666387"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle3Tz" " -1.09114662362916404"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle3Rx" " 153.56947879561730019"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle3Ry" " 12.33865755886490057"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle3Rz" " -35.56660005359305643"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle3Sx" " 1.00000000000000067"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle3Sy" " 1.00000000000000089"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle3Sz" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle3RotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandMiddle3RotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandMiddle3RotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandMiddle3RotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandMiddle3JointOrientx" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandMiddle3JointOrienty" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandMiddle3JointOrientz" " 5.0570713670817744"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle3MinRLimitx" " -360"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle3MinRLimity" " -360"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle3MinRLimitz" " -360"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle3MaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "RightHandMiddle3MaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "RightHandMiddle3MaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "RightHandMiddle3MinRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle3MinRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle3MinRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle3MaxRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle3MaxRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandMiddle3MaxRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing1Tx" " -30.13377893572383925"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing1Ty" " 117.56137042951110061"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing1Tz" " -4.7364802120643672"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing1Rx" " 168.00904048242045974"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing1Ry" " -17.31353198393632198"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing1Rz" " -80.43260147794138959"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing1Sx" " 1.00000000000000089"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing1Sy" " 1.00000000000000067"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing1Sz" " 1.00000000000000089"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing1RotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandRing1RotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandRing1RotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandRing1RotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandRing1JointOrientx" " -90.16593166073884902"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing1JointOrienty" " -3.20240225819697732"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing1JointOrientz" " -176.46195958874542953"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing1MinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "RightHandRing1MinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "RightHandRing1MinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "RightHandRing1MaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "RightHandRing1MaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "RightHandRing1MaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "RightHandRing1MinRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing1MinRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing1MinRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing1MaxRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing1MaxRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing1MaxRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing2Tx" " -29.46609439962155719"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing2Ty" " 113.60007611124575533"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing2Tz" " -3.48423018626912029"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing2Rx" " 159.66959163696265023"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing2Ry" " -5.19051159407227658"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing2Rz" " -39.66859716119552104"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing2Sx" " 1.00000000000000067"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing2Sy" " 1.00000000000000111"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing2Sz" " 1.00000000000000089"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing2RotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandRing2RotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandRing2RotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandRing2RotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandRing2JointOrientx" " -4.2583566530878491e-07"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing2JointOrienty" " 1.0834436588401121e-05"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing2JointOrientz" " -7.50720606304792337"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing2MinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "RightHandRing2MinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "RightHandRing2MinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "RightHandRing2MaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "RightHandRing2MaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "RightHandRing2MaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "RightHandRing2MinRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing2MinRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing2MinRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing2MaxRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing2MaxRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing2MaxRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing3Tx" " -27.67511274040250058"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing3Ty" " 112.11483192332275394"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing3Tz" " -3.27287175609815506"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing3Rx" " 159.74353411816917969"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing3Ry" " 5.48319322440033652"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing3Rz" " -11.43110768181259473"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing3Sx" " 1.00000000000000067"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing3Sy" " 1.00000000000000111"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing3Sz" " 1.00000000000000089"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing3RotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandRing3RotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandRing3RotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandRing3RotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandRing3JointOrientx" " -4.5733491725317521e-07"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing3JointOrienty" " -1.3550993778050644e-05"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing3JointOrientz" " 0.23740373232327577"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing3MinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "RightHandRing3MinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "RightHandRing3MinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "RightHandRing3MaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "RightHandRing3MaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "RightHandRing3MaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "RightHandRing3MinRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing3MinRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing3MinRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing3MaxRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing3MaxRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandRing3MaxRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky1Tx" " -30.59941819550173037"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky1Ty" " 117.33483681217961703"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky1Tz" " -7.06952761694693255"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky1Rx" " 169.08628797146508305"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky1Ry" " -18.95517298513086857"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky1Rz" " -69.94598034129890607"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky1Sx" " 1.00000000000000067"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky1Sy" " 1.00000000000000067"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky1Sz" " 1.00000000000000067"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky1RotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandPinky1RotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandPinky1RotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandPinky1RotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandPinky1JointOrientx" " -89.99990457087341156"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky1JointOrienty" " -6.41127656165066551"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky1JointOrientz" " -174.83465440842761041"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky1MinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "RightHandPinky1MinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "RightHandPinky1MinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "RightHandPinky1MaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "RightHandPinky1MaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "RightHandPinky1MaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "RightHandPinky1MinRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky1MinRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky1MinRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky1MaxRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky1MaxRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky1MaxRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky2Tx" " -29.60437152584874454"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky2Ty" " 114.60896774357036065"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky2Tz" " -6.07289436511474978"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky2Rx" " 159.18094066125019026"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky2Ry" " -10.514327470604103"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky2Rz" " -43.14897821960865798"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky2Sx" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky2Sy" " 1.00000000000000067"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky2Sz" " 1.00000000000000067"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky2RotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandPinky2RotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandPinky2RotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandPinky2RotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandPinky2JointOrientx" " -2.99857624596274208"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky2JointOrienty" " -0.0027330989826147372"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky2JointOrientz" " 3.21755720552598801"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky2MinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "RightHandPinky2MinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "RightHandPinky2MinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "RightHandPinky2MaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "RightHandPinky2MaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "RightHandPinky2MaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "RightHandPinky2MinRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky2MinRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky2MinRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky2MaxRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky2MaxRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky2MaxRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky3Tx" " -28.17327293373134012"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky3Ty" " 113.2674729074397959"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky3Tz" " -5.70883644971478432"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky3Rx" " 157.12563181184296468"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky3Ry" " 4.08985032864914633"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky3Rz" " -7.91721034571892357"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky3Sx" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky3Sy" " 1.00000000000000067"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky3Sz" " 1.00000000000000067"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky3RotateOrder" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandPinky3RotateAxisx" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandPinky3RotateAxisy" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandPinky3RotateAxisz" " 0"
		2 "rig_male_character_v003:maleChar" "RightHandPinky3JointOrientx" " -3.7987781344950862e-07"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky3JointOrienty" " 8.6709639528706399e-06"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky3JointOrientz" " -3.77528526456963132"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky3MinRLimitx" " -360"
		2 "rig_male_character_v003:maleChar" "RightHandPinky3MinRLimity" " -360"
		2 "rig_male_character_v003:maleChar" "RightHandPinky3MinRLimitz" " -360"
		2 "rig_male_character_v003:maleChar" "RightHandPinky3MaxRLimitx" " 360"
		2 "rig_male_character_v003:maleChar" "RightHandPinky3MaxRLimity" " 360"
		2 "rig_male_character_v003:maleChar" "RightHandPinky3MaxRLimitz" " 360"
		2 "rig_male_character_v003:maleChar" "RightHandPinky3MinRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky3MinRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky3MinRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky3MaxRLimitEnablex" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky3MaxRLimitEnabley" " 0"
		
		2 "rig_male_character_v003:maleChar" "RightHandPinky3MaxRLimitEnablez" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeafLeftForeArmRoll3Tx" " 23.66142751940125066"
		
		2 "rig_male_character_v003:maleChar" "LeafLeftForeArmRoll3Ty" " 126.38137141460491364"
		
		2 "rig_male_character_v003:maleChar" "LeafLeftForeArmRoll3Tz" " 37.8359469958604393"
		
		2 "rig_male_character_v003:maleChar" "LeafLeftForeArmRoll3Rx" " 41.38386706708556062"
		
		2 "rig_male_character_v003:maleChar" "LeafLeftForeArmRoll3Ry" " -23.08093228177691003"
		
		2 "rig_male_character_v003:maleChar" "LeafLeftForeArmRoll3Rz" " -160.69395654017884567"
		
		2 "rig_male_character_v003:maleChar" "LeafLeftForeArmRoll3Sx" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "LeafLeftForeArmRoll3Sy" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "LeafLeftForeArmRoll3Sz" " 1.00000000000000022"
		
		2 "rig_male_character_v003:maleChar" "LeafLeftForeArmRoll3RotateOrder" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeafLeftForeArmRoll3RotateAxisx" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeafLeftForeArmRoll3RotateAxisy" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeafLeftForeArmRoll3RotateAxisz" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeafLeftForeArmRoll3JointOrientx" " 2.8739744948488104"
		
		2 "rig_male_character_v003:maleChar" "LeafLeftForeArmRoll3JointOrienty" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeafLeftForeArmRoll3JointOrientz" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeafLeftForeArmRoll3MinRLimitx" " -360"
		
		2 "rig_male_character_v003:maleChar" "LeafLeftForeArmRoll3MinRLimity" " -360"
		
		2 "rig_male_character_v003:maleChar" "LeafLeftForeArmRoll3MinRLimitz" " -360"
		
		2 "rig_male_character_v003:maleChar" "LeafLeftForeArmRoll3MaxRLimitx" " 360"
		
		2 "rig_male_character_v003:maleChar" "LeafLeftForeArmRoll3MaxRLimity" " 360"
		
		2 "rig_male_character_v003:maleChar" "LeafLeftForeArmRoll3MaxRLimitz" " 360"
		
		2 "rig_male_character_v003:maleChar" "LeafLeftForeArmRoll3MinRLimitEnablex" 
		" 0"
		2 "rig_male_character_v003:maleChar" "LeafLeftForeArmRoll3MinRLimitEnabley" 
		" 0"
		2 "rig_male_character_v003:maleChar" "LeafLeftForeArmRoll3MinRLimitEnablez" 
		" 0"
		2 "rig_male_character_v003:maleChar" "LeafLeftForeArmRoll3MaxRLimitEnablex" 
		" 0"
		2 "rig_male_character_v003:maleChar" "LeafLeftForeArmRoll3MaxRLimitEnabley" 
		" 0"
		2 "rig_male_character_v003:maleChar" "LeafLeftForeArmRoll3MaxRLimitEnablez" 
		" 0"
		2 "rig_male_character_v003:maleChar" "LeafRightForeArmRoll3Tx" " -21.26185543117864185"
		
		2 "rig_male_character_v003:maleChar" "LeafRightForeArmRoll3Ty" " 134.18302188355909266"
		
		2 "rig_male_character_v003:maleChar" "LeafRightForeArmRoll3Tz" " -12.71326029399438617"
		
		2 "rig_male_character_v003:maleChar" "LeafRightForeArmRoll3Rx" " 96.39037034036680041"
		
		2 "rig_male_character_v003:maleChar" "LeafRightForeArmRoll3Ry" " 30.48084183399756597"
		
		2 "rig_male_character_v003:maleChar" "LeafRightForeArmRoll3Rz" " 50.6078572120145509"
		
		2 "rig_male_character_v003:maleChar" "LeafRightForeArmRoll3Sx" " 1.00000000000000067"
		
		2 "rig_male_character_v003:maleChar" "LeafRightForeArmRoll3Sy" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "LeafRightForeArmRoll3Sz" " 1.00000000000000044"
		
		2 "rig_male_character_v003:maleChar" "LeafRightForeArmRoll3RotateOrder" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeafRightForeArmRoll3RotateAxisx" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeafRightForeArmRoll3RotateAxisy" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeafRightForeArmRoll3RotateAxisz" " 0"
		
		2 "rig_male_character_v003:maleChar" "LeafRightForeArmRoll3JointOrientx" 
		" 2.87397449484903733"
		2 "rig_male_character_v003:maleChar" "LeafRightForeArmRoll3JointOrienty" 
		" 0"
		2 "rig_male_character_v003:maleChar" "LeafRightForeArmRoll3JointOrientz" 
		" 0"
		2 "rig_male_character_v003:maleChar" "LeafRightForeArmRoll3MinRLimitx" " -360"
		
		2 "rig_male_character_v003:maleChar" "LeafRightForeArmRoll3MinRLimity" " -360"
		
		2 "rig_male_character_v003:maleChar" "LeafRightForeArmRoll3MinRLimitz" " -360"
		
		2 "rig_male_character_v003:maleChar" "LeafRightForeArmRoll3MaxRLimitx" " 360"
		
		2 "rig_male_character_v003:maleChar" "LeafRightForeArmRoll3MaxRLimity" " 360"
		
		2 "rig_male_character_v003:maleChar" "LeafRightForeArmRoll3MaxRLimitz" " 360"
		
		2 "rig_male_character_v003:maleChar" "LeafRightForeArmRoll3MinRLimitEnablex" 
		" 0"
		2 "rig_male_character_v003:maleChar" "LeafRightForeArmRoll3MinRLimitEnabley" 
		" 0"
		2 "rig_male_character_v003:maleChar" "LeafRightForeArmRoll3MinRLimitEnablez" 
		" 0"
		2 "rig_male_character_v003:maleChar" "LeafRightForeArmRoll3MaxRLimitEnablex" 
		" 0"
		2 "rig_male_character_v003:maleChar" "LeafRightForeArmRoll3MaxRLimitEnabley" 
		" 0"
		2 "rig_male_character_v003:maleChar" "LeafRightForeArmRoll3MaxRLimitEnablez" 
		" 0"
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt.Character" 
		"rig_male_character_v003:maleChar.Spine4" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:cn_neckBase_jnt|rig_male_character_v003:cn_neckMid_jnt|rig_male_character_v003:cn_head_jnt.Character" 
		"rig_male_character_v003:maleChar.Head" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:cn_neckBase_jnt.Character" 
		"rig_male_character_v003:maleChar.Neck" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:cn_neckBase_jnt|rig_male_character_v003:cn_neckMid_jnt.Character" 
		"rig_male_character_v003:maleChar.Neck1" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt.Character" 
		"rig_male_character_v003:maleChar.Hips" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt.Character" 
		"rig_male_character_v003:maleChar.Reference" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt.Character" 
		"rig_male_character_v003:maleChar.Spine2" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt.Character" 
		"rig_male_character_v003:maleChar.Spine" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:lf_hip_jnt|rig_male_character_v003:lf_knee_jnt|rig_male_character_v003:lf_ankle_jnt.Character" 
		"rig_male_character_v003:maleChar.LeftFoot" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:lf_hip_jnt|rig_male_character_v003:lf_knee_jnt|rig_male_character_v003:lf_ankle_jnt|rig_male_character_v003:lf_ball_jnt.Character" 
		"rig_male_character_v003:maleChar.LeftToeBase" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt.Character" 
		"rig_male_character_v003:maleChar.LeftShoulder" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt.Character" 
		"rig_male_character_v003:maleChar.LeftForeArm" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_forearm_jnt.Character" 
		"rig_male_character_v003:maleChar.LeafLeftForeArmRoll3" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:lf_hip_jnt.Character" 
		"rig_male_character_v003:maleChar.LeftUpLeg" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_index01_jnt.Character" 
		"rig_male_character_v003:maleChar.LeftHandIndex1" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_index01_jnt|rig_male_character_v003:lf_index02_jnt.Character" 
		"rig_male_character_v003:maleChar.LeftHandIndex2" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_index01_jnt|rig_male_character_v003:lf_index02_jnt|rig_male_character_v003:lf_index03_jnt.Character" 
		"rig_male_character_v003:maleChar.LeftHandIndex3" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:lf_hip_jnt|rig_male_character_v003:lf_knee_jnt.Character" 
		"rig_male_character_v003:maleChar.LeftLeg" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_middle01_jnt.Character" 
		"rig_male_character_v003:maleChar.LeftHandMiddle1" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_middle01_jnt|rig_male_character_v003:lf_middle02_jnt.Character" 
		"rig_male_character_v003:maleChar.LeftHandMiddle2" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_middle01_jnt|rig_male_character_v003:lf_middle02_jnt|rig_male_character_v003:lf_middle03_jnt.Character" 
		"rig_male_character_v003:maleChar.LeftHandMiddle3" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_pinky01_jnt.Character" 
		"rig_male_character_v003:maleChar.LeftHandPinky1" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_pinky01_jnt|rig_male_character_v003:lf_pinky02_jnt.Character" 
		"rig_male_character_v003:maleChar.LeftHandPinky2" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_pinky01_jnt|rig_male_character_v003:lf_pinky02_jnt|rig_male_character_v003:lf_pinky03_jnt.Character" 
		"rig_male_character_v003:maleChar.LeftHandPinky3" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_ring01_jnt.Character" 
		"rig_male_character_v003:maleChar.LeftHandRing1" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_ring01_jnt|rig_male_character_v003:lf_ring02_jnt.Character" 
		"rig_male_character_v003:maleChar.LeftHandRing2" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_ring01_jnt|rig_male_character_v003:lf_ring02_jnt|rig_male_character_v003:lf_ring03_jnt.Character" 
		"rig_male_character_v003:maleChar.LeftHandRing3" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt.Character" 
		"rig_male_character_v003:maleChar.LeftArm" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_thumb01_jnt.Character" 
		"rig_male_character_v003:maleChar.LeftHandThumb1" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_thumb01_jnt|rig_male_character_v003:lf_thumb02_jnt.Character" 
		"rig_male_character_v003:maleChar.LeftHandThumb2" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_thumb01_jnt|rig_male_character_v003:lf_thumb02_jnt|rig_male_character_v003:lf_thumb03_jnt.Character" 
		"rig_male_character_v003:maleChar.LeftHandThumb3" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt.Character" 
		"rig_male_character_v003:maleChar.LeftHand" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:rt_hip_jnt|rig_male_character_v003:rt_knee_jnt|rig_male_character_v003:rt_ankle_jnt.Character" 
		"rig_male_character_v003:maleChar.RightFoot" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:rt_hip_jnt|rig_male_character_v003:rt_knee_jnt|rig_male_character_v003:rt_ankle_jnt|rig_male_character_v003:rt_ball_jnt.Character" 
		"rig_male_character_v003:maleChar.RightToeBase" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt.Character" 
		"rig_male_character_v003:maleChar.RightShoulder" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt.Character" 
		"rig_male_character_v003:maleChar.RightForeArm" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_forearm_jnt.Character" 
		"rig_male_character_v003:maleChar.LeafRightForeArmRoll3" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:rt_hip_jnt.Character" 
		"rig_male_character_v003:maleChar.RightUpLeg" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_index01_jnt.Character" 
		"rig_male_character_v003:maleChar.RightHandIndex1" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_index01_jnt|rig_male_character_v003:rt_index02_jnt.Character" 
		"rig_male_character_v003:maleChar.RightHandIndex2" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_index01_jnt|rig_male_character_v003:rt_index02_jnt|rig_male_character_v003:rt_index03_jnt.Character" 
		"rig_male_character_v003:maleChar.RightHandIndex3" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:rt_hip_jnt|rig_male_character_v003:rt_knee_jnt.Character" 
		"rig_male_character_v003:maleChar.RightLeg" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_middle01_jnt.Character" 
		"rig_male_character_v003:maleChar.RightHandMiddle1" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_middle01_jnt|rig_male_character_v003:rt_middle02_jnt.Character" 
		"rig_male_character_v003:maleChar.RightHandMiddle2" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_middle01_jnt|rig_male_character_v003:rt_middle02_jnt|rig_male_character_v003:rt_middle03_jnt.Character" 
		"rig_male_character_v003:maleChar.RightHandMiddle3" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_pinky01_jnt.Character" 
		"rig_male_character_v003:maleChar.RightHandPinky1" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_pinky01_jnt|rig_male_character_v003:rt_pinky02_jnt.Character" 
		"rig_male_character_v003:maleChar.RightHandPinky2" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_pinky01_jnt|rig_male_character_v003:rt_pinky02_jnt|rig_male_character_v003:rt_pinky03_jnt.Character" 
		"rig_male_character_v003:maleChar.RightHandPinky3" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_ring01_jnt.Character" 
		"rig_male_character_v003:maleChar.RightHandRing1" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_ring01_jnt|rig_male_character_v003:rt_ring02_jnt.Character" 
		"rig_male_character_v003:maleChar.RightHandRing2" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_ring01_jnt|rig_male_character_v003:rt_ring02_jnt|rig_male_character_v003:rt_ring03_jnt.Character" 
		"rig_male_character_v003:maleChar.RightHandRing3" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt.Character" 
		"rig_male_character_v003:maleChar.RightArm" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_thumb01_jnt.Character" 
		"rig_male_character_v003:maleChar.RightHandThumb1" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_thumb01_jnt|rig_male_character_v003:rt_thumb02_jnt.Character" 
		"rig_male_character_v003:maleChar.RightHandThumb2" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_thumb01_jnt|rig_male_character_v003:rt_thumb02_jnt|rig_male_character_v003:rt_thumb03_jnt.Character" 
		"rig_male_character_v003:maleChar.RightHandThumb3" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt.Character" 
		"rig_male_character_v003:maleChar.RightHand" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:rig_setup_grp|rig_male_character_v003:controller_joints_grp|rig_male_character_v003:spine01_jnt.Character" 
		"rig_male_character_v003:maleChar.Spine1" ""
		3 "|rig_male_character_v003:rig_grp|rig_male_character_v003:rig_setup_grp|rig_male_character_v003:controller_joints_grp|rig_male_character_v003:spine03_jnt.Character" 
		"rig_male_character_v003:maleChar.Spine3" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl.translateX" 
		"rig_male_character_v001RN.placeHolderList[1]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[2]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl.translateZ" 
		"rig_male_character_v001RN.placeHolderList[3]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[4]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[5]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[6]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl|rig_male_character_v003:waist_offsetCtrlGrp|rig_male_character_v003:waist_offsetDataGrp|rig_male_character_v003:pelvis_ctrlGrp|rig_male_character_v003:pelvis_ctrl|rig_male_character_v003:pelvis_offsetCtrlGrp|rig_male_character_v003:pelvis_offsetDataGrp|rig_male_character_v003:left_hip_ctrlGrp|rig_male_character_v003:left_hip_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[7]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl|rig_male_character_v003:waist_offsetCtrlGrp|rig_male_character_v003:waist_offsetDataGrp|rig_male_character_v003:pelvis_ctrlGrp|rig_male_character_v003:pelvis_ctrl|rig_male_character_v003:pelvis_offsetCtrlGrp|rig_male_character_v003:pelvis_offsetDataGrp|rig_male_character_v003:left_hip_ctrlGrp|rig_male_character_v003:left_hip_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[8]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl|rig_male_character_v003:waist_offsetCtrlGrp|rig_male_character_v003:waist_offsetDataGrp|rig_male_character_v003:pelvis_ctrlGrp|rig_male_character_v003:pelvis_ctrl|rig_male_character_v003:pelvis_offsetCtrlGrp|rig_male_character_v003:pelvis_offsetDataGrp|rig_male_character_v003:left_hip_ctrlGrp|rig_male_character_v003:left_hip_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[9]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl|rig_male_character_v003:waist_offsetCtrlGrp|rig_male_character_v003:waist_offsetDataGrp|rig_male_character_v003:pelvis_ctrlGrp|rig_male_character_v003:pelvis_ctrl|rig_male_character_v003:pelvis_offsetCtrlGrp|rig_male_character_v003:pelvis_offsetDataGrp|rig_male_character_v003:left_hip_ctrlGrp|rig_male_character_v003:left_hip_ctrl|rig_male_character_v003:left_knee_ctrlGrp|rig_male_character_v003:left_knee_ctrl.translateX" 
		"rig_male_character_v001RN.placeHolderList[10]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl|rig_male_character_v003:waist_offsetCtrlGrp|rig_male_character_v003:waist_offsetDataGrp|rig_male_character_v003:pelvis_ctrlGrp|rig_male_character_v003:pelvis_ctrl|rig_male_character_v003:pelvis_offsetCtrlGrp|rig_male_character_v003:pelvis_offsetDataGrp|rig_male_character_v003:left_hip_ctrlGrp|rig_male_character_v003:left_hip_ctrl|rig_male_character_v003:left_knee_ctrlGrp|rig_male_character_v003:left_knee_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[11]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl|rig_male_character_v003:waist_offsetCtrlGrp|rig_male_character_v003:waist_offsetDataGrp|rig_male_character_v003:pelvis_ctrlGrp|rig_male_character_v003:pelvis_ctrl|rig_male_character_v003:pelvis_offsetCtrlGrp|rig_male_character_v003:pelvis_offsetDataGrp|rig_male_character_v003:left_hip_ctrlGrp|rig_male_character_v003:left_hip_ctrl|rig_male_character_v003:left_knee_ctrlGrp|rig_male_character_v003:left_knee_ctrl.translateZ" 
		"rig_male_character_v001RN.placeHolderList[12]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl|rig_male_character_v003:waist_offsetCtrlGrp|rig_male_character_v003:waist_offsetDataGrp|rig_male_character_v003:pelvis_ctrlGrp|rig_male_character_v003:pelvis_ctrl|rig_male_character_v003:pelvis_offsetCtrlGrp|rig_male_character_v003:pelvis_offsetDataGrp|rig_male_character_v003:left_hip_ctrlGrp|rig_male_character_v003:left_hip_ctrl|rig_male_character_v003:left_knee_ctrlGrp|rig_male_character_v003:left_knee_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[13]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl|rig_male_character_v003:waist_offsetCtrlGrp|rig_male_character_v003:waist_offsetDataGrp|rig_male_character_v003:pelvis_ctrlGrp|rig_male_character_v003:pelvis_ctrl|rig_male_character_v003:pelvis_offsetCtrlGrp|rig_male_character_v003:pelvis_offsetDataGrp|rig_male_character_v003:left_hip_ctrlGrp|rig_male_character_v003:left_hip_ctrl|rig_male_character_v003:left_knee_ctrlGrp|rig_male_character_v003:left_knee_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[14]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl|rig_male_character_v003:waist_offsetCtrlGrp|rig_male_character_v003:waist_offsetDataGrp|rig_male_character_v003:pelvis_ctrlGrp|rig_male_character_v003:pelvis_ctrl|rig_male_character_v003:pelvis_offsetCtrlGrp|rig_male_character_v003:pelvis_offsetDataGrp|rig_male_character_v003:left_hip_ctrlGrp|rig_male_character_v003:left_hip_ctrl|rig_male_character_v003:left_knee_ctrlGrp|rig_male_character_v003:left_knee_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[15]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl|rig_male_character_v003:waist_offsetCtrlGrp|rig_male_character_v003:waist_offsetDataGrp|rig_male_character_v003:pelvis_ctrlGrp|rig_male_character_v003:pelvis_ctrl|rig_male_character_v003:pelvis_offsetCtrlGrp|rig_male_character_v003:pelvis_offsetDataGrp|rig_male_character_v003:left_hip_ctrlGrp|rig_male_character_v003:left_hip_ctrl|rig_male_character_v003:left_knee_ctrlGrp|rig_male_character_v003:left_knee_ctrl|rig_male_character_v003:left_ankle_ctrlGrp|rig_male_character_v003:left_ankle_ctrl.translateX" 
		"rig_male_character_v001RN.placeHolderList[16]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl|rig_male_character_v003:waist_offsetCtrlGrp|rig_male_character_v003:waist_offsetDataGrp|rig_male_character_v003:pelvis_ctrlGrp|rig_male_character_v003:pelvis_ctrl|rig_male_character_v003:pelvis_offsetCtrlGrp|rig_male_character_v003:pelvis_offsetDataGrp|rig_male_character_v003:left_hip_ctrlGrp|rig_male_character_v003:left_hip_ctrl|rig_male_character_v003:left_knee_ctrlGrp|rig_male_character_v003:left_knee_ctrl|rig_male_character_v003:left_ankle_ctrlGrp|rig_male_character_v003:left_ankle_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[17]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl|rig_male_character_v003:waist_offsetCtrlGrp|rig_male_character_v003:waist_offsetDataGrp|rig_male_character_v003:pelvis_ctrlGrp|rig_male_character_v003:pelvis_ctrl|rig_male_character_v003:pelvis_offsetCtrlGrp|rig_male_character_v003:pelvis_offsetDataGrp|rig_male_character_v003:left_hip_ctrlGrp|rig_male_character_v003:left_hip_ctrl|rig_male_character_v003:left_knee_ctrlGrp|rig_male_character_v003:left_knee_ctrl|rig_male_character_v003:left_ankle_ctrlGrp|rig_male_character_v003:left_ankle_ctrl.translateZ" 
		"rig_male_character_v001RN.placeHolderList[18]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl|rig_male_character_v003:waist_offsetCtrlGrp|rig_male_character_v003:waist_offsetDataGrp|rig_male_character_v003:pelvis_ctrlGrp|rig_male_character_v003:pelvis_ctrl|rig_male_character_v003:pelvis_offsetCtrlGrp|rig_male_character_v003:pelvis_offsetDataGrp|rig_male_character_v003:left_hip_ctrlGrp|rig_male_character_v003:left_hip_ctrl|rig_male_character_v003:left_knee_ctrlGrp|rig_male_character_v003:left_knee_ctrl|rig_male_character_v003:left_ankle_ctrlGrp|rig_male_character_v003:left_ankle_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[19]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl|rig_male_character_v003:waist_offsetCtrlGrp|rig_male_character_v003:waist_offsetDataGrp|rig_male_character_v003:pelvis_ctrlGrp|rig_male_character_v003:pelvis_ctrl|rig_male_character_v003:pelvis_offsetCtrlGrp|rig_male_character_v003:pelvis_offsetDataGrp|rig_male_character_v003:left_hip_ctrlGrp|rig_male_character_v003:left_hip_ctrl|rig_male_character_v003:left_knee_ctrlGrp|rig_male_character_v003:left_knee_ctrl|rig_male_character_v003:left_ankle_ctrlGrp|rig_male_character_v003:left_ankle_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[20]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl|rig_male_character_v003:waist_offsetCtrlGrp|rig_male_character_v003:waist_offsetDataGrp|rig_male_character_v003:pelvis_ctrlGrp|rig_male_character_v003:pelvis_ctrl|rig_male_character_v003:pelvis_offsetCtrlGrp|rig_male_character_v003:pelvis_offsetDataGrp|rig_male_character_v003:left_hip_ctrlGrp|rig_male_character_v003:left_hip_ctrl|rig_male_character_v003:left_knee_ctrlGrp|rig_male_character_v003:left_knee_ctrl|rig_male_character_v003:left_ankle_ctrlGrp|rig_male_character_v003:left_ankle_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[21]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl|rig_male_character_v003:waist_offsetCtrlGrp|rig_male_character_v003:waist_offsetDataGrp|rig_male_character_v003:pelvis_ctrlGrp|rig_male_character_v003:pelvis_ctrl|rig_male_character_v003:pelvis_offsetCtrlGrp|rig_male_character_v003:pelvis_offsetDataGrp|rig_male_character_v003:right_hip_ctrlGrp|rig_male_character_v003:right_hip_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[22]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl|rig_male_character_v003:waist_offsetCtrlGrp|rig_male_character_v003:waist_offsetDataGrp|rig_male_character_v003:pelvis_ctrlGrp|rig_male_character_v003:pelvis_ctrl|rig_male_character_v003:pelvis_offsetCtrlGrp|rig_male_character_v003:pelvis_offsetDataGrp|rig_male_character_v003:right_hip_ctrlGrp|rig_male_character_v003:right_hip_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[23]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl|rig_male_character_v003:waist_offsetCtrlGrp|rig_male_character_v003:waist_offsetDataGrp|rig_male_character_v003:pelvis_ctrlGrp|rig_male_character_v003:pelvis_ctrl|rig_male_character_v003:pelvis_offsetCtrlGrp|rig_male_character_v003:pelvis_offsetDataGrp|rig_male_character_v003:right_hip_ctrlGrp|rig_male_character_v003:right_hip_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[24]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl|rig_male_character_v003:waist_offsetCtrlGrp|rig_male_character_v003:waist_offsetDataGrp|rig_male_character_v003:pelvis_ctrlGrp|rig_male_character_v003:pelvis_ctrl|rig_male_character_v003:pelvis_offsetCtrlGrp|rig_male_character_v003:pelvis_offsetDataGrp|rig_male_character_v003:right_hip_ctrlGrp|rig_male_character_v003:right_hip_ctrl|rig_male_character_v003:right_knee_ctrlGrp|rig_male_character_v003:right_knee_ctrl.translateX" 
		"rig_male_character_v001RN.placeHolderList[25]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl|rig_male_character_v003:waist_offsetCtrlGrp|rig_male_character_v003:waist_offsetDataGrp|rig_male_character_v003:pelvis_ctrlGrp|rig_male_character_v003:pelvis_ctrl|rig_male_character_v003:pelvis_offsetCtrlGrp|rig_male_character_v003:pelvis_offsetDataGrp|rig_male_character_v003:right_hip_ctrlGrp|rig_male_character_v003:right_hip_ctrl|rig_male_character_v003:right_knee_ctrlGrp|rig_male_character_v003:right_knee_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[26]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl|rig_male_character_v003:waist_offsetCtrlGrp|rig_male_character_v003:waist_offsetDataGrp|rig_male_character_v003:pelvis_ctrlGrp|rig_male_character_v003:pelvis_ctrl|rig_male_character_v003:pelvis_offsetCtrlGrp|rig_male_character_v003:pelvis_offsetDataGrp|rig_male_character_v003:right_hip_ctrlGrp|rig_male_character_v003:right_hip_ctrl|rig_male_character_v003:right_knee_ctrlGrp|rig_male_character_v003:right_knee_ctrl.translateZ" 
		"rig_male_character_v001RN.placeHolderList[27]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl|rig_male_character_v003:waist_offsetCtrlGrp|rig_male_character_v003:waist_offsetDataGrp|rig_male_character_v003:pelvis_ctrlGrp|rig_male_character_v003:pelvis_ctrl|rig_male_character_v003:pelvis_offsetCtrlGrp|rig_male_character_v003:pelvis_offsetDataGrp|rig_male_character_v003:right_hip_ctrlGrp|rig_male_character_v003:right_hip_ctrl|rig_male_character_v003:right_knee_ctrlGrp|rig_male_character_v003:right_knee_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[28]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl|rig_male_character_v003:waist_offsetCtrlGrp|rig_male_character_v003:waist_offsetDataGrp|rig_male_character_v003:pelvis_ctrlGrp|rig_male_character_v003:pelvis_ctrl|rig_male_character_v003:pelvis_offsetCtrlGrp|rig_male_character_v003:pelvis_offsetDataGrp|rig_male_character_v003:right_hip_ctrlGrp|rig_male_character_v003:right_hip_ctrl|rig_male_character_v003:right_knee_ctrlGrp|rig_male_character_v003:right_knee_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[29]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl|rig_male_character_v003:waist_offsetCtrlGrp|rig_male_character_v003:waist_offsetDataGrp|rig_male_character_v003:pelvis_ctrlGrp|rig_male_character_v003:pelvis_ctrl|rig_male_character_v003:pelvis_offsetCtrlGrp|rig_male_character_v003:pelvis_offsetDataGrp|rig_male_character_v003:right_hip_ctrlGrp|rig_male_character_v003:right_hip_ctrl|rig_male_character_v003:right_knee_ctrlGrp|rig_male_character_v003:right_knee_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[30]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl|rig_male_character_v003:waist_offsetCtrlGrp|rig_male_character_v003:waist_offsetDataGrp|rig_male_character_v003:pelvis_ctrlGrp|rig_male_character_v003:pelvis_ctrl|rig_male_character_v003:pelvis_offsetCtrlGrp|rig_male_character_v003:pelvis_offsetDataGrp|rig_male_character_v003:right_hip_ctrlGrp|rig_male_character_v003:right_hip_ctrl|rig_male_character_v003:right_knee_ctrlGrp|rig_male_character_v003:right_knee_ctrl|rig_male_character_v003:right_ankle_ctrlGrp|rig_male_character_v003:right_ankle_ctrl.translateX" 
		"rig_male_character_v001RN.placeHolderList[31]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl|rig_male_character_v003:waist_offsetCtrlGrp|rig_male_character_v003:waist_offsetDataGrp|rig_male_character_v003:pelvis_ctrlGrp|rig_male_character_v003:pelvis_ctrl|rig_male_character_v003:pelvis_offsetCtrlGrp|rig_male_character_v003:pelvis_offsetDataGrp|rig_male_character_v003:right_hip_ctrlGrp|rig_male_character_v003:right_hip_ctrl|rig_male_character_v003:right_knee_ctrlGrp|rig_male_character_v003:right_knee_ctrl|rig_male_character_v003:right_ankle_ctrlGrp|rig_male_character_v003:right_ankle_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[32]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl|rig_male_character_v003:waist_offsetCtrlGrp|rig_male_character_v003:waist_offsetDataGrp|rig_male_character_v003:pelvis_ctrlGrp|rig_male_character_v003:pelvis_ctrl|rig_male_character_v003:pelvis_offsetCtrlGrp|rig_male_character_v003:pelvis_offsetDataGrp|rig_male_character_v003:right_hip_ctrlGrp|rig_male_character_v003:right_hip_ctrl|rig_male_character_v003:right_knee_ctrlGrp|rig_male_character_v003:right_knee_ctrl|rig_male_character_v003:right_ankle_ctrlGrp|rig_male_character_v003:right_ankle_ctrl.translateZ" 
		"rig_male_character_v001RN.placeHolderList[33]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl|rig_male_character_v003:waist_offsetCtrlGrp|rig_male_character_v003:waist_offsetDataGrp|rig_male_character_v003:pelvis_ctrlGrp|rig_male_character_v003:pelvis_ctrl|rig_male_character_v003:pelvis_offsetCtrlGrp|rig_male_character_v003:pelvis_offsetDataGrp|rig_male_character_v003:right_hip_ctrlGrp|rig_male_character_v003:right_hip_ctrl|rig_male_character_v003:right_knee_ctrlGrp|rig_male_character_v003:right_knee_ctrl|rig_male_character_v003:right_ankle_ctrlGrp|rig_male_character_v003:right_ankle_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[34]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl|rig_male_character_v003:waist_offsetCtrlGrp|rig_male_character_v003:waist_offsetDataGrp|rig_male_character_v003:pelvis_ctrlGrp|rig_male_character_v003:pelvis_ctrl|rig_male_character_v003:pelvis_offsetCtrlGrp|rig_male_character_v003:pelvis_offsetDataGrp|rig_male_character_v003:right_hip_ctrlGrp|rig_male_character_v003:right_hip_ctrl|rig_male_character_v003:right_knee_ctrlGrp|rig_male_character_v003:right_knee_ctrl|rig_male_character_v003:right_ankle_ctrlGrp|rig_male_character_v003:right_ankle_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[35]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl|rig_male_character_v003:waist_offsetCtrlGrp|rig_male_character_v003:waist_offsetDataGrp|rig_male_character_v003:pelvis_ctrlGrp|rig_male_character_v003:pelvis_ctrl|rig_male_character_v003:pelvis_offsetCtrlGrp|rig_male_character_v003:pelvis_offsetDataGrp|rig_male_character_v003:right_hip_ctrlGrp|rig_male_character_v003:right_hip_ctrl|rig_male_character_v003:right_knee_ctrlGrp|rig_male_character_v003:right_knee_ctrl|rig_male_character_v003:right_ankle_ctrlGrp|rig_male_character_v003:right_ankle_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[36]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl|rig_male_character_v003:waist_offsetCtrlGrp|rig_male_character_v003:waist_offsetDataGrp|rig_male_character_v003:spine01_ctrlGrp|rig_male_character_v003:spine01_ctrlOffsetGrp|rig_male_character_v003:spine01_ctrlOffsetChestGrp|rig_male_character_v003:spine01_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[37]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl|rig_male_character_v003:waist_offsetCtrlGrp|rig_male_character_v003:waist_offsetDataGrp|rig_male_character_v003:spine01_ctrlGrp|rig_male_character_v003:spine01_ctrlOffsetGrp|rig_male_character_v003:spine01_ctrlOffsetChestGrp|rig_male_character_v003:spine01_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[38]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl|rig_male_character_v003:waist_offsetCtrlGrp|rig_male_character_v003:waist_offsetDataGrp|rig_male_character_v003:spine01_ctrlGrp|rig_male_character_v003:spine01_ctrlOffsetGrp|rig_male_character_v003:spine01_ctrlOffsetChestGrp|rig_male_character_v003:spine01_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[39]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl|rig_male_character_v003:waist_offsetCtrlGrp|rig_male_character_v003:waist_offsetDataGrp|rig_male_character_v003:spine01_ctrlGrp|rig_male_character_v003:spine01_ctrlOffsetGrp|rig_male_character_v003:spine01_ctrlOffsetChestGrp|rig_male_character_v003:spine01_ctrl|rig_male_character_v003:spine02_ctrlGrp|rig_male_character_v003:spine02_ctrlOffsetChestGrp|rig_male_character_v003:spine02_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[40]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl|rig_male_character_v003:waist_offsetCtrlGrp|rig_male_character_v003:waist_offsetDataGrp|rig_male_character_v003:spine01_ctrlGrp|rig_male_character_v003:spine01_ctrlOffsetGrp|rig_male_character_v003:spine01_ctrlOffsetChestGrp|rig_male_character_v003:spine01_ctrl|rig_male_character_v003:spine02_ctrlGrp|rig_male_character_v003:spine02_ctrlOffsetChestGrp|rig_male_character_v003:spine02_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[41]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl|rig_male_character_v003:waist_offsetCtrlGrp|rig_male_character_v003:waist_offsetDataGrp|rig_male_character_v003:spine01_ctrlGrp|rig_male_character_v003:spine01_ctrlOffsetGrp|rig_male_character_v003:spine01_ctrlOffsetChestGrp|rig_male_character_v003:spine01_ctrl|rig_male_character_v003:spine02_ctrlGrp|rig_male_character_v003:spine02_ctrlOffsetChestGrp|rig_male_character_v003:spine02_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[42]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl|rig_male_character_v003:waist_offsetCtrlGrp|rig_male_character_v003:waist_offsetDataGrp|rig_male_character_v003:spine01_ctrlGrp|rig_male_character_v003:spine01_ctrlOffsetGrp|rig_male_character_v003:spine01_ctrlOffsetChestGrp|rig_male_character_v003:spine01_ctrl|rig_male_character_v003:spine02_ctrlGrp|rig_male_character_v003:spine02_ctrlOffsetChestGrp|rig_male_character_v003:spine02_ctrl|rig_male_character_v003:spine03_ctrlGrp|rig_male_character_v003:spine03_ctrlOffsetGrp|rig_male_character_v003:spine03_ctrlOffsetChestGrp|rig_male_character_v003:spine03_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[43]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl|rig_male_character_v003:waist_offsetCtrlGrp|rig_male_character_v003:waist_offsetDataGrp|rig_male_character_v003:spine01_ctrlGrp|rig_male_character_v003:spine01_ctrlOffsetGrp|rig_male_character_v003:spine01_ctrlOffsetChestGrp|rig_male_character_v003:spine01_ctrl|rig_male_character_v003:spine02_ctrlGrp|rig_male_character_v003:spine02_ctrlOffsetChestGrp|rig_male_character_v003:spine02_ctrl|rig_male_character_v003:spine03_ctrlGrp|rig_male_character_v003:spine03_ctrlOffsetGrp|rig_male_character_v003:spine03_ctrlOffsetChestGrp|rig_male_character_v003:spine03_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[44]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl|rig_male_character_v003:waist_offsetCtrlGrp|rig_male_character_v003:waist_offsetDataGrp|rig_male_character_v003:spine01_ctrlGrp|rig_male_character_v003:spine01_ctrlOffsetGrp|rig_male_character_v003:spine01_ctrlOffsetChestGrp|rig_male_character_v003:spine01_ctrl|rig_male_character_v003:spine02_ctrlGrp|rig_male_character_v003:spine02_ctrlOffsetChestGrp|rig_male_character_v003:spine02_ctrl|rig_male_character_v003:spine03_ctrlGrp|rig_male_character_v003:spine03_ctrlOffsetGrp|rig_male_character_v003:spine03_ctrlOffsetChestGrp|rig_male_character_v003:spine03_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[45]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl|rig_male_character_v003:waist_offsetCtrlGrp|rig_male_character_v003:waist_offsetDataGrp|rig_male_character_v003:spine01_ctrlGrp|rig_male_character_v003:spine01_ctrlOffsetGrp|rig_male_character_v003:spine01_ctrlOffsetChestGrp|rig_male_character_v003:spine01_ctrl|rig_male_character_v003:spine02_ctrlGrp|rig_male_character_v003:spine02_ctrlOffsetChestGrp|rig_male_character_v003:spine02_ctrl|rig_male_character_v003:spine03_ctrlGrp|rig_male_character_v003:spine03_ctrlOffsetGrp|rig_male_character_v003:spine03_ctrlOffsetChestGrp|rig_male_character_v003:spine03_ctrl|rig_male_character_v003:chest_ctrlGrp|rig_male_character_v003:chest_ctrlOffsetChestGrp|rig_male_character_v003:chest_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[46]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl|rig_male_character_v003:waist_offsetCtrlGrp|rig_male_character_v003:waist_offsetDataGrp|rig_male_character_v003:spine01_ctrlGrp|rig_male_character_v003:spine01_ctrlOffsetGrp|rig_male_character_v003:spine01_ctrlOffsetChestGrp|rig_male_character_v003:spine01_ctrl|rig_male_character_v003:spine02_ctrlGrp|rig_male_character_v003:spine02_ctrlOffsetChestGrp|rig_male_character_v003:spine02_ctrl|rig_male_character_v003:spine03_ctrlGrp|rig_male_character_v003:spine03_ctrlOffsetGrp|rig_male_character_v003:spine03_ctrlOffsetChestGrp|rig_male_character_v003:spine03_ctrl|rig_male_character_v003:chest_ctrlGrp|rig_male_character_v003:chest_ctrlOffsetChestGrp|rig_male_character_v003:chest_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[47]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl|rig_male_character_v003:waist_offsetCtrlGrp|rig_male_character_v003:waist_offsetDataGrp|rig_male_character_v003:spine01_ctrlGrp|rig_male_character_v003:spine01_ctrlOffsetGrp|rig_male_character_v003:spine01_ctrlOffsetChestGrp|rig_male_character_v003:spine01_ctrl|rig_male_character_v003:spine02_ctrlGrp|rig_male_character_v003:spine02_ctrlOffsetChestGrp|rig_male_character_v003:spine02_ctrl|rig_male_character_v003:spine03_ctrlGrp|rig_male_character_v003:spine03_ctrlOffsetGrp|rig_male_character_v003:spine03_ctrlOffsetChestGrp|rig_male_character_v003:spine03_ctrl|rig_male_character_v003:chest_ctrlGrp|rig_male_character_v003:chest_ctrlOffsetChestGrp|rig_male_character_v003:chest_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[48]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl|rig_male_character_v003:waist_offsetCtrlGrp|rig_male_character_v003:waist_offsetDataGrp|rig_male_character_v003:chest_ribbon_ctrlGrp|rig_male_character_v003:chest_ribbon_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[49]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl|rig_male_character_v003:waist_offsetCtrlGrp|rig_male_character_v003:waist_offsetDataGrp|rig_male_character_v003:chest_ribbon_ctrlGrp|rig_male_character_v003:chest_ribbon_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[50]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl|rig_male_character_v003:waist_offsetCtrlGrp|rig_male_character_v003:waist_offsetDataGrp|rig_male_character_v003:chest_ribbon_ctrlGrp|rig_male_character_v003:chest_ribbon_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[51]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl|rig_male_character_v003:waist_offsetCtrlGrp|rig_male_character_v003:waist_offsetDataGrp|rig_male_character_v003:chest_ribbon_ctrlGrp|rig_male_character_v003:chest_ribbon_ctrl.translateX" 
		"rig_male_character_v001RN.placeHolderList[52]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl|rig_male_character_v003:waist_offsetCtrlGrp|rig_male_character_v003:waist_offsetDataGrp|rig_male_character_v003:chest_ribbon_ctrlGrp|rig_male_character_v003:chest_ribbon_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[53]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:waist_ctrlGrp|rig_male_character_v003:waist_ctrl|rig_male_character_v003:waist_offsetCtrlGrp|rig_male_character_v003:waist_offsetDataGrp|rig_male_character_v003:chest_ribbon_ctrlGrp|rig_male_character_v003:chest_ribbon_ctrl.translateZ" 
		"rig_male_character_v001RN.placeHolderList[54]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_foot_ik_ctrlGrp|rig_male_character_v003:left_foot_ik_ctrl.pVecTwist" 
		"rig_male_character_v001RN.placeHolderList[55]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_foot_ik_ctrlGrp|rig_male_character_v003:left_foot_ik_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[56]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_foot_ik_ctrlGrp|rig_male_character_v003:left_foot_ik_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[57]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_foot_ik_ctrlGrp|rig_male_character_v003:left_foot_ik_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[58]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_foot_ik_ctrlGrp|rig_male_character_v003:left_foot_ik_ctrl.translateX" 
		"rig_male_character_v001RN.placeHolderList[59]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_foot_ik_ctrlGrp|rig_male_character_v003:left_foot_ik_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[60]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_foot_ik_ctrlGrp|rig_male_character_v003:left_foot_ik_ctrl.translateZ" 
		"rig_male_character_v001RN.placeHolderList[61]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_foot_ik_ctrlGrp|rig_male_character_v003:right_foot_ik_ctrl.translateX" 
		"rig_male_character_v001RN.placeHolderList[62]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_foot_ik_ctrlGrp|rig_male_character_v003:right_foot_ik_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[63]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_foot_ik_ctrlGrp|rig_male_character_v003:right_foot_ik_ctrl.translateZ" 
		"rig_male_character_v001RN.placeHolderList[64]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_foot_ik_ctrlGrp|rig_male_character_v003:right_foot_ik_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[65]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_foot_ik_ctrlGrp|rig_male_character_v003:right_foot_ik_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[66]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_foot_ik_ctrlGrp|rig_male_character_v003:right_foot_ik_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[67]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_foot_ik_ctrlGrp|rig_male_character_v003:right_foot_ik_ctrl.pVecTwist" 
		"rig_male_character_v001RN.placeHolderList[68]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_index01_ctrlGrp|rig_male_character_v003:left_index01_ctrlOffsetGrp|rig_male_character_v003:left_index01_ctrl.showScaleCtrl" 
		"rig_male_character_v001RN.placeHolderList[69]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_index01_ctrlGrp|rig_male_character_v003:left_index01_ctrlOffsetGrp|rig_male_character_v003:left_index01_ctrl.translateX" 
		"rig_male_character_v001RN.placeHolderList[70]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_index01_ctrlGrp|rig_male_character_v003:left_index01_ctrlOffsetGrp|rig_male_character_v003:left_index01_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[71]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_index01_ctrlGrp|rig_male_character_v003:left_index01_ctrlOffsetGrp|rig_male_character_v003:left_index01_ctrl.translateZ" 
		"rig_male_character_v001RN.placeHolderList[72]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_index01_ctrlGrp|rig_male_character_v003:left_index01_ctrlOffsetGrp|rig_male_character_v003:left_index01_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[73]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_index01_ctrlGrp|rig_male_character_v003:left_index01_ctrlOffsetGrp|rig_male_character_v003:left_index01_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[74]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_index01_ctrlGrp|rig_male_character_v003:left_index01_ctrlOffsetGrp|rig_male_character_v003:left_index01_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[75]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_index01_ctrlGrp|rig_male_character_v003:left_index01_ctrlOffsetGrp|rig_male_character_v003:left_index01_ctrl|rig_male_character_v003:left_index02_ctrlGrp|rig_male_character_v003:left_index02_ctrlOffsetGrp|rig_male_character_v003:left_index02_ctrl.showScaleCtrl" 
		"rig_male_character_v001RN.placeHolderList[76]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_index01_ctrlGrp|rig_male_character_v003:left_index01_ctrlOffsetGrp|rig_male_character_v003:left_index01_ctrl|rig_male_character_v003:left_index02_ctrlGrp|rig_male_character_v003:left_index02_ctrlOffsetGrp|rig_male_character_v003:left_index02_ctrl.translateX" 
		"rig_male_character_v001RN.placeHolderList[77]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_index01_ctrlGrp|rig_male_character_v003:left_index01_ctrlOffsetGrp|rig_male_character_v003:left_index01_ctrl|rig_male_character_v003:left_index02_ctrlGrp|rig_male_character_v003:left_index02_ctrlOffsetGrp|rig_male_character_v003:left_index02_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[78]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_index01_ctrlGrp|rig_male_character_v003:left_index01_ctrlOffsetGrp|rig_male_character_v003:left_index01_ctrl|rig_male_character_v003:left_index02_ctrlGrp|rig_male_character_v003:left_index02_ctrlOffsetGrp|rig_male_character_v003:left_index02_ctrl.translateZ" 
		"rig_male_character_v001RN.placeHolderList[79]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_index01_ctrlGrp|rig_male_character_v003:left_index01_ctrlOffsetGrp|rig_male_character_v003:left_index01_ctrl|rig_male_character_v003:left_index02_ctrlGrp|rig_male_character_v003:left_index02_ctrlOffsetGrp|rig_male_character_v003:left_index02_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[80]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_index01_ctrlGrp|rig_male_character_v003:left_index01_ctrlOffsetGrp|rig_male_character_v003:left_index01_ctrl|rig_male_character_v003:left_index02_ctrlGrp|rig_male_character_v003:left_index02_ctrlOffsetGrp|rig_male_character_v003:left_index02_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[81]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_index01_ctrlGrp|rig_male_character_v003:left_index01_ctrlOffsetGrp|rig_male_character_v003:left_index01_ctrl|rig_male_character_v003:left_index02_ctrlGrp|rig_male_character_v003:left_index02_ctrlOffsetGrp|rig_male_character_v003:left_index02_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[82]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_index01_ctrlGrp|rig_male_character_v003:left_index01_ctrlOffsetGrp|rig_male_character_v003:left_index01_ctrl|rig_male_character_v003:left_index02_ctrlGrp|rig_male_character_v003:left_index02_ctrlOffsetGrp|rig_male_character_v003:left_index02_ctrl|rig_male_character_v003:left_index03_ctrlGrp|rig_male_character_v003:left_index03_ctrlOffsetGrp|rig_male_character_v003:left_index03_ctrl.showScaleCtrl" 
		"rig_male_character_v001RN.placeHolderList[83]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_index01_ctrlGrp|rig_male_character_v003:left_index01_ctrlOffsetGrp|rig_male_character_v003:left_index01_ctrl|rig_male_character_v003:left_index02_ctrlGrp|rig_male_character_v003:left_index02_ctrlOffsetGrp|rig_male_character_v003:left_index02_ctrl|rig_male_character_v003:left_index03_ctrlGrp|rig_male_character_v003:left_index03_ctrlOffsetGrp|rig_male_character_v003:left_index03_ctrl.translateX" 
		"rig_male_character_v001RN.placeHolderList[84]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_index01_ctrlGrp|rig_male_character_v003:left_index01_ctrlOffsetGrp|rig_male_character_v003:left_index01_ctrl|rig_male_character_v003:left_index02_ctrlGrp|rig_male_character_v003:left_index02_ctrlOffsetGrp|rig_male_character_v003:left_index02_ctrl|rig_male_character_v003:left_index03_ctrlGrp|rig_male_character_v003:left_index03_ctrlOffsetGrp|rig_male_character_v003:left_index03_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[85]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_index01_ctrlGrp|rig_male_character_v003:left_index01_ctrlOffsetGrp|rig_male_character_v003:left_index01_ctrl|rig_male_character_v003:left_index02_ctrlGrp|rig_male_character_v003:left_index02_ctrlOffsetGrp|rig_male_character_v003:left_index02_ctrl|rig_male_character_v003:left_index03_ctrlGrp|rig_male_character_v003:left_index03_ctrlOffsetGrp|rig_male_character_v003:left_index03_ctrl.translateZ" 
		"rig_male_character_v001RN.placeHolderList[86]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_index01_ctrlGrp|rig_male_character_v003:left_index01_ctrlOffsetGrp|rig_male_character_v003:left_index01_ctrl|rig_male_character_v003:left_index02_ctrlGrp|rig_male_character_v003:left_index02_ctrlOffsetGrp|rig_male_character_v003:left_index02_ctrl|rig_male_character_v003:left_index03_ctrlGrp|rig_male_character_v003:left_index03_ctrlOffsetGrp|rig_male_character_v003:left_index03_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[87]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_index01_ctrlGrp|rig_male_character_v003:left_index01_ctrlOffsetGrp|rig_male_character_v003:left_index01_ctrl|rig_male_character_v003:left_index02_ctrlGrp|rig_male_character_v003:left_index02_ctrlOffsetGrp|rig_male_character_v003:left_index02_ctrl|rig_male_character_v003:left_index03_ctrlGrp|rig_male_character_v003:left_index03_ctrlOffsetGrp|rig_male_character_v003:left_index03_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[88]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_index01_ctrlGrp|rig_male_character_v003:left_index01_ctrlOffsetGrp|rig_male_character_v003:left_index01_ctrl|rig_male_character_v003:left_index02_ctrlGrp|rig_male_character_v003:left_index02_ctrlOffsetGrp|rig_male_character_v003:left_index02_ctrl|rig_male_character_v003:left_index03_ctrlGrp|rig_male_character_v003:left_index03_ctrlOffsetGrp|rig_male_character_v003:left_index03_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[89]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_middle01_ctrlGrp|rig_male_character_v003:left_middle01_ctrlOffsetGrp|rig_male_character_v003:left_middle01_ctrl.showScaleCtrl" 
		"rig_male_character_v001RN.placeHolderList[90]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_middle01_ctrlGrp|rig_male_character_v003:left_middle01_ctrlOffsetGrp|rig_male_character_v003:left_middle01_ctrl.translateX" 
		"rig_male_character_v001RN.placeHolderList[91]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_middle01_ctrlGrp|rig_male_character_v003:left_middle01_ctrlOffsetGrp|rig_male_character_v003:left_middle01_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[92]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_middle01_ctrlGrp|rig_male_character_v003:left_middle01_ctrlOffsetGrp|rig_male_character_v003:left_middle01_ctrl.translateZ" 
		"rig_male_character_v001RN.placeHolderList[93]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_middle01_ctrlGrp|rig_male_character_v003:left_middle01_ctrlOffsetGrp|rig_male_character_v003:left_middle01_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[94]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_middle01_ctrlGrp|rig_male_character_v003:left_middle01_ctrlOffsetGrp|rig_male_character_v003:left_middle01_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[95]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_middle01_ctrlGrp|rig_male_character_v003:left_middle01_ctrlOffsetGrp|rig_male_character_v003:left_middle01_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[96]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_middle01_ctrlGrp|rig_male_character_v003:left_middle01_ctrlOffsetGrp|rig_male_character_v003:left_middle01_ctrl|rig_male_character_v003:left_middle02_ctrlGrp|rig_male_character_v003:left_middle02_ctrlOffsetGrp|rig_male_character_v003:left_middle02_ctrl.showScaleCtrl" 
		"rig_male_character_v001RN.placeHolderList[97]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_middle01_ctrlGrp|rig_male_character_v003:left_middle01_ctrlOffsetGrp|rig_male_character_v003:left_middle01_ctrl|rig_male_character_v003:left_middle02_ctrlGrp|rig_male_character_v003:left_middle02_ctrlOffsetGrp|rig_male_character_v003:left_middle02_ctrl.translateX" 
		"rig_male_character_v001RN.placeHolderList[98]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_middle01_ctrlGrp|rig_male_character_v003:left_middle01_ctrlOffsetGrp|rig_male_character_v003:left_middle01_ctrl|rig_male_character_v003:left_middle02_ctrlGrp|rig_male_character_v003:left_middle02_ctrlOffsetGrp|rig_male_character_v003:left_middle02_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[99]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_middle01_ctrlGrp|rig_male_character_v003:left_middle01_ctrlOffsetGrp|rig_male_character_v003:left_middle01_ctrl|rig_male_character_v003:left_middle02_ctrlGrp|rig_male_character_v003:left_middle02_ctrlOffsetGrp|rig_male_character_v003:left_middle02_ctrl.translateZ" 
		"rig_male_character_v001RN.placeHolderList[100]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_middle01_ctrlGrp|rig_male_character_v003:left_middle01_ctrlOffsetGrp|rig_male_character_v003:left_middle01_ctrl|rig_male_character_v003:left_middle02_ctrlGrp|rig_male_character_v003:left_middle02_ctrlOffsetGrp|rig_male_character_v003:left_middle02_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[101]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_middle01_ctrlGrp|rig_male_character_v003:left_middle01_ctrlOffsetGrp|rig_male_character_v003:left_middle01_ctrl|rig_male_character_v003:left_middle02_ctrlGrp|rig_male_character_v003:left_middle02_ctrlOffsetGrp|rig_male_character_v003:left_middle02_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[102]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_middle01_ctrlGrp|rig_male_character_v003:left_middle01_ctrlOffsetGrp|rig_male_character_v003:left_middle01_ctrl|rig_male_character_v003:left_middle02_ctrlGrp|rig_male_character_v003:left_middle02_ctrlOffsetGrp|rig_male_character_v003:left_middle02_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[103]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_middle01_ctrlGrp|rig_male_character_v003:left_middle01_ctrlOffsetGrp|rig_male_character_v003:left_middle01_ctrl|rig_male_character_v003:left_middle02_ctrlGrp|rig_male_character_v003:left_middle02_ctrlOffsetGrp|rig_male_character_v003:left_middle02_ctrl|rig_male_character_v003:left_middle03_ctrlGrp|rig_male_character_v003:left_middle03_ctrlOffsetGrp|rig_male_character_v003:left_middle03_ctrl.showScaleCtrl" 
		"rig_male_character_v001RN.placeHolderList[104]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_middle01_ctrlGrp|rig_male_character_v003:left_middle01_ctrlOffsetGrp|rig_male_character_v003:left_middle01_ctrl|rig_male_character_v003:left_middle02_ctrlGrp|rig_male_character_v003:left_middle02_ctrlOffsetGrp|rig_male_character_v003:left_middle02_ctrl|rig_male_character_v003:left_middle03_ctrlGrp|rig_male_character_v003:left_middle03_ctrlOffsetGrp|rig_male_character_v003:left_middle03_ctrl.translateX" 
		"rig_male_character_v001RN.placeHolderList[105]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_middle01_ctrlGrp|rig_male_character_v003:left_middle01_ctrlOffsetGrp|rig_male_character_v003:left_middle01_ctrl|rig_male_character_v003:left_middle02_ctrlGrp|rig_male_character_v003:left_middle02_ctrlOffsetGrp|rig_male_character_v003:left_middle02_ctrl|rig_male_character_v003:left_middle03_ctrlGrp|rig_male_character_v003:left_middle03_ctrlOffsetGrp|rig_male_character_v003:left_middle03_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[106]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_middle01_ctrlGrp|rig_male_character_v003:left_middle01_ctrlOffsetGrp|rig_male_character_v003:left_middle01_ctrl|rig_male_character_v003:left_middle02_ctrlGrp|rig_male_character_v003:left_middle02_ctrlOffsetGrp|rig_male_character_v003:left_middle02_ctrl|rig_male_character_v003:left_middle03_ctrlGrp|rig_male_character_v003:left_middle03_ctrlOffsetGrp|rig_male_character_v003:left_middle03_ctrl.translateZ" 
		"rig_male_character_v001RN.placeHolderList[107]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_middle01_ctrlGrp|rig_male_character_v003:left_middle01_ctrlOffsetGrp|rig_male_character_v003:left_middle01_ctrl|rig_male_character_v003:left_middle02_ctrlGrp|rig_male_character_v003:left_middle02_ctrlOffsetGrp|rig_male_character_v003:left_middle02_ctrl|rig_male_character_v003:left_middle03_ctrlGrp|rig_male_character_v003:left_middle03_ctrlOffsetGrp|rig_male_character_v003:left_middle03_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[108]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_middle01_ctrlGrp|rig_male_character_v003:left_middle01_ctrlOffsetGrp|rig_male_character_v003:left_middle01_ctrl|rig_male_character_v003:left_middle02_ctrlGrp|rig_male_character_v003:left_middle02_ctrlOffsetGrp|rig_male_character_v003:left_middle02_ctrl|rig_male_character_v003:left_middle03_ctrlGrp|rig_male_character_v003:left_middle03_ctrlOffsetGrp|rig_male_character_v003:left_middle03_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[109]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_middle01_ctrlGrp|rig_male_character_v003:left_middle01_ctrlOffsetGrp|rig_male_character_v003:left_middle01_ctrl|rig_male_character_v003:left_middle02_ctrlGrp|rig_male_character_v003:left_middle02_ctrlOffsetGrp|rig_male_character_v003:left_middle02_ctrl|rig_male_character_v003:left_middle03_ctrlGrp|rig_male_character_v003:left_middle03_ctrlOffsetGrp|rig_male_character_v003:left_middle03_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[110]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_ring01_ctrlGrp|rig_male_character_v003:left_ring01_ctrlOffsetGrp|rig_male_character_v003:left_ring01_ctrl.showScaleCtrl" 
		"rig_male_character_v001RN.placeHolderList[111]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_ring01_ctrlGrp|rig_male_character_v003:left_ring01_ctrlOffsetGrp|rig_male_character_v003:left_ring01_ctrl.translateX" 
		"rig_male_character_v001RN.placeHolderList[112]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_ring01_ctrlGrp|rig_male_character_v003:left_ring01_ctrlOffsetGrp|rig_male_character_v003:left_ring01_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[113]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_ring01_ctrlGrp|rig_male_character_v003:left_ring01_ctrlOffsetGrp|rig_male_character_v003:left_ring01_ctrl.translateZ" 
		"rig_male_character_v001RN.placeHolderList[114]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_ring01_ctrlGrp|rig_male_character_v003:left_ring01_ctrlOffsetGrp|rig_male_character_v003:left_ring01_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[115]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_ring01_ctrlGrp|rig_male_character_v003:left_ring01_ctrlOffsetGrp|rig_male_character_v003:left_ring01_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[116]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_ring01_ctrlGrp|rig_male_character_v003:left_ring01_ctrlOffsetGrp|rig_male_character_v003:left_ring01_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[117]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_ring01_ctrlGrp|rig_male_character_v003:left_ring01_ctrlOffsetGrp|rig_male_character_v003:left_ring01_ctrl|rig_male_character_v003:left_ring02_ctrlGrp|rig_male_character_v003:left_ring02_ctrlOffsetGrp|rig_male_character_v003:left_ring02_ctrl.showScaleCtrl" 
		"rig_male_character_v001RN.placeHolderList[118]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_ring01_ctrlGrp|rig_male_character_v003:left_ring01_ctrlOffsetGrp|rig_male_character_v003:left_ring01_ctrl|rig_male_character_v003:left_ring02_ctrlGrp|rig_male_character_v003:left_ring02_ctrlOffsetGrp|rig_male_character_v003:left_ring02_ctrl.translateX" 
		"rig_male_character_v001RN.placeHolderList[119]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_ring01_ctrlGrp|rig_male_character_v003:left_ring01_ctrlOffsetGrp|rig_male_character_v003:left_ring01_ctrl|rig_male_character_v003:left_ring02_ctrlGrp|rig_male_character_v003:left_ring02_ctrlOffsetGrp|rig_male_character_v003:left_ring02_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[120]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_ring01_ctrlGrp|rig_male_character_v003:left_ring01_ctrlOffsetGrp|rig_male_character_v003:left_ring01_ctrl|rig_male_character_v003:left_ring02_ctrlGrp|rig_male_character_v003:left_ring02_ctrlOffsetGrp|rig_male_character_v003:left_ring02_ctrl.translateZ" 
		"rig_male_character_v001RN.placeHolderList[121]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_ring01_ctrlGrp|rig_male_character_v003:left_ring01_ctrlOffsetGrp|rig_male_character_v003:left_ring01_ctrl|rig_male_character_v003:left_ring02_ctrlGrp|rig_male_character_v003:left_ring02_ctrlOffsetGrp|rig_male_character_v003:left_ring02_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[122]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_ring01_ctrlGrp|rig_male_character_v003:left_ring01_ctrlOffsetGrp|rig_male_character_v003:left_ring01_ctrl|rig_male_character_v003:left_ring02_ctrlGrp|rig_male_character_v003:left_ring02_ctrlOffsetGrp|rig_male_character_v003:left_ring02_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[123]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_ring01_ctrlGrp|rig_male_character_v003:left_ring01_ctrlOffsetGrp|rig_male_character_v003:left_ring01_ctrl|rig_male_character_v003:left_ring02_ctrlGrp|rig_male_character_v003:left_ring02_ctrlOffsetGrp|rig_male_character_v003:left_ring02_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[124]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_ring01_ctrlGrp|rig_male_character_v003:left_ring01_ctrlOffsetGrp|rig_male_character_v003:left_ring01_ctrl|rig_male_character_v003:left_ring02_ctrlGrp|rig_male_character_v003:left_ring02_ctrlOffsetGrp|rig_male_character_v003:left_ring02_ctrl|rig_male_character_v003:left_ring03_ctrlGrp|rig_male_character_v003:left_ring03_ctrlOffsetGrp|rig_male_character_v003:left_ring03_ctrl.showScaleCtrl" 
		"rig_male_character_v001RN.placeHolderList[125]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_ring01_ctrlGrp|rig_male_character_v003:left_ring01_ctrlOffsetGrp|rig_male_character_v003:left_ring01_ctrl|rig_male_character_v003:left_ring02_ctrlGrp|rig_male_character_v003:left_ring02_ctrlOffsetGrp|rig_male_character_v003:left_ring02_ctrl|rig_male_character_v003:left_ring03_ctrlGrp|rig_male_character_v003:left_ring03_ctrlOffsetGrp|rig_male_character_v003:left_ring03_ctrl.translateX" 
		"rig_male_character_v001RN.placeHolderList[126]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_ring01_ctrlGrp|rig_male_character_v003:left_ring01_ctrlOffsetGrp|rig_male_character_v003:left_ring01_ctrl|rig_male_character_v003:left_ring02_ctrlGrp|rig_male_character_v003:left_ring02_ctrlOffsetGrp|rig_male_character_v003:left_ring02_ctrl|rig_male_character_v003:left_ring03_ctrlGrp|rig_male_character_v003:left_ring03_ctrlOffsetGrp|rig_male_character_v003:left_ring03_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[127]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_ring01_ctrlGrp|rig_male_character_v003:left_ring01_ctrlOffsetGrp|rig_male_character_v003:left_ring01_ctrl|rig_male_character_v003:left_ring02_ctrlGrp|rig_male_character_v003:left_ring02_ctrlOffsetGrp|rig_male_character_v003:left_ring02_ctrl|rig_male_character_v003:left_ring03_ctrlGrp|rig_male_character_v003:left_ring03_ctrlOffsetGrp|rig_male_character_v003:left_ring03_ctrl.translateZ" 
		"rig_male_character_v001RN.placeHolderList[128]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_ring01_ctrlGrp|rig_male_character_v003:left_ring01_ctrlOffsetGrp|rig_male_character_v003:left_ring01_ctrl|rig_male_character_v003:left_ring02_ctrlGrp|rig_male_character_v003:left_ring02_ctrlOffsetGrp|rig_male_character_v003:left_ring02_ctrl|rig_male_character_v003:left_ring03_ctrlGrp|rig_male_character_v003:left_ring03_ctrlOffsetGrp|rig_male_character_v003:left_ring03_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[129]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_ring01_ctrlGrp|rig_male_character_v003:left_ring01_ctrlOffsetGrp|rig_male_character_v003:left_ring01_ctrl|rig_male_character_v003:left_ring02_ctrlGrp|rig_male_character_v003:left_ring02_ctrlOffsetGrp|rig_male_character_v003:left_ring02_ctrl|rig_male_character_v003:left_ring03_ctrlGrp|rig_male_character_v003:left_ring03_ctrlOffsetGrp|rig_male_character_v003:left_ring03_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[130]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_ring01_ctrlGrp|rig_male_character_v003:left_ring01_ctrlOffsetGrp|rig_male_character_v003:left_ring01_ctrl|rig_male_character_v003:left_ring02_ctrlGrp|rig_male_character_v003:left_ring02_ctrlOffsetGrp|rig_male_character_v003:left_ring02_ctrl|rig_male_character_v003:left_ring03_ctrlGrp|rig_male_character_v003:left_ring03_ctrlOffsetGrp|rig_male_character_v003:left_ring03_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[131]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_pinky01_ctrlGrp|rig_male_character_v003:left_pinky01_ctrlOffsetGrp|rig_male_character_v003:left_pinky01_ctrl.showScaleCtrl" 
		"rig_male_character_v001RN.placeHolderList[132]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_pinky01_ctrlGrp|rig_male_character_v003:left_pinky01_ctrlOffsetGrp|rig_male_character_v003:left_pinky01_ctrl.translateX" 
		"rig_male_character_v001RN.placeHolderList[133]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_pinky01_ctrlGrp|rig_male_character_v003:left_pinky01_ctrlOffsetGrp|rig_male_character_v003:left_pinky01_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[134]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_pinky01_ctrlGrp|rig_male_character_v003:left_pinky01_ctrlOffsetGrp|rig_male_character_v003:left_pinky01_ctrl.translateZ" 
		"rig_male_character_v001RN.placeHolderList[135]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_pinky01_ctrlGrp|rig_male_character_v003:left_pinky01_ctrlOffsetGrp|rig_male_character_v003:left_pinky01_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[136]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_pinky01_ctrlGrp|rig_male_character_v003:left_pinky01_ctrlOffsetGrp|rig_male_character_v003:left_pinky01_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[137]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_pinky01_ctrlGrp|rig_male_character_v003:left_pinky01_ctrlOffsetGrp|rig_male_character_v003:left_pinky01_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[138]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_pinky01_ctrlGrp|rig_male_character_v003:left_pinky01_ctrlOffsetGrp|rig_male_character_v003:left_pinky01_ctrl|rig_male_character_v003:left_pinky02_ctrlGrp|rig_male_character_v003:left_pinky02_ctrlOffsetGrp|rig_male_character_v003:left_pinky02_ctrl.showScaleCtrl" 
		"rig_male_character_v001RN.placeHolderList[139]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_pinky01_ctrlGrp|rig_male_character_v003:left_pinky01_ctrlOffsetGrp|rig_male_character_v003:left_pinky01_ctrl|rig_male_character_v003:left_pinky02_ctrlGrp|rig_male_character_v003:left_pinky02_ctrlOffsetGrp|rig_male_character_v003:left_pinky02_ctrl.translateX" 
		"rig_male_character_v001RN.placeHolderList[140]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_pinky01_ctrlGrp|rig_male_character_v003:left_pinky01_ctrlOffsetGrp|rig_male_character_v003:left_pinky01_ctrl|rig_male_character_v003:left_pinky02_ctrlGrp|rig_male_character_v003:left_pinky02_ctrlOffsetGrp|rig_male_character_v003:left_pinky02_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[141]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_pinky01_ctrlGrp|rig_male_character_v003:left_pinky01_ctrlOffsetGrp|rig_male_character_v003:left_pinky01_ctrl|rig_male_character_v003:left_pinky02_ctrlGrp|rig_male_character_v003:left_pinky02_ctrlOffsetGrp|rig_male_character_v003:left_pinky02_ctrl.translateZ" 
		"rig_male_character_v001RN.placeHolderList[142]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_pinky01_ctrlGrp|rig_male_character_v003:left_pinky01_ctrlOffsetGrp|rig_male_character_v003:left_pinky01_ctrl|rig_male_character_v003:left_pinky02_ctrlGrp|rig_male_character_v003:left_pinky02_ctrlOffsetGrp|rig_male_character_v003:left_pinky02_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[143]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_pinky01_ctrlGrp|rig_male_character_v003:left_pinky01_ctrlOffsetGrp|rig_male_character_v003:left_pinky01_ctrl|rig_male_character_v003:left_pinky02_ctrlGrp|rig_male_character_v003:left_pinky02_ctrlOffsetGrp|rig_male_character_v003:left_pinky02_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[144]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_pinky01_ctrlGrp|rig_male_character_v003:left_pinky01_ctrlOffsetGrp|rig_male_character_v003:left_pinky01_ctrl|rig_male_character_v003:left_pinky02_ctrlGrp|rig_male_character_v003:left_pinky02_ctrlOffsetGrp|rig_male_character_v003:left_pinky02_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[145]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_pinky01_ctrlGrp|rig_male_character_v003:left_pinky01_ctrlOffsetGrp|rig_male_character_v003:left_pinky01_ctrl|rig_male_character_v003:left_pinky02_ctrlGrp|rig_male_character_v003:left_pinky02_ctrlOffsetGrp|rig_male_character_v003:left_pinky02_ctrl|rig_male_character_v003:left_pinky03_ctrlGrp|rig_male_character_v003:left_pinky03_ctrlOffsetGrp|rig_male_character_v003:left_pinky03_ctrl.showScaleCtrl" 
		"rig_male_character_v001RN.placeHolderList[146]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_pinky01_ctrlGrp|rig_male_character_v003:left_pinky01_ctrlOffsetGrp|rig_male_character_v003:left_pinky01_ctrl|rig_male_character_v003:left_pinky02_ctrlGrp|rig_male_character_v003:left_pinky02_ctrlOffsetGrp|rig_male_character_v003:left_pinky02_ctrl|rig_male_character_v003:left_pinky03_ctrlGrp|rig_male_character_v003:left_pinky03_ctrlOffsetGrp|rig_male_character_v003:left_pinky03_ctrl.translateX" 
		"rig_male_character_v001RN.placeHolderList[147]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_pinky01_ctrlGrp|rig_male_character_v003:left_pinky01_ctrlOffsetGrp|rig_male_character_v003:left_pinky01_ctrl|rig_male_character_v003:left_pinky02_ctrlGrp|rig_male_character_v003:left_pinky02_ctrlOffsetGrp|rig_male_character_v003:left_pinky02_ctrl|rig_male_character_v003:left_pinky03_ctrlGrp|rig_male_character_v003:left_pinky03_ctrlOffsetGrp|rig_male_character_v003:left_pinky03_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[148]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_pinky01_ctrlGrp|rig_male_character_v003:left_pinky01_ctrlOffsetGrp|rig_male_character_v003:left_pinky01_ctrl|rig_male_character_v003:left_pinky02_ctrlGrp|rig_male_character_v003:left_pinky02_ctrlOffsetGrp|rig_male_character_v003:left_pinky02_ctrl|rig_male_character_v003:left_pinky03_ctrlGrp|rig_male_character_v003:left_pinky03_ctrlOffsetGrp|rig_male_character_v003:left_pinky03_ctrl.translateZ" 
		"rig_male_character_v001RN.placeHolderList[149]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_pinky01_ctrlGrp|rig_male_character_v003:left_pinky01_ctrlOffsetGrp|rig_male_character_v003:left_pinky01_ctrl|rig_male_character_v003:left_pinky02_ctrlGrp|rig_male_character_v003:left_pinky02_ctrlOffsetGrp|rig_male_character_v003:left_pinky02_ctrl|rig_male_character_v003:left_pinky03_ctrlGrp|rig_male_character_v003:left_pinky03_ctrlOffsetGrp|rig_male_character_v003:left_pinky03_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[150]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_pinky01_ctrlGrp|rig_male_character_v003:left_pinky01_ctrlOffsetGrp|rig_male_character_v003:left_pinky01_ctrl|rig_male_character_v003:left_pinky02_ctrlGrp|rig_male_character_v003:left_pinky02_ctrlOffsetGrp|rig_male_character_v003:left_pinky02_ctrl|rig_male_character_v003:left_pinky03_ctrlGrp|rig_male_character_v003:left_pinky03_ctrlOffsetGrp|rig_male_character_v003:left_pinky03_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[151]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_pinky01_ctrlGrp|rig_male_character_v003:left_pinky01_ctrlOffsetGrp|rig_male_character_v003:left_pinky01_ctrl|rig_male_character_v003:left_pinky02_ctrlGrp|rig_male_character_v003:left_pinky02_ctrlOffsetGrp|rig_male_character_v003:left_pinky02_ctrl|rig_male_character_v003:left_pinky03_ctrlGrp|rig_male_character_v003:left_pinky03_ctrlOffsetGrp|rig_male_character_v003:left_pinky03_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[152]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_thumb01_ctrlGrp|rig_male_character_v003:left_thumb01_ctrlOffsetGrp|rig_male_character_v003:left_thumb01_ctrl.showScaleCtrl" 
		"rig_male_character_v001RN.placeHolderList[153]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_thumb01_ctrlGrp|rig_male_character_v003:left_thumb01_ctrlOffsetGrp|rig_male_character_v003:left_thumb01_ctrl.translateX" 
		"rig_male_character_v001RN.placeHolderList[154]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_thumb01_ctrlGrp|rig_male_character_v003:left_thumb01_ctrlOffsetGrp|rig_male_character_v003:left_thumb01_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[155]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_thumb01_ctrlGrp|rig_male_character_v003:left_thumb01_ctrlOffsetGrp|rig_male_character_v003:left_thumb01_ctrl.translateZ" 
		"rig_male_character_v001RN.placeHolderList[156]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_thumb01_ctrlGrp|rig_male_character_v003:left_thumb01_ctrlOffsetGrp|rig_male_character_v003:left_thumb01_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[157]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_thumb01_ctrlGrp|rig_male_character_v003:left_thumb01_ctrlOffsetGrp|rig_male_character_v003:left_thumb01_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[158]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_thumb01_ctrlGrp|rig_male_character_v003:left_thumb01_ctrlOffsetGrp|rig_male_character_v003:left_thumb01_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[159]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_thumb01_ctrlGrp|rig_male_character_v003:left_thumb01_ctrlOffsetGrp|rig_male_character_v003:left_thumb01_ctrl|rig_male_character_v003:left_thumb02_ctrlGrp|rig_male_character_v003:left_thumb02_ctrlOffsetGrp|rig_male_character_v003:left_thumb02_ctrl.showScaleCtrl" 
		"rig_male_character_v001RN.placeHolderList[160]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_thumb01_ctrlGrp|rig_male_character_v003:left_thumb01_ctrlOffsetGrp|rig_male_character_v003:left_thumb01_ctrl|rig_male_character_v003:left_thumb02_ctrlGrp|rig_male_character_v003:left_thumb02_ctrlOffsetGrp|rig_male_character_v003:left_thumb02_ctrl.translateX" 
		"rig_male_character_v001RN.placeHolderList[161]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_thumb01_ctrlGrp|rig_male_character_v003:left_thumb01_ctrlOffsetGrp|rig_male_character_v003:left_thumb01_ctrl|rig_male_character_v003:left_thumb02_ctrlGrp|rig_male_character_v003:left_thumb02_ctrlOffsetGrp|rig_male_character_v003:left_thumb02_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[162]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_thumb01_ctrlGrp|rig_male_character_v003:left_thumb01_ctrlOffsetGrp|rig_male_character_v003:left_thumb01_ctrl|rig_male_character_v003:left_thumb02_ctrlGrp|rig_male_character_v003:left_thumb02_ctrlOffsetGrp|rig_male_character_v003:left_thumb02_ctrl.translateZ" 
		"rig_male_character_v001RN.placeHolderList[163]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_thumb01_ctrlGrp|rig_male_character_v003:left_thumb01_ctrlOffsetGrp|rig_male_character_v003:left_thumb01_ctrl|rig_male_character_v003:left_thumb02_ctrlGrp|rig_male_character_v003:left_thumb02_ctrlOffsetGrp|rig_male_character_v003:left_thumb02_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[164]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_thumb01_ctrlGrp|rig_male_character_v003:left_thumb01_ctrlOffsetGrp|rig_male_character_v003:left_thumb01_ctrl|rig_male_character_v003:left_thumb02_ctrlGrp|rig_male_character_v003:left_thumb02_ctrlOffsetGrp|rig_male_character_v003:left_thumb02_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[165]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_thumb01_ctrlGrp|rig_male_character_v003:left_thumb01_ctrlOffsetGrp|rig_male_character_v003:left_thumb01_ctrl|rig_male_character_v003:left_thumb02_ctrlGrp|rig_male_character_v003:left_thumb02_ctrlOffsetGrp|rig_male_character_v003:left_thumb02_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[166]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_thumb01_ctrlGrp|rig_male_character_v003:left_thumb01_ctrlOffsetGrp|rig_male_character_v003:left_thumb01_ctrl|rig_male_character_v003:left_thumb02_ctrlGrp|rig_male_character_v003:left_thumb02_ctrlOffsetGrp|rig_male_character_v003:left_thumb02_ctrl|rig_male_character_v003:left_thumb03_ctrlGrp|rig_male_character_v003:left_thumb03_ctrlOffsetGrp|rig_male_character_v003:left_thumb03_ctrl.showScaleCtrl" 
		"rig_male_character_v001RN.placeHolderList[167]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_thumb01_ctrlGrp|rig_male_character_v003:left_thumb01_ctrlOffsetGrp|rig_male_character_v003:left_thumb01_ctrl|rig_male_character_v003:left_thumb02_ctrlGrp|rig_male_character_v003:left_thumb02_ctrlOffsetGrp|rig_male_character_v003:left_thumb02_ctrl|rig_male_character_v003:left_thumb03_ctrlGrp|rig_male_character_v003:left_thumb03_ctrlOffsetGrp|rig_male_character_v003:left_thumb03_ctrl.translateX" 
		"rig_male_character_v001RN.placeHolderList[168]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_thumb01_ctrlGrp|rig_male_character_v003:left_thumb01_ctrlOffsetGrp|rig_male_character_v003:left_thumb01_ctrl|rig_male_character_v003:left_thumb02_ctrlGrp|rig_male_character_v003:left_thumb02_ctrlOffsetGrp|rig_male_character_v003:left_thumb02_ctrl|rig_male_character_v003:left_thumb03_ctrlGrp|rig_male_character_v003:left_thumb03_ctrlOffsetGrp|rig_male_character_v003:left_thumb03_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[169]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_thumb01_ctrlGrp|rig_male_character_v003:left_thumb01_ctrlOffsetGrp|rig_male_character_v003:left_thumb01_ctrl|rig_male_character_v003:left_thumb02_ctrlGrp|rig_male_character_v003:left_thumb02_ctrlOffsetGrp|rig_male_character_v003:left_thumb02_ctrl|rig_male_character_v003:left_thumb03_ctrlGrp|rig_male_character_v003:left_thumb03_ctrlOffsetGrp|rig_male_character_v003:left_thumb03_ctrl.translateZ" 
		"rig_male_character_v001RN.placeHolderList[170]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_thumb01_ctrlGrp|rig_male_character_v003:left_thumb01_ctrlOffsetGrp|rig_male_character_v003:left_thumb01_ctrl|rig_male_character_v003:left_thumb02_ctrlGrp|rig_male_character_v003:left_thumb02_ctrlOffsetGrp|rig_male_character_v003:left_thumb02_ctrl|rig_male_character_v003:left_thumb03_ctrlGrp|rig_male_character_v003:left_thumb03_ctrlOffsetGrp|rig_male_character_v003:left_thumb03_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[171]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_thumb01_ctrlGrp|rig_male_character_v003:left_thumb01_ctrlOffsetGrp|rig_male_character_v003:left_thumb01_ctrl|rig_male_character_v003:left_thumb02_ctrlGrp|rig_male_character_v003:left_thumb02_ctrlOffsetGrp|rig_male_character_v003:left_thumb02_ctrl|rig_male_character_v003:left_thumb03_ctrlGrp|rig_male_character_v003:left_thumb03_ctrlOffsetGrp|rig_male_character_v003:left_thumb03_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[172]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_hand_grp|rig_male_character_v003:left_thumb01_ctrlGrp|rig_male_character_v003:left_thumb01_ctrlOffsetGrp|rig_male_character_v003:left_thumb01_ctrl|rig_male_character_v003:left_thumb02_ctrlGrp|rig_male_character_v003:left_thumb02_ctrlOffsetGrp|rig_male_character_v003:left_thumb02_ctrl|rig_male_character_v003:left_thumb03_ctrlGrp|rig_male_character_v003:left_thumb03_ctrlOffsetGrp|rig_male_character_v003:left_thumb03_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[173]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_wrist_ik_ctrlGrp|rig_male_character_v003:left_wrist_ik_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[174]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_wrist_ik_ctrlGrp|rig_male_character_v003:left_wrist_ik_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[175]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_wrist_ik_ctrlGrp|rig_male_character_v003:left_wrist_ik_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[176]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_wrist_ik_ctrlGrp|rig_male_character_v003:left_wrist_ik_ctrl.translateX" 
		"rig_male_character_v001RN.placeHolderList[177]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_wrist_ik_ctrlGrp|rig_male_character_v003:left_wrist_ik_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[178]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:left_wrist_ik_ctrlGrp|rig_male_character_v003:left_wrist_ik_ctrl.translateZ" 
		"rig_male_character_v001RN.placeHolderList[179]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_index01_ctrlGrp|rig_male_character_v003:right_index01_ctrlOffsetGrp|rig_male_character_v003:right_index01_ctrl.showScaleCtrl" 
		"rig_male_character_v001RN.placeHolderList[180]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_index01_ctrlGrp|rig_male_character_v003:right_index01_ctrlOffsetGrp|rig_male_character_v003:right_index01_ctrl.translateX" 
		"rig_male_character_v001RN.placeHolderList[181]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_index01_ctrlGrp|rig_male_character_v003:right_index01_ctrlOffsetGrp|rig_male_character_v003:right_index01_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[182]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_index01_ctrlGrp|rig_male_character_v003:right_index01_ctrlOffsetGrp|rig_male_character_v003:right_index01_ctrl.translateZ" 
		"rig_male_character_v001RN.placeHolderList[183]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_index01_ctrlGrp|rig_male_character_v003:right_index01_ctrlOffsetGrp|rig_male_character_v003:right_index01_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[184]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_index01_ctrlGrp|rig_male_character_v003:right_index01_ctrlOffsetGrp|rig_male_character_v003:right_index01_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[185]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_index01_ctrlGrp|rig_male_character_v003:right_index01_ctrlOffsetGrp|rig_male_character_v003:right_index01_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[186]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_index01_ctrlGrp|rig_male_character_v003:right_index01_ctrlOffsetGrp|rig_male_character_v003:right_index01_ctrl|rig_male_character_v003:right_index02_ctrlGrp|rig_male_character_v003:right_index02_ctrlOffsetGrp|rig_male_character_v003:right_index02_ctrl.showScaleCtrl" 
		"rig_male_character_v001RN.placeHolderList[187]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_index01_ctrlGrp|rig_male_character_v003:right_index01_ctrlOffsetGrp|rig_male_character_v003:right_index01_ctrl|rig_male_character_v003:right_index02_ctrlGrp|rig_male_character_v003:right_index02_ctrlOffsetGrp|rig_male_character_v003:right_index02_ctrl.translateX" 
		"rig_male_character_v001RN.placeHolderList[188]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_index01_ctrlGrp|rig_male_character_v003:right_index01_ctrlOffsetGrp|rig_male_character_v003:right_index01_ctrl|rig_male_character_v003:right_index02_ctrlGrp|rig_male_character_v003:right_index02_ctrlOffsetGrp|rig_male_character_v003:right_index02_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[189]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_index01_ctrlGrp|rig_male_character_v003:right_index01_ctrlOffsetGrp|rig_male_character_v003:right_index01_ctrl|rig_male_character_v003:right_index02_ctrlGrp|rig_male_character_v003:right_index02_ctrlOffsetGrp|rig_male_character_v003:right_index02_ctrl.translateZ" 
		"rig_male_character_v001RN.placeHolderList[190]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_index01_ctrlGrp|rig_male_character_v003:right_index01_ctrlOffsetGrp|rig_male_character_v003:right_index01_ctrl|rig_male_character_v003:right_index02_ctrlGrp|rig_male_character_v003:right_index02_ctrlOffsetGrp|rig_male_character_v003:right_index02_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[191]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_index01_ctrlGrp|rig_male_character_v003:right_index01_ctrlOffsetGrp|rig_male_character_v003:right_index01_ctrl|rig_male_character_v003:right_index02_ctrlGrp|rig_male_character_v003:right_index02_ctrlOffsetGrp|rig_male_character_v003:right_index02_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[192]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_index01_ctrlGrp|rig_male_character_v003:right_index01_ctrlOffsetGrp|rig_male_character_v003:right_index01_ctrl|rig_male_character_v003:right_index02_ctrlGrp|rig_male_character_v003:right_index02_ctrlOffsetGrp|rig_male_character_v003:right_index02_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[193]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_index01_ctrlGrp|rig_male_character_v003:right_index01_ctrlOffsetGrp|rig_male_character_v003:right_index01_ctrl|rig_male_character_v003:right_index02_ctrlGrp|rig_male_character_v003:right_index02_ctrlOffsetGrp|rig_male_character_v003:right_index02_ctrl|rig_male_character_v003:right_index03_ctrlGrp|rig_male_character_v003:right_index03_ctrlOffsetGrp|rig_male_character_v003:right_index03_ctrl.showScaleCtrl" 
		"rig_male_character_v001RN.placeHolderList[194]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_index01_ctrlGrp|rig_male_character_v003:right_index01_ctrlOffsetGrp|rig_male_character_v003:right_index01_ctrl|rig_male_character_v003:right_index02_ctrlGrp|rig_male_character_v003:right_index02_ctrlOffsetGrp|rig_male_character_v003:right_index02_ctrl|rig_male_character_v003:right_index03_ctrlGrp|rig_male_character_v003:right_index03_ctrlOffsetGrp|rig_male_character_v003:right_index03_ctrl.translateX" 
		"rig_male_character_v001RN.placeHolderList[195]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_index01_ctrlGrp|rig_male_character_v003:right_index01_ctrlOffsetGrp|rig_male_character_v003:right_index01_ctrl|rig_male_character_v003:right_index02_ctrlGrp|rig_male_character_v003:right_index02_ctrlOffsetGrp|rig_male_character_v003:right_index02_ctrl|rig_male_character_v003:right_index03_ctrlGrp|rig_male_character_v003:right_index03_ctrlOffsetGrp|rig_male_character_v003:right_index03_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[196]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_index01_ctrlGrp|rig_male_character_v003:right_index01_ctrlOffsetGrp|rig_male_character_v003:right_index01_ctrl|rig_male_character_v003:right_index02_ctrlGrp|rig_male_character_v003:right_index02_ctrlOffsetGrp|rig_male_character_v003:right_index02_ctrl|rig_male_character_v003:right_index03_ctrlGrp|rig_male_character_v003:right_index03_ctrlOffsetGrp|rig_male_character_v003:right_index03_ctrl.translateZ" 
		"rig_male_character_v001RN.placeHolderList[197]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_index01_ctrlGrp|rig_male_character_v003:right_index01_ctrlOffsetGrp|rig_male_character_v003:right_index01_ctrl|rig_male_character_v003:right_index02_ctrlGrp|rig_male_character_v003:right_index02_ctrlOffsetGrp|rig_male_character_v003:right_index02_ctrl|rig_male_character_v003:right_index03_ctrlGrp|rig_male_character_v003:right_index03_ctrlOffsetGrp|rig_male_character_v003:right_index03_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[198]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_index01_ctrlGrp|rig_male_character_v003:right_index01_ctrlOffsetGrp|rig_male_character_v003:right_index01_ctrl|rig_male_character_v003:right_index02_ctrlGrp|rig_male_character_v003:right_index02_ctrlOffsetGrp|rig_male_character_v003:right_index02_ctrl|rig_male_character_v003:right_index03_ctrlGrp|rig_male_character_v003:right_index03_ctrlOffsetGrp|rig_male_character_v003:right_index03_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[199]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_index01_ctrlGrp|rig_male_character_v003:right_index01_ctrlOffsetGrp|rig_male_character_v003:right_index01_ctrl|rig_male_character_v003:right_index02_ctrlGrp|rig_male_character_v003:right_index02_ctrlOffsetGrp|rig_male_character_v003:right_index02_ctrl|rig_male_character_v003:right_index03_ctrlGrp|rig_male_character_v003:right_index03_ctrlOffsetGrp|rig_male_character_v003:right_index03_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[200]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_middle01_ctrlGrp|rig_male_character_v003:right_middle01_ctrlOffsetGrp|rig_male_character_v003:right_middle01_ctrl.showScaleCtrl" 
		"rig_male_character_v001RN.placeHolderList[201]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_middle01_ctrlGrp|rig_male_character_v003:right_middle01_ctrlOffsetGrp|rig_male_character_v003:right_middle01_ctrl.translateX" 
		"rig_male_character_v001RN.placeHolderList[202]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_middle01_ctrlGrp|rig_male_character_v003:right_middle01_ctrlOffsetGrp|rig_male_character_v003:right_middle01_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[203]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_middle01_ctrlGrp|rig_male_character_v003:right_middle01_ctrlOffsetGrp|rig_male_character_v003:right_middle01_ctrl.translateZ" 
		"rig_male_character_v001RN.placeHolderList[204]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_middle01_ctrlGrp|rig_male_character_v003:right_middle01_ctrlOffsetGrp|rig_male_character_v003:right_middle01_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[205]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_middle01_ctrlGrp|rig_male_character_v003:right_middle01_ctrlOffsetGrp|rig_male_character_v003:right_middle01_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[206]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_middle01_ctrlGrp|rig_male_character_v003:right_middle01_ctrlOffsetGrp|rig_male_character_v003:right_middle01_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[207]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_middle01_ctrlGrp|rig_male_character_v003:right_middle01_ctrlOffsetGrp|rig_male_character_v003:right_middle01_ctrl|rig_male_character_v003:right_middle02_ctrlGrp|rig_male_character_v003:right_middle02_ctrlOffsetGrp|rig_male_character_v003:right_middle02_ctrl.showScaleCtrl" 
		"rig_male_character_v001RN.placeHolderList[208]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_middle01_ctrlGrp|rig_male_character_v003:right_middle01_ctrlOffsetGrp|rig_male_character_v003:right_middle01_ctrl|rig_male_character_v003:right_middle02_ctrlGrp|rig_male_character_v003:right_middle02_ctrlOffsetGrp|rig_male_character_v003:right_middle02_ctrl.translateX" 
		"rig_male_character_v001RN.placeHolderList[209]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_middle01_ctrlGrp|rig_male_character_v003:right_middle01_ctrlOffsetGrp|rig_male_character_v003:right_middle01_ctrl|rig_male_character_v003:right_middle02_ctrlGrp|rig_male_character_v003:right_middle02_ctrlOffsetGrp|rig_male_character_v003:right_middle02_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[210]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_middle01_ctrlGrp|rig_male_character_v003:right_middle01_ctrlOffsetGrp|rig_male_character_v003:right_middle01_ctrl|rig_male_character_v003:right_middle02_ctrlGrp|rig_male_character_v003:right_middle02_ctrlOffsetGrp|rig_male_character_v003:right_middle02_ctrl.translateZ" 
		"rig_male_character_v001RN.placeHolderList[211]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_middle01_ctrlGrp|rig_male_character_v003:right_middle01_ctrlOffsetGrp|rig_male_character_v003:right_middle01_ctrl|rig_male_character_v003:right_middle02_ctrlGrp|rig_male_character_v003:right_middle02_ctrlOffsetGrp|rig_male_character_v003:right_middle02_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[212]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_middle01_ctrlGrp|rig_male_character_v003:right_middle01_ctrlOffsetGrp|rig_male_character_v003:right_middle01_ctrl|rig_male_character_v003:right_middle02_ctrlGrp|rig_male_character_v003:right_middle02_ctrlOffsetGrp|rig_male_character_v003:right_middle02_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[213]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_middle01_ctrlGrp|rig_male_character_v003:right_middle01_ctrlOffsetGrp|rig_male_character_v003:right_middle01_ctrl|rig_male_character_v003:right_middle02_ctrlGrp|rig_male_character_v003:right_middle02_ctrlOffsetGrp|rig_male_character_v003:right_middle02_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[214]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_middle01_ctrlGrp|rig_male_character_v003:right_middle01_ctrlOffsetGrp|rig_male_character_v003:right_middle01_ctrl|rig_male_character_v003:right_middle02_ctrlGrp|rig_male_character_v003:right_middle02_ctrlOffsetGrp|rig_male_character_v003:right_middle02_ctrl|rig_male_character_v003:right_middle03_ctrlGrp|rig_male_character_v003:right_middle03_ctrlOffsetGrp|rig_male_character_v003:right_middle03_ctrl.showScaleCtrl" 
		"rig_male_character_v001RN.placeHolderList[215]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_middle01_ctrlGrp|rig_male_character_v003:right_middle01_ctrlOffsetGrp|rig_male_character_v003:right_middle01_ctrl|rig_male_character_v003:right_middle02_ctrlGrp|rig_male_character_v003:right_middle02_ctrlOffsetGrp|rig_male_character_v003:right_middle02_ctrl|rig_male_character_v003:right_middle03_ctrlGrp|rig_male_character_v003:right_middle03_ctrlOffsetGrp|rig_male_character_v003:right_middle03_ctrl.translateX" 
		"rig_male_character_v001RN.placeHolderList[216]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_middle01_ctrlGrp|rig_male_character_v003:right_middle01_ctrlOffsetGrp|rig_male_character_v003:right_middle01_ctrl|rig_male_character_v003:right_middle02_ctrlGrp|rig_male_character_v003:right_middle02_ctrlOffsetGrp|rig_male_character_v003:right_middle02_ctrl|rig_male_character_v003:right_middle03_ctrlGrp|rig_male_character_v003:right_middle03_ctrlOffsetGrp|rig_male_character_v003:right_middle03_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[217]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_middle01_ctrlGrp|rig_male_character_v003:right_middle01_ctrlOffsetGrp|rig_male_character_v003:right_middle01_ctrl|rig_male_character_v003:right_middle02_ctrlGrp|rig_male_character_v003:right_middle02_ctrlOffsetGrp|rig_male_character_v003:right_middle02_ctrl|rig_male_character_v003:right_middle03_ctrlGrp|rig_male_character_v003:right_middle03_ctrlOffsetGrp|rig_male_character_v003:right_middle03_ctrl.translateZ" 
		"rig_male_character_v001RN.placeHolderList[218]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_middle01_ctrlGrp|rig_male_character_v003:right_middle01_ctrlOffsetGrp|rig_male_character_v003:right_middle01_ctrl|rig_male_character_v003:right_middle02_ctrlGrp|rig_male_character_v003:right_middle02_ctrlOffsetGrp|rig_male_character_v003:right_middle02_ctrl|rig_male_character_v003:right_middle03_ctrlGrp|rig_male_character_v003:right_middle03_ctrlOffsetGrp|rig_male_character_v003:right_middle03_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[219]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_middle01_ctrlGrp|rig_male_character_v003:right_middle01_ctrlOffsetGrp|rig_male_character_v003:right_middle01_ctrl|rig_male_character_v003:right_middle02_ctrlGrp|rig_male_character_v003:right_middle02_ctrlOffsetGrp|rig_male_character_v003:right_middle02_ctrl|rig_male_character_v003:right_middle03_ctrlGrp|rig_male_character_v003:right_middle03_ctrlOffsetGrp|rig_male_character_v003:right_middle03_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[220]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_middle01_ctrlGrp|rig_male_character_v003:right_middle01_ctrlOffsetGrp|rig_male_character_v003:right_middle01_ctrl|rig_male_character_v003:right_middle02_ctrlGrp|rig_male_character_v003:right_middle02_ctrlOffsetGrp|rig_male_character_v003:right_middle02_ctrl|rig_male_character_v003:right_middle03_ctrlGrp|rig_male_character_v003:right_middle03_ctrlOffsetGrp|rig_male_character_v003:right_middle03_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[221]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_ring01_ctrlGrp|rig_male_character_v003:right_ring01_ctrlOffsetGrp|rig_male_character_v003:right_ring01_ctrl.showScaleCtrl" 
		"rig_male_character_v001RN.placeHolderList[222]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_ring01_ctrlGrp|rig_male_character_v003:right_ring01_ctrlOffsetGrp|rig_male_character_v003:right_ring01_ctrl.translateX" 
		"rig_male_character_v001RN.placeHolderList[223]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_ring01_ctrlGrp|rig_male_character_v003:right_ring01_ctrlOffsetGrp|rig_male_character_v003:right_ring01_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[224]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_ring01_ctrlGrp|rig_male_character_v003:right_ring01_ctrlOffsetGrp|rig_male_character_v003:right_ring01_ctrl.translateZ" 
		"rig_male_character_v001RN.placeHolderList[225]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_ring01_ctrlGrp|rig_male_character_v003:right_ring01_ctrlOffsetGrp|rig_male_character_v003:right_ring01_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[226]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_ring01_ctrlGrp|rig_male_character_v003:right_ring01_ctrlOffsetGrp|rig_male_character_v003:right_ring01_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[227]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_ring01_ctrlGrp|rig_male_character_v003:right_ring01_ctrlOffsetGrp|rig_male_character_v003:right_ring01_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[228]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_ring01_ctrlGrp|rig_male_character_v003:right_ring01_ctrlOffsetGrp|rig_male_character_v003:right_ring01_ctrl|rig_male_character_v003:right_ring02_ctrlGrp|rig_male_character_v003:right_ring02_ctrlOffsetGrp|rig_male_character_v003:right_ring02_ctrl.showScaleCtrl" 
		"rig_male_character_v001RN.placeHolderList[229]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_ring01_ctrlGrp|rig_male_character_v003:right_ring01_ctrlOffsetGrp|rig_male_character_v003:right_ring01_ctrl|rig_male_character_v003:right_ring02_ctrlGrp|rig_male_character_v003:right_ring02_ctrlOffsetGrp|rig_male_character_v003:right_ring02_ctrl.translateX" 
		"rig_male_character_v001RN.placeHolderList[230]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_ring01_ctrlGrp|rig_male_character_v003:right_ring01_ctrlOffsetGrp|rig_male_character_v003:right_ring01_ctrl|rig_male_character_v003:right_ring02_ctrlGrp|rig_male_character_v003:right_ring02_ctrlOffsetGrp|rig_male_character_v003:right_ring02_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[231]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_ring01_ctrlGrp|rig_male_character_v003:right_ring01_ctrlOffsetGrp|rig_male_character_v003:right_ring01_ctrl|rig_male_character_v003:right_ring02_ctrlGrp|rig_male_character_v003:right_ring02_ctrlOffsetGrp|rig_male_character_v003:right_ring02_ctrl.translateZ" 
		"rig_male_character_v001RN.placeHolderList[232]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_ring01_ctrlGrp|rig_male_character_v003:right_ring01_ctrlOffsetGrp|rig_male_character_v003:right_ring01_ctrl|rig_male_character_v003:right_ring02_ctrlGrp|rig_male_character_v003:right_ring02_ctrlOffsetGrp|rig_male_character_v003:right_ring02_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[233]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_ring01_ctrlGrp|rig_male_character_v003:right_ring01_ctrlOffsetGrp|rig_male_character_v003:right_ring01_ctrl|rig_male_character_v003:right_ring02_ctrlGrp|rig_male_character_v003:right_ring02_ctrlOffsetGrp|rig_male_character_v003:right_ring02_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[234]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_ring01_ctrlGrp|rig_male_character_v003:right_ring01_ctrlOffsetGrp|rig_male_character_v003:right_ring01_ctrl|rig_male_character_v003:right_ring02_ctrlGrp|rig_male_character_v003:right_ring02_ctrlOffsetGrp|rig_male_character_v003:right_ring02_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[235]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_ring01_ctrlGrp|rig_male_character_v003:right_ring01_ctrlOffsetGrp|rig_male_character_v003:right_ring01_ctrl|rig_male_character_v003:right_ring02_ctrlGrp|rig_male_character_v003:right_ring02_ctrlOffsetGrp|rig_male_character_v003:right_ring02_ctrl|rig_male_character_v003:right_ring03_ctrlGrp|rig_male_character_v003:right_ring03_ctrlOffsetGrp|rig_male_character_v003:right_ring03_ctrl.showScaleCtrl" 
		"rig_male_character_v001RN.placeHolderList[236]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_ring01_ctrlGrp|rig_male_character_v003:right_ring01_ctrlOffsetGrp|rig_male_character_v003:right_ring01_ctrl|rig_male_character_v003:right_ring02_ctrlGrp|rig_male_character_v003:right_ring02_ctrlOffsetGrp|rig_male_character_v003:right_ring02_ctrl|rig_male_character_v003:right_ring03_ctrlGrp|rig_male_character_v003:right_ring03_ctrlOffsetGrp|rig_male_character_v003:right_ring03_ctrl.translateX" 
		"rig_male_character_v001RN.placeHolderList[237]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_ring01_ctrlGrp|rig_male_character_v003:right_ring01_ctrlOffsetGrp|rig_male_character_v003:right_ring01_ctrl|rig_male_character_v003:right_ring02_ctrlGrp|rig_male_character_v003:right_ring02_ctrlOffsetGrp|rig_male_character_v003:right_ring02_ctrl|rig_male_character_v003:right_ring03_ctrlGrp|rig_male_character_v003:right_ring03_ctrlOffsetGrp|rig_male_character_v003:right_ring03_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[238]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_ring01_ctrlGrp|rig_male_character_v003:right_ring01_ctrlOffsetGrp|rig_male_character_v003:right_ring01_ctrl|rig_male_character_v003:right_ring02_ctrlGrp|rig_male_character_v003:right_ring02_ctrlOffsetGrp|rig_male_character_v003:right_ring02_ctrl|rig_male_character_v003:right_ring03_ctrlGrp|rig_male_character_v003:right_ring03_ctrlOffsetGrp|rig_male_character_v003:right_ring03_ctrl.translateZ" 
		"rig_male_character_v001RN.placeHolderList[239]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_ring01_ctrlGrp|rig_male_character_v003:right_ring01_ctrlOffsetGrp|rig_male_character_v003:right_ring01_ctrl|rig_male_character_v003:right_ring02_ctrlGrp|rig_male_character_v003:right_ring02_ctrlOffsetGrp|rig_male_character_v003:right_ring02_ctrl|rig_male_character_v003:right_ring03_ctrlGrp|rig_male_character_v003:right_ring03_ctrlOffsetGrp|rig_male_character_v003:right_ring03_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[240]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_ring01_ctrlGrp|rig_male_character_v003:right_ring01_ctrlOffsetGrp|rig_male_character_v003:right_ring01_ctrl|rig_male_character_v003:right_ring02_ctrlGrp|rig_male_character_v003:right_ring02_ctrlOffsetGrp|rig_male_character_v003:right_ring02_ctrl|rig_male_character_v003:right_ring03_ctrlGrp|rig_male_character_v003:right_ring03_ctrlOffsetGrp|rig_male_character_v003:right_ring03_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[241]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_ring01_ctrlGrp|rig_male_character_v003:right_ring01_ctrlOffsetGrp|rig_male_character_v003:right_ring01_ctrl|rig_male_character_v003:right_ring02_ctrlGrp|rig_male_character_v003:right_ring02_ctrlOffsetGrp|rig_male_character_v003:right_ring02_ctrl|rig_male_character_v003:right_ring03_ctrlGrp|rig_male_character_v003:right_ring03_ctrlOffsetGrp|rig_male_character_v003:right_ring03_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[242]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_pinky01_ctrlGrp|rig_male_character_v003:right_pinky01_ctrlOffsetGrp|rig_male_character_v003:right_pinky01_ctrl.showScaleCtrl" 
		"rig_male_character_v001RN.placeHolderList[243]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_pinky01_ctrlGrp|rig_male_character_v003:right_pinky01_ctrlOffsetGrp|rig_male_character_v003:right_pinky01_ctrl.translateX" 
		"rig_male_character_v001RN.placeHolderList[244]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_pinky01_ctrlGrp|rig_male_character_v003:right_pinky01_ctrlOffsetGrp|rig_male_character_v003:right_pinky01_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[245]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_pinky01_ctrlGrp|rig_male_character_v003:right_pinky01_ctrlOffsetGrp|rig_male_character_v003:right_pinky01_ctrl.translateZ" 
		"rig_male_character_v001RN.placeHolderList[246]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_pinky01_ctrlGrp|rig_male_character_v003:right_pinky01_ctrlOffsetGrp|rig_male_character_v003:right_pinky01_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[247]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_pinky01_ctrlGrp|rig_male_character_v003:right_pinky01_ctrlOffsetGrp|rig_male_character_v003:right_pinky01_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[248]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_pinky01_ctrlGrp|rig_male_character_v003:right_pinky01_ctrlOffsetGrp|rig_male_character_v003:right_pinky01_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[249]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_pinky01_ctrlGrp|rig_male_character_v003:right_pinky01_ctrlOffsetGrp|rig_male_character_v003:right_pinky01_ctrl|rig_male_character_v003:right_pinky02_ctrlGrp|rig_male_character_v003:right_pinky02_ctrlOffsetGrp|rig_male_character_v003:right_pinky02_ctrl.showScaleCtrl" 
		"rig_male_character_v001RN.placeHolderList[250]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_pinky01_ctrlGrp|rig_male_character_v003:right_pinky01_ctrlOffsetGrp|rig_male_character_v003:right_pinky01_ctrl|rig_male_character_v003:right_pinky02_ctrlGrp|rig_male_character_v003:right_pinky02_ctrlOffsetGrp|rig_male_character_v003:right_pinky02_ctrl.translateX" 
		"rig_male_character_v001RN.placeHolderList[251]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_pinky01_ctrlGrp|rig_male_character_v003:right_pinky01_ctrlOffsetGrp|rig_male_character_v003:right_pinky01_ctrl|rig_male_character_v003:right_pinky02_ctrlGrp|rig_male_character_v003:right_pinky02_ctrlOffsetGrp|rig_male_character_v003:right_pinky02_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[252]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_pinky01_ctrlGrp|rig_male_character_v003:right_pinky01_ctrlOffsetGrp|rig_male_character_v003:right_pinky01_ctrl|rig_male_character_v003:right_pinky02_ctrlGrp|rig_male_character_v003:right_pinky02_ctrlOffsetGrp|rig_male_character_v003:right_pinky02_ctrl.translateZ" 
		"rig_male_character_v001RN.placeHolderList[253]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_pinky01_ctrlGrp|rig_male_character_v003:right_pinky01_ctrlOffsetGrp|rig_male_character_v003:right_pinky01_ctrl|rig_male_character_v003:right_pinky02_ctrlGrp|rig_male_character_v003:right_pinky02_ctrlOffsetGrp|rig_male_character_v003:right_pinky02_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[254]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_pinky01_ctrlGrp|rig_male_character_v003:right_pinky01_ctrlOffsetGrp|rig_male_character_v003:right_pinky01_ctrl|rig_male_character_v003:right_pinky02_ctrlGrp|rig_male_character_v003:right_pinky02_ctrlOffsetGrp|rig_male_character_v003:right_pinky02_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[255]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_pinky01_ctrlGrp|rig_male_character_v003:right_pinky01_ctrlOffsetGrp|rig_male_character_v003:right_pinky01_ctrl|rig_male_character_v003:right_pinky02_ctrlGrp|rig_male_character_v003:right_pinky02_ctrlOffsetGrp|rig_male_character_v003:right_pinky02_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[256]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_pinky01_ctrlGrp|rig_male_character_v003:right_pinky01_ctrlOffsetGrp|rig_male_character_v003:right_pinky01_ctrl|rig_male_character_v003:right_pinky02_ctrlGrp|rig_male_character_v003:right_pinky02_ctrlOffsetGrp|rig_male_character_v003:right_pinky02_ctrl|rig_male_character_v003:right_pinky03_ctrlGrp|rig_male_character_v003:right_pinky03_ctrlOffsetGrp|rig_male_character_v003:right_pinky03_ctrl.showScaleCtrl" 
		"rig_male_character_v001RN.placeHolderList[257]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_pinky01_ctrlGrp|rig_male_character_v003:right_pinky01_ctrlOffsetGrp|rig_male_character_v003:right_pinky01_ctrl|rig_male_character_v003:right_pinky02_ctrlGrp|rig_male_character_v003:right_pinky02_ctrlOffsetGrp|rig_male_character_v003:right_pinky02_ctrl|rig_male_character_v003:right_pinky03_ctrlGrp|rig_male_character_v003:right_pinky03_ctrlOffsetGrp|rig_male_character_v003:right_pinky03_ctrl.translateX" 
		"rig_male_character_v001RN.placeHolderList[258]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_pinky01_ctrlGrp|rig_male_character_v003:right_pinky01_ctrlOffsetGrp|rig_male_character_v003:right_pinky01_ctrl|rig_male_character_v003:right_pinky02_ctrlGrp|rig_male_character_v003:right_pinky02_ctrlOffsetGrp|rig_male_character_v003:right_pinky02_ctrl|rig_male_character_v003:right_pinky03_ctrlGrp|rig_male_character_v003:right_pinky03_ctrlOffsetGrp|rig_male_character_v003:right_pinky03_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[259]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_pinky01_ctrlGrp|rig_male_character_v003:right_pinky01_ctrlOffsetGrp|rig_male_character_v003:right_pinky01_ctrl|rig_male_character_v003:right_pinky02_ctrlGrp|rig_male_character_v003:right_pinky02_ctrlOffsetGrp|rig_male_character_v003:right_pinky02_ctrl|rig_male_character_v003:right_pinky03_ctrlGrp|rig_male_character_v003:right_pinky03_ctrlOffsetGrp|rig_male_character_v003:right_pinky03_ctrl.translateZ" 
		"rig_male_character_v001RN.placeHolderList[260]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_pinky01_ctrlGrp|rig_male_character_v003:right_pinky01_ctrlOffsetGrp|rig_male_character_v003:right_pinky01_ctrl|rig_male_character_v003:right_pinky02_ctrlGrp|rig_male_character_v003:right_pinky02_ctrlOffsetGrp|rig_male_character_v003:right_pinky02_ctrl|rig_male_character_v003:right_pinky03_ctrlGrp|rig_male_character_v003:right_pinky03_ctrlOffsetGrp|rig_male_character_v003:right_pinky03_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[261]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_pinky01_ctrlGrp|rig_male_character_v003:right_pinky01_ctrlOffsetGrp|rig_male_character_v003:right_pinky01_ctrl|rig_male_character_v003:right_pinky02_ctrlGrp|rig_male_character_v003:right_pinky02_ctrlOffsetGrp|rig_male_character_v003:right_pinky02_ctrl|rig_male_character_v003:right_pinky03_ctrlGrp|rig_male_character_v003:right_pinky03_ctrlOffsetGrp|rig_male_character_v003:right_pinky03_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[262]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_pinky01_ctrlGrp|rig_male_character_v003:right_pinky01_ctrlOffsetGrp|rig_male_character_v003:right_pinky01_ctrl|rig_male_character_v003:right_pinky02_ctrlGrp|rig_male_character_v003:right_pinky02_ctrlOffsetGrp|rig_male_character_v003:right_pinky02_ctrl|rig_male_character_v003:right_pinky03_ctrlGrp|rig_male_character_v003:right_pinky03_ctrlOffsetGrp|rig_male_character_v003:right_pinky03_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[263]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_thumb01_ctrlGrp|rig_male_character_v003:right_thumb01_ctrlOffsetGrp|rig_male_character_v003:right_thumb01_ctrl.showScaleCtrl" 
		"rig_male_character_v001RN.placeHolderList[264]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_thumb01_ctrlGrp|rig_male_character_v003:right_thumb01_ctrlOffsetGrp|rig_male_character_v003:right_thumb01_ctrl.translateX" 
		"rig_male_character_v001RN.placeHolderList[265]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_thumb01_ctrlGrp|rig_male_character_v003:right_thumb01_ctrlOffsetGrp|rig_male_character_v003:right_thumb01_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[266]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_thumb01_ctrlGrp|rig_male_character_v003:right_thumb01_ctrlOffsetGrp|rig_male_character_v003:right_thumb01_ctrl.translateZ" 
		"rig_male_character_v001RN.placeHolderList[267]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_thumb01_ctrlGrp|rig_male_character_v003:right_thumb01_ctrlOffsetGrp|rig_male_character_v003:right_thumb01_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[268]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_thumb01_ctrlGrp|rig_male_character_v003:right_thumb01_ctrlOffsetGrp|rig_male_character_v003:right_thumb01_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[269]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_thumb01_ctrlGrp|rig_male_character_v003:right_thumb01_ctrlOffsetGrp|rig_male_character_v003:right_thumb01_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[270]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_thumb01_ctrlGrp|rig_male_character_v003:right_thumb01_ctrlOffsetGrp|rig_male_character_v003:right_thumb01_ctrl|rig_male_character_v003:right_thumb02_ctrlGrp|rig_male_character_v003:right_thumb02_ctrlOffsetGrp|rig_male_character_v003:right_thumb02_ctrl.showScaleCtrl" 
		"rig_male_character_v001RN.placeHolderList[271]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_thumb01_ctrlGrp|rig_male_character_v003:right_thumb01_ctrlOffsetGrp|rig_male_character_v003:right_thumb01_ctrl|rig_male_character_v003:right_thumb02_ctrlGrp|rig_male_character_v003:right_thumb02_ctrlOffsetGrp|rig_male_character_v003:right_thumb02_ctrl.translateX" 
		"rig_male_character_v001RN.placeHolderList[272]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_thumb01_ctrlGrp|rig_male_character_v003:right_thumb01_ctrlOffsetGrp|rig_male_character_v003:right_thumb01_ctrl|rig_male_character_v003:right_thumb02_ctrlGrp|rig_male_character_v003:right_thumb02_ctrlOffsetGrp|rig_male_character_v003:right_thumb02_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[273]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_thumb01_ctrlGrp|rig_male_character_v003:right_thumb01_ctrlOffsetGrp|rig_male_character_v003:right_thumb01_ctrl|rig_male_character_v003:right_thumb02_ctrlGrp|rig_male_character_v003:right_thumb02_ctrlOffsetGrp|rig_male_character_v003:right_thumb02_ctrl.translateZ" 
		"rig_male_character_v001RN.placeHolderList[274]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_thumb01_ctrlGrp|rig_male_character_v003:right_thumb01_ctrlOffsetGrp|rig_male_character_v003:right_thumb01_ctrl|rig_male_character_v003:right_thumb02_ctrlGrp|rig_male_character_v003:right_thumb02_ctrlOffsetGrp|rig_male_character_v003:right_thumb02_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[275]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_thumb01_ctrlGrp|rig_male_character_v003:right_thumb01_ctrlOffsetGrp|rig_male_character_v003:right_thumb01_ctrl|rig_male_character_v003:right_thumb02_ctrlGrp|rig_male_character_v003:right_thumb02_ctrlOffsetGrp|rig_male_character_v003:right_thumb02_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[276]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_thumb01_ctrlGrp|rig_male_character_v003:right_thumb01_ctrlOffsetGrp|rig_male_character_v003:right_thumb01_ctrl|rig_male_character_v003:right_thumb02_ctrlGrp|rig_male_character_v003:right_thumb02_ctrlOffsetGrp|rig_male_character_v003:right_thumb02_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[277]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_thumb01_ctrlGrp|rig_male_character_v003:right_thumb01_ctrlOffsetGrp|rig_male_character_v003:right_thumb01_ctrl|rig_male_character_v003:right_thumb02_ctrlGrp|rig_male_character_v003:right_thumb02_ctrlOffsetGrp|rig_male_character_v003:right_thumb02_ctrl|rig_male_character_v003:right_thumb03_ctrlGrp|rig_male_character_v003:right_thumb03_ctrlOffsetGrp|rig_male_character_v003:right_thumb03_ctrl.showScaleCtrl" 
		"rig_male_character_v001RN.placeHolderList[278]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_thumb01_ctrlGrp|rig_male_character_v003:right_thumb01_ctrlOffsetGrp|rig_male_character_v003:right_thumb01_ctrl|rig_male_character_v003:right_thumb02_ctrlGrp|rig_male_character_v003:right_thumb02_ctrlOffsetGrp|rig_male_character_v003:right_thumb02_ctrl|rig_male_character_v003:right_thumb03_ctrlGrp|rig_male_character_v003:right_thumb03_ctrlOffsetGrp|rig_male_character_v003:right_thumb03_ctrl.translateX" 
		"rig_male_character_v001RN.placeHolderList[279]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_thumb01_ctrlGrp|rig_male_character_v003:right_thumb01_ctrlOffsetGrp|rig_male_character_v003:right_thumb01_ctrl|rig_male_character_v003:right_thumb02_ctrlGrp|rig_male_character_v003:right_thumb02_ctrlOffsetGrp|rig_male_character_v003:right_thumb02_ctrl|rig_male_character_v003:right_thumb03_ctrlGrp|rig_male_character_v003:right_thumb03_ctrlOffsetGrp|rig_male_character_v003:right_thumb03_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[280]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_thumb01_ctrlGrp|rig_male_character_v003:right_thumb01_ctrlOffsetGrp|rig_male_character_v003:right_thumb01_ctrl|rig_male_character_v003:right_thumb02_ctrlGrp|rig_male_character_v003:right_thumb02_ctrlOffsetGrp|rig_male_character_v003:right_thumb02_ctrl|rig_male_character_v003:right_thumb03_ctrlGrp|rig_male_character_v003:right_thumb03_ctrlOffsetGrp|rig_male_character_v003:right_thumb03_ctrl.translateZ" 
		"rig_male_character_v001RN.placeHolderList[281]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_thumb01_ctrlGrp|rig_male_character_v003:right_thumb01_ctrlOffsetGrp|rig_male_character_v003:right_thumb01_ctrl|rig_male_character_v003:right_thumb02_ctrlGrp|rig_male_character_v003:right_thumb02_ctrlOffsetGrp|rig_male_character_v003:right_thumb02_ctrl|rig_male_character_v003:right_thumb03_ctrlGrp|rig_male_character_v003:right_thumb03_ctrlOffsetGrp|rig_male_character_v003:right_thumb03_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[282]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_thumb01_ctrlGrp|rig_male_character_v003:right_thumb01_ctrlOffsetGrp|rig_male_character_v003:right_thumb01_ctrl|rig_male_character_v003:right_thumb02_ctrlGrp|rig_male_character_v003:right_thumb02_ctrlOffsetGrp|rig_male_character_v003:right_thumb02_ctrl|rig_male_character_v003:right_thumb03_ctrlGrp|rig_male_character_v003:right_thumb03_ctrlOffsetGrp|rig_male_character_v003:right_thumb03_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[283]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_hand_grp|rig_male_character_v003:right_thumb01_ctrlGrp|rig_male_character_v003:right_thumb01_ctrlOffsetGrp|rig_male_character_v003:right_thumb01_ctrl|rig_male_character_v003:right_thumb02_ctrlGrp|rig_male_character_v003:right_thumb02_ctrlOffsetGrp|rig_male_character_v003:right_thumb02_ctrl|rig_male_character_v003:right_thumb03_ctrlGrp|rig_male_character_v003:right_thumb03_ctrlOffsetGrp|rig_male_character_v003:right_thumb03_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[284]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_wrist_ik_ctrlGrp|rig_male_character_v003:right_wrist_ik_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[285]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_wrist_ik_ctrlGrp|rig_male_character_v003:right_wrist_ik_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[286]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_wrist_ik_ctrlGrp|rig_male_character_v003:right_wrist_ik_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[287]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_wrist_ik_ctrlGrp|rig_male_character_v003:right_wrist_ik_ctrl.translateX" 
		"rig_male_character_v001RN.placeHolderList[288]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_wrist_ik_ctrlGrp|rig_male_character_v003:right_wrist_ik_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[289]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:direction_ctrlGrp|rig_male_character_v003:direction_ctrl|rig_male_character_v003:right_wrist_ik_ctrlGrp|rig_male_character_v003:right_wrist_ik_ctrl.translateZ" 
		"rig_male_character_v001RN.placeHolderList[290]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:chest_switch_ctrl_grp|rig_male_character_v003:right_clavicle_ctrlGrp|rig_male_character_v003:right_clavicle_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[291]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:chest_switch_ctrl_grp|rig_male_character_v003:right_clavicle_ctrlGrp|rig_male_character_v003:right_clavicle_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[292]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:chest_switch_ctrl_grp|rig_male_character_v003:right_clavicle_ctrlGrp|rig_male_character_v003:right_clavicle_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[293]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:chest_switch_ctrl_grp|rig_male_character_v003:right_clavicle_ctrlGrp|rig_male_character_v003:right_clavicle_ctrl|rig_male_character_v003:right_shoulder_ctrlGrp|rig_male_character_v003:right_shoulder_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[294]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:chest_switch_ctrl_grp|rig_male_character_v003:right_clavicle_ctrlGrp|rig_male_character_v003:right_clavicle_ctrl|rig_male_character_v003:right_shoulder_ctrlGrp|rig_male_character_v003:right_shoulder_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[295]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:chest_switch_ctrl_grp|rig_male_character_v003:right_clavicle_ctrlGrp|rig_male_character_v003:right_clavicle_ctrl|rig_male_character_v003:right_shoulder_ctrlGrp|rig_male_character_v003:right_shoulder_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[296]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:chest_switch_ctrl_grp|rig_male_character_v003:right_clavicle_ctrlGrp|rig_male_character_v003:right_clavicle_ctrl|rig_male_character_v003:right_shoulder_ctrlGrp|rig_male_character_v003:right_shoulder_ctrl|rig_male_character_v003:right_elbow_ctrlGrp|rig_male_character_v003:right_elbow_ctrl.translateX" 
		"rig_male_character_v001RN.placeHolderList[297]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:chest_switch_ctrl_grp|rig_male_character_v003:right_clavicle_ctrlGrp|rig_male_character_v003:right_clavicle_ctrl|rig_male_character_v003:right_shoulder_ctrlGrp|rig_male_character_v003:right_shoulder_ctrl|rig_male_character_v003:right_elbow_ctrlGrp|rig_male_character_v003:right_elbow_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[298]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:chest_switch_ctrl_grp|rig_male_character_v003:right_clavicle_ctrlGrp|rig_male_character_v003:right_clavicle_ctrl|rig_male_character_v003:right_shoulder_ctrlGrp|rig_male_character_v003:right_shoulder_ctrl|rig_male_character_v003:right_elbow_ctrlGrp|rig_male_character_v003:right_elbow_ctrl.translateZ" 
		"rig_male_character_v001RN.placeHolderList[299]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:chest_switch_ctrl_grp|rig_male_character_v003:right_clavicle_ctrlGrp|rig_male_character_v003:right_clavicle_ctrl|rig_male_character_v003:right_shoulder_ctrlGrp|rig_male_character_v003:right_shoulder_ctrl|rig_male_character_v003:right_elbow_ctrlGrp|rig_male_character_v003:right_elbow_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[300]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:chest_switch_ctrl_grp|rig_male_character_v003:right_clavicle_ctrlGrp|rig_male_character_v003:right_clavicle_ctrl|rig_male_character_v003:right_shoulder_ctrlGrp|rig_male_character_v003:right_shoulder_ctrl|rig_male_character_v003:right_elbow_ctrlGrp|rig_male_character_v003:right_elbow_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[301]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:chest_switch_ctrl_grp|rig_male_character_v003:right_clavicle_ctrlGrp|rig_male_character_v003:right_clavicle_ctrl|rig_male_character_v003:right_shoulder_ctrlGrp|rig_male_character_v003:right_shoulder_ctrl|rig_male_character_v003:right_elbow_ctrlGrp|rig_male_character_v003:right_elbow_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[302]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:chest_switch_ctrl_grp|rig_male_character_v003:right_clavicle_ctrlGrp|rig_male_character_v003:right_clavicle_ctrl|rig_male_character_v003:right_shoulder_ctrlGrp|rig_male_character_v003:right_shoulder_ctrl|rig_male_character_v003:right_elbow_ctrlGrp|rig_male_character_v003:right_elbow_ctrl|rig_male_character_v003:right_wrist_ctrlGrp|rig_male_character_v003:right_wrist_ctrl.translateX" 
		"rig_male_character_v001RN.placeHolderList[303]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:chest_switch_ctrl_grp|rig_male_character_v003:right_clavicle_ctrlGrp|rig_male_character_v003:right_clavicle_ctrl|rig_male_character_v003:right_shoulder_ctrlGrp|rig_male_character_v003:right_shoulder_ctrl|rig_male_character_v003:right_elbow_ctrlGrp|rig_male_character_v003:right_elbow_ctrl|rig_male_character_v003:right_wrist_ctrlGrp|rig_male_character_v003:right_wrist_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[304]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:chest_switch_ctrl_grp|rig_male_character_v003:right_clavicle_ctrlGrp|rig_male_character_v003:right_clavicle_ctrl|rig_male_character_v003:right_shoulder_ctrlGrp|rig_male_character_v003:right_shoulder_ctrl|rig_male_character_v003:right_elbow_ctrlGrp|rig_male_character_v003:right_elbow_ctrl|rig_male_character_v003:right_wrist_ctrlGrp|rig_male_character_v003:right_wrist_ctrl.translateZ" 
		"rig_male_character_v001RN.placeHolderList[305]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:chest_switch_ctrl_grp|rig_male_character_v003:right_clavicle_ctrlGrp|rig_male_character_v003:right_clavicle_ctrl|rig_male_character_v003:right_shoulder_ctrlGrp|rig_male_character_v003:right_shoulder_ctrl|rig_male_character_v003:right_elbow_ctrlGrp|rig_male_character_v003:right_elbow_ctrl|rig_male_character_v003:right_wrist_ctrlGrp|rig_male_character_v003:right_wrist_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[306]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:chest_switch_ctrl_grp|rig_male_character_v003:right_clavicle_ctrlGrp|rig_male_character_v003:right_clavicle_ctrl|rig_male_character_v003:right_shoulder_ctrlGrp|rig_male_character_v003:right_shoulder_ctrl|rig_male_character_v003:right_elbow_ctrlGrp|rig_male_character_v003:right_elbow_ctrl|rig_male_character_v003:right_wrist_ctrlGrp|rig_male_character_v003:right_wrist_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[307]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:chest_switch_ctrl_grp|rig_male_character_v003:right_clavicle_ctrlGrp|rig_male_character_v003:right_clavicle_ctrl|rig_male_character_v003:right_shoulder_ctrlGrp|rig_male_character_v003:right_shoulder_ctrl|rig_male_character_v003:right_elbow_ctrlGrp|rig_male_character_v003:right_elbow_ctrl|rig_male_character_v003:right_wrist_ctrlGrp|rig_male_character_v003:right_wrist_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[308]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:chest_switch_ctrl_grp|rig_male_character_v003:left_clavicle_ctrlGrp|rig_male_character_v003:left_clavicle_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[309]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:chest_switch_ctrl_grp|rig_male_character_v003:left_clavicle_ctrlGrp|rig_male_character_v003:left_clavicle_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[310]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:chest_switch_ctrl_grp|rig_male_character_v003:left_clavicle_ctrlGrp|rig_male_character_v003:left_clavicle_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[311]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:chest_switch_ctrl_grp|rig_male_character_v003:left_clavicle_ctrlGrp|rig_male_character_v003:left_clavicle_ctrl|rig_male_character_v003:left_shoulder_ctrlGrp|rig_male_character_v003:left_shoulder_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[312]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:chest_switch_ctrl_grp|rig_male_character_v003:left_clavicle_ctrlGrp|rig_male_character_v003:left_clavicle_ctrl|rig_male_character_v003:left_shoulder_ctrlGrp|rig_male_character_v003:left_shoulder_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[313]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:chest_switch_ctrl_grp|rig_male_character_v003:left_clavicle_ctrlGrp|rig_male_character_v003:left_clavicle_ctrl|rig_male_character_v003:left_shoulder_ctrlGrp|rig_male_character_v003:left_shoulder_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[314]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:chest_switch_ctrl_grp|rig_male_character_v003:left_clavicle_ctrlGrp|rig_male_character_v003:left_clavicle_ctrl|rig_male_character_v003:left_shoulder_ctrlGrp|rig_male_character_v003:left_shoulder_ctrl|rig_male_character_v003:left_elbow_ctrlGrp|rig_male_character_v003:left_elbow_ctrl.translateX" 
		"rig_male_character_v001RN.placeHolderList[315]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:chest_switch_ctrl_grp|rig_male_character_v003:left_clavicle_ctrlGrp|rig_male_character_v003:left_clavicle_ctrl|rig_male_character_v003:left_shoulder_ctrlGrp|rig_male_character_v003:left_shoulder_ctrl|rig_male_character_v003:left_elbow_ctrlGrp|rig_male_character_v003:left_elbow_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[316]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:chest_switch_ctrl_grp|rig_male_character_v003:left_clavicle_ctrlGrp|rig_male_character_v003:left_clavicle_ctrl|rig_male_character_v003:left_shoulder_ctrlGrp|rig_male_character_v003:left_shoulder_ctrl|rig_male_character_v003:left_elbow_ctrlGrp|rig_male_character_v003:left_elbow_ctrl.translateZ" 
		"rig_male_character_v001RN.placeHolderList[317]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:chest_switch_ctrl_grp|rig_male_character_v003:left_clavicle_ctrlGrp|rig_male_character_v003:left_clavicle_ctrl|rig_male_character_v003:left_shoulder_ctrlGrp|rig_male_character_v003:left_shoulder_ctrl|rig_male_character_v003:left_elbow_ctrlGrp|rig_male_character_v003:left_elbow_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[318]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:chest_switch_ctrl_grp|rig_male_character_v003:left_clavicle_ctrlGrp|rig_male_character_v003:left_clavicle_ctrl|rig_male_character_v003:left_shoulder_ctrlGrp|rig_male_character_v003:left_shoulder_ctrl|rig_male_character_v003:left_elbow_ctrlGrp|rig_male_character_v003:left_elbow_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[319]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:chest_switch_ctrl_grp|rig_male_character_v003:left_clavicle_ctrlGrp|rig_male_character_v003:left_clavicle_ctrl|rig_male_character_v003:left_shoulder_ctrlGrp|rig_male_character_v003:left_shoulder_ctrl|rig_male_character_v003:left_elbow_ctrlGrp|rig_male_character_v003:left_elbow_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[320]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:chest_switch_ctrl_grp|rig_male_character_v003:left_clavicle_ctrlGrp|rig_male_character_v003:left_clavicle_ctrl|rig_male_character_v003:left_shoulder_ctrlGrp|rig_male_character_v003:left_shoulder_ctrl|rig_male_character_v003:left_elbow_ctrlGrp|rig_male_character_v003:left_elbow_ctrl|rig_male_character_v003:left_wrist_ctrlGrp|rig_male_character_v003:left_wrist_ctrl.translateX" 
		"rig_male_character_v001RN.placeHolderList[321]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:chest_switch_ctrl_grp|rig_male_character_v003:left_clavicle_ctrlGrp|rig_male_character_v003:left_clavicle_ctrl|rig_male_character_v003:left_shoulder_ctrlGrp|rig_male_character_v003:left_shoulder_ctrl|rig_male_character_v003:left_elbow_ctrlGrp|rig_male_character_v003:left_elbow_ctrl|rig_male_character_v003:left_wrist_ctrlGrp|rig_male_character_v003:left_wrist_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[322]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:chest_switch_ctrl_grp|rig_male_character_v003:left_clavicle_ctrlGrp|rig_male_character_v003:left_clavicle_ctrl|rig_male_character_v003:left_shoulder_ctrlGrp|rig_male_character_v003:left_shoulder_ctrl|rig_male_character_v003:left_elbow_ctrlGrp|rig_male_character_v003:left_elbow_ctrl|rig_male_character_v003:left_wrist_ctrlGrp|rig_male_character_v003:left_wrist_ctrl.translateZ" 
		"rig_male_character_v001RN.placeHolderList[323]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:chest_switch_ctrl_grp|rig_male_character_v003:left_clavicle_ctrlGrp|rig_male_character_v003:left_clavicle_ctrl|rig_male_character_v003:left_shoulder_ctrlGrp|rig_male_character_v003:left_shoulder_ctrl|rig_male_character_v003:left_elbow_ctrlGrp|rig_male_character_v003:left_elbow_ctrl|rig_male_character_v003:left_wrist_ctrlGrp|rig_male_character_v003:left_wrist_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[324]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:chest_switch_ctrl_grp|rig_male_character_v003:left_clavicle_ctrlGrp|rig_male_character_v003:left_clavicle_ctrl|rig_male_character_v003:left_shoulder_ctrlGrp|rig_male_character_v003:left_shoulder_ctrl|rig_male_character_v003:left_elbow_ctrlGrp|rig_male_character_v003:left_elbow_ctrl|rig_male_character_v003:left_wrist_ctrlGrp|rig_male_character_v003:left_wrist_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[325]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:chest_switch_ctrl_grp|rig_male_character_v003:left_clavicle_ctrlGrp|rig_male_character_v003:left_clavicle_ctrl|rig_male_character_v003:left_shoulder_ctrlGrp|rig_male_character_v003:left_shoulder_ctrl|rig_male_character_v003:left_elbow_ctrlGrp|rig_male_character_v003:left_elbow_ctrl|rig_male_character_v003:left_wrist_ctrlGrp|rig_male_character_v003:left_wrist_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[326]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:neckBase_switch_ctrl_grp|rig_male_character_v003:neckBase_ctrlGrp|rig_male_character_v003:neckBase_ctrlOffsetGrp|rig_male_character_v003:neckBase_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[327]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:neckBase_switch_ctrl_grp|rig_male_character_v003:neckBase_ctrlGrp|rig_male_character_v003:neckBase_ctrlOffsetGrp|rig_male_character_v003:neckBase_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[328]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:neckBase_switch_ctrl_grp|rig_male_character_v003:neckBase_ctrlGrp|rig_male_character_v003:neckBase_ctrlOffsetGrp|rig_male_character_v003:neckBase_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[329]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:neckBase_switch_ctrl_grp|rig_male_character_v003:neckBase_ctrlGrp|rig_male_character_v003:neckBase_ctrlOffsetGrp|rig_male_character_v003:neckBase_ctrl|rig_male_character_v003:neckMid_ctrlGrp|rig_male_character_v003:neckMid_ctrlOffsetGrp|rig_male_character_v003:neckMid_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[330]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:neckBase_switch_ctrl_grp|rig_male_character_v003:neckBase_ctrlGrp|rig_male_character_v003:neckBase_ctrlOffsetGrp|rig_male_character_v003:neckBase_ctrl|rig_male_character_v003:neckMid_ctrlGrp|rig_male_character_v003:neckMid_ctrlOffsetGrp|rig_male_character_v003:neckMid_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[331]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:neckBase_switch_ctrl_grp|rig_male_character_v003:neckBase_ctrlGrp|rig_male_character_v003:neckBase_ctrlOffsetGrp|rig_male_character_v003:neckBase_ctrl|rig_male_character_v003:neckMid_ctrlGrp|rig_male_character_v003:neckMid_ctrlOffsetGrp|rig_male_character_v003:neckMid_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[332]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:neckBase_switch_ctrl_grp|rig_male_character_v003:neckBase_ctrlGrp|rig_male_character_v003:neckBase_ctrlOffsetGrp|rig_male_character_v003:neckBase_ctrl|rig_male_character_v003:neckMid_ctrlGrp|rig_male_character_v003:neckMid_ctrlOffsetGrp|rig_male_character_v003:neckMid_ctrl|rig_male_character_v003:head_ctrlGrp|rig_male_character_v003:head_ctrlOffsetGrp|rig_male_character_v003:head_ctrl.rotateX" 
		"rig_male_character_v001RN.placeHolderList[333]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:neckBase_switch_ctrl_grp|rig_male_character_v003:neckBase_ctrlGrp|rig_male_character_v003:neckBase_ctrlOffsetGrp|rig_male_character_v003:neckBase_ctrl|rig_male_character_v003:neckMid_ctrlGrp|rig_male_character_v003:neckMid_ctrlOffsetGrp|rig_male_character_v003:neckMid_ctrl|rig_male_character_v003:head_ctrlGrp|rig_male_character_v003:head_ctrlOffsetGrp|rig_male_character_v003:head_ctrl.rotateY" 
		"rig_male_character_v001RN.placeHolderList[334]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:neckBase_switch_ctrl_grp|rig_male_character_v003:neckBase_ctrlGrp|rig_male_character_v003:neckBase_ctrlOffsetGrp|rig_male_character_v003:neckBase_ctrl|rig_male_character_v003:neckMid_ctrlGrp|rig_male_character_v003:neckMid_ctrlOffsetGrp|rig_male_character_v003:neckMid_ctrl|rig_male_character_v003:head_ctrlGrp|rig_male_character_v003:head_ctrlOffsetGrp|rig_male_character_v003:head_ctrl.rotateZ" 
		"rig_male_character_v001RN.placeHolderList[335]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:neckBase_switch_ctrl_grp|rig_male_character_v003:neckBase_ctrlGrp|rig_male_character_v003:neckBase_ctrlOffsetGrp|rig_male_character_v003:neckBase_ctrl|rig_male_character_v003:neckMid_ctrlGrp|rig_male_character_v003:neckMid_ctrlOffsetGrp|rig_male_character_v003:neckMid_ctrl|rig_male_character_v003:head_ctrlGrp|rig_male_character_v003:head_ctrlOffsetGrp|rig_male_character_v003:head_ctrl.translateX" 
		"rig_male_character_v001RN.placeHolderList[336]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:neckBase_switch_ctrl_grp|rig_male_character_v003:neckBase_ctrlGrp|rig_male_character_v003:neckBase_ctrlOffsetGrp|rig_male_character_v003:neckBase_ctrl|rig_male_character_v003:neckMid_ctrlGrp|rig_male_character_v003:neckMid_ctrlOffsetGrp|rig_male_character_v003:neckMid_ctrl|rig_male_character_v003:head_ctrlGrp|rig_male_character_v003:head_ctrlOffsetGrp|rig_male_character_v003:head_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[337]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:neckBase_switch_ctrl_grp|rig_male_character_v003:neckBase_ctrlGrp|rig_male_character_v003:neckBase_ctrlOffsetGrp|rig_male_character_v003:neckBase_ctrl|rig_male_character_v003:neckMid_ctrlGrp|rig_male_character_v003:neckMid_ctrlOffsetGrp|rig_male_character_v003:neckMid_ctrl|rig_male_character_v003:head_ctrlGrp|rig_male_character_v003:head_ctrlOffsetGrp|rig_male_character_v003:head_ctrl.translateZ" 
		"rig_male_character_v001RN.placeHolderList[338]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:neckBase_switch_ctrl_grp|rig_male_character_v003:neckBase_ctrlGrp|rig_male_character_v003:neckBase_ctrlOffsetGrp|rig_male_character_v003:neckBase_ctrl|rig_male_character_v003:neckMid_ctrlGrp|rig_male_character_v003:neckMid_ctrlOffsetGrp|rig_male_character_v003:neckMid_ctrl|rig_male_character_v003:head_ctrlGrp|rig_male_character_v003:head_ctrlOffsetGrp|rig_male_character_v003:head_ctrl|rig_male_character_v003:head_offsetDataGrp|rig_male_character_v003:facial_side_gui_grp|rig_male_character_v003:eyes_gui_grp|rig_male_character_v003:left_blinkEyelid_ctrlGrp|rig_male_character_v003:left_blinkEyelid_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[339]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:neckBase_switch_ctrl_grp|rig_male_character_v003:neckBase_ctrlGrp|rig_male_character_v003:neckBase_ctrlOffsetGrp|rig_male_character_v003:neckBase_ctrl|rig_male_character_v003:neckMid_ctrlGrp|rig_male_character_v003:neckMid_ctrlOffsetGrp|rig_male_character_v003:neckMid_ctrl|rig_male_character_v003:head_ctrlGrp|rig_male_character_v003:head_ctrlOffsetGrp|rig_male_character_v003:head_ctrl|rig_male_character_v003:head_offsetDataGrp|rig_male_character_v003:facial_side_gui_grp|rig_male_character_v003:eyes_gui_grp|rig_male_character_v003:right_blinkEyelid_ctrlGrp|rig_male_character_v003:right_blinkEyelid_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[340]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:neckBase_switch_ctrl_grp|rig_male_character_v003:neckBase_ctrlGrp|rig_male_character_v003:neckBase_ctrlOffsetGrp|rig_male_character_v003:neckBase_ctrl|rig_male_character_v003:neckMid_ctrlGrp|rig_male_character_v003:neckMid_ctrlOffsetGrp|rig_male_character_v003:neckMid_ctrl|rig_male_character_v003:head_ctrlGrp|rig_male_character_v003:head_ctrlOffsetGrp|rig_male_character_v003:head_ctrl|rig_male_character_v003:head_offsetDataGrp|rig_male_character_v003:facial_side_gui_grp|rig_male_character_v003:mouth_gui_grp|rig_male_character_v003:left_cornerLip_offset_ctrlGrp|rig_male_character_v003:left_cornerLip_offset_ctrl.translateX" 
		"rig_male_character_v001RN.placeHolderList[341]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:neckBase_switch_ctrl_grp|rig_male_character_v003:neckBase_ctrlGrp|rig_male_character_v003:neckBase_ctrlOffsetGrp|rig_male_character_v003:neckBase_ctrl|rig_male_character_v003:neckMid_ctrlGrp|rig_male_character_v003:neckMid_ctrlOffsetGrp|rig_male_character_v003:neckMid_ctrl|rig_male_character_v003:head_ctrlGrp|rig_male_character_v003:head_ctrlOffsetGrp|rig_male_character_v003:head_ctrl|rig_male_character_v003:head_offsetDataGrp|rig_male_character_v003:facial_side_gui_grp|rig_male_character_v003:mouth_gui_grp|rig_male_character_v003:left_cornerLip_offset_ctrlGrp|rig_male_character_v003:left_cornerLip_offset_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[342]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:neckBase_switch_ctrl_grp|rig_male_character_v003:neckBase_ctrlGrp|rig_male_character_v003:neckBase_ctrlOffsetGrp|rig_male_character_v003:neckBase_ctrl|rig_male_character_v003:neckMid_ctrlGrp|rig_male_character_v003:neckMid_ctrlOffsetGrp|rig_male_character_v003:neckMid_ctrl|rig_male_character_v003:head_ctrlGrp|rig_male_character_v003:head_ctrlOffsetGrp|rig_male_character_v003:head_ctrl|rig_male_character_v003:head_offsetDataGrp|rig_male_character_v003:facial_side_gui_grp|rig_male_character_v003:mouth_gui_grp|rig_male_character_v003:left_cornerLip_offset_ctrlGrp|rig_male_character_v003:left_cornerLip_offset_ctrl.upInTargets" 
		"rig_male_character_v001RN.placeHolderList[343]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:neckBase_switch_ctrl_grp|rig_male_character_v003:neckBase_ctrlGrp|rig_male_character_v003:neckBase_ctrlOffsetGrp|rig_male_character_v003:neckBase_ctrl|rig_male_character_v003:neckMid_ctrlGrp|rig_male_character_v003:neckMid_ctrlOffsetGrp|rig_male_character_v003:neckMid_ctrl|rig_male_character_v003:head_ctrlGrp|rig_male_character_v003:head_ctrlOffsetGrp|rig_male_character_v003:head_ctrl|rig_male_character_v003:head_offsetDataGrp|rig_male_character_v003:facial_side_gui_grp|rig_male_character_v003:mouth_gui_grp|rig_male_character_v003:left_cornerLip_offset_ctrlGrp|rig_male_character_v003:left_cornerLip_offset_ctrl.inTargets" 
		"rig_male_character_v001RN.placeHolderList[344]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:neckBase_switch_ctrl_grp|rig_male_character_v003:neckBase_ctrlGrp|rig_male_character_v003:neckBase_ctrlOffsetGrp|rig_male_character_v003:neckBase_ctrl|rig_male_character_v003:neckMid_ctrlGrp|rig_male_character_v003:neckMid_ctrlOffsetGrp|rig_male_character_v003:neckMid_ctrl|rig_male_character_v003:head_ctrlGrp|rig_male_character_v003:head_ctrlOffsetGrp|rig_male_character_v003:head_ctrl|rig_male_character_v003:head_offsetDataGrp|rig_male_character_v003:facial_side_gui_grp|rig_male_character_v003:mouth_gui_grp|rig_male_character_v003:left_cornerLip_offset_ctrlGrp|rig_male_character_v003:left_cornerLip_offset_ctrl.downInTargets" 
		"rig_male_character_v001RN.placeHolderList[345]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:neckBase_switch_ctrl_grp|rig_male_character_v003:neckBase_ctrlGrp|rig_male_character_v003:neckBase_ctrlOffsetGrp|rig_male_character_v003:neckBase_ctrl|rig_male_character_v003:neckMid_ctrlGrp|rig_male_character_v003:neckMid_ctrlOffsetGrp|rig_male_character_v003:neckMid_ctrl|rig_male_character_v003:head_ctrlGrp|rig_male_character_v003:head_ctrlOffsetGrp|rig_male_character_v003:head_ctrl|rig_male_character_v003:head_offsetDataGrp|rig_male_character_v003:facial_side_gui_grp|rig_male_character_v003:mouth_gui_grp|rig_male_character_v003:left_cornerLip_offset_ctrlGrp|rig_male_character_v003:left_cornerLip_offset_ctrl.downOutTargets" 
		"rig_male_character_v001RN.placeHolderList[346]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:neckBase_switch_ctrl_grp|rig_male_character_v003:neckBase_ctrlGrp|rig_male_character_v003:neckBase_ctrlOffsetGrp|rig_male_character_v003:neckBase_ctrl|rig_male_character_v003:neckMid_ctrlGrp|rig_male_character_v003:neckMid_ctrlOffsetGrp|rig_male_character_v003:neckMid_ctrl|rig_male_character_v003:head_ctrlGrp|rig_male_character_v003:head_ctrlOffsetGrp|rig_male_character_v003:head_ctrl|rig_male_character_v003:head_offsetDataGrp|rig_male_character_v003:facial_side_gui_grp|rig_male_character_v003:mouth_gui_grp|rig_male_character_v003:left_cornerLip_offset_ctrlGrp|rig_male_character_v003:left_cornerLip_offset_ctrl.upOutTargets" 
		"rig_male_character_v001RN.placeHolderList[347]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:neckBase_switch_ctrl_grp|rig_male_character_v003:neckBase_ctrlGrp|rig_male_character_v003:neckBase_ctrlOffsetGrp|rig_male_character_v003:neckBase_ctrl|rig_male_character_v003:neckMid_ctrlGrp|rig_male_character_v003:neckMid_ctrlOffsetGrp|rig_male_character_v003:neckMid_ctrl|rig_male_character_v003:head_ctrlGrp|rig_male_character_v003:head_ctrlOffsetGrp|rig_male_character_v003:head_ctrl|rig_male_character_v003:head_offsetDataGrp|rig_male_character_v003:facial_side_gui_grp|rig_male_character_v003:mouth_gui_grp|rig_male_character_v003:left_cornerLip_offset_ctrlGrp|rig_male_character_v003:left_cornerLip_offset_ctrl.upTargets" 
		"rig_male_character_v001RN.placeHolderList[348]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:neckBase_switch_ctrl_grp|rig_male_character_v003:neckBase_ctrlGrp|rig_male_character_v003:neckBase_ctrlOffsetGrp|rig_male_character_v003:neckBase_ctrl|rig_male_character_v003:neckMid_ctrlGrp|rig_male_character_v003:neckMid_ctrlOffsetGrp|rig_male_character_v003:neckMid_ctrl|rig_male_character_v003:head_ctrlGrp|rig_male_character_v003:head_ctrlOffsetGrp|rig_male_character_v003:head_ctrl|rig_male_character_v003:head_offsetDataGrp|rig_male_character_v003:facial_side_gui_grp|rig_male_character_v003:mouth_gui_grp|rig_male_character_v003:left_cornerLip_offset_ctrlGrp|rig_male_character_v003:left_cornerLip_offset_ctrl.downTargets" 
		"rig_male_character_v001RN.placeHolderList[349]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:neckBase_switch_ctrl_grp|rig_male_character_v003:neckBase_ctrlGrp|rig_male_character_v003:neckBase_ctrlOffsetGrp|rig_male_character_v003:neckBase_ctrl|rig_male_character_v003:neckMid_ctrlGrp|rig_male_character_v003:neckMid_ctrlOffsetGrp|rig_male_character_v003:neckMid_ctrl|rig_male_character_v003:head_ctrlGrp|rig_male_character_v003:head_ctrlOffsetGrp|rig_male_character_v003:head_ctrl|rig_male_character_v003:head_offsetDataGrp|rig_male_character_v003:facial_side_gui_grp|rig_male_character_v003:mouth_gui_grp|rig_male_character_v003:left_cornerLip_offset_ctrlGrp|rig_male_character_v003:left_cornerLip_offset_ctrl.outTargets" 
		"rig_male_character_v001RN.placeHolderList[350]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:neckBase_switch_ctrl_grp|rig_male_character_v003:neckBase_ctrlGrp|rig_male_character_v003:neckBase_ctrlOffsetGrp|rig_male_character_v003:neckBase_ctrl|rig_male_character_v003:neckMid_ctrlGrp|rig_male_character_v003:neckMid_ctrlOffsetGrp|rig_male_character_v003:neckMid_ctrl|rig_male_character_v003:head_ctrlGrp|rig_male_character_v003:head_ctrlOffsetGrp|rig_male_character_v003:head_ctrl|rig_male_character_v003:head_offsetDataGrp|rig_male_character_v003:facial_side_gui_grp|rig_male_character_v003:mouth_gui_grp|rig_male_character_v003:right_cornerLip_offset_ctrlGrp|rig_male_character_v003:right_cornerLip_offset_ctrl.translateX" 
		"rig_male_character_v001RN.placeHolderList[351]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:neckBase_switch_ctrl_grp|rig_male_character_v003:neckBase_ctrlGrp|rig_male_character_v003:neckBase_ctrlOffsetGrp|rig_male_character_v003:neckBase_ctrl|rig_male_character_v003:neckMid_ctrlGrp|rig_male_character_v003:neckMid_ctrlOffsetGrp|rig_male_character_v003:neckMid_ctrl|rig_male_character_v003:head_ctrlGrp|rig_male_character_v003:head_ctrlOffsetGrp|rig_male_character_v003:head_ctrl|rig_male_character_v003:head_offsetDataGrp|rig_male_character_v003:facial_side_gui_grp|rig_male_character_v003:mouth_gui_grp|rig_male_character_v003:right_cornerLip_offset_ctrlGrp|rig_male_character_v003:right_cornerLip_offset_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[352]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:neckBase_switch_ctrl_grp|rig_male_character_v003:neckBase_ctrlGrp|rig_male_character_v003:neckBase_ctrlOffsetGrp|rig_male_character_v003:neckBase_ctrl|rig_male_character_v003:neckMid_ctrlGrp|rig_male_character_v003:neckMid_ctrlOffsetGrp|rig_male_character_v003:neckMid_ctrl|rig_male_character_v003:head_ctrlGrp|rig_male_character_v003:head_ctrlOffsetGrp|rig_male_character_v003:head_ctrl|rig_male_character_v003:head_offsetDataGrp|rig_male_character_v003:facial_side_gui_grp|rig_male_character_v003:mouth_gui_grp|rig_male_character_v003:right_cornerLip_offset_ctrlGrp|rig_male_character_v003:right_cornerLip_offset_ctrl.upInTargets" 
		"rig_male_character_v001RN.placeHolderList[353]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:neckBase_switch_ctrl_grp|rig_male_character_v003:neckBase_ctrlGrp|rig_male_character_v003:neckBase_ctrlOffsetGrp|rig_male_character_v003:neckBase_ctrl|rig_male_character_v003:neckMid_ctrlGrp|rig_male_character_v003:neckMid_ctrlOffsetGrp|rig_male_character_v003:neckMid_ctrl|rig_male_character_v003:head_ctrlGrp|rig_male_character_v003:head_ctrlOffsetGrp|rig_male_character_v003:head_ctrl|rig_male_character_v003:head_offsetDataGrp|rig_male_character_v003:facial_side_gui_grp|rig_male_character_v003:mouth_gui_grp|rig_male_character_v003:right_cornerLip_offset_ctrlGrp|rig_male_character_v003:right_cornerLip_offset_ctrl.inTargets" 
		"rig_male_character_v001RN.placeHolderList[354]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:neckBase_switch_ctrl_grp|rig_male_character_v003:neckBase_ctrlGrp|rig_male_character_v003:neckBase_ctrlOffsetGrp|rig_male_character_v003:neckBase_ctrl|rig_male_character_v003:neckMid_ctrlGrp|rig_male_character_v003:neckMid_ctrlOffsetGrp|rig_male_character_v003:neckMid_ctrl|rig_male_character_v003:head_ctrlGrp|rig_male_character_v003:head_ctrlOffsetGrp|rig_male_character_v003:head_ctrl|rig_male_character_v003:head_offsetDataGrp|rig_male_character_v003:facial_side_gui_grp|rig_male_character_v003:mouth_gui_grp|rig_male_character_v003:right_cornerLip_offset_ctrlGrp|rig_male_character_v003:right_cornerLip_offset_ctrl.downInTargets" 
		"rig_male_character_v001RN.placeHolderList[355]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:neckBase_switch_ctrl_grp|rig_male_character_v003:neckBase_ctrlGrp|rig_male_character_v003:neckBase_ctrlOffsetGrp|rig_male_character_v003:neckBase_ctrl|rig_male_character_v003:neckMid_ctrlGrp|rig_male_character_v003:neckMid_ctrlOffsetGrp|rig_male_character_v003:neckMid_ctrl|rig_male_character_v003:head_ctrlGrp|rig_male_character_v003:head_ctrlOffsetGrp|rig_male_character_v003:head_ctrl|rig_male_character_v003:head_offsetDataGrp|rig_male_character_v003:facial_side_gui_grp|rig_male_character_v003:mouth_gui_grp|rig_male_character_v003:right_cornerLip_offset_ctrlGrp|rig_male_character_v003:right_cornerLip_offset_ctrl.downOutTargets" 
		"rig_male_character_v001RN.placeHolderList[356]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:neckBase_switch_ctrl_grp|rig_male_character_v003:neckBase_ctrlGrp|rig_male_character_v003:neckBase_ctrlOffsetGrp|rig_male_character_v003:neckBase_ctrl|rig_male_character_v003:neckMid_ctrlGrp|rig_male_character_v003:neckMid_ctrlOffsetGrp|rig_male_character_v003:neckMid_ctrl|rig_male_character_v003:head_ctrlGrp|rig_male_character_v003:head_ctrlOffsetGrp|rig_male_character_v003:head_ctrl|rig_male_character_v003:head_offsetDataGrp|rig_male_character_v003:facial_side_gui_grp|rig_male_character_v003:mouth_gui_grp|rig_male_character_v003:right_cornerLip_offset_ctrlGrp|rig_male_character_v003:right_cornerLip_offset_ctrl.upOutTargets" 
		"rig_male_character_v001RN.placeHolderList[357]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:neckBase_switch_ctrl_grp|rig_male_character_v003:neckBase_ctrlGrp|rig_male_character_v003:neckBase_ctrlOffsetGrp|rig_male_character_v003:neckBase_ctrl|rig_male_character_v003:neckMid_ctrlGrp|rig_male_character_v003:neckMid_ctrlOffsetGrp|rig_male_character_v003:neckMid_ctrl|rig_male_character_v003:head_ctrlGrp|rig_male_character_v003:head_ctrlOffsetGrp|rig_male_character_v003:head_ctrl|rig_male_character_v003:head_offsetDataGrp|rig_male_character_v003:facial_side_gui_grp|rig_male_character_v003:mouth_gui_grp|rig_male_character_v003:right_cornerLip_offset_ctrlGrp|rig_male_character_v003:right_cornerLip_offset_ctrl.upTargets" 
		"rig_male_character_v001RN.placeHolderList[358]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:neckBase_switch_ctrl_grp|rig_male_character_v003:neckBase_ctrlGrp|rig_male_character_v003:neckBase_ctrlOffsetGrp|rig_male_character_v003:neckBase_ctrl|rig_male_character_v003:neckMid_ctrlGrp|rig_male_character_v003:neckMid_ctrlOffsetGrp|rig_male_character_v003:neckMid_ctrl|rig_male_character_v003:head_ctrlGrp|rig_male_character_v003:head_ctrlOffsetGrp|rig_male_character_v003:head_ctrl|rig_male_character_v003:head_offsetDataGrp|rig_male_character_v003:facial_side_gui_grp|rig_male_character_v003:mouth_gui_grp|rig_male_character_v003:right_cornerLip_offset_ctrlGrp|rig_male_character_v003:right_cornerLip_offset_ctrl.downTargets" 
		"rig_male_character_v001RN.placeHolderList[359]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:neckBase_switch_ctrl_grp|rig_male_character_v003:neckBase_ctrlGrp|rig_male_character_v003:neckBase_ctrlOffsetGrp|rig_male_character_v003:neckBase_ctrl|rig_male_character_v003:neckMid_ctrlGrp|rig_male_character_v003:neckMid_ctrlOffsetGrp|rig_male_character_v003:neckMid_ctrl|rig_male_character_v003:head_ctrlGrp|rig_male_character_v003:head_ctrlOffsetGrp|rig_male_character_v003:head_ctrl|rig_male_character_v003:head_offsetDataGrp|rig_male_character_v003:facial_side_gui_grp|rig_male_character_v003:mouth_gui_grp|rig_male_character_v003:right_cornerLip_offset_ctrlGrp|rig_male_character_v003:right_cornerLip_offset_ctrl.outTargets" 
		"rig_male_character_v001RN.placeHolderList[360]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:neckBase_switch_ctrl_grp|rig_male_character_v003:neckBase_ctrlGrp|rig_male_character_v003:neckBase_ctrlOffsetGrp|rig_male_character_v003:neckBase_ctrl|rig_male_character_v003:neckMid_ctrlGrp|rig_male_character_v003:neckMid_ctrlOffsetGrp|rig_male_character_v003:neckMid_ctrl|rig_male_character_v003:head_ctrlGrp|rig_male_character_v003:head_ctrlOffsetGrp|rig_male_character_v003:head_ctrl|rig_male_character_v003:head_offsetDataGrp|rig_male_character_v003:facial_side_gui_grp|rig_male_character_v003:mouth_gui_grp|rig_male_character_v003:jaw_offset_ctrlGrp|rig_male_character_v003:jaw_offset_ctrl.translateY" 
		"rig_male_character_v001RN.placeHolderList[361]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:neckBase_switch_ctrl_grp|rig_male_character_v003:neckBase_ctrlGrp|rig_male_character_v003:neckBase_ctrlOffsetGrp|rig_male_character_v003:neckBase_ctrl|rig_male_character_v003:neckMid_ctrlGrp|rig_male_character_v003:neckMid_ctrlOffsetGrp|rig_male_character_v003:neckMid_ctrl|rig_male_character_v003:head_ctrlGrp|rig_male_character_v003:head_ctrlOffsetGrp|rig_male_character_v003:head_ctrl|rig_male_character_v003:head_offsetDataGrp|rig_male_character_v003:facial_side_gui_grp|rig_male_character_v003:mouth_gui_grp|rig_male_character_v003:jaw_offset_ctrlGrp|rig_male_character_v003:jaw_offset_ctrl.translateX" 
		"rig_male_character_v001RN.placeHolderList[362]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:neckBase_switch_ctrl_grp|rig_male_character_v003:neckBase_ctrlGrp|rig_male_character_v003:neckBase_ctrlOffsetGrp|rig_male_character_v003:neckBase_ctrl|rig_male_character_v003:neckMid_ctrlGrp|rig_male_character_v003:neckMid_ctrlOffsetGrp|rig_male_character_v003:neckMid_ctrl|rig_male_character_v003:head_ctrlGrp|rig_male_character_v003:head_ctrlOffsetGrp|rig_male_character_v003:head_ctrl|rig_male_character_v003:head_offsetDataGrp|rig_male_character_v003:facial_side_gui_grp|rig_male_character_v003:mouth_gui_grp|rig_male_character_v003:jaw_offset_ctrlGrp|rig_male_character_v003:jaw_offset_ctrl.upTargets" 
		"rig_male_character_v001RN.placeHolderList[363]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:neckBase_switch_ctrl_grp|rig_male_character_v003:neckBase_ctrlGrp|rig_male_character_v003:neckBase_ctrlOffsetGrp|rig_male_character_v003:neckBase_ctrl|rig_male_character_v003:neckMid_ctrlGrp|rig_male_character_v003:neckMid_ctrlOffsetGrp|rig_male_character_v003:neckMid_ctrl|rig_male_character_v003:head_ctrlGrp|rig_male_character_v003:head_ctrlOffsetGrp|rig_male_character_v003:head_ctrl|rig_male_character_v003:head_offsetDataGrp|rig_male_character_v003:facial_side_gui_grp|rig_male_character_v003:mouth_gui_grp|rig_male_character_v003:jaw_offset_ctrlGrp|rig_male_character_v003:jaw_offset_ctrl.upOutTargets" 
		"rig_male_character_v001RN.placeHolderList[364]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:neckBase_switch_ctrl_grp|rig_male_character_v003:neckBase_ctrlGrp|rig_male_character_v003:neckBase_ctrlOffsetGrp|rig_male_character_v003:neckBase_ctrl|rig_male_character_v003:neckMid_ctrlGrp|rig_male_character_v003:neckMid_ctrlOffsetGrp|rig_male_character_v003:neckMid_ctrl|rig_male_character_v003:head_ctrlGrp|rig_male_character_v003:head_ctrlOffsetGrp|rig_male_character_v003:head_ctrl|rig_male_character_v003:head_offsetDataGrp|rig_male_character_v003:facial_side_gui_grp|rig_male_character_v003:mouth_gui_grp|rig_male_character_v003:jaw_offset_ctrlGrp|rig_male_character_v003:jaw_offset_ctrl.upInTargets" 
		"rig_male_character_v001RN.placeHolderList[365]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:neckBase_switch_ctrl_grp|rig_male_character_v003:neckBase_ctrlGrp|rig_male_character_v003:neckBase_ctrlOffsetGrp|rig_male_character_v003:neckBase_ctrl|rig_male_character_v003:neckMid_ctrlGrp|rig_male_character_v003:neckMid_ctrlOffsetGrp|rig_male_character_v003:neckMid_ctrl|rig_male_character_v003:head_ctrlGrp|rig_male_character_v003:head_ctrlOffsetGrp|rig_male_character_v003:head_ctrl|rig_male_character_v003:head_offsetDataGrp|rig_male_character_v003:facial_side_gui_grp|rig_male_character_v003:mouth_gui_grp|rig_male_character_v003:jaw_offset_ctrlGrp|rig_male_character_v003:jaw_offset_ctrl.inTargets" 
		"rig_male_character_v001RN.placeHolderList[366]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:neckBase_switch_ctrl_grp|rig_male_character_v003:neckBase_ctrlGrp|rig_male_character_v003:neckBase_ctrlOffsetGrp|rig_male_character_v003:neckBase_ctrl|rig_male_character_v003:neckMid_ctrlGrp|rig_male_character_v003:neckMid_ctrlOffsetGrp|rig_male_character_v003:neckMid_ctrl|rig_male_character_v003:head_ctrlGrp|rig_male_character_v003:head_ctrlOffsetGrp|rig_male_character_v003:head_ctrl|rig_male_character_v003:head_offsetDataGrp|rig_male_character_v003:facial_side_gui_grp|rig_male_character_v003:mouth_gui_grp|rig_male_character_v003:jaw_offset_ctrlGrp|rig_male_character_v003:jaw_offset_ctrl.outTargets" 
		"rig_male_character_v001RN.placeHolderList[367]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:neckBase_switch_ctrl_grp|rig_male_character_v003:neckBase_ctrlGrp|rig_male_character_v003:neckBase_ctrlOffsetGrp|rig_male_character_v003:neckBase_ctrl|rig_male_character_v003:neckMid_ctrlGrp|rig_male_character_v003:neckMid_ctrlOffsetGrp|rig_male_character_v003:neckMid_ctrl|rig_male_character_v003:head_ctrlGrp|rig_male_character_v003:head_ctrlOffsetGrp|rig_male_character_v003:head_ctrl|rig_male_character_v003:head_offsetDataGrp|rig_male_character_v003:facial_side_gui_grp|rig_male_character_v003:mouth_gui_grp|rig_male_character_v003:jaw_offset_ctrlGrp|rig_male_character_v003:jaw_offset_ctrl.downInTargets" 
		"rig_male_character_v001RN.placeHolderList[368]" ""
		5 4 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:controls_grp|rig_male_character_v003:main_ctrlGrp|rig_male_character_v003:main_ctrl|rig_male_character_v003:neckBase_switch_ctrl_grp|rig_male_character_v003:neckBase_ctrlGrp|rig_male_character_v003:neckBase_ctrlOffsetGrp|rig_male_character_v003:neckBase_ctrl|rig_male_character_v003:neckMid_ctrlGrp|rig_male_character_v003:neckMid_ctrlOffsetGrp|rig_male_character_v003:neckMid_ctrl|rig_male_character_v003:head_ctrlGrp|rig_male_character_v003:head_ctrlOffsetGrp|rig_male_character_v003:head_ctrl|rig_male_character_v003:head_offsetDataGrp|rig_male_character_v003:facial_side_gui_grp|rig_male_character_v003:mouth_gui_grp|rig_male_character_v003:jaw_offset_ctrlGrp|rig_male_character_v003:jaw_offset_ctrl.downOutTargets" 
		"rig_male_character_v001RN.placeHolderList[369]" ""
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt.Character" 
		"rig_male_character_v003:maleChar.Reference" "rig_male_character_v001RN.placeHolderList[370]" 
		"rig_male_character_v001RN.placeHolderList[371]" "rig_male_character_v003:maleChar.Reference"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt.Character" 
		"rig_male_character_v003:maleChar.Hips" "rig_male_character_v001RN.placeHolderList[372]" 
		"rig_male_character_v001RN.placeHolderList[373]" "rig_male_character_v003:maleChar.Hips"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:lf_hip_jnt.Character" 
		"rig_male_character_v003:maleChar.LeftUpLeg" "rig_male_character_v001RN.placeHolderList[374]" 
		"rig_male_character_v001RN.placeHolderList[375]" "rig_male_character_v003:maleChar.LeftUpLeg"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:lf_hip_jnt|rig_male_character_v003:lf_knee_jnt.Character" 
		"rig_male_character_v003:maleChar.LeftLeg" "rig_male_character_v001RN.placeHolderList[376]" 
		"rig_male_character_v001RN.placeHolderList[377]" "rig_male_character_v003:maleChar.LeftLeg"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:lf_hip_jnt|rig_male_character_v003:lf_knee_jnt|rig_male_character_v003:lf_ankle_jnt.Character" 
		"rig_male_character_v003:maleChar.LeftFoot" "rig_male_character_v001RN.placeHolderList[378]" 
		"rig_male_character_v001RN.placeHolderList[379]" "rig_male_character_v003:maleChar.LeftFoot"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:rt_hip_jnt.Character" 
		"rig_male_character_v003:maleChar.RightUpLeg" "rig_male_character_v001RN.placeHolderList[380]" 
		"rig_male_character_v001RN.placeHolderList[381]" "rig_male_character_v003:maleChar.RightUpLeg"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:rt_hip_jnt|rig_male_character_v003:rt_knee_jnt.Character" 
		"rig_male_character_v003:maleChar.RightLeg" "rig_male_character_v001RN.placeHolderList[382]" 
		"rig_male_character_v001RN.placeHolderList[383]" "rig_male_character_v003:maleChar.RightLeg"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:rt_hip_jnt|rig_male_character_v003:rt_knee_jnt|rig_male_character_v003:rt_ankle_jnt.Character" 
		"rig_male_character_v003:maleChar.RightFoot" "rig_male_character_v001RN.placeHolderList[384]" 
		"rig_male_character_v001RN.placeHolderList[385]" "rig_male_character_v003:maleChar.RightFoot"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt.Character" 
		"rig_male_character_v003:maleChar.Spine" "rig_male_character_v001RN.placeHolderList[386]" 
		"rig_male_character_v001RN.placeHolderList[387]" "rig_male_character_v003:maleChar.Spine"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt.Character" 
		"rig_male_character_v003:maleChar.LeftArm" "rig_male_character_v001RN.placeHolderList[388]" 
		"rig_male_character_v001RN.placeHolderList[389]" "rig_male_character_v003:maleChar.LeftArm"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt.Character" 
		"rig_male_character_v003:maleChar.LeftForeArm" "rig_male_character_v001RN.placeHolderList[390]" 
		"rig_male_character_v001RN.placeHolderList[391]" "rig_male_character_v003:maleChar.LeftForeArm"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt.Character" 
		"rig_male_character_v003:maleChar.LeftHand" "rig_male_character_v001RN.placeHolderList[392]" 
		"rig_male_character_v001RN.placeHolderList[393]" "rig_male_character_v003:maleChar.LeftHand"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt.Character" 
		"rig_male_character_v003:maleChar.RightArm" "rig_male_character_v001RN.placeHolderList[394]" 
		"rig_male_character_v001RN.placeHolderList[395]" "rig_male_character_v003:maleChar.RightArm"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt.Character" 
		"rig_male_character_v003:maleChar.RightForeArm" "rig_male_character_v001RN.placeHolderList[396]" 
		"rig_male_character_v001RN.placeHolderList[397]" "rig_male_character_v003:maleChar.RightForeArm"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt.Character" 
		"rig_male_character_v003:maleChar.RightHand" "rig_male_character_v001RN.placeHolderList[398]" 
		"rig_male_character_v001RN.placeHolderList[399]" "rig_male_character_v003:maleChar.RightHand"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:cn_neckBase_jnt|rig_male_character_v003:cn_neckMid_jnt|rig_male_character_v003:cn_head_jnt.Character" 
		"rig_male_character_v003:maleChar.Head" "rig_male_character_v001RN.placeHolderList[400]" 
		"rig_male_character_v001RN.placeHolderList[401]" "rig_male_character_v003:maleChar.Head"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:lf_hip_jnt|rig_male_character_v003:lf_knee_jnt|rig_male_character_v003:lf_ankle_jnt|rig_male_character_v003:lf_ball_jnt.Character" 
		"rig_male_character_v003:maleChar.LeftToeBase" "rig_male_character_v001RN.placeHolderList[402]" 
		"rig_male_character_v001RN.placeHolderList[403]" "rig_male_character_v003:maleChar.LeftToeBase"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:rt_hip_jnt|rig_male_character_v003:rt_knee_jnt|rig_male_character_v003:rt_ankle_jnt|rig_male_character_v003:rt_ball_jnt.Character" 
		"rig_male_character_v003:maleChar.RightToeBase" "rig_male_character_v001RN.placeHolderList[404]" 
		"rig_male_character_v001RN.placeHolderList[405]" "rig_male_character_v003:maleChar.RightToeBase"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt.Character" 
		"rig_male_character_v003:maleChar.LeftShoulder" "rig_male_character_v001RN.placeHolderList[406]" 
		"rig_male_character_v001RN.placeHolderList[407]" "rig_male_character_v003:maleChar.LeftShoulder"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt.Character" 
		"rig_male_character_v003:maleChar.RightShoulder" "rig_male_character_v001RN.placeHolderList[408]" 
		"rig_male_character_v001RN.placeHolderList[409]" "rig_male_character_v003:maleChar.RightShoulder"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:cn_neckBase_jnt.Character" 
		"rig_male_character_v003:maleChar.Neck" "rig_male_character_v001RN.placeHolderList[410]" 
		"rig_male_character_v001RN.placeHolderList[411]" "rig_male_character_v003:maleChar.Neck"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:cn_neckBase_jnt|rig_male_character_v003:cn_neckMid_jnt.Character" 
		"rig_male_character_v003:maleChar.Neck1" "rig_male_character_v001RN.placeHolderList[412]" 
		"rig_male_character_v001RN.placeHolderList[413]" "rig_male_character_v003:maleChar.Neck1"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:rig_setup_grp|rig_male_character_v003:controller_joints_grp|rig_male_character_v003:spine01_jnt.Character" 
		"rig_male_character_v003:maleChar.Spine1" "rig_male_character_v001RN.placeHolderList[414]" 
		"rig_male_character_v001RN.placeHolderList[415]" "rig_male_character_v003:maleChar.Spine1"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt.Character" 
		"rig_male_character_v003:maleChar.Spine2" "rig_male_character_v001RN.placeHolderList[416]" 
		"rig_male_character_v001RN.placeHolderList[417]" "rig_male_character_v003:maleChar.Spine2"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:rig_setup_grp|rig_male_character_v003:controller_joints_grp|rig_male_character_v003:spine03_jnt.Character" 
		"rig_male_character_v003:maleChar.Spine3" "rig_male_character_v001RN.placeHolderList[418]" 
		"rig_male_character_v001RN.placeHolderList[419]" "rig_male_character_v003:maleChar.Spine3"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt.Character" 
		"rig_male_character_v003:maleChar.Spine4" "rig_male_character_v001RN.placeHolderList[420]" 
		"rig_male_character_v001RN.placeHolderList[421]" "rig_male_character_v003:maleChar.Spine4"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_thumb01_jnt.Character" 
		"rig_male_character_v003:maleChar.LeftHandThumb1" "rig_male_character_v001RN.placeHolderList[422]" 
		"rig_male_character_v001RN.placeHolderList[423]" "rig_male_character_v003:maleChar.LeftHandThumb1"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_thumb01_jnt|rig_male_character_v003:lf_thumb02_jnt.Character" 
		"rig_male_character_v003:maleChar.LeftHandThumb2" "rig_male_character_v001RN.placeHolderList[424]" 
		"rig_male_character_v001RN.placeHolderList[425]" "rig_male_character_v003:maleChar.LeftHandThumb2"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_thumb01_jnt|rig_male_character_v003:lf_thumb02_jnt|rig_male_character_v003:lf_thumb03_jnt.Character" 
		"rig_male_character_v003:maleChar.LeftHandThumb3" "rig_male_character_v001RN.placeHolderList[426]" 
		"rig_male_character_v001RN.placeHolderList[427]" "rig_male_character_v003:maleChar.LeftHandThumb3"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_index01_jnt.Character" 
		"rig_male_character_v003:maleChar.LeftHandIndex1" "rig_male_character_v001RN.placeHolderList[428]" 
		"rig_male_character_v001RN.placeHolderList[429]" "rig_male_character_v003:maleChar.LeftHandIndex1"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_index01_jnt|rig_male_character_v003:lf_index02_jnt.Character" 
		"rig_male_character_v003:maleChar.LeftHandIndex2" "rig_male_character_v001RN.placeHolderList[430]" 
		"rig_male_character_v001RN.placeHolderList[431]" "rig_male_character_v003:maleChar.LeftHandIndex2"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_index01_jnt|rig_male_character_v003:lf_index02_jnt|rig_male_character_v003:lf_index03_jnt.Character" 
		"rig_male_character_v003:maleChar.LeftHandIndex3" "rig_male_character_v001RN.placeHolderList[432]" 
		"rig_male_character_v001RN.placeHolderList[433]" "rig_male_character_v003:maleChar.LeftHandIndex3"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_middle01_jnt.Character" 
		"rig_male_character_v003:maleChar.LeftHandMiddle1" "rig_male_character_v001RN.placeHolderList[434]" 
		"rig_male_character_v001RN.placeHolderList[435]" "rig_male_character_v003:maleChar.LeftHandMiddle1"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_middle01_jnt|rig_male_character_v003:lf_middle02_jnt.Character" 
		"rig_male_character_v003:maleChar.LeftHandMiddle2" "rig_male_character_v001RN.placeHolderList[436]" 
		"rig_male_character_v001RN.placeHolderList[437]" "rig_male_character_v003:maleChar.LeftHandMiddle2"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_middle01_jnt|rig_male_character_v003:lf_middle02_jnt|rig_male_character_v003:lf_middle03_jnt.Character" 
		"rig_male_character_v003:maleChar.LeftHandMiddle3" "rig_male_character_v001RN.placeHolderList[438]" 
		"rig_male_character_v001RN.placeHolderList[439]" "rig_male_character_v003:maleChar.LeftHandMiddle3"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_ring01_jnt.Character" 
		"rig_male_character_v003:maleChar.LeftHandRing1" "rig_male_character_v001RN.placeHolderList[440]" 
		"rig_male_character_v001RN.placeHolderList[441]" "rig_male_character_v003:maleChar.LeftHandRing1"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_ring01_jnt|rig_male_character_v003:lf_ring02_jnt.Character" 
		"rig_male_character_v003:maleChar.LeftHandRing2" "rig_male_character_v001RN.placeHolderList[442]" 
		"rig_male_character_v001RN.placeHolderList[443]" "rig_male_character_v003:maleChar.LeftHandRing2"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_ring01_jnt|rig_male_character_v003:lf_ring02_jnt|rig_male_character_v003:lf_ring03_jnt.Character" 
		"rig_male_character_v003:maleChar.LeftHandRing3" "rig_male_character_v001RN.placeHolderList[444]" 
		"rig_male_character_v001RN.placeHolderList[445]" "rig_male_character_v003:maleChar.LeftHandRing3"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_pinky01_jnt.Character" 
		"rig_male_character_v003:maleChar.LeftHandPinky1" "rig_male_character_v001RN.placeHolderList[446]" 
		"rig_male_character_v001RN.placeHolderList[447]" "rig_male_character_v003:maleChar.LeftHandPinky1"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_pinky01_jnt|rig_male_character_v003:lf_pinky02_jnt.Character" 
		"rig_male_character_v003:maleChar.LeftHandPinky2" "rig_male_character_v001RN.placeHolderList[448]" 
		"rig_male_character_v001RN.placeHolderList[449]" "rig_male_character_v003:maleChar.LeftHandPinky2"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_wrist_jnt|rig_male_character_v003:lf_pinky01_jnt|rig_male_character_v003:lf_pinky02_jnt|rig_male_character_v003:lf_pinky03_jnt.Character" 
		"rig_male_character_v003:maleChar.LeftHandPinky3" "rig_male_character_v001RN.placeHolderList[450]" 
		"rig_male_character_v001RN.placeHolderList[451]" "rig_male_character_v003:maleChar.LeftHandPinky3"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_thumb01_jnt.Character" 
		"rig_male_character_v003:maleChar.RightHandThumb1" "rig_male_character_v001RN.placeHolderList[452]" 
		"rig_male_character_v001RN.placeHolderList[453]" "rig_male_character_v003:maleChar.RightHandThumb1"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_thumb01_jnt|rig_male_character_v003:rt_thumb02_jnt.Character" 
		"rig_male_character_v003:maleChar.RightHandThumb2" "rig_male_character_v001RN.placeHolderList[454]" 
		"rig_male_character_v001RN.placeHolderList[455]" "rig_male_character_v003:maleChar.RightHandThumb2"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_thumb01_jnt|rig_male_character_v003:rt_thumb02_jnt|rig_male_character_v003:rt_thumb03_jnt.Character" 
		"rig_male_character_v003:maleChar.RightHandThumb3" "rig_male_character_v001RN.placeHolderList[456]" 
		"rig_male_character_v001RN.placeHolderList[457]" "rig_male_character_v003:maleChar.RightHandThumb3"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_index01_jnt.Character" 
		"rig_male_character_v003:maleChar.RightHandIndex1" "rig_male_character_v001RN.placeHolderList[458]" 
		"rig_male_character_v001RN.placeHolderList[459]" "rig_male_character_v003:maleChar.RightHandIndex1"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_index01_jnt|rig_male_character_v003:rt_index02_jnt.Character" 
		"rig_male_character_v003:maleChar.RightHandIndex2" "rig_male_character_v001RN.placeHolderList[460]" 
		"rig_male_character_v001RN.placeHolderList[461]" "rig_male_character_v003:maleChar.RightHandIndex2"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_index01_jnt|rig_male_character_v003:rt_index02_jnt|rig_male_character_v003:rt_index03_jnt.Character" 
		"rig_male_character_v003:maleChar.RightHandIndex3" "rig_male_character_v001RN.placeHolderList[462]" 
		"rig_male_character_v001RN.placeHolderList[463]" "rig_male_character_v003:maleChar.RightHandIndex3"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_middle01_jnt.Character" 
		"rig_male_character_v003:maleChar.RightHandMiddle1" "rig_male_character_v001RN.placeHolderList[464]" 
		"rig_male_character_v001RN.placeHolderList[465]" "rig_male_character_v003:maleChar.RightHandMiddle1"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_middle01_jnt|rig_male_character_v003:rt_middle02_jnt.Character" 
		"rig_male_character_v003:maleChar.RightHandMiddle2" "rig_male_character_v001RN.placeHolderList[466]" 
		"rig_male_character_v001RN.placeHolderList[467]" "rig_male_character_v003:maleChar.RightHandMiddle2"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_middle01_jnt|rig_male_character_v003:rt_middle02_jnt|rig_male_character_v003:rt_middle03_jnt.Character" 
		"rig_male_character_v003:maleChar.RightHandMiddle3" "rig_male_character_v001RN.placeHolderList[468]" 
		"rig_male_character_v001RN.placeHolderList[469]" "rig_male_character_v003:maleChar.RightHandMiddle3"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_ring01_jnt.Character" 
		"rig_male_character_v003:maleChar.RightHandRing1" "rig_male_character_v001RN.placeHolderList[470]" 
		"rig_male_character_v001RN.placeHolderList[471]" "rig_male_character_v003:maleChar.RightHandRing1"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_ring01_jnt|rig_male_character_v003:rt_ring02_jnt.Character" 
		"rig_male_character_v003:maleChar.RightHandRing2" "rig_male_character_v001RN.placeHolderList[472]" 
		"rig_male_character_v001RN.placeHolderList[473]" "rig_male_character_v003:maleChar.RightHandRing2"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_ring01_jnt|rig_male_character_v003:rt_ring02_jnt|rig_male_character_v003:rt_ring03_jnt.Character" 
		"rig_male_character_v003:maleChar.RightHandRing3" "rig_male_character_v001RN.placeHolderList[474]" 
		"rig_male_character_v001RN.placeHolderList[475]" "rig_male_character_v003:maleChar.RightHandRing3"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_pinky01_jnt.Character" 
		"rig_male_character_v003:maleChar.RightHandPinky1" "rig_male_character_v001RN.placeHolderList[476]" 
		"rig_male_character_v001RN.placeHolderList[477]" "rig_male_character_v003:maleChar.RightHandPinky1"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_pinky01_jnt|rig_male_character_v003:rt_pinky02_jnt.Character" 
		"rig_male_character_v003:maleChar.RightHandPinky2" "rig_male_character_v001RN.placeHolderList[478]" 
		"rig_male_character_v001RN.placeHolderList[479]" "rig_male_character_v003:maleChar.RightHandPinky2"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_wrist_jnt|rig_male_character_v003:rt_pinky01_jnt|rig_male_character_v003:rt_pinky02_jnt|rig_male_character_v003:rt_pinky03_jnt.Character" 
		"rig_male_character_v003:maleChar.RightHandPinky3" "rig_male_character_v001RN.placeHolderList[480]" 
		"rig_male_character_v001RN.placeHolderList[481]" "rig_male_character_v003:maleChar.RightHandPinky3"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:lf_clavicle_jnt|rig_male_character_v003:lf_shoulder_jnt|rig_male_character_v003:lf_elbow_jnt|rig_male_character_v003:lf_forearm_jnt.Character" 
		"rig_male_character_v003:maleChar.LeafLeftForeArmRoll3" "rig_male_character_v001RN.placeHolderList[482]" 
		"rig_male_character_v001RN.placeHolderList[483]" "rig_male_character_v003:maleChar.LeafLeftForeArmRoll3"
		
		5 0 "rig_male_character_v001RN" "|rig_male_character_v003:rig_grp|rig_male_character_v003:skeleton_grp|rig_male_character_v003:cn_root_jnt|rig_male_character_v003:cn_pelvis_jnt|rig_male_character_v003:cn_waist_jnt|rig_male_character_v003:cn_spine_jnt|rig_male_character_v003:cn_chest_jnt|rig_male_character_v003:rt_clavicle_jnt|rig_male_character_v003:rt_shoulder_jnt|rig_male_character_v003:rt_elbow_jnt|rig_male_character_v003:rt_forearm_jnt.Character" 
		"rig_male_character_v003:maleChar.LeafRightForeArmRoll3" "rig_male_character_v001RN.placeHolderList[484]" 
		"rig_male_character_v001RN.placeHolderList[485]" "rig_male_character_v003:maleChar.LeafRightForeArmRoll3";
	setAttr ".ptag" -type "string" "";
lockNode -l 1 ;
createNode animCurveTA -n "left_wrist_ik_ctrl_rotateX";
	rename -uid "278729F7-49C8-D5F7-1834-DC980E5BE7DD";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 5.8334447707156288e-06 0 15.28070578791403
		 1 18.777039562429167 2 37.029682486861695 3 163.20644841857683 4 178.92944779010344
		 5 181.52572060753576 6 1.5827255962281188 7 179.22162189531227 8 177.23700043725478
		 9 177.816302572951 10 178.89666955220687 11 178.74182315769414 12 176.67164432253995
		 13 173.24733508567002 14 168.79255360423164 15 163.72847091054879 16 153.54554511853362
		 17 111.72687812266773 18 58.298817740435233 19 41.653030559276857 20 33.94345579628699
		 21 27.992815646800977 22 23.257891861389073 23 18.496302864196323 24 13.733391115657005
		 25 10.915012326022909 26 11.478032477137335 27 13.795271887091948 28 15.280448366098094;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "left_wrist_ik_ctrl_rotateY";
	rename -uid "00CB573E-4A0E-AF9F-4ECB-68BA7E81F64F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 -2.0142910793956693e-06 0 -66.748576487088712
		 1 -75.813665723978616 2 -84.882650596526304 3 -83.305534550589172 4 -72.847819475597205
		 5 -63.52106044199666 6 -124.55578610785037 7 -47.231534693341558 8 -41.076028701004674
		 9 -39.003549924149297 10 -38.687723388458352 11 -39.922585307994218 12 -43.313238864568675
		 13 -48.056209583693715 14 -52.716195017665221 15 -56.675175114003949 16 -63.474581472053686
		 17 -73.07371959945938 18 -67.930832507198474 19 -60.817661973978879 20 -55.791485613415809
		 21 -52.872342542088205 22 -51.749161002441561 23 -51.150394054248899 24 -51.14517458372341
		 25 -52.585459539709035 26 -56.342199766962054 27 -61.566318855323516 28 -66.748570909949251;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "left_wrist_ik_ctrl_rotateZ";
	rename -uid "5C1810FA-4497-2366-3A5D-53A5C27F4D62";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 55.029597661746372 0 -28.564779803046854
		 1 -32.061785272313102 2 -49.274947436796765 3 -173.81019692305361 4 -185.48080465490906
		 5 -180.72944793783776 6 -353.72271346736699 7 -527.5929365092112 8 -523.98774428565616
		 9 -523.58975233075057 10 -524.26905741221367 11 -524.30805434781951 12 -522.39488241740924
		 13 -519.21235782512383 14 -516.52029788653795 15 -518.09434309116716 16 -515.21485703801864
		 17 -476.25069313998767 18 -424.70389951242191 19 -408.98530908250069 20 -400.38266616790759
		 21 -391.9110316967695 22 -385.17813579132854 23 -380.22529531473589 24 -376.09816501933062
		 25 -374.67465765142003 26 -377.64618667925453 27 -383.41991189839479 28 -388.56454271409592;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTL -n "left_wrist_ik_ctrl_translateX";
	rename -uid "84CB703B-4C4B-B1A4-CB79-98912953022B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 -22.036266326904297 0 -20.958473205566406
		 1 -20.272205352783203 2 -20.643730163574219 3 -22.80443000793457 4 -26.84318733215332
		 5 -31.240961074829102 6 -35.340847015380859 7 -38.885528564453125 8 -41.123847961425781
		 9 -42.31134033203125 10 -42.983009338378906 11 -42.535675048828125 12 -40.471046447753906
		 13 -37.675037384033203 14 -34.995143890380859 15 -32.456363677978516 16 -28.394977569580078
		 17 -20.703989028930664 18 -14.431109428405762 19 -12.565994262695312 20 -12.887056350708008
		 21 -14.76828670501709 22 -17.270038604736328 23 -19.660148620605469 24 -21.96588134765625
		 25 -23.189138412475586 26 -22.722902297973633 27 -21.594219207763672 28 -20.958461761474609;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTL -n "left_wrist_ik_ctrl_translateY";
	rename -uid "D1854D63-49EB-C598-C16A-7EAEA94C7C2A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 31.09453010559082 0 -16.008115768432617
		 1 -16.42365837097168 2 -15.860669136047363 3 -14.463061332702637 4 -11.575850486755371
		 5 -8.5651035308837891 6 -7.270167350769043 7 -8.5150833129882812 8 -10.060264587402344
		 9 -10.094098091125488 10 -9.6847553253173828 11 -9.3355283737182617 12 -8.8860883712768555
		 13 -8.2024936676025391 14 -7.8911614418029785 15 -9.0666189193725586 16 -11.423915863037109
		 17 -13.855155944824219 18 -15.387624740600586 19 -15.419907569885254 20 -14.218350410461426
		 21 -11.790935516357422 22 -9.9242229461669922 23 -9.3214559555053711 24 -9.265955924987793
		 25 -9.8437891006469727 26 -11.311539649963379 27 -13.61613941192627 28 -16.008111953735352;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTL -n "left_wrist_ik_ctrl_translateZ";
	rename -uid "A4CFE4A3-4B48-EAF8-15DE-BFAD53132817";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 -0.83768355846405029 0 -0.27165606617927551
		 1 5.9823927879333496 2 12.756009101867676 3 20.513269424438477 4 27.371030807495117
		 5 31.311485290527344 6 33.170890808105469 7 33.382720947265625 8 32.581260681152344
		 9 31.973196029663086 10 31.377805709838867 11 30.451272964477539 12 28.712020874023438
		 13 26.357738494873047 14 24.116424560546875 15 22.344488143920898 16 20.21150016784668
		 17 16.016311645507812 18 9.0482912063598633 19 2.1563444137573242 20 -3.1952171325683594
		 21 -6.3127069473266602 22 -7.9084453582763672 23 -9.0307798385620117 24 -9.6173210144042969
		 25 -9.0918655395507812 26 -6.9630537033081055 27 -3.6777470111846924 28 -0.27168780565261841;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "right_wrist_ik_ctrl_rotateX";
	rename -uid "CF20A66B-4D06-F364-F892-B3AA77064E00";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 -2.3764281483061142e-06 0 168.79204856918346
		 1 163.16229276240517 2 153.54558119661806 3 111.72660934680579 4 58.298764702348024
		 5 41.65303129722524 6 33.943409079006827 7 27.992810792958473 8 23.257907203115899
		 9 18.496269242213696 10 13.733416071124873 11 10.915093427127227 12 11.445959824674002
		 13 13.511278406546223 14 15.280879034586846 15 17.917344720925058 16 37.02959925505052
		 17 163.20529935856092 18 178.92922289268145 19 181.52544821667357 20 1.5825637033590176
		 21 179.22142968236832 22 177.23682495434554 23 177.81613273849138 24 178.8966212540733
		 25 178.74150755057119 26 176.32746293679892 27 172.62890644166265 28 168.79182156021326;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "right_wrist_ik_ctrl_rotateY";
	rename -uid "EAA8CD15-4AA7-9E70-1D59-E39BEC2D2FE0";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 1.4587570020645227e-06 0 -52.716176844565737
		 1 -56.870901932175862 2 -63.474544648832236 3 -73.073656865481581 4 -67.930747295158554
		 5 -60.817581192264377 6 -55.791417010432447 7 -52.872358586076778 8 -51.74904965511007
		 9 -51.15030458120912 10 -51.145090085245478 11 -52.585477406607637 12 -55.9645156690043
		 13 -60.815556426272053 14 -66.748595381152512 15 -75.145490375999941 16 -84.882551706435791
		 17 -83.305542327737029 18 -72.847866369407413 19 -63.521014697393518 20 -124.55579083216006
		 21 -47.231431734524065 22 -41.076038866512079 23 -39.003472193334716 24 -38.687638360772851
		 25 -39.922512313954662 26 -43.324107612951096 27 -48.18772093770383 28 -52.716195238053523;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "right_wrist_ik_ctrl_rotateZ";
	rename -uid "C1B589C3-422A-841B-E675-2DA0C8A41297";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 55.029585844772086 0 203.47992542837918
		 1 201.40115787791461 2 204.78496893464401 3 243.74940360177729 4 295.29600433090189
		 5 311.01457684869348 6 319.61723955219588 7 328.08887983167227 8 334.82176367874013
		 9 339.77459025447308 10 343.90167835062056 11 345.32524309093316 12 342.27332184954776
		 13 336.50896642377813 14 331.43490543556993 15 328.29741664012363 16 310.72499560056883
		 17 186.19074854707426 18 174.51920995949507 19 179.27065834707929 20 6.277252538989738
		 21 -167.59295466429657 22 -163.98774118911103 23 -163.58981863174435 24 -164.26916315624908
		 25 -164.30792835046444 26 -162.6987742086653 27 -159.89205794370662 28 -156.51987366467122;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTL -n "right_wrist_ik_ctrl_translateX";
	rename -uid "26B8771A-428E-96F6-43E9-10B095CC30E0";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 -22.036264419555664 0 -34.9951171875
		 1 -32.240612030029297 2 -28.395027160644531 3 -20.70402717590332 4 -14.431120872497559
		 5 -12.565986633300781 6 -12.887035369873047 7 -14.768283843994141 8 -17.270029067993164
		 9 -19.660146713256836 10 -21.965892791748047 11 -23.189130783081055 12 -22.829799652099609
		 13 -21.786130905151367 14 -20.958488464355469 15 -20.340364456176758 16 -20.643728256225586
		 17 -22.804424285888672 18 -26.843189239501953 19 -31.240966796875 20 -35.340854644775391
		 21 -38.885570526123047 22 -41.123851776123047 23 -42.311355590820312 24 -42.983074188232422
		 25 -42.535713195800781 26 -40.414867401123047 27 -37.483345031738281 28 -34.995059967041016;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTL -n "right_wrist_ik_ctrl_translateY";
	rename -uid "A729C37D-49CD-42B4-CE69-BC8326BB57BE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 31.09453010559082 0 -7.8912625312805176
		 1 -9.464228630065918 2 -11.423921585083008 3 -13.855164527893066 4 -15.387616157531738
		 5 -15.419848442077637 6 -14.218341827392578 7 -11.790870666503906 8 -9.9242048263549805
		 9 -9.3214139938354492 10 -9.2659378051757812 11 -9.8437471389770508 12 -11.352665901184082
		 13 -13.749091148376465 14 -16.008092880249023 15 -16.670696258544922 16 -15.860673904418945
		 17 -14.463128089904785 18 -11.57591724395752 19 -8.5651531219482422 20 -7.2701873779296875
		 21 -8.5151433944702148 22 -10.060309410095215 23 -10.094103813171387 24 -9.6847238540649414
		 25 -9.3355779647827148 26 -9.0770196914672852 27 -8.5945024490356445 28 -7.8912749290466309;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTL -n "right_wrist_ik_ctrl_translateZ";
	rename -uid "DD3C0BB9-4506-4CE8-1090-4DB4DF972397";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 -0.83768653869628906 0 24.11644172668457
		 1 22.470302581787109 2 20.211551666259766 3 16.016277313232422 4 9.0482797622680664
		 5 2.1563239097595215 6 -3.1952211856842041 7 -6.3126921653747559 8 -7.9084897041320801
		 9 -9.0307865142822266 10 -9.6173238754272461 11 -9.0918149948120117 12 -7.1924681663513184
		 13 -4.1708564758300781 14 -0.27163976430892944 15 5.4799637794494629 16 12.755966186523438
		 17 20.513248443603516 18 27.371007919311523 19 31.31151008605957 20 33.170925140380859
		 21 33.382724761962891 22 32.581291198730469 23 31.973178863525391 24 31.377819061279297
		 25 30.451263427734375 26 28.850248336791992 27 26.601423263549805 28 24.116413116455078;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTU -n "left_foot_ik_ctrl_pVecTwist";
	rename -uid "F77DCC5B-4A90-4823-4A1C-1CA5105574DA";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 0 14 0 16 -1.2500015497207642 17 -13.475001335144043
		 18 -13.475000381469727 19 -4.1518075145892226 20 -12.977852176374466 28 0;
	setAttr -s 8 ".ktl[0:7]" no no no no yes no no no;
createNode animCurveTA -n "left_foot_ik_ctrl_rotateX";
	rename -uid "4C227BED-45E6-685D-5577-829AA7E1E8FA";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0 0 -7.3424511534959818 1 -3.7461401446159015
		 2 -0.13867356570007935 3 -0.27581179200536327 4 -0.40333120181775223 5 3.631804954698334
		 6 13.056280199248789 7 31.910216649190332 8 56.514750231049369 9 57.942370076502421
		 10 59.384400508647282 11 65.54248687055096 12 80.636745380957919 13 100.74669771368976
		 14 118.11443721482267 15 128.74312598362235 16 131.33862995731323 17 121.38589188893597
		 18 106.85828267316346 19 87.744912783495096 20 69.778487588766282 21 50.164542826103535
		 22 32.847461047756589 23 20.426059842854578 24 10.182344546697673 25 2.2273421579909241
		 26 -2.5841140536620735 27 -5.0059115480569947 28 -7.3424574060359857;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "left_foot_ik_ctrl_rotateY";
	rename -uid "C6CD9061-4B9E-EF8A-23DE-19994046AD2F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 -0.0001730379853574381 0 8.6059329654729293
		 1 8.9397061582167776 2 9.1684592893361554 3 8.2132253186282274 4 7.2567670102983808
		 5 7.2987248711162076 6 6.9231919836324742 7 6.9550026672545062 8 7.7844555225631975
		 9 8.2856617519467282 10 8.6096524932455925 11 9.5342988546631258 12 11.539840558593202
		 13 13.546825602747532 14 14.50335381318828 15 14.946643947745782 16 15.222356951418485
		 17 14.932259912342561 18 14.308671143695062 19 7.9359804187560119 20 1.7051288951352548
		 21 1.4753814018198339 22 3.9745011293416139 23 4.980100727738769 24 5.6950367828453876
		 25 6.278227388271298 26 6.9653412355400786 27 7.7458057090895798 28 8.6059515485092852;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "left_foot_ik_ctrl_rotateZ";
	rename -uid "3F05C6B1-4673-9B3A-77BE-A7B4EE45A010";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 -0.00012581191933948142 0 -1.0318102222138019
		 1 0.64840210484402183 2 2.3477772101900349 3 1.7939663982294716 4 1.2437015386088908
		 5 0.82066367620702163 6 0.52545524186819859 7 -2.1103195783600506 8 -4.1188429930709534
		 9 -3.9968609745464851 10 -3.7970171852700121 11 -3.4637394904488095 12 -2.1816791108181968
		 13 0.74296336218477199 14 4.2511626566602443 15 6.4214969831102726 16 7.9183350712561094
		 17 9.5226038176084735 18 10.030100411054905 19 1.5119979060922348 20 -3.8367862287667913
		 21 -3.2657815840282969 22 -2.3796424744244917 23 -3.1893742598540462 24 -4.2942157949702544
		 25 -4.7091434231426383 26 -3.9374362896294093 27 -2.5141286022074771 28 -1.0318059054244262;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTL -n "left_foot_ik_ctrl_translateX";
	rename -uid "BDCC1181-4AC7-EBBF-EE50-EAA5AF24B0D1";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 -5.843874454498291 0 -11.601167678833008
		 1 -12.188092231750488 2 -12.813083648681641 3 -12.936716079711914 4 -13.059345245361328
		 5 -12.948933601379395 6 -12.569819450378418 7 -11.513469696044922 8 -10.219399452209473
		 9 -10.546645164489746 10 -10.521047592163086 11 -10.444729804992676 12 -10.508400917053223
		 13 -10.199362754821777 14 -9.3432645797729492 15 -7.9401164054870605 16 -7.2403936386108398
		 17 -7.5201196670532227 18 -8.2329473495483398 19 -6.7415585517883301 20 -6.2937088012695312
		 21 -6.9889397621154785 22 -7.9968757629394531 23 -8.3152866363525391 24 -7.9909014701843262
		 25 -7.5777754783630371 26 -8.1460294723510742 27 -9.6715087890625 28 -11.601157188415527;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTL -n "left_foot_ik_ctrl_translateY";
	rename -uid "E496C517-4844-826E-FA8B-7A9A77FBD7C2";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 -0.37684726715087891 0 5.0684041976928711
		 1 3.8108358383178711 2 2.3099889755249023 3 2.4930028915405273 4 2.6700429916381836
		 5 2.9447927474975586 6 5.1807699203491211 7 8.8208074569702148 8 11.654440879821777
		 9 14.727042198181152 10 18.155815124511719 11 22.145515441894531 12 28.657257080078125
		 13 37.989059448242188 14 45.42779541015625 15 46.290542602539062 16 43.559402465820312
		 17 40.048252105712891 18 37.657569885253906 19 32.059165954589844 20 28.874198913574219
		 21 28.880416870117188 22 27.956100463867188 23 23.172569274902344 24 18.911331176757812
		 25 16.146919250488281 26 12.88675594329834 27 8.6750555038452148 28 5.0683355331420898;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTL -n "left_foot_ik_ctrl_translateZ";
	rename -uid "D95CFBB4-4E99-422A-AAB4-DABAFF061449";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 5.3179836273193359 0 26.167011260986328
		 1 21.356924057006836 2 16.921207427978516 3 9.4337387084960938 4 1.5358734130859375
		 5 -7.9689207077026367 6 -17.332679748535156 7 -25.366443634033203 8 -30.432052612304688
		 9 -35.858753204345703 10 -40.774681091308594 11 -45.725490570068359 12 -50.477275848388672
		 13 -51.644596099853516 14 -48.448619842529297 15 -42.158447265625 16 -34.428466796875
		 17 -27.644451141357422 18 -20.519050598144531 19 -13.859049797058105 20 -5.4415397644042969
		 21 3.1299190521240234 22 10.921758651733398 23 19.170646667480469 24 27.696617126464844
		 25 33.243133544921875 26 33.397506713867188 27 29.917915344238281 28 26.167007446289062;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTU -n "right_foot_ik_ctrl_pVecTwist";
	rename -uid "EB639471-46DB-6E82-0183-DA8870C181DF";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 0 2 1.6000000238418579 3 17.499998092651367
		 4 17.5 5 1.0444367204843132 6 11.36662022753849 14 0 28 0;
	setAttr -s 8 ".ktl[0:7]" no no no yes no no no no;
createNode animCurveTA -n "right_foot_ik_ctrl_rotateX";
	rename -uid "43AFA2AC-4F4C-D6F3-9195-E0B9A65804D4";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 -3.6186120988205928e-06 0 118.11451187068347
		 1 127.05881632030413 2 131.33869950482031 3 122.42269956015683 4 106.85829577859461
		 5 88.618225067381459 6 69.778448381261128 7 50.164535949802193 8 32.847441327964574
		 9 20.426077469220207 10 10.182342568142854 11 2.2273413890942613 12 -2.5835921460042757
		 13 -5.0052976803259037 14 -7.3424610206939143 15 -3.7461378262787997 16 -0.13863710545282684
		 17 -0.27579098033613059 18 -0.40328413721747702 19 3.591087494651716 20 13.056300436664872
		 21 31.925094578479897 22 56.514753698558081 23 61.441849208479383 24 60.139649140424424
		 25 65.542561142510181 26 82.835035109955854 27 100.37842014445967 28 118.11448384634375;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "right_foot_ik_ctrl_rotateY";
	rename -uid "D8A1B597-4E9C-E33F-8BC9-3BB41C1161BF";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0.00016620777072326248 0 -14.503262576092364
		 1 -15.020054707309315 2 -15.222273487706319 3 -15.303829706275037 4 -14.308626349394755
		 5 -8.6452640340932483 6 -1.7052107248970321 7 -1.475502634822456 8 -3.9746605241980091
		 9 -4.9802886845701995 10 -5.6952292427005569 11 -6.2784131970514458 12 -6.9583022262672998
		 13 -7.7314542989047483 14 -8.6061102256579805 15 -8.9398717112357318 16 -9.1686273259385427
		 17 -8.2134120739948013 18 -7.2569240482733939 19 -7.3027095938140345 20 -6.9233656434438871
		 21 -6.9549588332576207 22 -7.7845720151532953 23 -8.3538807521847467 24 -9.0301065535710894
		 25 -9.5343575960362372 26 -11.945753090364942 27 -13.64107664821208 28 -14.503275096008799;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "right_foot_ik_ctrl_rotateZ";
	rename -uid "EE42A026-40BA-7CC1-3367-D3B852B8E9A4";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0.00012581193843613894 0 -4.2513090968366436
		 1 -6.007221680395217 2 -7.9184711017582092 3 -10.459297291944663 4 -10.03026373986885
		 5 -2.2078659994764802 6 3.8366302070822762 7 3.265636240928409 8 2.3795505506673291
		 9 3.1893324294200895 10 4.2941767820396617 11 4.7091516718555653 12 3.9358751325328902
		 13 2.5110519651488303 14 1.0317658252778736 15 -0.64840249603080158 16 -2.3477980762987145
		 17 -1.7939731896825606 18 -1.2437591511823631 19 -0.81967930167081371 20 -0.52544689413449064
		 21 2.1090659770343865 22 4.118709903004282 23 3.5705546907497006 24 4.2332046682029212
		 25 3.4635891281894637 26 2.0952094889008506 27 -0.55906612169559555 28 -4.2513040815995362;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTL -n "right_foot_ik_ctrl_translateX";
	rename -uid "C8A94F4F-4422-D875-B0CC-07B09CA54B6A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 7.268852710723877 0 9.3432645797729492
		 1 7.8964862823486328 2 7.2403969764709473 3 7.951695442199707 4 8.2329473495483398
		 5 7.2083268165588379 6 6.2937107086181641 7 6.9889364242553711 8 7.9968624114990234
		 9 8.315277099609375 10 7.990882396697998 11 7.5777525901794434 12 8.1475944519042969
		 13 9.6740703582763672 14 11.601184844970703 15 12.188203811645508 16 12.813048362731934
		 17 12.936689376831055 18 13.059314727783203 19 12.950927734375 20 12.569777488708496
		 21 11.51303768157959 22 10.21934700012207 23 10.43040657043457 24 10.252340316772461
		 25 10.444706916809082 26 10.605725288391113 27 10.117639541625977 28 9.3432636260986328;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTL -n "right_foot_ik_ctrl_translateY";
	rename -uid "A298CD97-413E-559D-36BE-B38172CADF9C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 -0.45072269439697266 0 45.427661895751953
		 1 44.814189910888672 2 43.559257507324219 3 40.809165954589844 4 37.657485961914062
		 5 32.892917633056641 6 28.874053955078125 7 28.880287170410156 8 27.955921173095703
		 9 23.172397613525391 10 18.911235809326172 11 16.146846771240234 12 13.262167930603027
		 13 9.4256048202514648 14 5.0682287216186523 15 3.8091802597045898 16 2.3098974227905273
		 17 2.4928426742553711 18 2.6699743270874023 19 2.9284429550170898 20 5.1807622909545898
		 21 8.8248662948608398 22 11.654189109802246 23 15.34726619720459 24 19.296974182128906
		 25 22.145515441894531 26 28.739044189453125 27 36.749366760253906 28 45.427654266357422;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTL -n "right_foot_ik_ctrl_translateZ";
	rename -uid "A83D7DEB-4E20-548F-2D5D-E988E8F033C5";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 5.0252985954284668 0 -48.448677062988281
		 1 -41.899517059326172 2 -34.428554534912109 3 -27.245841979980469 4 -20.519119262695312
		 5 -13.811921119689941 6 -5.4415931701660156 7 3.1298465728759766 8 10.921695709228516
		 9 19.170637130737305 10 27.696620941162109 11 33.243064880371094 12 33.403446197509766
		 13 29.929569244384766 14 26.166927337646484 15 20.396200180053711 16 15.451891899108887
		 17 8.7306442260742188 18 1.5359134674072266 19 -7.878169059753418 20 -17.332756042480469
		 21 -25.376277923583984 22 -30.432056427001953 23 -36.320522308349609 24 -42.213478088378906
		 25 -45.72564697265625 26 -49.633689880371094 27 -50.486274719238281 28 -48.448673248291016;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "left_shoulder_ctrl_rotateX";
	rename -uid "0A604A56-40D1-53F6-96EB-7A9BCD4EF974";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0.98024264211608669 0 29.339408350044554
		 1 16.731004207750473 2 3.3971075096581766 3 -13.331086141767733 4 -29.23553895548023
		 5 -38.821412135410071 6 -43.869593761898287 7 -46.116145201064796 8 -46.126101568456086
		 9 -44.276166947321471 10 -41.639159148291299 11 -38.67751787774128 12 -35.199389615439102
		 13 -31.770060220287117 14 -28.534530431962647 15 -24.782314580029425 16 -16.565050631828559
		 17 0.55418283476888808 18 16.541132571021432 19 27.282701462982686 20 35.441368443362634
		 21 39.375065072580483 22 40.192447513516221 23 40.283747657382619 24 39.660134526150685
		 25 38.400824427645546 26 36.310143704837671 27 33.15261562389518 28 29.338790235429808;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "left_shoulder_ctrl_rotateY";
	rename -uid "1726E344-44C3-51AF-3615-7686DE5AC614";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 -2.6496647364857999 0 31.625971712275941
		 1 27.856463615013357 2 24.273767058038757 3 22.430861842033046 4 19.343398854713154
		 5 15.300401879175373 6 12.234744346663385 7 11.505588406309636 8 11.679259128668381
		 9 10.576238753218757 10 9.3654971415735098 11 10.017309753372887 12 13.805065044086293
		 13 19.240453352747917 14 24.379266312446486 15 28.787242318871566 16 32.494092206563472
		 17 31.300969172638322 18 27.418977411620311 19 30.049055314089976 20 34.802880535450868
		 21 37.677430537507696 22 39.846310736679975 23 41.632684104473007 24 42.973552174490855
		 25 43.009918637446916 26 40.939507574447028 27 36.78207953559334 28 31.626179359139332;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "left_shoulder_ctrl_rotateZ";
	rename -uid "EB833F33-445D-9F97-3946-04A74CE6E30E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 -28.409271464253507 0 39.244002290721866
		 1 37.827436808363821 2 35.716143349622087 3 33.717075379839052 4 29.478570854721063
		 5 21.086537264492847 6 12.127428558931912 7 4.0496576550730961 8 -1.0483309369203264
		 9 -0.53284772444171047 10 2.1885058207413106 11 4.5076792490253812 12 4.854871778357249
		 13 4.2040341841373534 14 4.7483196148540934 15 10.676268535973801 16 18.606857691345891
		 17 25.140597538900042 18 27.801507101400663 19 25.105172843695289 20 21.858040662943353
		 21 22.14557277316575 22 23.71988403123347 23 25.692599302946324 24 28.169133626221214
		 25 30.834675913884013 26 33.640872351157476 27 36.559549583461909 28 39.243481890937005;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "right_shoulder_ctrl_rotateX";
	rename -uid "FBFEEA9F-4011-A6B1-F6B3-E89F48CFE5A4";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0.98025806837882901 0 -28.534528576233768
		 1 -24.400808465590991 2 -16.565013103713266 3 0.55382600398873894 4 16.542494258849931
		 5 27.282458631391457 6 35.441323776633752 7 39.375052375726803 8 40.192308060232158
		 9 40.283734842607203 10 39.66015187858558 11 38.400797464357737 12 37.159964018333135
		 13 34.809293147307159 14 29.342202409717171 15 18.112872821138225 16 3.3972121408347085
		 17 -13.330919472562606 18 -29.235508263015703 19 -38.821525926963254 20 -43.869614216102448
		 21 -46.116096676727686 22 -46.126048657844564 23 -44.276101462261302 24 -41.639134423127658
		 25 -38.677486009074052 26 -35.235869732176582 27 -31.633908723134049 28 -28.534511505828025;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "right_shoulder_ctrl_rotateY";
	rename -uid "34B444F3-4294-29DD-0793-F1BEF3B0189F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 -2.6496725258031195 0 24.379288785684359
		 1 28.807737947171649 2 32.494085865882198 3 31.300964356756008 4 27.418707282385732
		 5 30.049173062390739 6 34.802884180458946 7 37.677434722703154 8 39.846390111883807
		 9 41.632691429498728 10 42.973588402641766 11 43.009949847258312 12 40.785825640288479
		 13 36.41309884817462 14 31.624814629565172 15 27.582725633540658 16 24.273789207267125
		 17 22.430889458305447 18 19.343229590752337 19 15.300746190760437 20 12.234748247860347
		 21 11.505620885303012 22 11.679256694120197 23 10.576229042550903 24 9.3654455944951298
		 25 10.017312614438817 26 13.814697096751646 27 19.253020533748078 28 24.379275734915137;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "right_shoulder_ctrl_rotateZ";
	rename -uid "8FA98AD8-4007-1DE6-92E3-3D990E8078AD";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 -28.409278930257912 0 4.7483108185916736
		 1 11.783527118168438 2 18.606880107545745 3 25.140172060869094 4 27.802531743636266
		 5 25.104882818708347 6 21.857947161594947 7 22.145464230192541 8 23.719667865592143
		 9 25.692520907043345 10 28.169068523734076 11 30.834513650820256 12 33.849054234713307
		 13 37.058306477845967 14 39.246302940760202 15 38.415869171583097 16 35.716225081711436
		 17 33.717209093254461 18 29.478279066027699 19 21.086985642302626 20 12.1275377463366
		 21 4.0497114007769799 22 -1.0482887746528067 23 -0.53276540103897552 24 2.1885656245129352
		 25 4.5077568292906793 26 5.379106124258163 27 5.3693076664903421 28 4.7482904181146841;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "left_elbow_ctrl_rotateX";
	rename -uid "46F2252B-4361-1A5B-2FBA-C59D216B8D35";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 -0.85220659589297298 0 -98.793917907147502
		 1 -93.832779260662988 2 -88.571391401157697 3 -81.460148205646902 4 -75.862742489343802
		 5 -75.235701160799394 6 -77.619738653668023 7 -83.066439592640592 8 -89.061435881757006
		 9 -93.186251425190179 10 -96.70947465246357 11 -99.455842632895695 12 -101.46799502193572
		 13 -102.68520797863694 14 -102.79154951747346 15 -101.17269046001901 16 -96.661283076780222
		 17 -86.485322767886288 18 -77.578824587140332 19 -77.480333933128094 20 -81.041090032313974
		 21 -85.959593240232138 22 -91.398709010952771 23 -96.23116876955217 24 -100.76214704467348
		 25 -103.4480932510897 26 -103.13668216827259 27 -100.96246626154799 28 -98.793607865755547;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "left_elbow_ctrl_rotateY";
	rename -uid "B1D45822-44A1-F6D1-60E4-0881CCE7665E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0 0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0
		 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0
		 26 0 27 0 28 0;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "left_elbow_ctrl_rotateZ";
	rename -uid "1796A6F7-4BE8-444C-9A47-0DA0E0251162";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0 0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0
		 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0
		 26 0 27 0 28 0;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTL -n "left_elbow_ctrl_translateX";
	rename -uid "4EFAA135-4A44-6384-CBE9-5C972E29F23C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0 0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0
		 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0
		 26 0 27 0 28 0;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTL -n "left_elbow_ctrl_translateY";
	rename -uid "7B35EC15-446B-E253-5C02-EC986C3B740B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0 0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0
		 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0
		 26 0 27 0 28 0;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTL -n "left_elbow_ctrl_translateZ";
	rename -uid "AEDDBB34-4CD5-648B-06C3-1CABC57CFA8A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0 0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0
		 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0
		 26 0 27 0 28 0;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "right_elbow_ctrl_rotateX";
	rename -uid "313F6CDA-448A-4E47-9BB5-DCBBAD078FA7";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 -0.8522211923809847 0 -102.79159445036386
		 1 -100.5457070568267 2 -96.661340939559096 3 -86.485188647040161 4 -77.579715719833729
		 5 -77.480209243054631 6 -81.041069450655414 7 -85.959683506821563 8 -91.398674225515137
		 9 -96.231202284682908 10 -100.76223254675963 11 -103.44812653726814 12 -103.45777359361796
		 13 -101.60287179196017 14 -98.795574640108526 15 -94.369047128595241 16 -88.571457234740564
		 17 -81.460248773127674 18 -75.862843154930431 19 -75.23547409297079 20 -77.619710997090877
		 21 -83.066566094921981 22 -89.061545112356583 23 -93.18643039466501 24 -96.709549974985563
		 25 -99.455929912200588 26 -101.09619932471347 27 -101.94363262006802 28 -102.79163983234385;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "right_elbow_ctrl_rotateY";
	rename -uid "0EE7E112-44D0-F8AE-153B-D6A32F675C3C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0 0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0
		 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0
		 26 0 27 0 28 0;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "right_elbow_ctrl_rotateZ";
	rename -uid "426638E9-4E04-A37A-809E-4F915CA14903";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0 0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0
		 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0
		 26 0 27 0 28 0;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTL -n "right_elbow_ctrl_translateX";
	rename -uid "51F25847-410A-B1B3-D4E1-5CA5EBFED5B0";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0 0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0
		 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0
		 26 0 27 0 28 0;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTL -n "right_elbow_ctrl_translateY";
	rename -uid "EB25369A-4840-A50C-E386-BFB57A95BFA3";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0 0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0
		 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0
		 26 0 27 0 28 0;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTL -n "right_elbow_ctrl_translateZ";
	rename -uid "4F1ACDFA-46AB-A0D1-4C2F-398BAEA31BF5";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0 0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0
		 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0
		 26 0 27 0 28 0;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "left_wrist_ctrl_rotateX";
	rename -uid "A6A48D49-4259-1A19-83B3-C7B65F9F63BD";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 -0.44579703507349322 0 -9.0195671507075712
		 1 -10.540919893670635 2 -12.011248251676156 3 -13.605559203546472 4 -14.644421299527538
		 5 -14.380442445547974 6 -13.306265739278521 7 -11.485247418188141 8 -9.46497651953492
		 9 -7.5223343545503027 10 -5.6485820284604671 11 -4.7100247841667082 12 -5.0922761296857768
		 13 -6.3655337669699072 14 -8.2432856938516945 15 -11.611071549971673 16 -15.630618548587808
		 17 -19.36986518587921 18 -22.255809416463187 19 -22.734666970339607 20 -21.469941410650385
		 21 -18.340700182021173 22 -14.681517393806688 23 -11.476876449257038 24 -8.4550005618956892
		 25 -6.5999542209661888 26 -6.633184477401401 27 -7.831278278379914 28 -9.0194151985281259;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "left_wrist_ctrl_rotateY";
	rename -uid "43DD1296-4EF5-4197-F469-CE92C490FE35";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 2.7831948786604928 0 3.9378123836276604
		 1 3.9497395836755596 2 3.8395501963937648 3 3.1880169482085678 4 2.7685063863699528
		 5 3.2937415502701395 6 4.335904212302351 7 5.9488569745342836 8 7.6739386069064572
		 9 9.2894280772052067 10 10.770202235742502 11 11.317118714601271 12 10.40921709219568
		 13 8.527369987368381 14 6.3900042821746297 15 4.0790085813815571 16 1.682150085221348
		 17 -0.46594443211184583 18 -2.0513943312012972 19 -3.1279916698909549 20 -3.57356654297348
		 21 -2.8618814379937079 22 -1.6673096925979123 23 -0.62371768692987328 24 0.44931669658629481
		 25 1.457697965788179 26 2.3285074425192076 27 3.1267350411266293 28 3.9373408241046897;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "left_wrist_ctrl_rotateZ";
	rename -uid "A6DB5CCD-4D06-70FE-65A1-B0A5139E9FE9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 -10.301499629262882 0 -27.496934146712043
		 1 -27.232087672980157 2 -26.990497493645996 3 -26.883415300117143 4 -26.825219610234175
		 5 -27.091310731536197 6 -27.625454236686949 7 -28.407772171187474 8 -28.982277161815592
		 9 -28.946136763768568 10 -28.730819830480232 11 -29.096412963767783 12 -30.743039097440054
		 13 -32.973939487629146 14 -34.51132643320377 15 -34.4514349130284 16 -32.974852524852132
		 17 -29.430293128284401 18 -25.86615572372256 19 -25.721405940238757 20 -26.783291681664469
		 21 -27.631705756938153 22 -28.396846728256946 23 -28.990827812188471 24 -29.436997005319029
		 25 -29.490988950764272 26 -29.025295824642146 27 -28.258858746809942 28 -27.497012589229179;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTL -n "left_wrist_ctrl_translateX";
	rename -uid "28A787E6-43BE-AC63-365F-9EB14AA294AE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0 0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0
		 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0
		 26 0 27 0 28 0;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTL -n "left_wrist_ctrl_translateY";
	rename -uid "BF681EDD-4B7F-5D58-AE18-EDA69C311E84";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0 0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0
		 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0
		 26 0 27 0 28 0;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTL -n "left_wrist_ctrl_translateZ";
	rename -uid "B38771FE-4283-2169-26C7-B09063525B73";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0 0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0
		 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0
		 26 0 27 0 28 0;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "right_wrist_ctrl_rotateX";
	rename -uid "A84985B5-4C29-D0D1-19B9-E7AF04CCF2F6";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 -0.44579861146981653 0 -8.2431901660132443
		 1 -12.004481375703303 2 -15.630545380331183 3 -19.369719017072004 4 -22.255984376290453
		 5 -22.734613541203959 6 -21.469922700887295 7 -18.340675117295998 8 -14.681452110321516
		 9 -11.476806740315306 10 -8.4549186781671626 11 -6.5999106264353786 12 -6.5690991521106579
		 13 -7.7025467924039424 14 -9.0200842071072938 15 -10.435181104023711 16 -12.011227200754369
		 17 -13.605540744305104 18 -14.644272678014179 19 -14.380557774406089 20 -13.306233789229282
		 21 -11.485186374525762 22 -9.464894610683384 23 -7.5222682335238638 24 -5.6484869276593539
		 25 -4.7099799238768796 26 -5.3196857345341577 27 -6.8169618617309293 28 -8.2431646036153818;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "right_wrist_ctrl_rotateY";
	rename -uid "DBBCAA80-4713-C820-C221-61BC3E47CA38";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 2.7831882840067279 0 6.3897860086946663
		 1 3.9860536327631677 2 1.6820050924656673 3 -0.46640758299288237 4 -2.0505464702805312
		 5 -3.1282822806170962 6 -3.5736830626384308 7 -2.8619718208846119 8 -1.6674839227209075
		 9 -0.62384546464870894 10 0.44920460333120688 11 1.4575223901391519 12 2.4073354669836853
		 13 3.2850130637290551 14 3.9398981344470094 15 4.08464261455266 16 3.8395071696677343
		 17 3.1879759148688107 18 2.7680358217125436 19 3.2941000869407109 20 4.3358326070797908
		 21 5.9487160352367168 22 7.6737989690609281 23 9.2892733010207973 24 10.770005699851817
		 25 11.316966853127925 26 10.347047963819813 27 8.3935668079075114 28 6.3897900650901809;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "right_wrist_ctrl_rotateZ";
	rename -uid "A6E10AF2-4F38-6D6B-A207-E0845CF0ADE0";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 -10.301481176568629 0 -34.511232616763927
		 1 -34.089126372062019 2 -32.974752194406769 3 -29.430131142623015 4 -25.866195181343453
		 5 -25.721227608250022 6 -26.783146312365915 7 -27.631602136927505 8 -28.396719895409891
		 9 -28.990713315267616 10 -29.436897114497796 11 -29.490871718798285 12 -28.97547317253343
		 13 -28.164020467108145 14 -27.496498765110985 15 -27.167867134884073 16 -26.990401718238267
		 17 -26.883301050769841 18 -26.825040641720339 19 -27.091295442833914 20 -27.625316052142519
		 21 -28.407633787480943 22 -28.9821488848233 23 -28.945982850414271 24 -28.730662729628285
		 25 -29.096290111101421 26 -30.536997399901743 27 -32.560348720388923 28 -34.511230095128646;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTL -n "right_wrist_ctrl_translateX";
	rename -uid "4AE85415-4BBC-4CAE-8F05-8C92F6B91D74";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0 0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0
		 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0
		 26 0 27 0 28 0;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTL -n "right_wrist_ctrl_translateY";
	rename -uid "8052B946-4658-E09C-3E78-A5A94110906D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0 0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0
		 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0
		 26 0 27 0 28 0;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTL -n "right_wrist_ctrl_translateZ";
	rename -uid "1D41182E-493B-4D3B-887A-CDBB9BE1866A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0 0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0
		 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0
		 26 0 27 0 28 0;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "left_hip_ctrl_rotateX";
	rename -uid "98574EF9-4675-AF67-EE5B-479E68F0CFB0";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 4.8698555771987833 0 44.68848330217125
		 1 58.157833493086443 2 61.660385397015325 3 58.328921462371603 4 50.474067875846963
		 5 38.723641326162706 6 26.860612917446105 7 16.198404814305718 8 7.2733075916239427
		 9 -1.8393915667092944 10 -9.2385238242586176 11 -13.753188563787983 12 -11.385072074439922
		 13 -4.8285884363395564 14 1.9968902550516923 15 10.038027410104077 16 20.5558629505787
		 17 32.888700730071015 18 45.638774243303864 19 54.678011092172838 20 63.559324200459308
		 21 71.837044933972223 22 76.484648615332446 23 75.527694434475137 24 72.19954112807109
		 25 67.557005436319699 26 61.159011449394761 27 52.992397280390186 28 44.688403187219059;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "left_hip_ctrl_rotateY";
	rename -uid "18E6EF9E-4FCA-73AB-2F04-FC99FCE200D6";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0.098529468274261386 0 -4.274265422736355
		 1 -2.4430110123178408 2 -1.7142604964173556 3 -1.2876299504433484 4 -0.83239635765005104
		 5 -3.1023131543311355 6 -4.6894581188757662 7 -6.9071531163027498 8 -8.6568826715486473
		 9 -9.1359704863677855 10 -9.5169203901314887 11 -10.339431967692287 12 -11.847278629009628
		 13 -13.811212653633122 14 -15.780228995119026 15 -17.628830545867494 16 -19.406122037704389
		 17 -20.27365789421772 18 -19.58521917672854 19 -16.347778544147673 20 -13.417486731526211
		 21 -11.041935368843529 22 -9.4982234528045133 23 -9.6193779453182291 24 -10.31360938263353
		 25 -10.37549074819955 26 -9.1509034912194736 27 -6.9445928922808706 28 -4.2743242109676949;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "left_hip_ctrl_rotateZ";
	rename -uid "10214C5E-4681-1E41-1E5C-9CB977B5FA29";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 -4.7943686122944849 0 -15.51756094263075
		 1 -19.304328791628038 2 -20.190082760356429 3 -15.644703765952501 4 -10.14678200161263
		 5 -7.5216592118486352 6 -5.3883160128955625 7 -2.5938304532943373 8 -0.22962261508130102
		 9 0.39526279630016037 10 1.0288729357859501 11 1.0071465833120579 12 0.05767454535673517
		 13 -2.1256188405866139 14 -4.6146939938459761 15 -6.9117731301427785 16 -10.627610726273518
		 17 -16.975395612906908 18 -23.935417364272169 19 -23.714763090224942 20 -23.414656972079769
		 21 -24.517074456358642 22 -25.190272508821256 23 -24.425944731998559 24 -23.38434557893779
		 25 -21.899171322846886 26 -19.753543700277849 27 -17.374530299387828 28 -15.517492461377206;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "right_hip_ctrl_rotateX";
	rename -uid "7F8033E4-46B9-1FD1-4E25-52B05B4F4FE4";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 1.7265006662486642 0 1.9813685892717832
		 1 10.750686221258276 2 20.655820257657513 3 33.352046911493005 4 45.638621310945908
		 5 55.070672315154482 6 63.55928706382209 7 71.834990007098028 8 76.481571906580754
		 9 75.533500828350469 10 72.219445035870251 11 67.5567526907721 12 61.155379671318819
		 13 53.030390796269614 14 44.684534788322466 15 56.571754666000395 16 60.855410302613336
		 17 57.800234764114101 18 50.468952925911523 19 38.799262325617029 20 26.863929060702631
		 21 16.191422970091903 22 7.2727310785494579 23 -0.72345143520514921 24 -9.55319752650853
		 25 -13.752626568623693 26 -8.2046670894465112 27 -2.7975868512090885 28 1.982190158110227;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "right_hip_ctrl_rotateY";
	rename -uid "FA250738-40CA-E77D-DA87-A09A58F50867";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0.085985802628042229 0 -15.780312515959769
		 1 -17.626508106134381 2 -19.394722867242784 3 -20.608295152300194 4 -19.585987904594152
		 5 -16.524364355778157 6 -13.41854927958965 7 -11.042792452144054 8 -9.4996116546231573
		 9 -9.6199898416643723 10 -10.316899924386433 11 -10.376718859016517 12 -9.1525699713345521
		 13 -6.9488980195541972 14 -4.2749625073929574 15 -2.6840313524369188 16 -1.9107632963650556
		 17 -1.3742053122746651 18 -0.83273438036568692 19 -3.0934800340861019 20 -4.6898114683795873
		 21 -6.9075704661234081 22 -8.6570076680111452 23 -9.2180316908913476 24 -9.6749247150707962
		 25 -10.32011175821728 26 -12.165813081324732 27 -13.984551261691134 28 -15.780316332008512;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "right_hip_ctrl_rotateZ";
	rename -uid "BF6B5901-4A1B-9BDC-9FFC-F2BAB3E5BDD3";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 -4.5947049602727663 0 -4.6090219040376166
		 1 -6.9592335233002398 2 -10.650633684421063 3 -17.714283822907973 4 -23.934372287191032
		 5 -24.485523088238093 6 -23.414032660061629 7 -24.516741584221592 8 -25.189948441140661
		 9 -24.423803400711162 10 -23.380285053775243 11 -21.898608548757746 12 -19.753243409172484
		 13 -17.370521799085715 14 -15.516786996475323 15 -18.974668049469972 16 -20.046795867461462
		 17 -15.561115896155325 18 -10.146469332794089 19 -7.5477110344326412 20 -5.3874563553285526
		 21 -2.5906471561616553 22 -0.22829278894784161 23 0.40325826138309712 24 1.1239637424584639
		 25 1.0023769562083069 26 -0.50304816916836159 27 -2.4609330775942793 28 -4.6092504167106085;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "left_knee_ctrl_rotateX";
	rename -uid "A0CD65BE-4BF0-9A74-B729-C1BE69EEC8A1";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 -4.9005112339958492 0 -15.620996462258002
		 1 -47.051674446470003 2 -59.744976453827512 3 -64.882064142499871 4 -62.316149304446824
		 5 -53.630628930738098 6 -43.921562875549455 7 -34.280987167493791 8 -23.568898648852201
		 9 -14.013233154503729 10 -7.740221120913759 11 -8.0642080705617456 12 -24.515290578905883
		 13 -49.731083294235795 14 -71.970162019707971 15 -90.578874538414127 16 -105.23959008864128
		 17 -110.95214033527955 18 -113.73265289577023 19 -108.16031692571084 20 -103.20698213315632
		 21 -99.889907064418637 22 -92.906206377771795 23 -77.444081679996131 24 -59.315216463180313
		 25 -44.013097006041498 26 -33.6800179047897 27 -25.035218892470741 28 -15.620670027492736;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "left_knee_ctrl_rotateY";
	rename -uid "F3A6F519-4F4A-A281-9547-BCA05E4BC033";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0 0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0
		 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0
		 26 0 27 0 28 0;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "left_knee_ctrl_rotateZ";
	rename -uid "EDD189A0-4502-5150-3B0B-BA83499AF513";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0 0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0
		 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0
		 26 0 27 0 28 0;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTL -n "left_knee_ctrl_translateX";
	rename -uid "89978826-47E3-9597-B6E1-58AD07A6DA1E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0 0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0
		 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0
		 26 0 27 0 28 0;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTL -n "left_knee_ctrl_translateY";
	rename -uid "7805609B-40D4-039A-9B49-C99217005EED";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0 0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0
		 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0
		 26 0 27 0 28 0;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTL -n "left_knee_ctrl_translateZ";
	rename -uid "AC841EC0-4589-B7DB-3B62-42BB2247BCE8";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0 0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0
		 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0
		 26 0 27 0 28 0;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "right_knee_ctrl_rotateX";
	rename -uid "05018E0B-4ED9-1307-97F9-A7924D27E746";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0.38910285074386747 0 -71.95579359949204
		 1 -90.209729408392988 2 -105.3139114915695 3 -112.28165396672981 4 -113.73265066927337
		 5 -109.47050237333399 6 -103.20687494437578 7 -99.887346101582182 8 -92.903052086042337
		 9 -77.427501618295352 10 -59.274962613465775 11 -44.012979141728998 12 -33.6971635094513
		 13 -25.107967437568998 14 -15.616534761287845 15 -45.603717979421603 16 -60.52555761293565
		 17 -65.039887305422198 18 -62.31085151072174 19 -53.622968125413948 20 -43.925048055932294
		 21 -34.28216665589045 22 -23.567926840411847 23 -17.1733072495262 24 -9.6431683363241731
		 25 -8.0636095137965498 26 -30.158068638438614 27 -51.833582592753103 28 -71.956553575321678;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "right_knee_ctrl_rotateY";
	rename -uid "9D7F9AE7-46D5-203D-0E37-91B6FAEF07D3";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0 0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0
		 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0
		 26 0 27 0 28 0;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "right_knee_ctrl_rotateZ";
	rename -uid "09F0D283-4AB6-D993-7C6A-A5AB2F0CE9F4";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0 0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0
		 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0
		 26 0 27 0 28 0;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTL -n "right_knee_ctrl_translateX";
	rename -uid "3CFFEE8C-41E5-306E-13C4-1FA9026F83D5";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0 0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0
		 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0
		 26 0 27 0 28 0;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTL -n "right_knee_ctrl_translateY";
	rename -uid "09BADC1B-479C-9FB5-C504-C69966C6722C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0 0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0
		 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0
		 26 0 27 0 28 0;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTL -n "right_knee_ctrl_translateZ";
	rename -uid "E521F5BF-4A3B-AA0B-60F1-13A7B191A2A3";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0 0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0
		 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0
		 26 0 27 0 28 0;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "left_ankle_ctrl_rotateX";
	rename -uid "2E3A6691-43C5-CE21-849D-74848D0C033E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0.12357976060353464 0 -1.5657737795556201
		 1 13.855011041894981 2 20.445480656199955 3 28.693876394642185 4 33.508937038486714
		 5 32.126336960844519 6 24.333852235606955 7 5.2118049353944871 8 -22.114748303333773
		 9 -24.003184750795167 10 -24.342504049680414 11 -25.716725024946911 12 -26.629562471286519
		 13 -27.169112798561248 14 -27.68415182861472 15 -26.532205479456866 16 -23.584099796025093
		 17 -18.683538352410956 18 -12.633129081918439 19 -10.612179848595654 20 -8.0267881775645744
		 21 0.1442619898680495 22 6.1166893596633489 23 3.3465428580756948 24 -2.1520179217988167
		 25 -5.5290707297772883 26 -4.9186348352447347 27 -2.977264209664487 28 -1.5660234276012714;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "left_ankle_ctrl_rotateY";
	rename -uid "0FD37973-4FE5-109E-42A0-75A54ED86C8C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 4.1271556897179069 0 9.3209275575868258
		 1 14.456409104359848 2 16.83014318557079 3 15.018065418853663 4 12.571523161455644
		 5 11.91866815316909 6 11.217262821266162 7 9.5709284665233838 8 6.7152739852268244
		 9 5.0800432211720725 10 3.6330585463096483 11 2.8047174257815941 12 3.1030115152249711
		 13 3.3349400612350308 14 1.9794936894829274 15 -0.17514231778801526 16 -2.1866482364927955
		 17 -2.7437728478562784 18 -2.017096897825239 19 7.3247337711008802 20 13.40880277963498
		 21 13.299419838527523 22 12.096279539263561 23 12.49461489981789 24 11.833308378705402
		 25 10.30800904413346 26 9.3444712675261759 27 9.0580695486350447 28 9.3208576605767046;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "left_ankle_ctrl_rotateZ";
	rename -uid "3FAC4FF5-407A-F8CB-B2DE-1286E755DBF3";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 2.4575269040079673 0 2.7103416244527438
		 1 7.1343832587608391 2 10.733131564835023 3 11.181133671555687 4 10.255180040817512
		 5 7.1138397277591654 6 3.9849148917181738 7 -1.9280893158824999 8 -6.3999105971602539
		 9 -6.6587439432072593 10 -6.8057163741334774 11 -6.5498358659100884 12 -5.2275033274987939
		 13 -1.897777896775495 14 1.7727611140273585 15 3.8198119641061137 16 6.2205014497513735
		 17 10.91331356277664 18 16.102046579107704 19 11.321010228965239 20 6.5306203698607659
		 21 7.3621762006289195 22 8.584574133436373 23 5.320188096001087 24 1.1025398292437762
		 25 -1.3813750342193649 26 -1.1939850383757675 27 0.49802324274287851 28 2.7102776792843519;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTL -n "left_ankle_ctrl_translateX";
	rename -uid "9F9D4E92-429B-7B74-FC74-7983DF5552C9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0 0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0
		 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0
		 26 0 27 0 28 0;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTL -n "left_ankle_ctrl_translateY";
	rename -uid "FA3D2A01-4ECF-6872-58E3-EF83878B8560";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0 0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0
		 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0
		 26 0 27 0 28 0;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTL -n "left_ankle_ctrl_translateZ";
	rename -uid "2620D11F-4DAC-0594-5FE3-64B7AB8A306C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0 0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0
		 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0
		 26 0 27 0 28 0;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "right_ankle_ctrl_rotateX";
	rename -uid "7B53EA94-4A6D-596B-BD51-0ABF47CED788";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 -2.0300603797351178 0 -27.684992209045049
		 1 -26.018134326732682 2 -23.602229654442777 3 -18.316617331980897 4 -12.633213938833912
		 5 -10.114662266432674 6 -8.0270191250520035 7 0.14362767066436874 8 6.1165173151010546
		 9 3.3230506239609316 10 -2.2143366102382651 11 -5.5291781478559754 12 -4.8979091183574264
		 13 -2.9428783780560299 14 -1.5664363163320039 15 13.93813728188802 16 22.050959309409603
		 17 29.380804940591947 18 33.508687990806905 19 32.086737190350085 20 24.333849186002062
		 21 5.2050422013546367 22 -22.115286762562938 23 -25.394043165246394 24 -23.031035204047797
		 25 -25.714038020028731 26 -26.287700243103753 27 -26.698157474433085 28 -27.684951209874669;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "right_ankle_ctrl_rotateY";
	rename -uid "9389102A-4B68-EEE3-344F-CCAA5E38E778";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 3.9516249678865831 0 1.9806561476981654
		 1 0.042545488547437581 2 -2.2048190261461649 3 -3.7270316824223451 4 -2.0160464773306188
		 5 6.4876588851224657 6 13.409662720983302 7 13.300072991248342 8 12.097083579451434
		 9 12.494246904750511 10 11.828925575718161 11 10.307512050999483 12 9.3454844289197059
		 13 9.0553652991074856 14 9.3201421500730159 15 14.203570939204802 16 16.572863079285035
		 17 14.900533604426142 18 12.57153679053418 19 11.933552305084838 20 11.216887642150207
		 21 9.5703155309798724 22 6.7144184060806804 23 5.5561172425215553 24 3.492858413751236
		 25 2.7929434640657753 26 3.5407785368633156 27 3.4956953452007133 28 1.9806151316475715;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "right_ankle_ctrl_rotateZ";
	rename -uid "DE43C80A-4712-015F-9D7F-99A2E1643B2F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 2.3534602408913305 0 1.7675879624915374
		 1 3.5892901557625589 2 6.2378789437980044 3 11.904017255226385 4 16.10139216157534
		 5 12.516458520564047 6 6.529745116312335 7 7.3614294250895584 8 8.5833788937566453
		 9 5.3151619576838947 10 1.0899678449353456 11 -1.3826778685279555 12 -1.1937697276470671
		 13 0.4965540622925298 14 2.7095812259811178 15 6.8186220019539387 16 10.837822954309617
		 17 11.188808440665778 18 10.254655047032497 19 7.1283043341615144 20 3.9839950936046815
		 21 -1.9289434551790958 22 -6.4009279952809921 23 -6.2665579088404053 24 -7.2466984289987613
		 25 -6.5339746259103864 26 -4.7820868558439029 27 -1.7951159629837659 28 1.7677956917019453;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTL -n "right_ankle_ctrl_translateX";
	rename -uid "351870D0-4F64-ACEE-47D2-58BE7EB486D3";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0 0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0
		 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0
		 26 0 27 0 28 0;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTL -n "right_ankle_ctrl_translateY";
	rename -uid "4A05FB11-4200-B19A-56CC-D094D5D6CA9F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0 0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0
		 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0
		 26 0 27 0 28 0;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTL -n "right_ankle_ctrl_translateZ";
	rename -uid "B1BA85E7-4DF6-CF58-8D15-B98054283195";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0 0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0
		 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0
		 26 0 27 0 28 0;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "left_thumb03_ctrl_rotateX";
	rename -uid "ABBFD58B-4040-8A2D-2E1A-D0A6D8655F3A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "left_thumb03_ctrl_rotateY";
	rename -uid "15937009-4A79-8E2A-1326-14BB01E6B518";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "left_thumb03_ctrl_rotateZ";
	rename -uid "4721E15B-4B81-868D-2C7C-16AAEC486376";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 -4.4057614930400897;
	setAttr ".ktl[0]" no;
createNode animCurveTU -n "left_thumb03_ctrl_showScaleCtrl";
	rename -uid "60FF205D-4A69-3106-32E2-00A440706564";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".kot[0]"  5;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "left_thumb03_ctrl_translateX";
	rename -uid "14C92563-4175-2EB9-DBBB-FA937904CFE2";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "left_thumb03_ctrl_translateY";
	rename -uid "5C6CA497-4D17-A81D-9B0F-DEAAB48BF4E3";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "left_thumb03_ctrl_translateZ";
	rename -uid "FB70D445-4E7D-F2BE-565C-E39EDD98977C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "right_thumb03_ctrl_rotateX";
	rename -uid "93CAEDEF-4EE2-CE3E-593D-A895DABCDC87";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "right_thumb03_ctrl_rotateY";
	rename -uid "18594DE7-41B4-E0FD-5B17-7FBBAAE5D8CA";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "right_thumb03_ctrl_rotateZ";
	rename -uid "5C7BEBD4-4A45-E1E2-4AC5-61B896CFA43E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 -7.6629270907169618;
	setAttr ".ktl[0]" no;
createNode animCurveTU -n "right_thumb03_ctrl_showScaleCtrl";
	rename -uid "EB11914D-43C9-CFFB-3ED6-AB97111E47B8";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".kot[0]"  5;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "right_thumb03_ctrl_translateX";
	rename -uid "AB0A9FDE-4C29-868F-D543-D1BB9A85EE41";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "right_thumb03_ctrl_translateY";
	rename -uid "10663136-4B35-1DC7-8E38-14A1D6B06A28";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "right_thumb03_ctrl_translateZ";
	rename -uid "6456332E-40F5-DE7C-E9D4-4F9C04E26430";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "left_thumb02_ctrl_rotateX";
	rename -uid "B35D8D2C-4307-469A-165A-EBBDE00A7783";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "left_thumb02_ctrl_rotateY";
	rename -uid "443F9D91-4776-96A2-1F97-73B669B3A38C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "left_thumb02_ctrl_rotateZ";
	rename -uid "510C3136-444F-232B-2FF1-DEA01E1D20CE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 -4.1689338821438611;
	setAttr ".ktl[0]" no;
createNode animCurveTU -n "left_thumb02_ctrl_showScaleCtrl";
	rename -uid "1798189E-41F1-B1A9-8921-71B9A26B9365";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".kot[0]"  5;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "left_thumb02_ctrl_translateX";
	rename -uid "8046DE35-4A59-6DF5-0F1E-78BAC939FE22";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "left_thumb02_ctrl_translateY";
	rename -uid "1D6D0856-43F7-8419-121B-869BD8A79AD5";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "left_thumb02_ctrl_translateZ";
	rename -uid "15E7AB77-4CDB-0D26-6726-48A5E188AA05";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "right_thumb02_ctrl_rotateX";
	rename -uid "997CF3E4-4920-67D5-6A96-EAB973860A06";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "right_thumb02_ctrl_rotateY";
	rename -uid "2D570A55-4A05-5C05-073E-0AA5D2456A6B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "right_thumb02_ctrl_rotateZ";
	rename -uid "3A514F3E-44DC-400D-CB73-96832D32AD1A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 -6.7497105971795657;
	setAttr ".ktl[0]" no;
createNode animCurveTU -n "right_thumb02_ctrl_showScaleCtrl";
	rename -uid "2D90D826-403D-CB8C-D52A-43876E919D8B";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".kot[0]"  5;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "right_thumb02_ctrl_translateX";
	rename -uid "C380730B-455F-D3B4-2985-B1BE900151B5";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "right_thumb02_ctrl_translateY";
	rename -uid "05ECC0BD-474A-7497-4438-DCA978E82C61";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "right_thumb02_ctrl_translateZ";
	rename -uid "5B8C16F9-4253-644E-0DDD-4296BB2BC066";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "left_thumb01_ctrl_rotateX";
	rename -uid "36CF09D2-46F2-B995-4DC5-3B8D1C6B94F5";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 5.0425514483971297;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "left_thumb01_ctrl_rotateY";
	rename -uid "8F9E3026-4D19-3B7E-9CA5-CA92E4CF2727";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 10.557110488585087;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "left_thumb01_ctrl_rotateZ";
	rename -uid "F66D3636-400E-F7FC-9BE6-849A8BC7181A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 -5.4567368990290985;
	setAttr ".ktl[0]" no;
createNode animCurveTU -n "left_thumb01_ctrl_showScaleCtrl";
	rename -uid "929C4549-4674-5FE8-6573-65B24694967E";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".kot[0]"  5;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "left_thumb01_ctrl_translateX";
	rename -uid "B9B32448-4BEC-4A64-2DA9-0AAA9A81AE87";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "left_thumb01_ctrl_translateY";
	rename -uid "7CAE70DB-4E6C-ADAD-4F39-43A4BA3E7C53";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "left_thumb01_ctrl_translateZ";
	rename -uid "432BB3E5-43BC-5CF5-D380-92B7E477E67F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "right_thumb01_ctrl_rotateX";
	rename -uid "8392B963-4308-8D9D-B26D-06AD307F04E5";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 -2.6193443748043284;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "right_thumb01_ctrl_rotateY";
	rename -uid "53E2CF10-45AA-EEC9-F421-66992E3E96BD";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 -13.768161000404046;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "right_thumb01_ctrl_rotateZ";
	rename -uid "A25D1DFC-4363-1D89-6E99-FBA59D61B752";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 -8.6832331880795568;
	setAttr ".ktl[0]" no;
createNode animCurveTU -n "right_thumb01_ctrl_showScaleCtrl";
	rename -uid "76AE656C-4D15-865D-8ED5-6F89CB74E7C7";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".kot[0]"  5;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "right_thumb01_ctrl_translateX";
	rename -uid "28CBE8D7-4463-43EA-1D01-C9AB7A5715D4";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "right_thumb01_ctrl_translateY";
	rename -uid "48D1ECAE-4072-A2A3-BBB1-76A68907C1A0";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "right_thumb01_ctrl_translateZ";
	rename -uid "2A9298F0-4D72-A5E7-9477-D09D29E93181";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "left_index01_ctrl_rotateX";
	rename -uid "8C122099-4670-909F-80B5-08AEB2BD9BD3";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 1.5244943929428107;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "left_index01_ctrl_rotateY";
	rename -uid "B482F328-4E92-7EA2-CC57-D78F7A8EF831";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 12.232666922274857;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "left_index01_ctrl_rotateZ";
	rename -uid "4E3B49B3-47BA-7480-2814-A89FFA96B959";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 -5.3415777939427711;
	setAttr ".ktl[0]" no;
createNode animCurveTU -n "left_index01_ctrl_showScaleCtrl";
	rename -uid "C9DE7659-4820-6E0A-B635-858F81E91BD0";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".kot[0]"  5;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "left_index01_ctrl_translateX";
	rename -uid "20F05ECD-4171-FBA7-5549-F5B17B2EEDF5";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "left_index01_ctrl_translateY";
	rename -uid "0AB4B3F2-46FA-0E8D-90A5-7DB1BD9D1B4C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "left_index01_ctrl_translateZ";
	rename -uid "B49F842C-4CFB-F434-9E2F-509B40373166";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "right_index01_ctrl_rotateX";
	rename -uid "B07D787A-4D9F-CD7B-376B-2B8B83AE2D56";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 -0.34635022776634855;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "right_index01_ctrl_rotateY";
	rename -uid "5F23EB3C-431C-FA0B-E6D8-A49E01C6EBA9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 -12.309132534724416;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "right_index01_ctrl_rotateZ";
	rename -uid "4E8605A5-41CE-BC2A-C147-359137CDA1CC";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 -1.2217325451728447;
	setAttr ".ktl[0]" no;
createNode animCurveTU -n "right_index01_ctrl_showScaleCtrl";
	rename -uid "69844A3E-4438-E2D0-2804-C2BAD9958A16";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".kot[0]"  5;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "right_index01_ctrl_translateX";
	rename -uid "76FD36AA-4812-2658-B709-E5B9C793B219";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "right_index01_ctrl_translateY";
	rename -uid "91FE271D-4281-140E-D7AA-5B8635407C44";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "right_index01_ctrl_translateZ";
	rename -uid "58F63D51-43B0-706F-E8BD-F8B28F42D43C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "left_middle02_ctrl_rotateX";
	rename -uid "E405B2AA-47C1-A466-B203-75B2153D11FC";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "left_middle02_ctrl_rotateY";
	rename -uid "8CA1B4F3-4557-1282-3AEA-9DA46E4CDE8A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "left_middle02_ctrl_rotateZ";
	rename -uid "1EAB8133-487F-3B5F-36EE-11A28A8509BC";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 -24.367378505858301;
	setAttr ".ktl[0]" no;
createNode animCurveTU -n "left_middle02_ctrl_showScaleCtrl";
	rename -uid "8936D1E0-4594-4634-D8F4-6696D60152EE";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".kot[0]"  5;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "left_middle02_ctrl_translateX";
	rename -uid "AA9CA659-408E-954C-3099-A987F4CE1601";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "left_middle02_ctrl_translateY";
	rename -uid "A8A503E0-48DE-6DFF-8E66-D9A566D70F91";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "left_middle02_ctrl_translateZ";
	rename -uid "928E6C6F-4DA3-89FF-8A26-2495255A89CB";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "right_middle02_ctrl_rotateX";
	rename -uid "FED55CDD-4103-F3B8-1753-038682D9268D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "right_middle02_ctrl_rotateY";
	rename -uid "2FAEC251-42A0-A93C-4EA9-0AB09647625B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "right_middle02_ctrl_rotateZ";
	rename -uid "DBF4F4AF-49DA-BF92-C607-848A868AC1F3";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 -24.528141973979402;
	setAttr ".ktl[0]" no;
createNode animCurveTU -n "right_middle02_ctrl_showScaleCtrl";
	rename -uid "388DF3A3-4900-9D9A-4A12-6B8D63D2A7EC";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".kot[0]"  5;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "right_middle02_ctrl_translateX";
	rename -uid "230E2D82-4D42-E7FE-295E-949D290FE398";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "right_middle02_ctrl_translateY";
	rename -uid "9DA02F43-4B4A-B8E6-EC01-EFB7C6531448";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "right_middle02_ctrl_translateZ";
	rename -uid "3546C5E8-4B3E-E3C4-5C11-2CB1AFBC888F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "left_middle01_ctrl_rotateX";
	rename -uid "88357EFF-4246-6223-87D3-33A38106C3BA";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 -0.28379621088960333;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "left_middle01_ctrl_rotateY";
	rename -uid "4C82F559-4A22-F753-348A-EABDE84D18A6";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 1.9086460773851393;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "left_middle01_ctrl_rotateZ";
	rename -uid "F5CC43A0-43A0-4298-8AE4-04B37D91C4A0";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 -14.829029772795181;
	setAttr ".ktl[0]" no;
createNode animCurveTU -n "left_middle01_ctrl_showScaleCtrl";
	rename -uid "3F545806-4473-6320-F81C-23B4768C8B37";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".kot[0]"  5;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "left_middle01_ctrl_translateX";
	rename -uid "06042B58-4A43-534A-8D0E-1081902438F7";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "left_middle01_ctrl_translateY";
	rename -uid "EBD58737-4988-78BD-D73F-4E83EFE5D628";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "left_middle01_ctrl_translateZ";
	rename -uid "FAA5264D-4A6A-B761-5380-A18158FD4A72";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "right_middle01_ctrl_rotateX";
	rename -uid "2462E590-4314-B2B2-2BC8-0DB805A63379";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0.34903355285560306;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "right_middle01_ctrl_rotateY";
	rename -uid "71D3F0D2-453D-F66D-F7DD-DD858E5F65BD";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 -2.0383192179114107;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "right_middle01_ctrl_rotateZ";
	rename -uid "3B1CF926-43C9-21F2-5862-CEB89003253E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 -16.154390840534301;
	setAttr ".ktl[0]" no;
createNode animCurveTU -n "right_middle01_ctrl_showScaleCtrl";
	rename -uid "93C39863-494D-5F89-3DF3-B393DA6CAD29";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".kot[0]"  5;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "right_middle01_ctrl_translateX";
	rename -uid "45D527EA-43E0-53AA-D728-C18DECB626B9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "right_middle01_ctrl_translateY";
	rename -uid "9351FF9B-4203-3EBD-CEBF-51998C8EE10E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "right_middle01_ctrl_translateZ";
	rename -uid "61D32391-4325-2BE4-B11A-2C9DB74D821B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "left_index03_ctrl_rotateX";
	rename -uid "A56CAE72-459D-8961-30B1-39A30228280B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "left_index03_ctrl_rotateY";
	rename -uid "38736A39-464F-07EE-12C7-A386F1146B2A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "left_index03_ctrl_rotateZ";
	rename -uid "B772BD82-4CD5-90B3-4E41-71893965091C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 -11.874379058954798;
	setAttr ".ktl[0]" no;
createNode animCurveTU -n "left_index03_ctrl_showScaleCtrl";
	rename -uid "2F343AAE-4E0B-83D5-3546-B9A1B00E08DE";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".kot[0]"  5;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "left_index03_ctrl_translateX";
	rename -uid "71FB306C-4E8E-F890-154E-BA8DC50968DD";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "left_index03_ctrl_translateY";
	rename -uid "EB687F4D-4B87-751C-3392-E88C85E96C38";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "left_index03_ctrl_translateZ";
	rename -uid "B4D5E0CC-455C-E143-6B46-F794EBBF0DB9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "right_index03_ctrl_rotateX";
	rename -uid "08B26C81-4AD9-7A8C-4BF4-D296E55D2096";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "right_index03_ctrl_rotateY";
	rename -uid "0FE0EC8C-4794-968B-3F99-BE9B3CA402F6";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "right_index03_ctrl_rotateZ";
	rename -uid "1AB6E17B-4522-3A31-C2DC-41B7212BCC83";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 -9.2424020861421585;
	setAttr ".ktl[0]" no;
createNode animCurveTU -n "right_index03_ctrl_showScaleCtrl";
	rename -uid "0D31440D-4B31-DE25-2980-C9A72B567A7C";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".kot[0]"  5;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "right_index03_ctrl_translateX";
	rename -uid "5A0AAEF7-4792-A05B-CD97-D7B1EF0EB052";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "right_index03_ctrl_translateY";
	rename -uid "CBFA1F37-4C68-7412-CAFA-E9816317BDC1";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "right_index03_ctrl_translateZ";
	rename -uid "5A81D62B-4E86-6CE6-999B-809A55BA8497";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "left_index02_ctrl_rotateX";
	rename -uid "21FCFACF-4127-1CA3-DB3E-38B506F4EE75";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "left_index02_ctrl_rotateY";
	rename -uid "697E1D3C-4C9D-6657-8D57-94B65D018CB4";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "left_index02_ctrl_rotateZ";
	rename -uid "21857BBB-4363-35B1-742F-7BA9C7976E2D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 -12.522461096603511;
	setAttr ".ktl[0]" no;
createNode animCurveTU -n "left_index02_ctrl_showScaleCtrl";
	rename -uid "F2929E0A-4DF0-192C-A156-E8BCD1DC3377";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".kot[0]"  5;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "left_index02_ctrl_translateX";
	rename -uid "EEAC8C3F-40FD-1FF3-2751-F08116810105";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "left_index02_ctrl_translateY";
	rename -uid "37904BB1-4521-C7E6-C7E6-1A9EB0CE27F8";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "left_index02_ctrl_translateZ";
	rename -uid "7F5713F3-4DF4-1BA0-95DA-96998F8525BB";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "right_index02_ctrl_rotateX";
	rename -uid "49B42781-4649-9D0B-1989-9C93B1268B18";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "right_index02_ctrl_rotateY";
	rename -uid "561171C8-4758-41FF-81EA-5BAD1EAEFE34";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "right_index02_ctrl_rotateZ";
	rename -uid "FB42C061-4916-2E8C-9D36-35AFF92A4162";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 -9.7460374861221055;
	setAttr ".ktl[0]" no;
createNode animCurveTU -n "right_index02_ctrl_showScaleCtrl";
	rename -uid "357D4EB3-4A69-F963-263E-F09196707B76";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".kot[0]"  5;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "right_index02_ctrl_translateX";
	rename -uid "7E6D83B7-46EB-1AC8-4F9B-68948A09FF46";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "right_index02_ctrl_translateY";
	rename -uid "4DD103E5-49D3-EB2B-3D8D-7A944EE560FA";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "right_index02_ctrl_translateZ";
	rename -uid "AF2F7BF5-443E-FC68-8C12-A4A1DADCFA0D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "left_ring03_ctrl_rotateX";
	rename -uid "FB9CCD79-42BA-75DF-14BC-54AB3846C2CE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "left_ring03_ctrl_rotateY";
	rename -uid "ED96D48E-4C87-2FAE-E9D6-DC9B065D82A0";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "left_ring03_ctrl_rotateZ";
	rename -uid "FAE84C74-45B5-5C88-45A5-FEBDC95C6929";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 -25.917581296695271;
	setAttr ".ktl[0]" no;
createNode animCurveTU -n "left_ring03_ctrl_showScaleCtrl";
	rename -uid "4F012C42-4F80-A1A4-EDD0-E0A8F0F30700";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".kot[0]"  5;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "left_ring03_ctrl_translateX";
	rename -uid "8185F821-485D-43D7-C0A3-9F81547F45BF";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "left_ring03_ctrl_translateY";
	rename -uid "D511E294-478A-3654-F285-DCBA8A39739C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "left_ring03_ctrl_translateZ";
	rename -uid "2ADB4B87-4FF5-D69A-C46F-339F4044319D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "right_ring03_ctrl_rotateX";
	rename -uid "CE96590D-4E5C-A0CE-0ED1-B8847F7D51A9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "right_ring03_ctrl_rotateY";
	rename -uid "836B9A66-4A15-C531-C4D6-E4B130FC77F8";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "right_ring03_ctrl_rotateZ";
	rename -uid "BB041267-4CAE-6286-F92A-FDB1D11252C9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 -30.386396341920268;
	setAttr ".ktl[0]" no;
createNode animCurveTU -n "right_ring03_ctrl_showScaleCtrl";
	rename -uid "0AAB3C0F-4227-9700-CE6B-33BA9DA851DE";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".kot[0]"  5;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "right_ring03_ctrl_translateX";
	rename -uid "468956BD-4EA2-AF7C-78E9-0F90F57F63BB";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "right_ring03_ctrl_translateY";
	rename -uid "599437E3-4CD5-3D86-FCF0-2286DCFEDFBE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "right_ring03_ctrl_translateZ";
	rename -uid "F757FF4C-4725-B11B-979B-208CD180D156";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "left_ring02_ctrl_rotateX";
	rename -uid "404A318B-4F59-30B7-FCE0-9A814EAC961E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "left_ring02_ctrl_rotateY";
	rename -uid "5EAE079B-4733-9BB3-6952-65BC9D3F1C38";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "left_ring02_ctrl_rotateZ";
	rename -uid "DC7A7C1C-4027-88E8-4989-BF9B3F4D1535";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 -29.822207496629829;
	setAttr ".ktl[0]" no;
createNode animCurveTU -n "left_ring02_ctrl_showScaleCtrl";
	rename -uid "42D965F2-42CA-1ADA-116E-3294D3F0909B";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".kot[0]"  5;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "left_ring02_ctrl_translateX";
	rename -uid "3FE33653-4403-8DA3-DED6-5A98F83536D1";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "left_ring02_ctrl_translateY";
	rename -uid "7C76D078-4E1C-06BB-4843-088CF29E6929";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "left_ring02_ctrl_translateZ";
	rename -uid "A63E1BD5-4824-00A0-71A0-DD8939CBE906";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "right_ring02_ctrl_rotateX";
	rename -uid "D43D5E26-4E99-80D4-79B4-EFA86A0C3364";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "right_ring02_ctrl_rotateY";
	rename -uid "EB51CFD7-4B1A-240D-3923-95AF074EEF5F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "right_ring02_ctrl_rotateZ";
	rename -uid "BF98020E-48E8-7499-1474-BD91F8260F3B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 -34.157666149507428;
	setAttr ".ktl[0]" no;
createNode animCurveTU -n "right_ring02_ctrl_showScaleCtrl";
	rename -uid "12067889-48D2-0FBA-C12F-C6ABE4EB1A11";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".kot[0]"  5;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "right_ring02_ctrl_translateX";
	rename -uid "B4FB3AAA-4F1D-F2DB-290E-75ADD79C2D62";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "right_ring02_ctrl_translateY";
	rename -uid "D7802E26-4758-748C-A16D-83B241CAC5A3";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "right_ring02_ctrl_translateZ";
	rename -uid "709DA1B2-4FAC-0F0F-19CE-BF82322DAC00";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "left_ring01_ctrl_rotateX";
	rename -uid "49FC0B81-4122-6356-B365-C9823A7AA73E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 -14.16457628841408;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "left_ring01_ctrl_rotateY";
	rename -uid "E91C8B05-4AFF-C739-C539-BEBBDE914A68";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 -6.2202114462299933;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "left_ring01_ctrl_rotateZ";
	rename -uid "B19735C2-4CB4-F37B-A813-64824EF6461C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 -16.252826251874435;
	setAttr ".ktl[0]" no;
createNode animCurveTU -n "left_ring01_ctrl_showScaleCtrl";
	rename -uid "BFCCB577-4C35-64A4-ECD0-8C968BE19A21";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".kot[0]"  5;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "left_ring01_ctrl_translateX";
	rename -uid "EA7B4429-4AC4-6C23-4545-878B70BCCE16";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "left_ring01_ctrl_translateY";
	rename -uid "01C3ADAB-465E-B88C-FA61-0B935E025F3E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "left_ring01_ctrl_translateZ";
	rename -uid "66A32E44-4134-C0FD-690B-F4B990E88A78";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "right_ring01_ctrl_rotateX";
	rename -uid "6CAE1D36-4002-8F8D-98C4-1089818BBD52";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 14.1264213854634;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "right_ring01_ctrl_rotateY";
	rename -uid "CF0C4E64-4D45-C3FE-3063-03A148C2D030";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 6.4546122806491404;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "right_ring01_ctrl_rotateZ";
	rename -uid "EDA287E5-46AC-E2A1-25E4-76A24523E9B7";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 -20.720903610192977;
	setAttr ".ktl[0]" no;
createNode animCurveTU -n "right_ring01_ctrl_showScaleCtrl";
	rename -uid "2513CB14-47C5-828E-7298-B2BA47343C87";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".kot[0]"  5;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "right_ring01_ctrl_translateX";
	rename -uid "3064FBC9-4B8C-3E8C-8F29-35A37C34F3BA";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "right_ring01_ctrl_translateY";
	rename -uid "7F7CC927-4051-A557-5BD9-7A82F30B55BD";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "right_ring01_ctrl_translateZ";
	rename -uid "324FF996-401A-118E-170D-8EB6C045F4D7";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "left_middle03_ctrl_rotateX";
	rename -uid "83044F93-48F9-6799-19C9-3EB438C36C3A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "left_middle03_ctrl_rotateY";
	rename -uid "39A6FD7A-464A-E5BC-92FC-15AB18FAA9D6";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "left_middle03_ctrl_rotateZ";
	rename -uid "78689E6F-49A6-1A56-9343-8CA14268A83D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 -26.625409641863381;
	setAttr ".ktl[0]" no;
createNode animCurveTU -n "left_middle03_ctrl_showScaleCtrl";
	rename -uid "85B508DC-48FF-B8FD-08C0-59B331532EBF";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".kot[0]"  5;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "left_middle03_ctrl_translateX";
	rename -uid "54F96A08-4D86-8251-A25D-DCA954BF1873";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "left_middle03_ctrl_translateY";
	rename -uid "FE599F8B-4F2C-E609-37D2-C4BD50FD033E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "left_middle03_ctrl_translateZ";
	rename -uid "158E8F69-42B7-0CAB-D370-30B681A22581";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "right_middle03_ctrl_rotateX";
	rename -uid "0DD881E5-4F8F-2C4C-ACDE-4E86348C0C8D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "right_middle03_ctrl_rotateY";
	rename -uid "75DF42C3-49E1-41CB-EA6F-D8B15BA52710";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "right_middle03_ctrl_rotateZ";
	rename -uid "CA59AA2D-4162-9A4C-B5FC-A0B653E02877";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 -26.306307517223956;
	setAttr ".ktl[0]" no;
createNode animCurveTU -n "right_middle03_ctrl_showScaleCtrl";
	rename -uid "93971C05-48FA-4A81-53FA-7885A2668801";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".kot[0]"  5;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "right_middle03_ctrl_translateX";
	rename -uid "1244C353-4B96-824D-9D12-C3AED16856FC";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "right_middle03_ctrl_translateY";
	rename -uid "EA172AD1-4F50-ECC7-64E7-D1A81D9D5D3E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "right_middle03_ctrl_translateZ";
	rename -uid "9AAA8103-4E90-B167-F350-968EA492942B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "left_pinky03_ctrl_rotateX";
	rename -uid "0B76CC34-475A-F137-1C85-B89BB4186837";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "left_pinky03_ctrl_rotateY";
	rename -uid "107EF200-4302-621D-825B-A5A42C88CA2A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "left_pinky03_ctrl_rotateZ";
	rename -uid "F4D5F778-46F2-A3CD-8AD8-15B8F1C8BC98";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 -33.563734690634668;
	setAttr ".ktl[0]" no;
createNode animCurveTU -n "left_pinky03_ctrl_showScaleCtrl";
	rename -uid "6B87527C-480C-41C6-9A92-3D9ACEDE8BDF";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".kot[0]"  5;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "left_pinky03_ctrl_translateX";
	rename -uid "AED24902-43DA-DAB2-D6BC-4EA87A747230";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "left_pinky03_ctrl_translateY";
	rename -uid "BF846EA0-4FC4-AF0D-9594-4A89C6B0A4CD";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "left_pinky03_ctrl_translateZ";
	rename -uid "3910F170-48E5-E5B8-4C7F-50A0BED66713";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "right_pinky03_ctrl_rotateX";
	rename -uid "DE443987-428D-46B4-2A8E-5FB0EE4DD6BB";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "right_pinky03_ctrl_rotateY";
	rename -uid "D49622F6-4527-D273-D53E-B6B96DF3D606";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "right_pinky03_ctrl_rotateZ";
	rename -uid "9B1A4D6E-425B-6583-4943-7C886F29CE1B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 -34.221041447789055;
	setAttr ".ktl[0]" no;
createNode animCurveTU -n "right_pinky03_ctrl_showScaleCtrl";
	rename -uid "47B1B159-47A5-6029-21D5-019A8D83B612";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".kot[0]"  5;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "right_pinky03_ctrl_translateX";
	rename -uid "00484A70-4626-0605-1CB2-31869AA48A1E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "right_pinky03_ctrl_translateY";
	rename -uid "FDABD417-4B49-107F-99C4-5FAFF646633A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "right_pinky03_ctrl_translateZ";
	rename -uid "698596FC-4F93-F4E8-CF04-0EAF8CAB0F60";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "left_pinky02_ctrl_rotateX";
	rename -uid "F16EC0DD-4485-294A-0CF1-1F86A2D63A24";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "left_pinky02_ctrl_rotateY";
	rename -uid "8C7783C6-496E-144C-73D7-D88FF73508A5";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "left_pinky02_ctrl_rotateZ";
	rename -uid "2A1BCF1C-487D-A5A0-E236-6E8648742479";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 -28.744960352937618;
	setAttr ".ktl[0]" no;
createNode animCurveTU -n "left_pinky02_ctrl_showScaleCtrl";
	rename -uid "1597CE32-43A6-43F7-3F1F-C3B0407CA2C3";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".kot[0]"  5;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "left_pinky02_ctrl_translateX";
	rename -uid "6E80C07F-4E80-9F52-7F9D-5BAB81B3D608";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "left_pinky02_ctrl_translateY";
	rename -uid "C008CE89-4CD1-78CE-8CB9-A4B4E51F117E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "left_pinky02_ctrl_translateZ";
	rename -uid "D6F31484-44AE-4FE1-1266-5587AFCABE12";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "right_pinky02_ctrl_rotateX";
	rename -uid "D4D4121A-4D09-04FE-2C2F-188C93367AAB";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "right_pinky02_ctrl_rotateY";
	rename -uid "0A621E36-4A82-670B-011A-3884393B09B0";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "right_pinky02_ctrl_rotateZ";
	rename -uid "9869C364-4672-0137-ACD0-B7980E7D9DBB";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 -30.426329164448394;
	setAttr ".ktl[0]" no;
createNode animCurveTU -n "right_pinky02_ctrl_showScaleCtrl";
	rename -uid "C81E2D7E-473E-B1E2-8F89-5996447A5E2B";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".kot[0]"  5;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "right_pinky02_ctrl_translateX";
	rename -uid "D1B4ED04-46AF-4D2F-0F22-62B2DA22F578";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "right_pinky02_ctrl_translateY";
	rename -uid "B702047F-46AE-686B-8DD5-ADB8F6EA79A3";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "right_pinky02_ctrl_translateZ";
	rename -uid "28B7CA75-4FAA-FE22-EF19-7F91B4857931";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "left_pinky01_ctrl_rotateX";
	rename -uid "840CB997-4A63-AF31-886B-CF805378CD99";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 -16.172703846449995;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "left_pinky01_ctrl_rotateY";
	rename -uid "6E4EF4A4-4439-131D-DBB9-C5B5C994C8BE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 -12.84972093363862;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "left_pinky01_ctrl_rotateZ";
	rename -uid "B024D96F-41BF-7A34-844A-6FADD1E50532";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 -18.708602232219462;
	setAttr ".ktl[0]" no;
createNode animCurveTU -n "left_pinky01_ctrl_showScaleCtrl";
	rename -uid "F5C4C4FD-429A-4678-33A0-16A20DF1F66A";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".kot[0]"  5;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "left_pinky01_ctrl_translateX";
	rename -uid "0B46394E-48FF-1F69-5BE0-E2830BDE0602";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "left_pinky01_ctrl_translateY";
	rename -uid "46014D2A-48C4-3BB7-6E5D-C7BEBA23027B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "left_pinky01_ctrl_translateZ";
	rename -uid "4F9F5FDF-4A00-40F5-8D2C-6CA00CDEC868";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "right_pinky01_ctrl_rotateX";
	rename -uid "BD154CB1-4CA2-853C-8E12-2985362C3687";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 16.077705724447743;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "right_pinky01_ctrl_rotateY";
	rename -uid "3CC7D736-4F77-7798-CA44-8C9E2AF3CFEC";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 13.75328917400919;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "right_pinky01_ctrl_rotateZ";
	rename -uid "95A848D0-4DEE-31A9-FDC0-818B101B4BA1";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 -25.981878639010436;
	setAttr ".ktl[0]" no;
createNode animCurveTU -n "right_pinky01_ctrl_showScaleCtrl";
	rename -uid "FBF5803B-436E-4836-46C7-73AC47C235D8";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".kot[0]"  5;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "right_pinky01_ctrl_translateX";
	rename -uid "90FEC776-4035-BEEC-B603-0D97184AFCB9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "right_pinky01_ctrl_translateY";
	rename -uid "F5B28C88-4934-3E4F-4E65-FBADDE378532";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTL -n "right_pinky01_ctrl_translateZ";
	rename -uid "A1775094-4DAA-2CE9-E1E9-32B6A50D2A67";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  8 0;
	setAttr ".ktl[0]" no;
createNode animCurveTA -n "left_clavicle_ctrl_rotateX";
	rename -uid "5A129C28-4C60-2A81-2C17-01BD07DBF74C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0.054152574652982573 0 10.942591749576311
		 1 10.513792709661089 2 10.224990189853983 3 10.450651162873633 4 10.578185673118849
		 5 10.069602523159725 6 9.3623010075086874 7 8.6170782550498046 8 8.1382074534530169
		 9 7.6870147456377795 10 7.1253350291401665 11 6.8134772227678413 12 7.2282454395429543
		 13 8.3110813167474404 14 9.4892241080974404 15 10.364849049704322 16 10.426535470238733
		 17 8.9634804779949651 18 8.375724974918473 19 8.3952014902458014 20 7.7484538780012153
		 21 8.0646220424987209 22 9.6136238119818813 23 11.581925189196568 24 14.070282569586732
		 25 15.553600900200621 26 14.62787822749867 27 12.559029692410414 28 10.942632238803753;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "left_clavicle_ctrl_rotateY";
	rename -uid "9914F945-4647-E476-4CEF-989B0E907CAF";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0.3772277268011312 0 14.151463876015834
		 1 11.01750934506695 2 8.3291310796251707 3 7.0927299919484224 4 6.041367327173564
		 5 4.0992583995628165 6 1.7746996985260421 7 -0.99378798314606875 8 -3.6096935473939187
		 9 -5.925374908693394 10 -7.9087107023589658 11 -8.3003774807995896 12 -6.0673980958421208
		 13 -2.3560832296205088 14 0.8624158137557465 15 3.0886017803259436 16 3.804878776914514
		 17 0.40776735765353006 18 -2.4031130664860916 19 1.3105020865207764 20 7.0410388690919072
		 21 12.173777288249035 22 16.807791080903517 23 21.02225235773745 24 24.625690145992042
		 25 25.834272560599825 26 23.501575666344241 27 18.882852118582811 28 14.151517620097492;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "left_clavicle_ctrl_rotateZ";
	rename -uid "F575DE9D-4A35-B033-15F9-A4B560B34AE3";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 16.33874770351991 0 9.2484202574629784
		 1 9.4315250316714163 2 10.152675942921137 3 12.805620419374392 4 15.1959276265339
		 5 15.257187645218872 6 14.13185431790439 7 11.517965707899471 8 9.6096402573223667
		 9 10.405142796063584 10 12.227220293545384 11 14.207326063750946 12 16.305757144746895
		 13 18.571135803275759 14 20.19835174012594 15 20.799533111005346 16 19.068171394759521
		 17 12.888792988980059 18 5.6513261987859504 19 -0.70697718796422726 20 -4.4016835015181055
		 21 -1.3495250657665749 22 3.9517785678213442 23 8.376279554063192 24 12.837492503610347
		 25 15.404654933349281 26 14.547541223156271 27 11.786076252959425 28 9.2484136032444262;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "right_clavicle_ctrl_rotateX";
	rename -uid "CBDC6D2F-4C1C-334C-7FBD-CE87FE86E90A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0.054159360404665943 0 9.489231866064948
		 1 10.242356180272497 2 10.426390573888755 3 8.9634550015177332 4 8.3756654747152144
		 5 8.3952135986605096 6 7.7484525182075581 7 8.0646109591751731 8 9.6136589146943798
		 9 11.581934731692648 10 14.070307675106946 11 15.55350984248798 12 14.510684727726908
		 13 12.372283231930728 14 10.942505427494886 15 10.411731980605639 16 10.225019998039592
		 17 10.450631124918013 18 10.578140658082933 19 10.069514710028457 20 9.3622413046082347
		 21 8.6169532802009101 22 8.1381647574422544 23 7.6869400379558792 24 7.1251445225139891
		 25 6.8134532481426975 26 7.2032810546986692 27 8.2211490275214345 28 9.4893371828717417;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "right_clavicle_ctrl_rotateY";
	rename -uid "0929C2CE-408F-865E-53EA-298E80190DA3";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0.37723085200271905 0 0.86232145572298891
		 1 2.8713488496555555 2 3.8049601469088867 3 0.40777788173255036 4 -2.4030854984533887
		 5 1.310517194117593 6 7.0410500488777483 7 12.173783736366842 8 16.807820856723207
		 9 21.022256466176572 10 24.625691574619474 11 25.83424236436807 12 23.420334839908747
		 13 18.703889872861122 14 14.151409029593344 15 10.853902624412688 16 8.3291748814118716
		 17 7.092727658068152 18 6.0413903781327383 19 4.0993061652727212 20 1.7747246050875194
		 21 -0.99375640113378849 22 -3.60964841715036 23 -5.9253205268077389 24 -7.9086439273719638
		 25 -8.3004378311532232 26 -6.2120546608410123 27 -2.6337629126923692 28 0.86222013787599761;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "right_clavicle_ctrl_rotateZ";
	rename -uid "9988C56A-4279-D1C0-0B9B-B88349203EE9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 16.338746991380074 0 20.198322289583523
		 1 20.399757070122735 2 19.068161050483585 3 12.888763255281976 4 5.6512909444131942
		 5 -0.70700727231947036 6 -4.4017256614195714 7 -1.3495497590094736 8 3.9517473610681928
		 9 8.3762464042122495 10 12.837479521668138 11 15.404670627610368 12 14.32758381210734
		 13 11.36596446813005 14 9.2483691045221867 15 9.0950778827584955 16 10.15268031110511
		 17 12.8055925090407 18 15.195882459853301 19 15.257159357935686 20 14.131807686249598
		 21 11.517933715798724 22 9.6096106949152222 23 10.405098632550226 24 12.227207933427588
		 25 14.20736178213394 26 16.074752076675242 27 18.106592827474898 28 20.198329415409585;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "waist_ctrl_rotateX";
	rename -uid "E71D76C6-46D9-0F4C-4592-D68CD62EC854";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0 0 19.76183825336031 1 19.889134712943292
		 2 19.908782199589091 3 19.518036099657301 4 19.068021673525081 5 19.013340896937077
		 6 19.091362169722501 7 19.125160074584439 8 19.1827957842568 9 19.262720421989119
		 10 19.351099452347754 11 19.448829666721437 12 19.557385662136195 13 19.666354357042938
		 14 19.761834372171815 15 19.888643968464418 16 19.908805882215809 17 19.518047546173953
		 18 19.068058567071301 19 19.013346430658896 20 19.091377374220439 21 19.12518643592686
		 22 19.182812601740416 23 19.262742696213152 24 19.351102285885105 25 19.448843851245627
		 26 19.557817510952475 27 19.667076531140111 28 19.76183825336031;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "waist_ctrl_rotateY";
	rename -uid "1A2B7921-4AF6-EB0D-804B-F799D59F54FF";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0 0 2.3682227323378027 1 4.5001190864521847
		 2 6.4021675933715905 3 7.7561749335619279 4 8.5473325700820091 5 8.6097306671278773
		 6 8.2698307291665625 7 7.8608975067504332 8 7.1438512544912216 9 6.1041822893818845
		 10 4.8845716901152194 11 3.4328850526160646 12 1.6616525609846664 13 -0.34211592718980094
		 14 -2.3683864064741469 15 -4.4880265600191009 16 -6.4023223759978691 17 -7.756361605373395
		 18 -8.5474981977752496 19 -8.6098991490084664 20 -8.2699850070939753 21 -7.8610624700811034
		 22 -7.1440125509039492 23 -6.1043604792755009 24 -4.8847223635248715 25 -3.4330553624936364
		 26 -1.6545632210295356 27 0.35646303810145008 28 2.3682227323378031;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "waist_ctrl_rotateZ";
	rename -uid "B76A71C9-4422-E263-048F-CEBAEBA0EA06";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0 0 2.4902738876379074 1 2.4291197846407582
		 2 1.6711497528228494 3 -1.6048676754561104 4 -4.783918563764213 5 -5.1745133683571263
		 6 -4.7232490809642682 7 -4.634132729790287 8 -4.4787189832342476 9 -4.2550827927269097
		 10 -3.9951874154353493 11 -3.6889120045801658 12 -3.3191577494182458 13 -2.9052228665456252
		 14 -2.4903353537823039 15 -2.4316595146392497 16 -1.6712190554468951 17 1.6047995421615768
		 18 4.7838391304169132 19 5.1744406556533686 20 4.7231880267575468 21 4.6340685557074845
		 22 4.4786408695359325 23 4.25501676774513 24 3.9951246375919234 25 3.6888415743668257
		 26 3.3175920423580876 27 2.9021790482617891 28 2.4902738876379074;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTL -n "waist_ctrl_translateX";
	rename -uid "6ACF86FB-4C1D-E65F-1C81-8C8574D4DC37";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0.85132813453674316 0 0.045044094324111938
		 1 0.17814995348453522 2 0.30761495232582092 3 0.41146594285964966 4 0.51082587242126465
		 5 0.54372847080230713 6 0.52861970663070679 7 0.45911699533462524 8 0.36621823906898499
		 9 0.33539468050003052 10 0.30938592553138733 11 0.27922144532203674 12 0.21630802750587463
		 13 0.10532612353563309 14 -0.045039378106594086 15 -0.17580462992191315 16 -0.30654370784759521
		 17 -0.42671036720275879 18 -0.51082158088684082 19 -0.55835521221160889 20 -0.52861213684082031
		 21 -0.45910060405731201 22 -0.36621010303497314 23 -0.33213579654693604 24 -0.30170705914497375
		 25 -0.27921786904335022 26 -0.21961452066898346 27 -0.10236965864896774 28 0.04504326730966568;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTL -n "waist_ctrl_translateY";
	rename -uid "47EF9E04-414C-66AD-330E-1A817EFFB0EF";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 -0.11885833740234375 0 1.0310134887695312
		 1 -5.1756134033203125 2 -9.8347244262695312 3 -10.167572021484375 4 -8.5102615356445312
		 5 -6.2473983764648438 6 -3.4160919189453125 7 -0.24607086181640625 8 2.3685760498046875
		 9 3.6776809692382812 10 4.4029083251953125 11 4.502349853515625 12 4.1361465454101562
		 13 3.14630126953125 14 1.0310134887695312 15 -4.544097900390625 16 -9.851898193359375
		 17 -10.177986145019531 18 -8.5102615356445312 19 -6.245208740234375 20 -3.4160842895507812
		 21 -0.24614715576171875 22 2.3685684204101562 23 3.6740570068359375 24 4.39508056640625
		 25 4.50238037109375 26 3.7581863403320312 27 2.3915023803710938 28 1.0309982299804688;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTL -n "waist_ctrl_translateZ";
	rename -uid "DBAD20A2-46FC-059D-FAF8-56B5D33D426F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 2.0432047843933105 0 3.4291455745697021
		 1 3.4771559238433838 2 3.4392907619476318 3 3.4128894805908203 4 3.3688762187957764
		 5 3.3651125431060791 6 3.3265211582183838 7 3.2923946380615234 8 3.1971414089202881
		 9 3.0942456722259521 10 2.9906861782073975 11 2.9867918491363525 12 3.1451566219329834
		 13 3.3431265354156494 14 3.4291448593139648 15 3.5206072330474854 16 3.4933974742889404
		 17 3.4435257911682129 18 3.3688738346099854 19 3.3549814224243164 20 3.3265211582183838
		 21 3.292710542678833 22 3.1971313953399658 23 3.1112813949584961 24 3.0329186916351318
		 25 2.9867887496948242 26 3.1236803531646729 27 3.3052041530609131 28 3.4291436672210693;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "spine01_ctrl_rotateX";
	rename -uid "44F39D09-4D14-3D26-7150-68BDE2A95280";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0 0 1.2067233146915404 1 1.2763437396394561
		 2 1.3487855358242666 3 1.4323802944645314 4 1.5468677727133615 5 1.5993210122923025
		 6 1.5808364016370478 7 1.470746690509285 8 1.3808689493931894 9 1.4390326334781052
		 10 1.5524750460948757 11 1.6008461087444443 12 1.4891469743972698 13 1.3180999426625046
		 14 1.2067281332993915 15 1.243734562436962 16 1.3487946184924784 17 1.4324644725137825
		 18 1.5468829671284356 19 1.599312596929519 20 1.5808195440450858 21 1.470724533003249
		 22 1.3808825799655289 23 1.4390863068037969 24 1.552489505849435 25 1.6008115329340389
		 26 1.5115514652828745 27 1.3554258414418792 28 1.2067229073824621;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "spine01_ctrl_rotateY";
	rename -uid "F20E9BC4-4709-9EF5-D4BA-47B8580B9D62";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0 0 1.725404321945663 1 1.1198670765227936
		 2 0.48716608999977024 3 -0.25746306426849896 4 -0.93645912055600888 5 -1.414410103185882
		 6 -1.741362595886774 7 -1.8488628602721491 8 -1.8459340207531283 9 -1.8428655451275449
		 10 -1.810379964676941 11 -1.7888802651576199 12 -1.8553608049105736 13 -1.8921871433646953
		 14 -1.7254105361577192 15 -1.1997224750698587 16 -0.48717297669449694 17 0.25745724664868297
		 18 0.93646687039943199 19 1.414419405850674 20 1.7413607747897577 21 1.8488763260417533
		 22 1.8459473273235931 23 1.8428805072533674 24 1.8103862852140526 25 1.7888911995822028
		 26 1.8003796865757811 27 1.7894632458594619 28 1.7253982480810808;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "spine01_ctrl_rotateZ";
	rename -uid "6D0EFB2B-42C6-628C-F3DC-8EA8186D23E7";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0 0 -0.25003761163924337 1 -0.13152271040196284
		 2 0.030528941661476613 3 0.38637565098807325 4 0.7227729913866825 5 0.78722498369890903
		 6 0.85403912361112444 7 1.1800614750689193 8 1.4657720960530265 9 1.5631240105559667
		 10 1.5845309702145329 11 1.4785869056770928 12 1.1543539626927075 13 0.6733644156708023
		 14 0.25002648264544014 15 0.091270453434836057 16 -0.03053487468580816 17 -0.38638814630527885
		 18 -0.72277900485666868 19 -0.78724492602079987 20 -0.8540574892041215 21 -1.1800730412928866
		 22 -1.4657750479812894 23 -1.5631327533997972 24 -1.5845426535770042 25 -1.4785862625039685
		 26 -1.1734705375470269 27 -0.71798520032035884 28 -0.25003452310590846;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "spine02_ctrl_rotateX";
	rename -uid "41B53474-4933-B13B-5D8D-26B276A34D2E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0 0 2.4225973137075907 1 2.5571162299045449
		 2 2.699158023907676 3 2.862938086714204 4 3.085318425859966 5 3.1892140577038122
		 6 3.1515515069921052 7 2.919019346440427 8 2.7268775292649479 9 2.8390123283087041
		 10 3.065183113348763 11 3.1667772757914925 12 2.9569069747411585 13 2.6335469606583781
		 14 2.4226053429004346 15 2.4935653624882761 16 2.6991373585569223 17 2.862924982820283
		 18 3.0853089889960472 19 3.1892065300334211 20 3.1515571066013006 21 2.9190055189273396
		 22 2.72686288814011 23 2.8390035438663332 24 3.065183314743908 25 3.1667586857735177
		 26 3.0008827870745565 27 2.7056858104940451 28 2.4225818740534577;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "spine02_ctrl_rotateY";
	rename -uid "1611A690-45D6-2A84-A567-658FB5C185F8";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0 0 3.4864799175383121 1 2.2533626675212894
		 2 0.9530956424697572 3 -0.62870702272740986 4 -2.0756837951112157 5 -3.0404286364664985
		 6 -3.7069218643429918 7 -4.0196431513242192 8 -4.100870939510286 9 -4.1261375904701554
		 10 -4.071115687479546 11 -3.9965266301227516 12 -4.0247804155855595 13 -3.9466785248987675
		 14 -3.486473418639068 15 -2.3988602613220378 16 -0.95307442348602667 17 0.62871528579501557
		 18 2.0756933955855139 19 3.0404154359541109 20 3.7069279275868894 21 4.0196464887933621
		 22 4.1008841643309975 23 4.1261290254537197 24 4.0711268788121204 25 3.9965206318961979
		 26 3.9224248463381133 27 3.757712603617795 28 3.4864567712872616;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "spine02_ctrl_rotateZ";
	rename -uid "E503772F-48CA-6747-0EE1-B1A093DDE835";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0 0 0.035744525071235086 1 0.085254404041543899
		 2 0.21105771513432722 3 0.6833187634470681 4 1.1349763642258719 5 1.1116224447150092
		 6 1.1417974476940307 7 1.7566279563607905 8 2.3258725225288002 9 2.517260554934412
		 10 2.5656303060717773 11 2.3610899711859847 12 1.7031060647360794 13 0.74639737425448816
		 14 -0.035771851499594866 15 -0.18876307049242166 16 -0.21106545562137322 17 -0.68333926071451856
		 18 -1.1349963128554463 19 -1.111622127416134 20 -1.1418118765923706 21 -1.7566409923472768
		 22 -2.3258880411681648 23 -2.5172704984501149 24 -2.5656471843881539 25 -2.3610873108488821
		 26 -1.7572480517206515 27 -0.86514414064288525 28 0.035754036581523242;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "spine03_ctrl_rotateX";
	rename -uid "03D779C7-4704-71A6-590F-09917BD0DBB2";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  -1 4.6857823524721281e-06 0 0.22468394146470311
		 2 0.14300444157126049 4 -0.15410835898596925 6 -0.1275896077179188 9 0 11 0.053059240534887843
		 14 0.23653280603000704 19 0.014308564057155443 24 -0.093798285294616576 28 0.22468394146470311;
	setAttr -s 11 ".kit[10]"  1;
	setAttr -s 11 ".kot[10]"  1;
	setAttr -s 11 ".ktl[0:10]" no no no no no no no no no no no;
	setAttr -s 11 ".kix[10]"  1;
	setAttr -s 11 ".kiy[10]"  0;
	setAttr -s 11 ".kox[10]"  1;
	setAttr -s 11 ".koy[10]"  0;
createNode animCurveTA -n "spine03_ctrl_rotateY";
	rename -uid "58A0135A-48D2-FCE3-1737-5DB0CE08D79A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  -1 0 0 -0.41540030650693033 2 -0.10242381842238961
		 4 0.61413894899721777 6 0.54530996905764972 9 0 11 -0.061284446206147009 14 0.43651997713595897
		 19 -0.42605480161525133 24 0.12614032492384586 28 -0.41540030650693033;
	setAttr -s 11 ".kit[10]"  1;
	setAttr -s 11 ".kot[10]"  1;
	setAttr -s 11 ".ktl[0:10]" no no no no no no no no no no no;
	setAttr -s 11 ".kix[10]"  1;
	setAttr -s 11 ".kiy[10]"  0;
	setAttr -s 11 ".kox[10]"  1;
	setAttr -s 11 ".koy[10]"  0;
createNode animCurveTA -n "spine03_ctrl_rotateZ";
	rename -uid "597AD319-4078-B7B1-D379-F18427B58B4A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  -1 0 0 -1.6758572331250243 2 -0.41759082271121128
		 4 2.4087979015430756 6 2.1158499626281198 9 0 11 -0.20560865014115068 14 1.7618048023923667
		 19 -1.6593791729298168 24 0.49368738257617323 28 -1.6758572331250243;
	setAttr -s 11 ".kit[10]"  1;
	setAttr -s 11 ".kot[10]"  1;
	setAttr -s 11 ".ktl[0:10]" no no no no no no no no no no no;
	setAttr -s 11 ".kix[10]"  1;
	setAttr -s 11 ".kiy[10]"  0;
	setAttr -s 11 ".kox[10]"  1;
	setAttr -s 11 ".koy[10]"  0;
createNode animCurveTA -n "chest_ribbon_ctrl_rotateX";
	rename -uid "9F92E3BC-4AE8-0182-7EDE-A2B9FB0D8D40";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0 0 11.107275989904254 1 11.615853015951606
		 2 12.188850054999786 3 12.829588938210108 4 13.641527434112435 5 14.073071558148767
		 6 13.872718197338136 7 12.434334828701816 8 11.190721777811818 9 11.587442397764239
		 10 12.617488630442971 11 13.226047435347203 12 12.640836441228499 13 11.700173906910603
		 14 11.107358261475778 15 11.374078252493851 16 12.188783613567773 17 12.829651372775405
		 18 13.641523943010297 19 14.073049862548951 20 13.872675439918529 21 12.434260011056516
		 22 11.190708639222123 23 11.587438284068677 24 12.617467703710593 25 13.225941914597289
		 26 12.823082132382407 27 11.964585919184284 28 11.107231594400938;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "chest_ribbon_ctrl_rotateY";
	rename -uid "439FEB6B-4885-68C5-50A2-07B0119D4927";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 1.7075472925031871e-06 0 15.632386891353699
		 1 10.082768020641749 2 4.2120811978556612 3 -3.0265068840788278 4 -9.6711385011331874
		 5 -13.992242975753715 6 -16.981573227827997 7 -18.537970786112368 8 -19.006215135163718
		 9 -19.196907510920756 10 -19.029452175315644 11 -18.664967256250748 12 -18.552385459551697
		 13 -17.90099570973717 14 -15.632433199908171 15 -10.710754596687734 16 -4.2120363754217962
		 17 3.0265438022352353 18 9.6711833235389744 19 13.992272425567773 20 16.981592712868352
		 21 18.537999894040663 22 19.006266832721824 23 19.196976880572215 24 19.02949547343831
		 25 18.664932170722842 26 18.117754411765528 27 17.090051136863423 28 15.632327033903753;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "chest_ribbon_ctrl_rotateZ";
	rename -uid "AB984A46-4063-7A00-E87C-14B7A75BE997";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0 0 1.0588943383368308 1 0.99428299081765614
		 2 1.220415864245803 3 2.8699830726700259 4 4.4092062582943807 5 3.9553020278050433
		 6 3.8952799363231132 7 6.769173613564246 8 9.5003292601499023 9 10.312164168304284
		 10 10.405973770134485 11 9.4156175239382947 12 6.4980702390047238 13 2.2958439553725118
		 14 -1.0589906463393797 15 -1.4829702827366684 16 -1.2204492437838985 17 -2.8700570881426488
		 18 -4.4092786536664486 19 -3.9553672137527895 20 -3.8953729075470021 21 -6.7692597352134207
		 22 -9.5003721321588568 23 -10.312227378021284 24 -10.406050840043262 25 -9.4156472134360456
		 26 -6.7480440995798761 27 -2.8529232275246814 28 1.0588912216278028;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTL -n "chest_ribbon_ctrl_translateX";
	rename -uid "F7F41634-4E4A-F8DF-B51C-6FBA2B146C78";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0 0 -0.4211900532245636 1 -0.49014788866043091
		 2 -0.4817003607749939 3 -0.22938396036624908 4 0.015202096663415432 5 0.057791918516159058
		 6 -0.057390306144952774 7 -0.41490340232849121 8 -0.74672341346740723 9 -0.89001935720443726
		 10 -0.96160167455673218 11 -0.88415968418121338 12 -0.53545713424682617 13 -0.007478068582713604
		 14 0.42121458053588867 15 0.54925233125686646 16 0.48171952366828918 17 0.22941212356090546
		 18 -0.015175352804362774 19 -0.05776769295334816 20 0.057412438094615936 21 0.41492736339569092
		 22 0.74674689769744873 23 0.89004158973693848 24 0.96163004636764526 25 0.88417351245880127
		 26 0.56653738021850586 27 0.076073125004768372 28 -0.42119234800338745;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTL -n "chest_ribbon_ctrl_translateY";
	rename -uid "0892D1A9-4A12-9F18-EC5D-D2AE4D482359";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 -9.5367431640625e-07 0 0.87307620048522949
		 1 0.87134695053100586 2 0.86167216300964355 3 0.84360456466674805 4 0.84731507301330566
		 5 0.84744381904602051 6 0.8418118953704834 7 0.82789373397827148 8 0.80332016944885254
		 9 0.78260278701782227 10 0.76449942588806152 11 0.76958560943603516 12 0.81467008590698242
		 13 0.85920071601867676 14 0.87307977676391602 15 0.87328076362609863 16 0.86167812347412109
		 17 0.8435969352722168 18 0.847320556640625 19 0.84743595123291016 20 0.84181118011474609
		 21 0.82789325714111328 22 0.80332350730895996 23 0.78260636329650879 24 0.76449871063232422
		 25 0.76958298683166504 26 0.80988287925720215 27 0.85358190536499023 28 0.87307500839233398;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTL -n "chest_ribbon_ctrl_translateZ";
	rename -uid "772426E6-4F9A-B7A6-4883-1FB96BB6EF2B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 -1.7881393432617188e-07 0 4.8611459732055664
		 1 4.9430327415466309 2 5.0282630920410156 3 5.119563102722168 4 5.2294387817382812
		 5 5.279914379119873 6 5.2502307891845703 7 5.0918664932250977 8 4.9592013359069824
		 9 5.0140895843505859 10 5.1410031318664551 11 5.2061347961425781 12 5.1070785522460938
		 13 4.9550919532775879 14 4.8611574172973633 15 4.9085836410522461 16 5.0282692909240723
		 17 5.1195855140686035 18 5.2294430732727051 19 5.2799201011657715 20 5.2502493858337402
		 21 5.0918560028076172 22 4.9592061042785645 23 5.0141115188598633 24 5.1410021781921387
		 25 5.206118106842041 26 5.1319479942321777 27 4.9937992095947266 28 4.8611421585083008;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "neckBase_ctrl_rotateX";
	rename -uid "76B4BDA3-4460-B8E1-5B34-13B83FD65DCB";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 11.218048699424459 0 7.6818891210106346e-05
		 1 11.21791699354943 2 11.21781074051302 3 11.217938533256277 4 11.217601503714778
		 5 11.218124478195927 6 11.217910085493632 7 11.218032608610116 8 11.217751970971886
		 9 11.217686654478811 10 11.218047171097933 11 11.217949306504519 12 11.217936248031515
		 13 11.217950390444495 14 11.217890021905465 15 11.217799154218431 16 11.218023302072703
		 17 11.21785611032225 18 11.217801935503163 19 11.217828459175729 20 11.217936660762943
		 21 11.218001030615989 22 11.217926794271021 23 11.217936827658153 24 11.217984465825662
		 25 11.217967300098115 26 11.218093196157819 27 11.217932120616151 28 11.217544688461532;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "neckBase_ctrl_rotateY";
	rename -uid "9C17ACDB-4A25-12C3-FAAD-ADB09364CF5E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 -1.8303599585719488e-05 0 1.8220455986346692e-06
		 1 3.9999166399475482e-06 2 0 3 4.7491113839734571e-06 4 -8.7541092744133649e-06 5 -3.7150332460926956e-06
		 6 -1.2444503613546532e-05 7 1.963586042117963e-06 8 -1.237507153707801e-05 9 -3.2141409928963491e-05
		 10 7.6567221021698536e-06 11 -2.3922772479980907e-05 12 8.9943497436403316e-06 13 -3.9609685850195823e-05
		 14 -3.8812029875557512e-06 15 4.4412109393286301e-05 16 4.2077487085144974e-05 17 -1.3078177882065186e-05
		 18 8.7334622302189384e-06 19 3.7843865457300055e-06 20 1.3152213979201282e-06 21 1.2123050014402959e-05
		 22 -7.6406548379528561e-06 23 2.3335318365951707e-05 24 -3.8694104498807193e-06 25 0
		 26 -1.892974329050336e-05 27 -1.3556678759328096e-05 28 1.4423256663460384e-06;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "neckBase_ctrl_rotateZ";
	rename -uid "7277C487-4600-45FC-92B5-B584A6C09B0A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 4.2828390380401281e-05 0 0 1 5.9621616646365869e-06
		 2 -1.504276268131655e-05 3 2.4993962528898852e-05 4 6.3719378922094083e-06 5 4.976661034502479e-05
		 6 6.8217498874854842e-06 7 -2.0327927875559817e-05 8 2.6603286866160959e-05 9 5.9800136571451715e-05
		 10 -4.0887296594540936e-05 11 -1.6872365125033399e-05 12 -9.1432193600112366e-06
		 13 -3.9933398325447955e-05 14 2.1257323528064504e-05 15 -3.6213045127769801e-05 16 -4.9642342726340448e-05
		 17 -2.5332507796879917e-05 18 -1.1196124181097164e-05 19 3.1986479903727779e-06 20 1.7862465924023345e-06
		 21 1.0562832890114426e-05 22 -8.8319883184286483e-06 23 -3.1889486554507099e-05 24 1.1197092342035217e-05
		 25 1.7759742909577301e-05 26 3.6086517781402301e-05 27 1.4054410067999622e-05 28 -5.0446369471093054e-05;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "neckMid_ctrl_rotateX";
	rename -uid "5303C334-4694-43D0-72E7-949F8D1907A4";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 -11.217890755933237 0 22.435719763599053
		 1 11.217820145794375 2 11.217859708663832 3 11.215453891272443 4 11.220536944024314
		 5 11.21764115034982 6 11.217967142620896 7 11.217200415033362 8 11.21695059227488
		 9 11.218207832086938 10 11.217908146287114 11 11.218024959838553 12 11.217979004391989
		 13 11.217767538848436 14 11.217798620011486 15 11.21999386609018 16 11.2176651895921
		 17 11.217475731905521 18 11.217919559450344 19 11.21802394731974 20 11.217945819400159
		 21 11.217922394730794 22 11.217944208829344 23 11.218188261446938 24 11.21796529508582
		 25 11.217983625156172 26 11.217767324053296 27 11.215698639710636 28 11.218844137722197;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "neckMid_ctrl_rotateY";
	rename -uid "74A7EF0D-49B5-B589-1EFE-2CAAF5DFA543";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 1.4526207626683071e-05 0 5.9683332270357791e-06
		 1 -1.765531628821341e-05 2 1.1252409136107091e-05 3 -1.1954599094486662e-05 4 2.3799262594657794e-05
		 5 -1.9255746060743303e-05 6 0 7 -1.8079250855588249e-05 8 -5.2303061098991234e-05
		 9 2.6204362202803447e-05 10 -5.6493130519835522e-05 11 3.3073188737818641e-05 12 -6.073284416449044e-05
		 13 5.4258496951200434e-05 14 6.9453822063770952e-05 15 4.9232612699226829e-05 16 -7.1582797773476125e-05
		 17 1.9959975208649457e-05 18 -6.2912375571322801e-06 19 0 20 1.2336543059919196e-05
		 21 -1.772970231609135e-05 22 2.1401576950020634e-05 23 -2.4619979808374713e-05 24 1.3351141269338768e-05
		 25 -1.8832867685207588e-05 26 -1.9484747050658081e-05 27 3.0626797296514008e-05 28 2.0830126067522634e-05;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "neckMid_ctrl_rotateZ";
	rename -uid "79B9588A-4198-418D-D197-64AA47A6ED98";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 -4.7341780034768094e-05 0 1.3617184741739097e-05
		 1 -6.9321181401940911e-06 2 1.0881861184806585e-05 3 -3.6918744229563564e-05 4 -0.00010673055865283599
		 5 -2.0802813264701973e-05 6 -2.7047019704124221e-05 7 2.1880546293300334e-05 8 8.1620290329430196e-05
		 9 -0.00015296388452095653 10 2.8719805046349425e-05 11 0 12 -3.3353552702157151e-05
		 13 2.0872794452223712e-05 14 -8.4108955008763587e-05 15 -0.00012494852008456721 16 4.7877009689887614e-05
		 17 0 18 2.0757114983600303e-05 19 1.4239393066662362e-06 20 1.1226408108155602e-05
		 21 -3.3442354115754203e-06 22 -2.8776956845937058e-05 23 0.00011928395506850576 24 -2.3636367713892317e-05
		 25 -7.0824253563186925e-05 26 1.56142966459678e-05 27 -0.00014945894682937992 28 0.00012173427219983624;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "head_ctrl_rotateX";
	rename -uid "61361DB0-4B31-F3F7-EB8B-6DB07E8000E6";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 4.5346954589122776e-06 0 -50.193182883366063
		 1 -50.427751514340017 2 -49.856891649892312 3 -46.529512171104741 4 -42.87296019645099
		 5 -39.894891618292199 6 -37.605894195280193 7 -36.320458937946185 8 -36.537423144542736
		 9 -39.210584171553407 10 -42.943200048370549 11 -46.096666508342217 12 -48.007414496765655
		 13 -49.332861613014146 14 -50.193201583987928 15 -50.636445153193542 16 -49.856834417269233
		 17 -46.529513750155473 18 -42.872957043169173 19 -39.894893085032997 20 -37.605945900386892
		 21 -36.320394994277557 22 -36.537435494011298 23 -39.21056781804991 24 -42.943243733712826
		 25 -46.096702312870931 26 -47.883114589699929 27 -49.046151169905848 28 -50.193128016411286;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "head_ctrl_rotateY";
	rename -uid "F85814E5-41F5-A9B8-CFB8-60B5C38F6FAD";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 -1.0245284569203225e-05 0 -11.016827619995178
		 1 -7.5679322610966544 2 -3.9239140320093564 3 0.19927742226899334 4 3.7090103936124157
		 5 6.3446928973455226 6 7.971960091957583 7 7.4392216866698053 8 6.4466543710164999
		 9 5.9646465765150856 10 5.3975605106157651 11 5.5579366067400127 12 7.635787865563187
		 13 10.241254324483714 14 11.016868491910268 15 8.2677419403641093 16 3.9239268955553821
		 17 -0.19923772327611039 18 -3.7089990186675146 19 -6.3446744032912843 20 -7.9719169534656062
		 21 -7.4391977640958435 22 -6.4466322500037325 23 -5.9646210949616618 24 -5.3975216272132238
		 25 -5.557883927144168 26 -7.1591798518021283 27 -9.3393579971677276 28 -11.016805593879321;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "head_ctrl_rotateZ";
	rename -uid "3BA6C56B-4575-598E-3BA7-538AA03DE8A3";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 -4.5198400492034347e-29 0 8.7063079351740953
		 1 7.1595689117007915 2 5.6572059661527456 3 4.0917044607252899 4 2.2935876563183974
		 5 0.17706552299097786 6 -2.6077031514682787 7 -6.5505349907969546 8 -10.048483044703822
		 9 -12.287672429451259 10 -13.919829034758715 11 -14.540608345776631 12 -13.637656105968469
		 13 -11.28022596531852 14 -8.7062134968610483 15 -7.060896060310565 16 -5.6571022739372658
		 17 -4.0916246108908307 18 -2.2934666810996518 19 -0.17699949628987721 20 2.607801591531929
		 21 6.5506077361406545 22 10.048571514289115 23 12.287791463370979 24 13.919943725652558
		 25 14.540680542661873 26 13.615432125946354 27 11.333093608203226 28 8.7062874882939241;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTL -n "head_ctrl_translateX";
	rename -uid "A5F48B3A-4A18-9722-F874-CCB17E2E2193";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0 0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0
		 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0
		 26 0 27 0 28 0;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTL -n "head_ctrl_translateY";
	rename -uid "6943BBC5-4DF9-EF03-1A0C-67B06307BA47";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0 0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0
		 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0
		 26 0 27 0 28 0;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTL -n "head_ctrl_translateZ";
	rename -uid "0CCC8E02-4202-1327-AE31-6697B4735F25";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 30 ".ktv[0:29]"  -1 0 0 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0
		 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0
		 26 0 27 0 28 0;
	setAttr -s 30 ".ktl[0:29]" no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no;
createNode animCurveTA -n "chest_ctrl_rotateX";
	rename -uid "77814DCA-4EB2-B70B-4527-3E80935BEC11";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  -1 -1.428860614995618e-06 0 0.31570754156729058
		 2 0.31498778353333895 4 0.050037325924888042 6 0.030199495738711692 9 0 11 -0.015835820561396596
		 14 0.33221164155128052 19 0.3118774935005556 24 0.0031381212086818307 28 0.31570754156729058;
	setAttr -s 11 ".kit[10]"  1;
	setAttr -s 11 ".kot[10]"  1;
	setAttr -s 11 ".ktl[0:10]" no no no no no no no no no no no;
	setAttr -s 11 ".kix[10]"  1;
	setAttr -s 11 ".kiy[10]"  0;
	setAttr -s 11 ".kox[10]"  1;
	setAttr -s 11 ".koy[10]"  0;
createNode animCurveTA -n "chest_ctrl_rotateY";
	rename -uid "4AD9F527-45D2-084C-E8CE-B98299F4848C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  -1 -1.6674845300848749e-06 0 -0.41393051078900617
		 2 -0.091323404175197867 4 0.63952129183018147 6 0.56437206656969241 9 0 11 -0.062690880479711095
		 14 0.43491128803574186 19 -0.4621893111680806 24 0.081839880584226227 28 -0.41393051078900617;
	setAttr -s 11 ".kit[10]"  1;
	setAttr -s 11 ".kot[10]"  1;
	setAttr -s 11 ".ktl[0:10]" no no no no no no no no no no no;
	setAttr -s 11 ".kix[10]"  1;
	setAttr -s 11 ".kiy[10]"  0;
	setAttr -s 11 ".kox[10]"  1;
	setAttr -s 11 ".koy[10]"  0;
createNode animCurveTA -n "chest_ctrl_rotateZ";
	rename -uid "06C9F1CD-423F-4CD1-8E17-4A859F5A005C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  -1 0 0 -1.6384298020348249 2 -0.38252843094990246
		 4 2.4337247342923032 6 2.1211708650285934 9 0 11 -0.1948875177118565 14 1.7224570177327214
		 19 -1.6869272309564234 24 0.40964109477713362 28 -1.6384298020348249;
	setAttr -s 11 ".kit[10]"  1;
	setAttr -s 11 ".kot[10]"  1;
	setAttr -s 11 ".ktl[0:10]" no no no no no no no no no no no;
	setAttr -s 11 ".kix[10]"  1;
	setAttr -s 11 ".kiy[10]"  0;
	setAttr -s 11 ".kox[10]"  1;
	setAttr -s 11 ".koy[10]"  0;
createNode animCurveTL -n "left_cornerLip_offset_ctrl_translateX";
	rename -uid "926C36A8-4D8C-3560-2941-8E9C4E349721";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 0 11 2.2985283266787762 18 2.2985283266787762
		 28 0;
createNode animCurveTL -n "left_cornerLip_offset_ctrl_translateY";
	rename -uid "7FED8B70-4EDB-CD7D-9A02-4D83C281912D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 0 11 3.7579505978506562 18 3.7579505978506562
		 28 0;
createNode animCurveTU -n "left_cornerLip_offset_ctrl_upTargets";
	rename -uid "85C8856F-4DFE-80C6-CA3E-9A99F8B90145";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 0 11 0 18 0 28 0;
	setAttr -s 4 ".kot[0:3]"  5 5 5 5;
createNode animCurveTU -n "left_cornerLip_offset_ctrl_upInTargets";
	rename -uid "20366EC8-4874-5452-1CB9-5389872AC6E0";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 0 11 0 18 0 28 0;
	setAttr -s 4 ".kot[0:3]"  5 5 5 5;
createNode animCurveTU -n "left_cornerLip_offset_ctrl_inTargets";
	rename -uid "13003E41-4F17-D6BD-9893-3A93F08EF4A7";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 0 11 0 18 0 28 0;
	setAttr -s 4 ".kot[0:3]"  5 5 5 5;
createNode animCurveTU -n "left_cornerLip_offset_ctrl_downInTargets";
	rename -uid "0E392B68-4C6A-2EB0-8250-538870AA3D75";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 0 11 0 18 0 28 0;
	setAttr -s 4 ".kot[0:3]"  5 5 5 5;
createNode animCurveTU -n "left_cornerLip_offset_ctrl_downTargets";
	rename -uid "057D2F07-439D-5BCD-C458-67B9A201D544";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 0 11 0 18 0 28 0;
	setAttr -s 4 ".kot[0:3]"  5 5 5 5;
createNode animCurveTU -n "left_cornerLip_offset_ctrl_downOutTargets";
	rename -uid "03B10874-4D0E-AB22-0205-B9AD74CA42A3";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 0 11 0 18 0 28 0;
	setAttr -s 4 ".kot[0:3]"  5 5 5 5;
createNode animCurveTU -n "left_cornerLip_offset_ctrl_outTargets";
	rename -uid "0BEC464F-4393-01E2-2839-22AC39A2F80A";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 0 11 0 18 0 28 0;
	setAttr -s 4 ".kot[0:3]"  5 5 5 5;
createNode animCurveTU -n "left_cornerLip_offset_ctrl_upOutTargets";
	rename -uid "BA604250-4143-4EC7-0EEA-ACA6AD32C8D5";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 0 11 0 18 0 28 0;
	setAttr -s 4 ".kot[0:3]"  5 5 5 5;
createNode animCurveTL -n "right_cornerLip_offset_ctrl_translateX";
	rename -uid "6EEA2E80-4DC2-42C4-6360-4FA575724BBA";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 11 2.2985283266787762 28 0;
createNode animCurveTL -n "right_cornerLip_offset_ctrl_translateY";
	rename -uid "C988948D-4CA6-B2D6-511E-B4AB08B82D22";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 11 3.7579505978506558 28 0;
createNode animCurveTU -n "right_cornerLip_offset_ctrl_upTargets";
	rename -uid "E347DD7F-4E3F-1660-68EF-D8A4726213EB";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 11 0 28 0;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTU -n "right_cornerLip_offset_ctrl_upInTargets";
	rename -uid "1640F01D-45F5-7175-5AFA-C19B9AE95BF6";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 11 0 28 0;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTU -n "right_cornerLip_offset_ctrl_inTargets";
	rename -uid "C5AF60AF-4EA8-9BF5-682B-C18A44E68B98";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 11 0 28 0;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTU -n "right_cornerLip_offset_ctrl_downInTargets";
	rename -uid "B6C120F4-4282-959B-397C-DF823719AD19";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 11 0 28 0;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTU -n "right_cornerLip_offset_ctrl_downTargets";
	rename -uid "84E176DF-4E4C-B1AA-B6E9-39A4E2766E29";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 11 0 28 0;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTU -n "right_cornerLip_offset_ctrl_downOutTargets";
	rename -uid "50C8B6E9-4C77-061E-B21C-9AA31189D382";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 11 0 28 0;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTU -n "right_cornerLip_offset_ctrl_outTargets";
	rename -uid "FD4E06D4-4987-6592-F93C-EE8F03F6C308";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 11 0 28 0;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTU -n "right_cornerLip_offset_ctrl_upOutTargets";
	rename -uid "18FB7A16-472A-6B80-FFC7-5283FE7C0F1B";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 11 0 28 0;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTL -n "jaw_offset_ctrl_translateX";
	rename -uid "FEE4264B-4E36-D6A0-A40C-989299E23741";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 12 -8.8378740090155894e-15 28 -8.8378740090155894e-15;
createNode animCurveTL -n "jaw_offset_ctrl_translateY";
	rename -uid "B98960B1-4926-9573-896F-5C9D1E6AFEC4";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 12 -0.12794430702846812 28 0;
createNode animCurveTU -n "jaw_offset_ctrl_upTargets";
	rename -uid "D445A7C8-4F93-9A2C-44F7-C89ADC98C799";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 12 0 28 0;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTU -n "jaw_offset_ctrl_upOutTargets";
	rename -uid "C6FD0A39-4AFA-4836-35F9-AE991E55CFEC";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 12 0 28 0;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTU -n "jaw_offset_ctrl_upInTargets";
	rename -uid "74B196CB-4D78-6259-6D36-5BA8576491FE";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 12 0 28 0;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTU -n "jaw_offset_ctrl_inTargets";
	rename -uid "B38BA5E8-430B-4611-B68B-A78431ED6814";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 12 0 28 0;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTU -n "jaw_offset_ctrl_outTargets";
	rename -uid "93869B02-4186-8C5B-C88F-588DF44AD85E";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 12 0 28 0;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTU -n "jaw_offset_ctrl_downInTargets";
	rename -uid "92DFE6CE-468B-FBFF-7F74-5D90F5029133";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 12 0 28 0;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTU -n "jaw_offset_ctrl_downOutTargets";
	rename -uid "EA82DCE1-4374-FE92-5451-6597F3DC5045";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 12 0 28 0;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTL -n "left_blinkEyelid_ctrl_translateY";
	rename -uid "3B4FFBC0-4925-E64F-8FB1-F4B4C8CE83A7";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  5 0 7 -10 8 -10 10 0;
createNode animCurveTL -n "right_blinkEyelid_ctrl_translateY";
	rename -uid "74ED0A08-4A64-CB1B-1E58-CAA56092E758";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  5 0 7 -10 8 -10 10 0;
createNode script -n "uiConfigurationScriptNode";
	rename -uid "9D636E81-4F49-A454-29C2-EE87DFED05AA";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $nodeEditorPanelVisible = stringArrayContains(\"nodeEditorPanel1\", `getPanel -vis`);\n\tint    $nodeEditorWorkspaceControlOpen = (`workspaceControl -exists nodeEditorPanel1Window` && `workspaceControl -q -visible nodeEditorPanel1Window`);\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\n\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n"
		+ "            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n"
		+ "            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n"
		+ "            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n"
		+ "            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n"
		+ "            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n"
		+ "            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n"
		+ "            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n"
		+ "            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n"
		+ "            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n"
		+ "            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n"
		+ "            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 740\n            -height 1075\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"ToggledOutliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"ToggledOutliner\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -docTag \"isolOutln_fromSeln\" \n            -showShapes 1\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 1\n            -showReferenceMembers 1\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n"
		+ "            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -isSet 0\n            -isSetMember 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -selectCommand \"print(\\\"\\\")\" \n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            -renderFilterIndex 0\n"
		+ "            -selectionOrder \"chronological\" \n            -expandAttribute 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 0\n            -showReferenceMembers 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n"
		+ "            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n"
		+ "            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n"
		+ "                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n"
		+ "                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayValues 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showPlayRangeShades \"on\" \n                -lockPlayRangeShades \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n"
		+ "                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -keyMinScale 1\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -valueLinesToggle 1\n                -outliner \"graphEditor1OutlineEd\" \n                -highlightAffectedCurves 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n"
		+ "                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n"
		+ "                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayValues 0\n                -snapTime \"integer\" \n"
		+ "                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"timeEditorPanel\" (localizedPanelLabel(\"Time Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Time Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n"
		+ "            clipEditor -e \n                -displayValues 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayValues 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showConstraintLabels 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n"
		+ "                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif ($nodeEditorPanelVisible || $nodeEditorWorkspaceControlOpen) {\n\t\tif (\"\" == $panelName) {\n\t\t\tif ($useSceneConfig) {\n\t\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n"
		+ "                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -editorMode \"default\" \n                -hasWatchpoint 0\n                $editorName;\n\t\t\t}\n\t\t} else {\n\t\t\t$label = `panel -q -label $panelName`;\n\t\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n"
		+ "                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -editorMode \"default\" \n                -hasWatchpoint 0\n                $editorName;\n\t\t\tif (!$useSceneConfig) {\n\t\t\t\tpanel -e -l $label $panelName;\n\t\t\t}\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"shapePanel\" (localizedPanelLabel(\"Shape Editor\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tshapePanel -edit -l (localizedPanelLabel(\"Shape Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"posePanel\" (localizedPanelLabel(\"Pose Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tposePanel -edit -l (localizedPanelLabel(\"Pose Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"profilerPanel\" (localizedPanelLabel(\"Profiler Tool\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Profiler Tool\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"contentBrowserPanel\" (localizedPanelLabel(\"Content Browser\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Content Browser\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"Stereo\" (localizedPanelLabel(\"Stereo\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels  $panelName;\n{ string $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n"
		+ "                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 32768\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n                -maxConstantTransparency 1\n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n"
		+ "                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -controllers 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n"
		+ "                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                -captureSequenceNumber -1\n                -width 0\n                -height 0\n                -sceneRenderFilter 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                -useCustomBackground 1\n                $editorName;\n            stereoCameraView -e -viewSelected 0 $editorName;\n            stereoCameraView -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName; };\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n"
		+ "        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-userCreated false\n\t\t\t\t-defaultImage \"vacantCell.xP:/\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 740\\n    -height 1075\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 740\\n    -height 1075\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 50 -size 120 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "D92E0689-48E0-5C08-57D3-D68403E29FDC";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 28 -ast 1 -aet 200 ";
	setAttr ".st" 6;
createNode reference -n "sharedReferenceNode";
	rename -uid "941CB73F-479E-4EA8-2850-B5AF0E77B641";
	setAttr ".ed" -type "dataReferenceEdits" 
		"sharedReferenceNode";
select -ne :time1;
	setAttr ".o" 9;
	setAttr ".unw" 9;
select -ne :hardwareRenderingGlobals;
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 0 1 1 1 1 1
		 1 1 1 0 0 0 0 0 0 0 0 0
		 0 0 0 0 ;
	setAttr ".fprt" yes;
select -ne :renderPartition;
	setAttr -s 14 ".st";
select -ne :renderGlobalsList1;
select -ne :defaultShaderList1;
	setAttr -s 17 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -s 3 ".u";
select -ne :defaultRenderingList1;
	setAttr -s 2 ".r";
select -ne :initialShadingGroup;
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultRenderGlobals;
	addAttr -ci true -h true -sn "dss" -ln "defaultSurfaceShader" -dt "string";
	setAttr ".ren" -type "string" "arnold";
	setAttr ".dss" -type "string" "lambert1";
select -ne :defaultResolution;
	setAttr ".pa" 1;
select -ne :defaultColorMgtGlobals;
	setAttr ".cfe" yes;
	setAttr ".cfp" -type "string" "<MAYA_RESOURCES>/OCIO-configs/Maya2022-default/config.ocio";
	setAttr ".wsn" -type "string" "ACEScg";
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
select -ne :ikSystem;
	setAttr -s 2 ".sol";
connectAttr "waist_ctrl_translateX.o" "rig_male_character_v001RN.phl[1]";
connectAttr "waist_ctrl_translateY.o" "rig_male_character_v001RN.phl[2]";
connectAttr "waist_ctrl_translateZ.o" "rig_male_character_v001RN.phl[3]";
connectAttr "waist_ctrl_rotateX.o" "rig_male_character_v001RN.phl[4]";
connectAttr "waist_ctrl_rotateY.o" "rig_male_character_v001RN.phl[5]";
connectAttr "waist_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[6]";
connectAttr "left_hip_ctrl_rotateX.o" "rig_male_character_v001RN.phl[7]";
connectAttr "left_hip_ctrl_rotateY.o" "rig_male_character_v001RN.phl[8]";
connectAttr "left_hip_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[9]";
connectAttr "left_knee_ctrl_translateX.o" "rig_male_character_v001RN.phl[10]";
connectAttr "left_knee_ctrl_translateY.o" "rig_male_character_v001RN.phl[11]";
connectAttr "left_knee_ctrl_translateZ.o" "rig_male_character_v001RN.phl[12]";
connectAttr "left_knee_ctrl_rotateX.o" "rig_male_character_v001RN.phl[13]";
connectAttr "left_knee_ctrl_rotateY.o" "rig_male_character_v001RN.phl[14]";
connectAttr "left_knee_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[15]";
connectAttr "left_ankle_ctrl_translateX.o" "rig_male_character_v001RN.phl[16]";
connectAttr "left_ankle_ctrl_translateY.o" "rig_male_character_v001RN.phl[17]";
connectAttr "left_ankle_ctrl_translateZ.o" "rig_male_character_v001RN.phl[18]";
connectAttr "left_ankle_ctrl_rotateX.o" "rig_male_character_v001RN.phl[19]";
connectAttr "left_ankle_ctrl_rotateY.o" "rig_male_character_v001RN.phl[20]";
connectAttr "left_ankle_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[21]";
connectAttr "right_hip_ctrl_rotateX.o" "rig_male_character_v001RN.phl[22]";
connectAttr "right_hip_ctrl_rotateY.o" "rig_male_character_v001RN.phl[23]";
connectAttr "right_hip_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[24]";
connectAttr "right_knee_ctrl_translateX.o" "rig_male_character_v001RN.phl[25]";
connectAttr "right_knee_ctrl_translateY.o" "rig_male_character_v001RN.phl[26]";
connectAttr "right_knee_ctrl_translateZ.o" "rig_male_character_v001RN.phl[27]";
connectAttr "right_knee_ctrl_rotateX.o" "rig_male_character_v001RN.phl[28]";
connectAttr "right_knee_ctrl_rotateY.o" "rig_male_character_v001RN.phl[29]";
connectAttr "right_knee_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[30]";
connectAttr "right_ankle_ctrl_translateX.o" "rig_male_character_v001RN.phl[31]";
connectAttr "right_ankle_ctrl_translateY.o" "rig_male_character_v001RN.phl[32]";
connectAttr "right_ankle_ctrl_translateZ.o" "rig_male_character_v001RN.phl[33]";
connectAttr "right_ankle_ctrl_rotateX.o" "rig_male_character_v001RN.phl[34]";
connectAttr "right_ankle_ctrl_rotateY.o" "rig_male_character_v001RN.phl[35]";
connectAttr "right_ankle_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[36]";
connectAttr "spine01_ctrl_rotateX.o" "rig_male_character_v001RN.phl[37]";
connectAttr "spine01_ctrl_rotateY.o" "rig_male_character_v001RN.phl[38]";
connectAttr "spine01_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[39]";
connectAttr "spine02_ctrl_rotateX.o" "rig_male_character_v001RN.phl[40]";
connectAttr "spine02_ctrl_rotateY.o" "rig_male_character_v001RN.phl[41]";
connectAttr "spine02_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[42]";
connectAttr "spine03_ctrl_rotateX.o" "rig_male_character_v001RN.phl[43]";
connectAttr "spine03_ctrl_rotateY.o" "rig_male_character_v001RN.phl[44]";
connectAttr "spine03_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[45]";
connectAttr "chest_ctrl_rotateX.o" "rig_male_character_v001RN.phl[46]";
connectAttr "chest_ctrl_rotateY.o" "rig_male_character_v001RN.phl[47]";
connectAttr "chest_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[48]";
connectAttr "chest_ribbon_ctrl_rotateX.o" "rig_male_character_v001RN.phl[49]";
connectAttr "chest_ribbon_ctrl_rotateY.o" "rig_male_character_v001RN.phl[50]";
connectAttr "chest_ribbon_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[51]";
connectAttr "chest_ribbon_ctrl_translateX.o" "rig_male_character_v001RN.phl[52]"
		;
connectAttr "chest_ribbon_ctrl_translateY.o" "rig_male_character_v001RN.phl[53]"
		;
connectAttr "chest_ribbon_ctrl_translateZ.o" "rig_male_character_v001RN.phl[54]"
		;
connectAttr "left_foot_ik_ctrl_pVecTwist.o" "rig_male_character_v001RN.phl[55]";
connectAttr "left_foot_ik_ctrl_rotateX.o" "rig_male_character_v001RN.phl[56]";
connectAttr "left_foot_ik_ctrl_rotateY.o" "rig_male_character_v001RN.phl[57]";
connectAttr "left_foot_ik_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[58]";
connectAttr "left_foot_ik_ctrl_translateX.o" "rig_male_character_v001RN.phl[59]"
		;
connectAttr "left_foot_ik_ctrl_translateY.o" "rig_male_character_v001RN.phl[60]"
		;
connectAttr "left_foot_ik_ctrl_translateZ.o" "rig_male_character_v001RN.phl[61]"
		;
connectAttr "right_foot_ik_ctrl_translateX.o" "rig_male_character_v001RN.phl[62]"
		;
connectAttr "right_foot_ik_ctrl_translateY.o" "rig_male_character_v001RN.phl[63]"
		;
connectAttr "right_foot_ik_ctrl_translateZ.o" "rig_male_character_v001RN.phl[64]"
		;
connectAttr "right_foot_ik_ctrl_rotateX.o" "rig_male_character_v001RN.phl[65]";
connectAttr "right_foot_ik_ctrl_rotateY.o" "rig_male_character_v001RN.phl[66]";
connectAttr "right_foot_ik_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[67]";
connectAttr "right_foot_ik_ctrl_pVecTwist.o" "rig_male_character_v001RN.phl[68]"
		;
connectAttr "left_index01_ctrl_showScaleCtrl.o" "rig_male_character_v001RN.phl[69]"
		;
connectAttr "left_index01_ctrl_translateX.o" "rig_male_character_v001RN.phl[70]"
		;
connectAttr "left_index01_ctrl_translateY.o" "rig_male_character_v001RN.phl[71]"
		;
connectAttr "left_index01_ctrl_translateZ.o" "rig_male_character_v001RN.phl[72]"
		;
connectAttr "left_index01_ctrl_rotateX.o" "rig_male_character_v001RN.phl[73]";
connectAttr "left_index01_ctrl_rotateY.o" "rig_male_character_v001RN.phl[74]";
connectAttr "left_index01_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[75]";
connectAttr "left_index02_ctrl_showScaleCtrl.o" "rig_male_character_v001RN.phl[76]"
		;
connectAttr "left_index02_ctrl_translateX.o" "rig_male_character_v001RN.phl[77]"
		;
connectAttr "left_index02_ctrl_translateY.o" "rig_male_character_v001RN.phl[78]"
		;
connectAttr "left_index02_ctrl_translateZ.o" "rig_male_character_v001RN.phl[79]"
		;
connectAttr "left_index02_ctrl_rotateX.o" "rig_male_character_v001RN.phl[80]";
connectAttr "left_index02_ctrl_rotateY.o" "rig_male_character_v001RN.phl[81]";
connectAttr "left_index02_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[82]";
connectAttr "left_index03_ctrl_showScaleCtrl.o" "rig_male_character_v001RN.phl[83]"
		;
connectAttr "left_index03_ctrl_translateX.o" "rig_male_character_v001RN.phl[84]"
		;
connectAttr "left_index03_ctrl_translateY.o" "rig_male_character_v001RN.phl[85]"
		;
connectAttr "left_index03_ctrl_translateZ.o" "rig_male_character_v001RN.phl[86]"
		;
connectAttr "left_index03_ctrl_rotateX.o" "rig_male_character_v001RN.phl[87]";
connectAttr "left_index03_ctrl_rotateY.o" "rig_male_character_v001RN.phl[88]";
connectAttr "left_index03_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[89]";
connectAttr "left_middle01_ctrl_showScaleCtrl.o" "rig_male_character_v001RN.phl[90]"
		;
connectAttr "left_middle01_ctrl_translateX.o" "rig_male_character_v001RN.phl[91]"
		;
connectAttr "left_middle01_ctrl_translateY.o" "rig_male_character_v001RN.phl[92]"
		;
connectAttr "left_middle01_ctrl_translateZ.o" "rig_male_character_v001RN.phl[93]"
		;
connectAttr "left_middle01_ctrl_rotateX.o" "rig_male_character_v001RN.phl[94]";
connectAttr "left_middle01_ctrl_rotateY.o" "rig_male_character_v001RN.phl[95]";
connectAttr "left_middle01_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[96]";
connectAttr "left_middle02_ctrl_showScaleCtrl.o" "rig_male_character_v001RN.phl[97]"
		;
connectAttr "left_middle02_ctrl_translateX.o" "rig_male_character_v001RN.phl[98]"
		;
connectAttr "left_middle02_ctrl_translateY.o" "rig_male_character_v001RN.phl[99]"
		;
connectAttr "left_middle02_ctrl_translateZ.o" "rig_male_character_v001RN.phl[100]"
		;
connectAttr "left_middle02_ctrl_rotateX.o" "rig_male_character_v001RN.phl[101]";
connectAttr "left_middle02_ctrl_rotateY.o" "rig_male_character_v001RN.phl[102]";
connectAttr "left_middle02_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[103]";
connectAttr "left_middle03_ctrl_showScaleCtrl.o" "rig_male_character_v001RN.phl[104]"
		;
connectAttr "left_middle03_ctrl_translateX.o" "rig_male_character_v001RN.phl[105]"
		;
connectAttr "left_middle03_ctrl_translateY.o" "rig_male_character_v001RN.phl[106]"
		;
connectAttr "left_middle03_ctrl_translateZ.o" "rig_male_character_v001RN.phl[107]"
		;
connectAttr "left_middle03_ctrl_rotateX.o" "rig_male_character_v001RN.phl[108]";
connectAttr "left_middle03_ctrl_rotateY.o" "rig_male_character_v001RN.phl[109]";
connectAttr "left_middle03_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[110]";
connectAttr "left_ring01_ctrl_showScaleCtrl.o" "rig_male_character_v001RN.phl[111]"
		;
connectAttr "left_ring01_ctrl_translateX.o" "rig_male_character_v001RN.phl[112]"
		;
connectAttr "left_ring01_ctrl_translateY.o" "rig_male_character_v001RN.phl[113]"
		;
connectAttr "left_ring01_ctrl_translateZ.o" "rig_male_character_v001RN.phl[114]"
		;
connectAttr "left_ring01_ctrl_rotateX.o" "rig_male_character_v001RN.phl[115]";
connectAttr "left_ring01_ctrl_rotateY.o" "rig_male_character_v001RN.phl[116]";
connectAttr "left_ring01_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[117]";
connectAttr "left_ring02_ctrl_showScaleCtrl.o" "rig_male_character_v001RN.phl[118]"
		;
connectAttr "left_ring02_ctrl_translateX.o" "rig_male_character_v001RN.phl[119]"
		;
connectAttr "left_ring02_ctrl_translateY.o" "rig_male_character_v001RN.phl[120]"
		;
connectAttr "left_ring02_ctrl_translateZ.o" "rig_male_character_v001RN.phl[121]"
		;
connectAttr "left_ring02_ctrl_rotateX.o" "rig_male_character_v001RN.phl[122]";
connectAttr "left_ring02_ctrl_rotateY.o" "rig_male_character_v001RN.phl[123]";
connectAttr "left_ring02_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[124]";
connectAttr "left_ring03_ctrl_showScaleCtrl.o" "rig_male_character_v001RN.phl[125]"
		;
connectAttr "left_ring03_ctrl_translateX.o" "rig_male_character_v001RN.phl[126]"
		;
connectAttr "left_ring03_ctrl_translateY.o" "rig_male_character_v001RN.phl[127]"
		;
connectAttr "left_ring03_ctrl_translateZ.o" "rig_male_character_v001RN.phl[128]"
		;
connectAttr "left_ring03_ctrl_rotateX.o" "rig_male_character_v001RN.phl[129]";
connectAttr "left_ring03_ctrl_rotateY.o" "rig_male_character_v001RN.phl[130]";
connectAttr "left_ring03_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[131]";
connectAttr "left_pinky01_ctrl_showScaleCtrl.o" "rig_male_character_v001RN.phl[132]"
		;
connectAttr "left_pinky01_ctrl_translateX.o" "rig_male_character_v001RN.phl[133]"
		;
connectAttr "left_pinky01_ctrl_translateY.o" "rig_male_character_v001RN.phl[134]"
		;
connectAttr "left_pinky01_ctrl_translateZ.o" "rig_male_character_v001RN.phl[135]"
		;
connectAttr "left_pinky01_ctrl_rotateX.o" "rig_male_character_v001RN.phl[136]";
connectAttr "left_pinky01_ctrl_rotateY.o" "rig_male_character_v001RN.phl[137]";
connectAttr "left_pinky01_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[138]";
connectAttr "left_pinky02_ctrl_showScaleCtrl.o" "rig_male_character_v001RN.phl[139]"
		;
connectAttr "left_pinky02_ctrl_translateX.o" "rig_male_character_v001RN.phl[140]"
		;
connectAttr "left_pinky02_ctrl_translateY.o" "rig_male_character_v001RN.phl[141]"
		;
connectAttr "left_pinky02_ctrl_translateZ.o" "rig_male_character_v001RN.phl[142]"
		;
connectAttr "left_pinky02_ctrl_rotateX.o" "rig_male_character_v001RN.phl[143]";
connectAttr "left_pinky02_ctrl_rotateY.o" "rig_male_character_v001RN.phl[144]";
connectAttr "left_pinky02_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[145]";
connectAttr "left_pinky03_ctrl_showScaleCtrl.o" "rig_male_character_v001RN.phl[146]"
		;
connectAttr "left_pinky03_ctrl_translateX.o" "rig_male_character_v001RN.phl[147]"
		;
connectAttr "left_pinky03_ctrl_translateY.o" "rig_male_character_v001RN.phl[148]"
		;
connectAttr "left_pinky03_ctrl_translateZ.o" "rig_male_character_v001RN.phl[149]"
		;
connectAttr "left_pinky03_ctrl_rotateX.o" "rig_male_character_v001RN.phl[150]";
connectAttr "left_pinky03_ctrl_rotateY.o" "rig_male_character_v001RN.phl[151]";
connectAttr "left_pinky03_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[152]";
connectAttr "left_thumb01_ctrl_showScaleCtrl.o" "rig_male_character_v001RN.phl[153]"
		;
connectAttr "left_thumb01_ctrl_translateX.o" "rig_male_character_v001RN.phl[154]"
		;
connectAttr "left_thumb01_ctrl_translateY.o" "rig_male_character_v001RN.phl[155]"
		;
connectAttr "left_thumb01_ctrl_translateZ.o" "rig_male_character_v001RN.phl[156]"
		;
connectAttr "left_thumb01_ctrl_rotateX.o" "rig_male_character_v001RN.phl[157]";
connectAttr "left_thumb01_ctrl_rotateY.o" "rig_male_character_v001RN.phl[158]";
connectAttr "left_thumb01_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[159]";
connectAttr "left_thumb02_ctrl_showScaleCtrl.o" "rig_male_character_v001RN.phl[160]"
		;
connectAttr "left_thumb02_ctrl_translateX.o" "rig_male_character_v001RN.phl[161]"
		;
connectAttr "left_thumb02_ctrl_translateY.o" "rig_male_character_v001RN.phl[162]"
		;
connectAttr "left_thumb02_ctrl_translateZ.o" "rig_male_character_v001RN.phl[163]"
		;
connectAttr "left_thumb02_ctrl_rotateX.o" "rig_male_character_v001RN.phl[164]";
connectAttr "left_thumb02_ctrl_rotateY.o" "rig_male_character_v001RN.phl[165]";
connectAttr "left_thumb02_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[166]";
connectAttr "left_thumb03_ctrl_showScaleCtrl.o" "rig_male_character_v001RN.phl[167]"
		;
connectAttr "left_thumb03_ctrl_translateX.o" "rig_male_character_v001RN.phl[168]"
		;
connectAttr "left_thumb03_ctrl_translateY.o" "rig_male_character_v001RN.phl[169]"
		;
connectAttr "left_thumb03_ctrl_translateZ.o" "rig_male_character_v001RN.phl[170]"
		;
connectAttr "left_thumb03_ctrl_rotateX.o" "rig_male_character_v001RN.phl[171]";
connectAttr "left_thumb03_ctrl_rotateY.o" "rig_male_character_v001RN.phl[172]";
connectAttr "left_thumb03_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[173]";
connectAttr "left_wrist_ik_ctrl_rotateX.o" "rig_male_character_v001RN.phl[174]";
connectAttr "left_wrist_ik_ctrl_rotateY.o" "rig_male_character_v001RN.phl[175]";
connectAttr "left_wrist_ik_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[176]";
connectAttr "left_wrist_ik_ctrl_translateX.o" "rig_male_character_v001RN.phl[177]"
		;
connectAttr "left_wrist_ik_ctrl_translateY.o" "rig_male_character_v001RN.phl[178]"
		;
connectAttr "left_wrist_ik_ctrl_translateZ.o" "rig_male_character_v001RN.phl[179]"
		;
connectAttr "right_index01_ctrl_showScaleCtrl.o" "rig_male_character_v001RN.phl[180]"
		;
connectAttr "right_index01_ctrl_translateX.o" "rig_male_character_v001RN.phl[181]"
		;
connectAttr "right_index01_ctrl_translateY.o" "rig_male_character_v001RN.phl[182]"
		;
connectAttr "right_index01_ctrl_translateZ.o" "rig_male_character_v001RN.phl[183]"
		;
connectAttr "right_index01_ctrl_rotateX.o" "rig_male_character_v001RN.phl[184]";
connectAttr "right_index01_ctrl_rotateY.o" "rig_male_character_v001RN.phl[185]";
connectAttr "right_index01_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[186]";
connectAttr "right_index02_ctrl_showScaleCtrl.o" "rig_male_character_v001RN.phl[187]"
		;
connectAttr "right_index02_ctrl_translateX.o" "rig_male_character_v001RN.phl[188]"
		;
connectAttr "right_index02_ctrl_translateY.o" "rig_male_character_v001RN.phl[189]"
		;
connectAttr "right_index02_ctrl_translateZ.o" "rig_male_character_v001RN.phl[190]"
		;
connectAttr "right_index02_ctrl_rotateX.o" "rig_male_character_v001RN.phl[191]";
connectAttr "right_index02_ctrl_rotateY.o" "rig_male_character_v001RN.phl[192]";
connectAttr "right_index02_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[193]";
connectAttr "right_index03_ctrl_showScaleCtrl.o" "rig_male_character_v001RN.phl[194]"
		;
connectAttr "right_index03_ctrl_translateX.o" "rig_male_character_v001RN.phl[195]"
		;
connectAttr "right_index03_ctrl_translateY.o" "rig_male_character_v001RN.phl[196]"
		;
connectAttr "right_index03_ctrl_translateZ.o" "rig_male_character_v001RN.phl[197]"
		;
connectAttr "right_index03_ctrl_rotateX.o" "rig_male_character_v001RN.phl[198]";
connectAttr "right_index03_ctrl_rotateY.o" "rig_male_character_v001RN.phl[199]";
connectAttr "right_index03_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[200]";
connectAttr "right_middle01_ctrl_showScaleCtrl.o" "rig_male_character_v001RN.phl[201]"
		;
connectAttr "right_middle01_ctrl_translateX.o" "rig_male_character_v001RN.phl[202]"
		;
connectAttr "right_middle01_ctrl_translateY.o" "rig_male_character_v001RN.phl[203]"
		;
connectAttr "right_middle01_ctrl_translateZ.o" "rig_male_character_v001RN.phl[204]"
		;
connectAttr "right_middle01_ctrl_rotateX.o" "rig_male_character_v001RN.phl[205]"
		;
connectAttr "right_middle01_ctrl_rotateY.o" "rig_male_character_v001RN.phl[206]"
		;
connectAttr "right_middle01_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[207]"
		;
connectAttr "right_middle02_ctrl_showScaleCtrl.o" "rig_male_character_v001RN.phl[208]"
		;
connectAttr "right_middle02_ctrl_translateX.o" "rig_male_character_v001RN.phl[209]"
		;
connectAttr "right_middle02_ctrl_translateY.o" "rig_male_character_v001RN.phl[210]"
		;
connectAttr "right_middle02_ctrl_translateZ.o" "rig_male_character_v001RN.phl[211]"
		;
connectAttr "right_middle02_ctrl_rotateX.o" "rig_male_character_v001RN.phl[212]"
		;
connectAttr "right_middle02_ctrl_rotateY.o" "rig_male_character_v001RN.phl[213]"
		;
connectAttr "right_middle02_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[214]"
		;
connectAttr "right_middle03_ctrl_showScaleCtrl.o" "rig_male_character_v001RN.phl[215]"
		;
connectAttr "right_middle03_ctrl_translateX.o" "rig_male_character_v001RN.phl[216]"
		;
connectAttr "right_middle03_ctrl_translateY.o" "rig_male_character_v001RN.phl[217]"
		;
connectAttr "right_middle03_ctrl_translateZ.o" "rig_male_character_v001RN.phl[218]"
		;
connectAttr "right_middle03_ctrl_rotateX.o" "rig_male_character_v001RN.phl[219]"
		;
connectAttr "right_middle03_ctrl_rotateY.o" "rig_male_character_v001RN.phl[220]"
		;
connectAttr "right_middle03_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[221]"
		;
connectAttr "right_ring01_ctrl_showScaleCtrl.o" "rig_male_character_v001RN.phl[222]"
		;
connectAttr "right_ring01_ctrl_translateX.o" "rig_male_character_v001RN.phl[223]"
		;
connectAttr "right_ring01_ctrl_translateY.o" "rig_male_character_v001RN.phl[224]"
		;
connectAttr "right_ring01_ctrl_translateZ.o" "rig_male_character_v001RN.phl[225]"
		;
connectAttr "right_ring01_ctrl_rotateX.o" "rig_male_character_v001RN.phl[226]";
connectAttr "right_ring01_ctrl_rotateY.o" "rig_male_character_v001RN.phl[227]";
connectAttr "right_ring01_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[228]";
connectAttr "right_ring02_ctrl_showScaleCtrl.o" "rig_male_character_v001RN.phl[229]"
		;
connectAttr "right_ring02_ctrl_translateX.o" "rig_male_character_v001RN.phl[230]"
		;
connectAttr "right_ring02_ctrl_translateY.o" "rig_male_character_v001RN.phl[231]"
		;
connectAttr "right_ring02_ctrl_translateZ.o" "rig_male_character_v001RN.phl[232]"
		;
connectAttr "right_ring02_ctrl_rotateX.o" "rig_male_character_v001RN.phl[233]";
connectAttr "right_ring02_ctrl_rotateY.o" "rig_male_character_v001RN.phl[234]";
connectAttr "right_ring02_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[235]";
connectAttr "right_ring03_ctrl_showScaleCtrl.o" "rig_male_character_v001RN.phl[236]"
		;
connectAttr "right_ring03_ctrl_translateX.o" "rig_male_character_v001RN.phl[237]"
		;
connectAttr "right_ring03_ctrl_translateY.o" "rig_male_character_v001RN.phl[238]"
		;
connectAttr "right_ring03_ctrl_translateZ.o" "rig_male_character_v001RN.phl[239]"
		;
connectAttr "right_ring03_ctrl_rotateX.o" "rig_male_character_v001RN.phl[240]";
connectAttr "right_ring03_ctrl_rotateY.o" "rig_male_character_v001RN.phl[241]";
connectAttr "right_ring03_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[242]";
connectAttr "right_pinky01_ctrl_showScaleCtrl.o" "rig_male_character_v001RN.phl[243]"
		;
connectAttr "right_pinky01_ctrl_translateX.o" "rig_male_character_v001RN.phl[244]"
		;
connectAttr "right_pinky01_ctrl_translateY.o" "rig_male_character_v001RN.phl[245]"
		;
connectAttr "right_pinky01_ctrl_translateZ.o" "rig_male_character_v001RN.phl[246]"
		;
connectAttr "right_pinky01_ctrl_rotateX.o" "rig_male_character_v001RN.phl[247]";
connectAttr "right_pinky01_ctrl_rotateY.o" "rig_male_character_v001RN.phl[248]";
connectAttr "right_pinky01_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[249]";
connectAttr "right_pinky02_ctrl_showScaleCtrl.o" "rig_male_character_v001RN.phl[250]"
		;
connectAttr "right_pinky02_ctrl_translateX.o" "rig_male_character_v001RN.phl[251]"
		;
connectAttr "right_pinky02_ctrl_translateY.o" "rig_male_character_v001RN.phl[252]"
		;
connectAttr "right_pinky02_ctrl_translateZ.o" "rig_male_character_v001RN.phl[253]"
		;
connectAttr "right_pinky02_ctrl_rotateX.o" "rig_male_character_v001RN.phl[254]";
connectAttr "right_pinky02_ctrl_rotateY.o" "rig_male_character_v001RN.phl[255]";
connectAttr "right_pinky02_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[256]";
connectAttr "right_pinky03_ctrl_showScaleCtrl.o" "rig_male_character_v001RN.phl[257]"
		;
connectAttr "right_pinky03_ctrl_translateX.o" "rig_male_character_v001RN.phl[258]"
		;
connectAttr "right_pinky03_ctrl_translateY.o" "rig_male_character_v001RN.phl[259]"
		;
connectAttr "right_pinky03_ctrl_translateZ.o" "rig_male_character_v001RN.phl[260]"
		;
connectAttr "right_pinky03_ctrl_rotateX.o" "rig_male_character_v001RN.phl[261]";
connectAttr "right_pinky03_ctrl_rotateY.o" "rig_male_character_v001RN.phl[262]";
connectAttr "right_pinky03_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[263]";
connectAttr "right_thumb01_ctrl_showScaleCtrl.o" "rig_male_character_v001RN.phl[264]"
		;
connectAttr "right_thumb01_ctrl_translateX.o" "rig_male_character_v001RN.phl[265]"
		;
connectAttr "right_thumb01_ctrl_translateY.o" "rig_male_character_v001RN.phl[266]"
		;
connectAttr "right_thumb01_ctrl_translateZ.o" "rig_male_character_v001RN.phl[267]"
		;
connectAttr "right_thumb01_ctrl_rotateX.o" "rig_male_character_v001RN.phl[268]";
connectAttr "right_thumb01_ctrl_rotateY.o" "rig_male_character_v001RN.phl[269]";
connectAttr "right_thumb01_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[270]";
connectAttr "right_thumb02_ctrl_showScaleCtrl.o" "rig_male_character_v001RN.phl[271]"
		;
connectAttr "right_thumb02_ctrl_translateX.o" "rig_male_character_v001RN.phl[272]"
		;
connectAttr "right_thumb02_ctrl_translateY.o" "rig_male_character_v001RN.phl[273]"
		;
connectAttr "right_thumb02_ctrl_translateZ.o" "rig_male_character_v001RN.phl[274]"
		;
connectAttr "right_thumb02_ctrl_rotateX.o" "rig_male_character_v001RN.phl[275]";
connectAttr "right_thumb02_ctrl_rotateY.o" "rig_male_character_v001RN.phl[276]";
connectAttr "right_thumb02_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[277]";
connectAttr "right_thumb03_ctrl_showScaleCtrl.o" "rig_male_character_v001RN.phl[278]"
		;
connectAttr "right_thumb03_ctrl_translateX.o" "rig_male_character_v001RN.phl[279]"
		;
connectAttr "right_thumb03_ctrl_translateY.o" "rig_male_character_v001RN.phl[280]"
		;
connectAttr "right_thumb03_ctrl_translateZ.o" "rig_male_character_v001RN.phl[281]"
		;
connectAttr "right_thumb03_ctrl_rotateX.o" "rig_male_character_v001RN.phl[282]";
connectAttr "right_thumb03_ctrl_rotateY.o" "rig_male_character_v001RN.phl[283]";
connectAttr "right_thumb03_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[284]";
connectAttr "right_wrist_ik_ctrl_rotateX.o" "rig_male_character_v001RN.phl[285]"
		;
connectAttr "right_wrist_ik_ctrl_rotateY.o" "rig_male_character_v001RN.phl[286]"
		;
connectAttr "right_wrist_ik_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[287]"
		;
connectAttr "right_wrist_ik_ctrl_translateX.o" "rig_male_character_v001RN.phl[288]"
		;
connectAttr "right_wrist_ik_ctrl_translateY.o" "rig_male_character_v001RN.phl[289]"
		;
connectAttr "right_wrist_ik_ctrl_translateZ.o" "rig_male_character_v001RN.phl[290]"
		;
connectAttr "right_clavicle_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[291]"
		;
connectAttr "right_clavicle_ctrl_rotateX.o" "rig_male_character_v001RN.phl[292]"
		;
connectAttr "right_clavicle_ctrl_rotateY.o" "rig_male_character_v001RN.phl[293]"
		;
connectAttr "right_shoulder_ctrl_rotateX.o" "rig_male_character_v001RN.phl[294]"
		;
connectAttr "right_shoulder_ctrl_rotateY.o" "rig_male_character_v001RN.phl[295]"
		;
connectAttr "right_shoulder_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[296]"
		;
connectAttr "right_elbow_ctrl_translateX.o" "rig_male_character_v001RN.phl[297]"
		;
connectAttr "right_elbow_ctrl_translateY.o" "rig_male_character_v001RN.phl[298]"
		;
connectAttr "right_elbow_ctrl_translateZ.o" "rig_male_character_v001RN.phl[299]"
		;
connectAttr "right_elbow_ctrl_rotateX.o" "rig_male_character_v001RN.phl[300]";
connectAttr "right_elbow_ctrl_rotateY.o" "rig_male_character_v001RN.phl[301]";
connectAttr "right_elbow_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[302]";
connectAttr "right_wrist_ctrl_translateX.o" "rig_male_character_v001RN.phl[303]"
		;
connectAttr "right_wrist_ctrl_translateY.o" "rig_male_character_v001RN.phl[304]"
		;
connectAttr "right_wrist_ctrl_translateZ.o" "rig_male_character_v001RN.phl[305]"
		;
connectAttr "right_wrist_ctrl_rotateX.o" "rig_male_character_v001RN.phl[306]";
connectAttr "right_wrist_ctrl_rotateY.o" "rig_male_character_v001RN.phl[307]";
connectAttr "right_wrist_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[308]";
connectAttr "left_clavicle_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[309]";
connectAttr "left_clavicle_ctrl_rotateX.o" "rig_male_character_v001RN.phl[310]";
connectAttr "left_clavicle_ctrl_rotateY.o" "rig_male_character_v001RN.phl[311]";
connectAttr "left_shoulder_ctrl_rotateX.o" "rig_male_character_v001RN.phl[312]";
connectAttr "left_shoulder_ctrl_rotateY.o" "rig_male_character_v001RN.phl[313]";
connectAttr "left_shoulder_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[314]";
connectAttr "left_elbow_ctrl_translateX.o" "rig_male_character_v001RN.phl[315]";
connectAttr "left_elbow_ctrl_translateY.o" "rig_male_character_v001RN.phl[316]";
connectAttr "left_elbow_ctrl_translateZ.o" "rig_male_character_v001RN.phl[317]";
connectAttr "left_elbow_ctrl_rotateX.o" "rig_male_character_v001RN.phl[318]";
connectAttr "left_elbow_ctrl_rotateY.o" "rig_male_character_v001RN.phl[319]";
connectAttr "left_elbow_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[320]";
connectAttr "left_wrist_ctrl_translateX.o" "rig_male_character_v001RN.phl[321]";
connectAttr "left_wrist_ctrl_translateY.o" "rig_male_character_v001RN.phl[322]";
connectAttr "left_wrist_ctrl_translateZ.o" "rig_male_character_v001RN.phl[323]";
connectAttr "left_wrist_ctrl_rotateX.o" "rig_male_character_v001RN.phl[324]";
connectAttr "left_wrist_ctrl_rotateY.o" "rig_male_character_v001RN.phl[325]";
connectAttr "left_wrist_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[326]";
connectAttr "neckBase_ctrl_rotateX.o" "rig_male_character_v001RN.phl[327]";
connectAttr "neckBase_ctrl_rotateY.o" "rig_male_character_v001RN.phl[328]";
connectAttr "neckBase_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[329]";
connectAttr "neckMid_ctrl_rotateX.o" "rig_male_character_v001RN.phl[330]";
connectAttr "neckMid_ctrl_rotateY.o" "rig_male_character_v001RN.phl[331]";
connectAttr "neckMid_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[332]";
connectAttr "head_ctrl_rotateX.o" "rig_male_character_v001RN.phl[333]";
connectAttr "head_ctrl_rotateY.o" "rig_male_character_v001RN.phl[334]";
connectAttr "head_ctrl_rotateZ.o" "rig_male_character_v001RN.phl[335]";
connectAttr "head_ctrl_translateX.o" "rig_male_character_v001RN.phl[336]";
connectAttr "head_ctrl_translateY.o" "rig_male_character_v001RN.phl[337]";
connectAttr "head_ctrl_translateZ.o" "rig_male_character_v001RN.phl[338]";
connectAttr "left_blinkEyelid_ctrl_translateY.o" "rig_male_character_v001RN.phl[339]"
		;
connectAttr "right_blinkEyelid_ctrl_translateY.o" "rig_male_character_v001RN.phl[340]"
		;
connectAttr "left_cornerLip_offset_ctrl_translateX.o" "rig_male_character_v001RN.phl[341]"
		;
connectAttr "left_cornerLip_offset_ctrl_translateY.o" "rig_male_character_v001RN.phl[342]"
		;
connectAttr "left_cornerLip_offset_ctrl_upInTargets.o" "rig_male_character_v001RN.phl[343]"
		;
connectAttr "left_cornerLip_offset_ctrl_inTargets.o" "rig_male_character_v001RN.phl[344]"
		;
connectAttr "left_cornerLip_offset_ctrl_downInTargets.o" "rig_male_character_v001RN.phl[345]"
		;
connectAttr "left_cornerLip_offset_ctrl_downOutTargets.o" "rig_male_character_v001RN.phl[346]"
		;
connectAttr "left_cornerLip_offset_ctrl_upOutTargets.o" "rig_male_character_v001RN.phl[347]"
		;
connectAttr "left_cornerLip_offset_ctrl_upTargets.o" "rig_male_character_v001RN.phl[348]"
		;
connectAttr "left_cornerLip_offset_ctrl_downTargets.o" "rig_male_character_v001RN.phl[349]"
		;
connectAttr "left_cornerLip_offset_ctrl_outTargets.o" "rig_male_character_v001RN.phl[350]"
		;
connectAttr "right_cornerLip_offset_ctrl_translateX.o" "rig_male_character_v001RN.phl[351]"
		;
connectAttr "right_cornerLip_offset_ctrl_translateY.o" "rig_male_character_v001RN.phl[352]"
		;
connectAttr "right_cornerLip_offset_ctrl_upInTargets.o" "rig_male_character_v001RN.phl[353]"
		;
connectAttr "right_cornerLip_offset_ctrl_inTargets.o" "rig_male_character_v001RN.phl[354]"
		;
connectAttr "right_cornerLip_offset_ctrl_downInTargets.o" "rig_male_character_v001RN.phl[355]"
		;
connectAttr "right_cornerLip_offset_ctrl_downOutTargets.o" "rig_male_character_v001RN.phl[356]"
		;
connectAttr "right_cornerLip_offset_ctrl_upOutTargets.o" "rig_male_character_v001RN.phl[357]"
		;
connectAttr "right_cornerLip_offset_ctrl_upTargets.o" "rig_male_character_v001RN.phl[358]"
		;
connectAttr "right_cornerLip_offset_ctrl_downTargets.o" "rig_male_character_v001RN.phl[359]"
		;
connectAttr "right_cornerLip_offset_ctrl_outTargets.o" "rig_male_character_v001RN.phl[360]"
		;
connectAttr "jaw_offset_ctrl_translateY.o" "rig_male_character_v001RN.phl[361]";
connectAttr "jaw_offset_ctrl_translateX.o" "rig_male_character_v001RN.phl[362]";
connectAttr "jaw_offset_ctrl_upTargets.o" "rig_male_character_v001RN.phl[363]";
connectAttr "jaw_offset_ctrl_upOutTargets.o" "rig_male_character_v001RN.phl[364]"
		;
connectAttr "jaw_offset_ctrl_upInTargets.o" "rig_male_character_v001RN.phl[365]"
		;
connectAttr "jaw_offset_ctrl_inTargets.o" "rig_male_character_v001RN.phl[366]";
connectAttr "jaw_offset_ctrl_outTargets.o" "rig_male_character_v001RN.phl[367]";
connectAttr "jaw_offset_ctrl_downInTargets.o" "rig_male_character_v001RN.phl[368]"
		;
connectAttr "jaw_offset_ctrl_downOutTargets.o" "rig_male_character_v001RN.phl[369]"
		;
connectAttr "rig_male_character_v001RN.phl[370]" "rig_male_character_v001RN.phl[371]"
		;
connectAttr "rig_male_character_v001RN.phl[372]" "rig_male_character_v001RN.phl[373]"
		;
connectAttr "rig_male_character_v001RN.phl[374]" "rig_male_character_v001RN.phl[375]"
		;
connectAttr "rig_male_character_v001RN.phl[376]" "rig_male_character_v001RN.phl[377]"
		;
connectAttr "rig_male_character_v001RN.phl[378]" "rig_male_character_v001RN.phl[379]"
		;
connectAttr "rig_male_character_v001RN.phl[380]" "rig_male_character_v001RN.phl[381]"
		;
connectAttr "rig_male_character_v001RN.phl[382]" "rig_male_character_v001RN.phl[383]"
		;
connectAttr "rig_male_character_v001RN.phl[384]" "rig_male_character_v001RN.phl[385]"
		;
connectAttr "rig_male_character_v001RN.phl[386]" "rig_male_character_v001RN.phl[387]"
		;
connectAttr "rig_male_character_v001RN.phl[388]" "rig_male_character_v001RN.phl[389]"
		;
connectAttr "rig_male_character_v001RN.phl[390]" "rig_male_character_v001RN.phl[391]"
		;
connectAttr "rig_male_character_v001RN.phl[392]" "rig_male_character_v001RN.phl[393]"
		;
connectAttr "rig_male_character_v001RN.phl[394]" "rig_male_character_v001RN.phl[395]"
		;
connectAttr "rig_male_character_v001RN.phl[396]" "rig_male_character_v001RN.phl[397]"
		;
connectAttr "rig_male_character_v001RN.phl[398]" "rig_male_character_v001RN.phl[399]"
		;
connectAttr "rig_male_character_v001RN.phl[400]" "rig_male_character_v001RN.phl[401]"
		;
connectAttr "rig_male_character_v001RN.phl[402]" "rig_male_character_v001RN.phl[403]"
		;
connectAttr "rig_male_character_v001RN.phl[404]" "rig_male_character_v001RN.phl[405]"
		;
connectAttr "rig_male_character_v001RN.phl[406]" "rig_male_character_v001RN.phl[407]"
		;
connectAttr "rig_male_character_v001RN.phl[408]" "rig_male_character_v001RN.phl[409]"
		;
connectAttr "rig_male_character_v001RN.phl[410]" "rig_male_character_v001RN.phl[411]"
		;
connectAttr "rig_male_character_v001RN.phl[412]" "rig_male_character_v001RN.phl[413]"
		;
connectAttr "rig_male_character_v001RN.phl[414]" "rig_male_character_v001RN.phl[415]"
		;
connectAttr "rig_male_character_v001RN.phl[416]" "rig_male_character_v001RN.phl[417]"
		;
connectAttr "rig_male_character_v001RN.phl[418]" "rig_male_character_v001RN.phl[419]"
		;
connectAttr "rig_male_character_v001RN.phl[420]" "rig_male_character_v001RN.phl[421]"
		;
connectAttr "rig_male_character_v001RN.phl[422]" "rig_male_character_v001RN.phl[423]"
		;
connectAttr "rig_male_character_v001RN.phl[424]" "rig_male_character_v001RN.phl[425]"
		;
connectAttr "rig_male_character_v001RN.phl[426]" "rig_male_character_v001RN.phl[427]"
		;
connectAttr "rig_male_character_v001RN.phl[428]" "rig_male_character_v001RN.phl[429]"
		;
connectAttr "rig_male_character_v001RN.phl[430]" "rig_male_character_v001RN.phl[431]"
		;
connectAttr "rig_male_character_v001RN.phl[432]" "rig_male_character_v001RN.phl[433]"
		;
connectAttr "rig_male_character_v001RN.phl[434]" "rig_male_character_v001RN.phl[435]"
		;
connectAttr "rig_male_character_v001RN.phl[436]" "rig_male_character_v001RN.phl[437]"
		;
connectAttr "rig_male_character_v001RN.phl[438]" "rig_male_character_v001RN.phl[439]"
		;
connectAttr "rig_male_character_v001RN.phl[440]" "rig_male_character_v001RN.phl[441]"
		;
connectAttr "rig_male_character_v001RN.phl[442]" "rig_male_character_v001RN.phl[443]"
		;
connectAttr "rig_male_character_v001RN.phl[444]" "rig_male_character_v001RN.phl[445]"
		;
connectAttr "rig_male_character_v001RN.phl[446]" "rig_male_character_v001RN.phl[447]"
		;
connectAttr "rig_male_character_v001RN.phl[448]" "rig_male_character_v001RN.phl[449]"
		;
connectAttr "rig_male_character_v001RN.phl[450]" "rig_male_character_v001RN.phl[451]"
		;
connectAttr "rig_male_character_v001RN.phl[452]" "rig_male_character_v001RN.phl[453]"
		;
connectAttr "rig_male_character_v001RN.phl[454]" "rig_male_character_v001RN.phl[455]"
		;
connectAttr "rig_male_character_v001RN.phl[456]" "rig_male_character_v001RN.phl[457]"
		;
connectAttr "rig_male_character_v001RN.phl[458]" "rig_male_character_v001RN.phl[459]"
		;
connectAttr "rig_male_character_v001RN.phl[460]" "rig_male_character_v001RN.phl[461]"
		;
connectAttr "rig_male_character_v001RN.phl[462]" "rig_male_character_v001RN.phl[463]"
		;
connectAttr "rig_male_character_v001RN.phl[464]" "rig_male_character_v001RN.phl[465]"
		;
connectAttr "rig_male_character_v001RN.phl[466]" "rig_male_character_v001RN.phl[467]"
		;
connectAttr "rig_male_character_v001RN.phl[468]" "rig_male_character_v001RN.phl[469]"
		;
connectAttr "rig_male_character_v001RN.phl[470]" "rig_male_character_v001RN.phl[471]"
		;
connectAttr "rig_male_character_v001RN.phl[472]" "rig_male_character_v001RN.phl[473]"
		;
connectAttr "rig_male_character_v001RN.phl[474]" "rig_male_character_v001RN.phl[475]"
		;
connectAttr "rig_male_character_v001RN.phl[476]" "rig_male_character_v001RN.phl[477]"
		;
connectAttr "rig_male_character_v001RN.phl[478]" "rig_male_character_v001RN.phl[479]"
		;
connectAttr "rig_male_character_v001RN.phl[480]" "rig_male_character_v001RN.phl[481]"
		;
connectAttr "rig_male_character_v001RN.phl[482]" "rig_male_character_v001RN.phl[483]"
		;
connectAttr "rig_male_character_v001RN.phl[484]" "rig_male_character_v001RN.phl[485]"
		;
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "sharedReferenceNode.sr" "rig_male_character_v001RN.sr";
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
// End of anim_rig_male_jog.002.ma
