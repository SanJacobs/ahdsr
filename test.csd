;    This tests ahdsr.udo
;    Copyright (C) 2021 - Sander J. Skjegstad
;
;    This program is free software: you can redistribute it and/or modify
;    it under the terms of the GNU General Public License as published by
;    the Free Software Foundation, either version 3 of the License, or
;    any later version.
;
;    This program is distributed in the hope that it will be useful,
;    but WITHOUT ANY WARRANTY; without even the implied warranty of
;    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;    GNU General Public License for more details.
;
;    You should have received a copy of the GNU General Public License
;    along with this program.  If not, see <https://www.gnu.org/licenses/>.

<CsoundSynthesizer>
<CsOptions>
-odac
-Mhw:2,0,0
-b256 -B512
</CsOptions>
; ==============================================
<CsInstruments>

sr	=	48000
ksmps	=	1
;nchnls	=	2
0dbfs	=	1

instr 1
; #############
; ### AHDSR ###
; #############

iAttack = 1
iAttackTension = 0.5

iHold = 0.5

iDecay = 1
iDecayTension = 0.9

iSustain = 2

iRelease = 1.5
iReleaseTension = 0.3


kAHDSR ahdsr iAttack, iAttackTension, iHold, iDecay, iDecayTension, iSustain, iRelease, iReleaseTension

printk2 kAHDSR 

endin

</CsInstruments>
; ==============================================
<CsScore> 

</CsScore>
</CsoundSynthesizer>

