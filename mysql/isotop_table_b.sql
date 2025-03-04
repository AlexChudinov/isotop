USE `isotop`;
INSERT INTO `isotop_tables` (`source`,`mass_accuracy`,`abundance_accurace`) VALUES ("https://dpva.ru/Guide/GuideChemistry/PeriodicalMendeleevTable/IsotopiAbundance1/",1e-7,1e-5);
SELECT @current_table_id := id FROM isotop_tables WHERE `source`="https://dpva.ru/Guide/GuideChemistry/PeriodicalMendeleevTable/IsotopiAbundance1/";
INSERT INTO `distribution` VALUES ("H",1,1.007825,99.985,@current_table_id);
INSERT INTO `distribution` VALUES ("H",2,2.014,0.015,@current_table_id);
INSERT INTO `distribution` VALUES ("He",3,3.01603,0.00014,@current_table_id);
INSERT INTO `distribution` VALUES ("He",4,4.0026,99.99986,@current_table_id);
INSERT INTO `distribution` VALUES ("Li",6,6.015121,7.5,@current_table_id);
INSERT INTO `distribution` VALUES ("Li",7,7.016003,92.5,@current_table_id);
INSERT INTO `distribution` VALUES ("Be",9,9.012182,100,@current_table_id);
INSERT INTO `distribution` VALUES ("B",10,10.012937,19.8,@current_table_id);
INSERT INTO `distribution` VALUES ("B",11,11.009305,80.2,@current_table_id);
INSERT INTO `distribution` VALUES ("C",12,12,98.9,@current_table_id);
INSERT INTO `distribution` VALUES ("C",13,13.003355,1.1,@current_table_id);
INSERT INTO `distribution` VALUES ("N",14,14.003074,99.63,@current_table_id);
INSERT INTO `distribution` VALUES ("N",15,15.000108,0.37,@current_table_id);
INSERT INTO `distribution` VALUES ("O",16,15.994915,99.762,@current_table_id);
INSERT INTO `distribution` VALUES ("O",17,16.999131,0.038,@current_table_id);
INSERT INTO `distribution` VALUES ("O",18,17.99916,0.2,@current_table_id);
INSERT INTO `distribution` VALUES ("F",19,18.998403,100,@current_table_id);
INSERT INTO `distribution` VALUES ("Ne",20,19.992435,90.51,@current_table_id);
INSERT INTO `distribution` VALUES ("Ne",21,20.993843,0.27,@current_table_id);
INSERT INTO `distribution` VALUES ("Ne",22,21.991383,9.22,@current_table_id);
INSERT INTO `distribution` VALUES ("Na",23,22.989767,100,@current_table_id);
INSERT INTO `distribution` VALUES ("Mg",24,23.985042,78.99,@current_table_id);
INSERT INTO `distribution` VALUES ("Mg",25,24.985837,10,@current_table_id);
INSERT INTO `distribution` VALUES ("Mg",26,25.982593,11.01,@current_table_id);
INSERT INTO `distribution` VALUES ("Al",27,26.98154,100,@current_table_id);
INSERT INTO `distribution` VALUES ("Si",28,27.976927,92.23,@current_table_id);
INSERT INTO `distribution` VALUES ("Si",29,28.976495,4.67,@current_table_id);
INSERT INTO `distribution` VALUES ("Si",30,29.97377,3.1,@current_table_id);
INSERT INTO `distribution` VALUES ("P",31,30.973762,100,@current_table_id);
INSERT INTO `distribution` VALUES ("S",32,31.97207,95.02,@current_table_id);
INSERT INTO `distribution` VALUES ("S",33,32.971456,0.75,@current_table_id);
INSERT INTO `distribution` VALUES ("S",34,33.967866,4.21,@current_table_id);
INSERT INTO `distribution` VALUES ("S",36,35.96708,0.02,@current_table_id);
INSERT INTO `distribution` VALUES ("Cl",35,34.968852,75.77,@current_table_id);
INSERT INTO `distribution` VALUES ("Cl",37,36.965903,24.23,@current_table_id);
INSERT INTO `distribution` VALUES ("Ar",36,35.967545,0.337,@current_table_id);
INSERT INTO `distribution` VALUES ("Ar",38,37.962732,0.063,@current_table_id);
INSERT INTO `distribution` VALUES ("Ar",40,39.962384,99.6,@current_table_id);
INSERT INTO `distribution` VALUES ("K",39,38.963707,93.2581,@current_table_id);
INSERT INTO `distribution` VALUES ("K",40,39.963999,0.0117,@current_table_id);
INSERT INTO `distribution` VALUES ("K",41,40.961825,6.7302,@current_table_id);
INSERT INTO `distribution` VALUES ("Ca",40,39.962591,96.941,@current_table_id);
INSERT INTO `distribution` VALUES ("Ca",42,41.958618,0.647,@current_table_id);
INSERT INTO `distribution` VALUES ("Ca",43,42.958766,0.135,@current_table_id);
INSERT INTO `distribution` VALUES ("Ca",44,43.95548,2.086,@current_table_id);
INSERT INTO `distribution` VALUES ("Ca",46,45.953689,0.004,@current_table_id);
INSERT INTO `distribution` VALUES ("Ca",48,47.952533,0.187,@current_table_id);
INSERT INTO `distribution` VALUES ("Sc",45,44.95591,100,@current_table_id);
INSERT INTO `distribution` VALUES ("Ti",46,45.952629,8,@current_table_id);
INSERT INTO `distribution` VALUES ("Ti",47,46.951764,7.3,@current_table_id);
INSERT INTO `distribution` VALUES ("Ti",48,47.947947,73.8,@current_table_id);
INSERT INTO `distribution` VALUES ("Ti",49,48.947871,5.5,@current_table_id);
INSERT INTO `distribution` VALUES ("Ti",50,49.944792,5.4,@current_table_id);
INSERT INTO `distribution` VALUES ("V",50,49.947161,0.25,@current_table_id);
INSERT INTO `distribution` VALUES ("V",51,50.943962,99.75,@current_table_id);
INSERT INTO `distribution` VALUES ("Cr",50,49.946046,4.35,@current_table_id);
INSERT INTO `distribution` VALUES ("Cr",52,51.940509,83.79,@current_table_id);
INSERT INTO `distribution` VALUES ("Cr",53,52.940651,9.5,@current_table_id);
INSERT INTO `distribution` VALUES ("Cr",54,53.938882,2.36,@current_table_id);
INSERT INTO `distribution` VALUES ("Mn",55,54.938047,100,@current_table_id);
INSERT INTO `distribution` VALUES ("Fe",54,53.939612,5.8,@current_table_id);
INSERT INTO `distribution` VALUES ("Fe",56,55.934939,91.72,@current_table_id);
INSERT INTO `distribution` VALUES ("Fe",57,56.935396,2.2,@current_table_id);
INSERT INTO `distribution` VALUES ("Fe",58,57.933277,0.28,@current_table_id);
INSERT INTO `distribution` VALUES ("Co",59,58.933198,100,@current_table_id);
INSERT INTO `distribution` VALUES ("Ni",58,57.935346,68.27,@current_table_id);
INSERT INTO `distribution` VALUES ("Ni",60,59.930788,26.1,@current_table_id);
INSERT INTO `distribution` VALUES ("Ni",61,60.931058,1.13,@current_table_id);
INSERT INTO `distribution` VALUES ("Ni",62,61.928346,3.59,@current_table_id);
INSERT INTO `distribution` VALUES ("Ni",64,63.927968,0.91,@current_table_id);
INSERT INTO `distribution` VALUES ("Cu",63,62.939598,69.17,@current_table_id);
INSERT INTO `distribution` VALUES ("Cu",65,64.927793,30.83,@current_table_id);
INSERT INTO `distribution` VALUES ("Zn",64,63.929145,48.6,@current_table_id);
INSERT INTO `distribution` VALUES ("Zn",66,65.926034,27.9,@current_table_id);
INSERT INTO `distribution` VALUES ("Zn",67,66.927129,4.1,@current_table_id);
INSERT INTO `distribution` VALUES ("Zn",68,67.924846,18.8,@current_table_id);
INSERT INTO `distribution` VALUES ("Zn",70,69.925325,0.6,@current_table_id);
INSERT INTO `distribution` VALUES ("Ga",69,68.92558,60.1,@current_table_id);
INSERT INTO `distribution` VALUES ("Ga",71,70.9247,39.9,@current_table_id);
INSERT INTO `distribution` VALUES ("Ge",70,69.92425,20.5,@current_table_id);
INSERT INTO `distribution` VALUES ("Ge",72,71.922079,27.4,@current_table_id);
INSERT INTO `distribution` VALUES ("Ge",73,72.923463,7.8,@current_table_id);
INSERT INTO `distribution` VALUES ("Ge",74,73.921177,36.5,@current_table_id);
INSERT INTO `distribution` VALUES ("Ge",76,75.921401,7.8,@current_table_id);
INSERT INTO `distribution` VALUES ("As",75,74.921594,100,@current_table_id);
INSERT INTO `distribution` VALUES ("Se",74,73.922475,0.9,@current_table_id);
INSERT INTO `distribution` VALUES ("Se",76,75.919212,9,@current_table_id);
INSERT INTO `distribution` VALUES ("Se",77,76.919912,7.6,@current_table_id);
INSERT INTO `distribution` VALUES ("Se",78,77.917304,23.5,@current_table_id);
INSERT INTO `distribution` VALUES ("Se",80,79.91652,49.6,@current_table_id);
INSERT INTO `distribution` VALUES ("Se",82,81.916698,9.4,@current_table_id);
INSERT INTO `distribution` VALUES ("Br",79,78.918336,50.69,@current_table_id);
INSERT INTO `distribution` VALUES ("Br",81,80.916289,49.31,@current_table_id);
INSERT INTO `distribution` VALUES ("Kr",78,77.920397,0.35,@current_table_id);
INSERT INTO `distribution` VALUES ("Kr",80,79.91638,2.25,@current_table_id);
INSERT INTO `distribution` VALUES ("Kr",82,81.913482,11.6,@current_table_id);
INSERT INTO `distribution` VALUES ("Kr",83,82.914135,11.5,@current_table_id);
INSERT INTO `distribution` VALUES ("Kr",84,83.911507,57,@current_table_id);
INSERT INTO `distribution` VALUES ("Kr",86,85.910616,17.3,@current_table_id);
INSERT INTO `distribution` VALUES ("Rb",85,84.911794,72.17,@current_table_id);
INSERT INTO `distribution` VALUES ("Rb",87,86.909187,27.83,@current_table_id);
INSERT INTO `distribution` VALUES ("Sr",84,83.91343,0.56,@current_table_id);
INSERT INTO `distribution` VALUES ("Sr",86,85.909267,9.86,@current_table_id);
INSERT INTO `distribution` VALUES ("Sr",87,86.908884,7,@current_table_id);
INSERT INTO `distribution` VALUES ("Sr",88,87.905619,82.58,@current_table_id);
INSERT INTO `distribution` VALUES ("Y",89,88.905849,100,@current_table_id);
INSERT INTO `distribution` VALUES ("Zr",90,89.904703,51.45,@current_table_id);
INSERT INTO `distribution` VALUES ("Zr",91,90.905644,11.27,@current_table_id);
INSERT INTO `distribution` VALUES ("Zr",92,91.905039,17.17,@current_table_id);
INSERT INTO `distribution` VALUES ("Zr",94,93.906314,17.33,@current_table_id);
INSERT INTO `distribution` VALUES ("Zr",96,95.908275,2.78,@current_table_id);
INSERT INTO `distribution` VALUES ("Nb",93,92.906377,100,@current_table_id);
INSERT INTO `distribution` VALUES ("Mo",92,91.906088,14.84,@current_table_id);
INSERT INTO `distribution` VALUES ("Mo",94,93.905085,9.25,@current_table_id);
INSERT INTO `distribution` VALUES ("Mo",95,94.90584,15.92,@current_table_id);
INSERT INTO `distribution` VALUES ("Mo",96,95.904678,16.68,@current_table_id);
INSERT INTO `distribution` VALUES ("Mo",97,96.90602,9.55,@current_table_id);
INSERT INTO `distribution` VALUES ("Mo",98,97.905406,24.13,@current_table_id);
INSERT INTO `distribution` VALUES ("Mo",100,99.907477,9.63,@current_table_id);
INSERT INTO `distribution` VALUES ("Ru",96,95.907599,5.52,@current_table_id);
INSERT INTO `distribution` VALUES ("Ru",98,97.905287,1.88,@current_table_id);
INSERT INTO `distribution` VALUES ("Ru",99,98.905939,12.7,@current_table_id);
INSERT INTO `distribution` VALUES ("Ru",100,99.904219,12.6,@current_table_id);
INSERT INTO `distribution` VALUES ("Ru",101,100.905582,17,@current_table_id);
INSERT INTO `distribution` VALUES ("Ru",102,101.904348,31.6,@current_table_id);
INSERT INTO `distribution` VALUES ("Ru",104,103.905424,18.7,@current_table_id);
INSERT INTO `distribution` VALUES ("Rh",103,102.9055,100,@current_table_id);
INSERT INTO `distribution` VALUES ("Pd",102,101.905634,1.02,@current_table_id);
INSERT INTO `distribution` VALUES ("Pd",104,103.904029,11.14,@current_table_id);
INSERT INTO `distribution` VALUES ("Pd",105,104.905079,22.33,@current_table_id);
INSERT INTO `distribution` VALUES ("Pd",106,105.903478,27.33,@current_table_id);
INSERT INTO `distribution` VALUES ("Pd",108,107.903895,26.46,@current_table_id);
INSERT INTO `distribution` VALUES ("Pd",110,109.905167,11.72,@current_table_id);
INSERT INTO `distribution` VALUES ("Ag",107,106.905092,51.84,@current_table_id);
INSERT INTO `distribution` VALUES ("Ag",109,108.904757,48.16,@current_table_id);
INSERT INTO `distribution` VALUES ("Cd",106,105.906461,1.25,@current_table_id);
INSERT INTO `distribution` VALUES ("Cd",108,107.904176,0.89,@current_table_id);
INSERT INTO `distribution` VALUES ("Cd",110,109.903005,12.49,@current_table_id);
INSERT INTO `distribution` VALUES ("Cd",111,110.904182,12.8,@current_table_id);
INSERT INTO `distribution` VALUES ("Cd",112,111.902758,24.13,@current_table_id);
INSERT INTO `distribution` VALUES ("Cd",113,112.9044,12.22,@current_table_id);
INSERT INTO `distribution` VALUES ("Cd",114,113.903357,28.73,@current_table_id);
INSERT INTO `distribution` VALUES ("Cd",116,115.904754,7.49,@current_table_id);
INSERT INTO `distribution` VALUES ("In",113,112.904061,4.3,@current_table_id);
INSERT INTO `distribution` VALUES ("In",115,114.90388,95.7,@current_table_id);
INSERT INTO `distribution` VALUES ("Sn",112,111.904826,1,@current_table_id);
INSERT INTO `distribution` VALUES ("Sn",114,113.902784,0.7,@current_table_id);
INSERT INTO `distribution` VALUES ("Sn",115,114.903348,0.4,@current_table_id);
INSERT INTO `distribution` VALUES ("Sn",116,115.901747,14.7,@current_table_id);
INSERT INTO `distribution` VALUES ("Sn",117,116.902956,7.7,@current_table_id);
INSERT INTO `distribution` VALUES ("Sn",118,117.901609,24.3,@current_table_id);
INSERT INTO `distribution` VALUES ("Sn",119,118.90331,8.6,@current_table_id);
INSERT INTO `distribution` VALUES ("Sn",120,119.9022,32.4,@current_table_id);
INSERT INTO `distribution` VALUES ("Sn",122,121.90344,4.6,@current_table_id);
INSERT INTO `distribution` VALUES ("Sn",124,123.905274,5.66,@current_table_id);
INSERT INTO `distribution` VALUES ("Sb",121,120.903821,57.3,@current_table_id);
INSERT INTO `distribution` VALUES ("Sb",123,122.904216,42.7,@current_table_id);
INSERT INTO `distribution` VALUES ("Te",120,119.904048,0.096,@current_table_id);
INSERT INTO `distribution` VALUES ("Te",122,121.903054,2.6,@current_table_id);
INSERT INTO `distribution` VALUES ("Te",123,122.904271,0.908,@current_table_id);
INSERT INTO `distribution` VALUES ("Te",124,123.902823,4.816,@current_table_id);
INSERT INTO `distribution` VALUES ("Te",125,124.904433,7.14,@current_table_id);
INSERT INTO `distribution` VALUES ("Te",126,125.903314,18.95,@current_table_id);
INSERT INTO `distribution` VALUES ("Te",128,127.904463,31.69,@current_table_id);
INSERT INTO `distribution` VALUES ("Te",130,129.906229,33.8,@current_table_id);
INSERT INTO `distribution` VALUES ("I",127,126.904473,100,@current_table_id);
INSERT INTO `distribution` VALUES ("Xe",124,123.905894,0.1,@current_table_id);
INSERT INTO `distribution` VALUES ("Xe",126,125.904281,0.09,@current_table_id);
INSERT INTO `distribution` VALUES ("Xe",128,127.903531,1.91,@current_table_id);
INSERT INTO `distribution` VALUES ("Xe",129,128.90478,26.4,@current_table_id);
INSERT INTO `distribution` VALUES ("Xe",130,129.903509,4.1,@current_table_id);
INSERT INTO `distribution` VALUES ("Xe",131,130.905072,21.2,@current_table_id);
INSERT INTO `distribution` VALUES ("Xe",132,131.904144,26.9,@current_table_id);
INSERT INTO `distribution` VALUES ("Xe",134,133.905395,10.4,@current_table_id);
INSERT INTO `distribution` VALUES ("Xe",136,135.907214,8.9,@current_table_id);
INSERT INTO `distribution` VALUES ("Cs",133,132.905429,100,@current_table_id);
INSERT INTO `distribution` VALUES ("Ba",130,129.906282,0.106,@current_table_id);
INSERT INTO `distribution` VALUES ("Ba",132,131.905042,0.101,@current_table_id);
INSERT INTO `distribution` VALUES ("Ba",134,133.904486,2.417,@current_table_id);
INSERT INTO `distribution` VALUES ("Ba",135,134.905665,6.592,@current_table_id);
INSERT INTO `distribution` VALUES ("Ba",136,135.904553,7.854,@current_table_id);
INSERT INTO `distribution` VALUES ("Ba",137,136.905812,11.23,@current_table_id);
INSERT INTO `distribution` VALUES ("Ba",138,137.905232,71.7,@current_table_id);
INSERT INTO `distribution` VALUES ("La",138,137.907105,0.09,@current_table_id);
INSERT INTO `distribution` VALUES ("La",139,138.906346,99.91,@current_table_id);
INSERT INTO `distribution` VALUES ("Ce",136,135.90714,0.19,@current_table_id);
INSERT INTO `distribution` VALUES ("Ce",138,137.905985,0.25,@current_table_id);
INSERT INTO `distribution` VALUES ("Ce",140,139.905433,88.48,@current_table_id);
INSERT INTO `distribution` VALUES ("Ce",142,141.909241,11.08,@current_table_id);
INSERT INTO `distribution` VALUES ("Pr",141,140.907647,100,@current_table_id);
INSERT INTO `distribution` VALUES ("Nd",142,141.907719,27.13,@current_table_id);
INSERT INTO `distribution` VALUES ("Nd",143,142.90981,12.18,@current_table_id);
INSERT INTO `distribution` VALUES ("Nd",144,143.910083,23.8,@current_table_id);
INSERT INTO `distribution` VALUES ("Nd",145,144.91257,8.3,@current_table_id);
INSERT INTO `distribution` VALUES ("Nd",146,145.913113,17.19,@current_table_id);
INSERT INTO `distribution` VALUES ("Nd",148,147.916889,5.76,@current_table_id);
INSERT INTO `distribution` VALUES ("Nd",150,149.920887,5.64,@current_table_id);
INSERT INTO `distribution` VALUES ("Sm",144,143.911998,3.1,@current_table_id);
INSERT INTO `distribution` VALUES ("Sm",147,146.914895,15,@current_table_id);
INSERT INTO `distribution` VALUES ("Sm",148,147.91482,11.3,@current_table_id);
INSERT INTO `distribution` VALUES ("Sm",149,148.917181,13.8,@current_table_id);
INSERT INTO `distribution` VALUES ("Sm",150,149.917273,7.4,@current_table_id);
INSERT INTO `distribution` VALUES ("Sm",152,151.919729,26.7,@current_table_id);
INSERT INTO `distribution` VALUES ("Sm",154,153.922206,22.7,@current_table_id);
INSERT INTO `distribution` VALUES ("Eu",151,150.919847,47.8,@current_table_id);
INSERT INTO `distribution` VALUES ("Eu",153,152.921225,52.2,@current_table_id);
INSERT INTO `distribution` VALUES ("Gd",152,151.919786,0.2,@current_table_id);
INSERT INTO `distribution` VALUES ("Gd",154,153.920861,2.18,@current_table_id);
INSERT INTO `distribution` VALUES ("Gd",155,154.922618,14.8,@current_table_id);
INSERT INTO `distribution` VALUES ("Gd",156,155.922118,20.47,@current_table_id);
INSERT INTO `distribution` VALUES ("Gd",157,156.923956,15.65,@current_table_id);
INSERT INTO `distribution` VALUES ("Gd",158,157.924099,24.84,@current_table_id);
INSERT INTO `distribution` VALUES ("Gd",160,159.927049,21.86,@current_table_id);
INSERT INTO `distribution` VALUES ("Tb",159,158.925342,100,@current_table_id);
INSERT INTO `distribution` VALUES ("Dy",156,155.925277,0.06,@current_table_id);
INSERT INTO `distribution` VALUES ("Dy",158,157.924403,0.1,@current_table_id);
INSERT INTO `distribution` VALUES ("Dy",160,159.925193,2.34,@current_table_id);
INSERT INTO `distribution` VALUES ("Dy",161,160.92693,18.9,@current_table_id);
INSERT INTO `distribution` VALUES ("Dy",162,161.926795,25.5,@current_table_id);
INSERT INTO `distribution` VALUES ("Dy",163,162.928728,24.9,@current_table_id);
INSERT INTO `distribution` VALUES ("Dy",164,163.929171,28.2,@current_table_id);
INSERT INTO `distribution` VALUES ("Ho",165,164.930319,100,@current_table_id);
INSERT INTO `distribution` VALUES ("Er",162,161.928775,0.14,@current_table_id);
INSERT INTO `distribution` VALUES ("Er",164,163.929198,1.61,@current_table_id);
INSERT INTO `distribution` VALUES ("Er",166,165.93029,33.6,@current_table_id);
INSERT INTO `distribution` VALUES ("Er",167,166.932046,22.95,@current_table_id);
INSERT INTO `distribution` VALUES ("Er",168,167.932368,26.8,@current_table_id);
INSERT INTO `distribution` VALUES ("Er",170,169.935461,14.9,@current_table_id);
INSERT INTO `distribution` VALUES ("Tm",169,168.934212,100,@current_table_id);
INSERT INTO `distribution` VALUES ("Yb",168,167.933894,0.13,@current_table_id);
INSERT INTO `distribution` VALUES ("Yb",170,169.934759,3.05,@current_table_id);
INSERT INTO `distribution` VALUES ("Yb",171,170.936323,14.3,@current_table_id);
INSERT INTO `distribution` VALUES ("Yb",172,171.936378,21.9,@current_table_id);
INSERT INTO `distribution` VALUES ("Yb",173,172.938208,16.12,@current_table_id);
INSERT INTO `distribution` VALUES ("Yb",174,173.938859,31.8,@current_table_id);
INSERT INTO `distribution` VALUES ("Yb",176,175.942564,12.7,@current_table_id);
INSERT INTO `distribution` VALUES ("Lu",175,174.94077,97.41,@current_table_id);
INSERT INTO `distribution` VALUES ("Lu",176,175.942679,2.59,@current_table_id);
INSERT INTO `distribution` VALUES ("Hf",174,173.940044,0.16,@current_table_id);
INSERT INTO `distribution` VALUES ("Hf",176,175.941406,5.2,@current_table_id);
INSERT INTO `distribution` VALUES ("Hf",177,176.943217,18.6,@current_table_id);
INSERT INTO `distribution` VALUES ("Hf",178,177.943696,27.1,@current_table_id);
INSERT INTO `distribution` VALUES ("Hf",179,178.945812,13.74,@current_table_id);
INSERT INTO `distribution` VALUES ("Hf",180,179.946545,35.2,@current_table_id);
INSERT INTO `distribution` VALUES ("Ta",180,179.947462,0.012,@current_table_id);
INSERT INTO `distribution` VALUES ("Ta",181,180.947992,99.988,@current_table_id);
INSERT INTO `distribution` VALUES ("W",180,179.946701,0.13,@current_table_id);
INSERT INTO `distribution` VALUES ("W",182,181.948202,26.3,@current_table_id);
INSERT INTO `distribution` VALUES ("W",183,182.95022,14.3,@current_table_id);
INSERT INTO `distribution` VALUES ("W",184,183.950928,30.67,@current_table_id);
INSERT INTO `distribution` VALUES ("W",186,185.954357,28.6,@current_table_id);
INSERT INTO `distribution` VALUES ("Re",185,184.952951,37.4,@current_table_id);
INSERT INTO `distribution` VALUES ("Re",187,186.955744,62.6,@current_table_id);
INSERT INTO `distribution` VALUES ("Os",184,183.952488,0.02,@current_table_id);
INSERT INTO `distribution` VALUES ("Os",186,185.95383,1.58,@current_table_id);
INSERT INTO `distribution` VALUES ("Os",187,186.955741,1.6,@current_table_id);
INSERT INTO `distribution` VALUES ("Os",188,187.95586,13.3,@current_table_id);
INSERT INTO `distribution` VALUES ("Os",189,188.958137,16.1,@current_table_id);
INSERT INTO `distribution` VALUES ("Os",190,189.958436,26.4,@current_table_id);
INSERT INTO `distribution` VALUES ("Os",192,191.961467,41,@current_table_id);
INSERT INTO `distribution` VALUES ("Ir",191,190.960584,37.3,@current_table_id);
INSERT INTO `distribution` VALUES ("Ir",193,192.962917,62.7,@current_table_id);
INSERT INTO `distribution` VALUES ("Pt",190,189.959917,0.01,@current_table_id);
INSERT INTO `distribution` VALUES ("Pt",192,191.961019,0.79,@current_table_id);
INSERT INTO `distribution` VALUES ("Pt",194,193.962655,32.9,@current_table_id);
INSERT INTO `distribution` VALUES ("Pt",195,194.964766,33.8,@current_table_id);
INSERT INTO `distribution` VALUES ("Pt",196,195.964926,25.3,@current_table_id);
INSERT INTO `distribution` VALUES ("Pt",198,197.967869,7.2,@current_table_id);
INSERT INTO `distribution` VALUES ("Au",197,196.966543,100,@current_table_id);
INSERT INTO `distribution` VALUES ("Hg",196,195.965807,0.15,@current_table_id);
INSERT INTO `distribution` VALUES ("Hg",198,197.966743,10.1,@current_table_id);
INSERT INTO `distribution` VALUES ("Hg",199,198.968254,17,@current_table_id);
INSERT INTO `distribution` VALUES ("Hg",200,199.9683,23.1,@current_table_id);
INSERT INTO `distribution` VALUES ("Hg",201,200.970277,13.2,@current_table_id);
INSERT INTO `distribution` VALUES ("Hg",202,201.970617,29.65,@current_table_id);
INSERT INTO `distribution` VALUES ("Hg",204,203.973467,6.8,@current_table_id);
INSERT INTO `distribution` VALUES ("Tl",203,202.97232,29.524,@current_table_id);
INSERT INTO `distribution` VALUES ("Tl",205,204.974401,70.476,@current_table_id);
INSERT INTO `distribution` VALUES ("Pb",204,203.97302,1.4,@current_table_id);
INSERT INTO `distribution` VALUES ("Pb",206,205.97444,24.1,@current_table_id);
INSERT INTO `distribution` VALUES ("Pb",207,206.975872,22.1,@current_table_id);
INSERT INTO `distribution` VALUES ("Pb",208,207.976627,52.4,@current_table_id);
INSERT INTO `distribution` VALUES ("Bi",209,208.980374,100,@current_table_id);
INSERT INTO `distribution` VALUES ("Th",232,232.038054,100,@current_table_id);
INSERT INTO `distribution` VALUES ("U",234,234.040946,0.0055,@current_table_id);
INSERT INTO `distribution` VALUES ("U",235,235.043924,0.72,@current_table_id);
INSERT INTO `distribution` VALUES ("U",238,238.050784,99.2745,@current_table_id);
INSERT INTO `composition` VALUES ("K", "K", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Na", "Na", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Os", "Os", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Re", "Re", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Ru", "Ru", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Be", "Be", 1, @current_table_id);
INSERT INTO `composition` VALUES ("U", "U", 1, @current_table_id);
INSERT INTO `composition` VALUES ("P", "P", 1, @current_table_id);
INSERT INTO `composition` VALUES ("V", "V", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Mg", "Mg", 1, @current_table_id);
INSERT INTO `composition` VALUES ("F", "F", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Fe", "Fe", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Ta", "Ta", 1, @current_table_id);
INSERT INTO `composition` VALUES ("B", "B", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Ar", "Ar", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Hf", "Hf", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Lu", "Lu", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Tm", "Tm", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Ir", "Ir", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Cu", "Cu", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Eu", "Eu", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Te", "Te", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Y", "Y", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Cr", "Cr", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Ba", "Ba", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Ti", "Ti", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Bi", "Bi", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Ni", "Ni", 1, @current_table_id);
INSERT INTO `composition` VALUES ("O", "O", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Gd", "Gd", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Zn", "Zn", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Si", "Si", 1, @current_table_id);
INSERT INTO `composition` VALUES ("I", "I", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Rh", "Rh", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Ga", "Ga", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Mn", "Mn", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Sr", "Sr", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Au", "Au", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Al", "Al", 1, @current_table_id);
INSERT INTO `composition` VALUES ("As", "As", 1, @current_table_id);
INSERT INTO `composition` VALUES ("N", "N", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Ho", "Ho", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Pr", "Pr", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Ge", "Ge", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Ag", "Ag", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Co", "Co", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Hg", "Hg", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Pd", "Pd", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Tl", "Tl", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Zr", "Zr", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Ca", "Ca", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Rb", "Rb", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Se", "Se", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Kr", "Kr", 1, @current_table_id);
INSERT INTO `composition` VALUES ("La", "La", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Cd", "Cd", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Ne", "Ne", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Pt", "Pt", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Pb", "Pb", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Cl", "Cl", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Sm", "Sm", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Mo", "Mo", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Yb", "Yb", 1, @current_table_id);
INSERT INTO `composition` VALUES ("S", "S", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Th", "Th", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Xe", "Xe", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Sn", "Sn", 1, @current_table_id);
INSERT INTO `composition` VALUES ("H", "H", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Dy", "Dy", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Ce", "Ce", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Tb", "Tb", 1, @current_table_id);
INSERT INTO `composition` VALUES ("W", "W", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Br", "Br", 1, @current_table_id);
INSERT INTO `composition` VALUES ("C", "C", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Sc", "Sc", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Nb", "Nb", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Er", "Er", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Cs", "Cs", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Li", "Li", 1, @current_table_id);
INSERT INTO `composition` VALUES ("He", "He", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Sb", "Sb", 1, @current_table_id);
INSERT INTO `composition` VALUES ("In", "In", 1, @current_table_id);
INSERT INTO `composition` VALUES ("Nd", "Nd", 1, @current_table_id);
