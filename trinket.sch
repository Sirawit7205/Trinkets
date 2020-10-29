EESchema Schematic File Version 4
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Microchip_ATtiny:ATtiny414-SS U1
U 1 1 5DBF0798
P 4050 4150
F 0 "U1" H 4050 5028 50  0000 C CNN
F 1 "ATtiny414-SS" H 4050 4937 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 4050 4150 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/40001912A.pdf" H 4050 4150 50  0001 C CNN
	1    4050 4150
	1    0    0    -1  
$EndComp
$Comp
L Display_Character:MAN71A U2
U 1 1 5DBF0891
P 5950 4150
F 0 "U2" H 5950 4817 50  0000 C CNN
F 1 "MAN71A" H 5950 4726 50  0000 C CNN
F 2 "Display_7Segment:MAN71A" H 5450 3450 50  0001 L CNN
F 3 "https://www.digchip.com/datasheets/parts/datasheet/161/MAN3640A-pdf.php" H 5960 4490 50  0001 L CNN
	1    5950 4150
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_SPDT SW1
U 1 1 5DBF0969
P 1650 3900
F 0 "SW1" V 1650 3650 50  0000 C CNN
F 1 "POWER" V 1550 3600 50  0000 C CNN
F 2 "" H 1650 3900 50  0001 C CNN
F 3 "" H 1650 3900 50  0001 C CNN
	1    1650 3900
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C1
U 1 1 5DBF0A45
P 2950 4100
F 0 "C1" H 3065 4146 50  0000 L CNN
F 1 "100nF" H 3065 4055 50  0000 L CNN
F 2 "" H 2988 3950 50  0001 C CNN
F 3 "~" H 2950 4100 50  0001 C CNN
	1    2950 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5DBF0AF2
P 5150 3750
F 0 "R1" V 4943 3750 50  0001 C CNN
F 1 "1k" V 5034 3750 50  0001 C CNN
F 2 "" V 5080 3750 50  0001 C CNN
F 3 "~" H 5150 3750 50  0001 C CNN
	1    5150 3750
	0    1    1    0   
$EndComp
$Comp
L Device:Battery BT1
U 1 1 5DBF0CF0
P 1650 4550
F 0 "BT1" H 1758 4596 50  0000 L CNN
F 1 "3V CR2032" H 1758 4505 50  0000 L CNN
F 2 "" V 1650 4610 50  0001 C CNN
F 3 "~" V 1650 4610 50  0001 C CNN
	1    1650 4550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5DBF1359
P 5150 3850
F 0 "R2" V 4943 3850 50  0001 C CNN
F 1 "1k" V 5034 3850 50  0001 C CNN
F 2 "" V 5080 3850 50  0001 C CNN
F 3 "~" H 5150 3850 50  0001 C CNN
	1    5150 3850
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 5DBF136E
P 5150 3950
F 0 "R3" V 4943 3950 50  0001 C CNN
F 1 "1k" V 5034 3950 50  0001 C CNN
F 2 "" V 5080 3950 50  0001 C CNN
F 3 "~" H 5150 3950 50  0001 C CNN
	1    5150 3950
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 5DBF1383
P 5150 4050
F 0 "R4" V 4943 4050 50  0001 C CNN
F 1 "1k" V 5034 4050 50  0001 C CNN
F 2 "" V 5080 4050 50  0001 C CNN
F 3 "~" H 5150 4050 50  0001 C CNN
	1    5150 4050
	0    1    1    0   
$EndComp
$Comp
L Device:R R5
U 1 1 5DBF1398
P 5150 4150
F 0 "R5" V 4943 4150 50  0001 C CNN
F 1 "1k" V 5034 4150 50  0001 C CNN
F 2 "" V 5080 4150 50  0001 C CNN
F 3 "~" H 5150 4150 50  0001 C CNN
	1    5150 4150
	0    1    1    0   
$EndComp
$Comp
L Device:R R6
U 1 1 5DBF13AD
P 5150 4250
F 0 "R6" V 4943 4250 50  0001 C CNN
F 1 "1k" V 5034 4250 50  0001 C CNN
F 2 "" V 5080 4250 50  0001 C CNN
F 3 "~" H 5150 4250 50  0001 C CNN
	1    5150 4250
	0    1    1    0   
$EndComp
$Comp
L Device:R R7
U 1 1 5DBF13C2
P 5150 4350
F 0 "R7" V 4943 4350 50  0001 C CNN
F 1 "1k" V 5034 4350 50  0001 C CNN
F 2 "" V 5080 4350 50  0001 C CNN
F 3 "~" H 5150 4350 50  0001 C CNN
	1    5150 4350
	0    1    1    0   
$EndComp
Wire Wire Line
	4650 3750 5000 3750
Wire Wire Line
	4650 3850 5000 3850
Wire Wire Line
	4650 3950 5000 3950
Wire Wire Line
	4650 4050 5000 4050
Wire Wire Line
	4650 4150 5000 4150
Wire Wire Line
	4650 4250 5000 4250
Wire Wire Line
	4650 4350 5000 4350
Wire Wire Line
	1650 4100 1650 4350
Text Notes 1800 3600 1    50   ~ 0
CUT THIS LEG
Wire Wire Line
	4050 3450 2950 3450
Wire Wire Line
	2950 3450 2950 3950
Wire Wire Line
	2950 4250 2950 4850
Wire Wire Line
	2950 4850 4050 4850
Wire Wire Line
	1550 3700 1550 3000
Wire Wire Line
	1550 3000 2950 3000
Wire Wire Line
	2950 3000 2950 3450
Connection ~ 2950 3450
Wire Wire Line
	1650 4750 1650 4850
Wire Wire Line
	1650 4850 2950 4850
Connection ~ 2950 4850
Text Notes 5400 3650 2    50   ~ 0
1K resistors
Wire Wire Line
	5300 3750 5650 3750
Wire Wire Line
	5300 3850 5650 3850
Wire Wire Line
	5300 3950 5650 3950
Wire Wire Line
	5300 4050 5650 4050
Wire Wire Line
	5300 4150 5650 4150
Wire Wire Line
	5300 4250 5650 4250
Wire Wire Line
	5300 4350 5650 4350
Text Notes 6300 4700 0    50   ~ 0
CUT\nBOTTOM ANODE
Connection ~ 2950 3000
Wire Wire Line
	6250 4450 6350 4450
Wire Wire Line
	6350 4450 6350 3000
Wire Wire Line
	6350 3000 2950 3000
$EndSCHEMATC
