;    This UDO generates an AHDSR with tension control
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

; TODO: Convert every variable after attack tension to k-rate,
;		allowing the attributes of each section to be changed before it is reached.

opcode expTen, i, i
xin iTension
; UDO for generating exponent from tension value
; The fairly magic function is: f = (x * 2 - 2) ^ 2
; x = tension value
; f = exponent

iExponent = (iTension * 2 - 2) ^ 2

xout iExponent
endop


opcode ahdsr, a, iiiiiiii
xin iAttack, iAttackTension, iHold, iDecay, iDecayTension, iSustain, iRelease, iReleaseTension

; Generating exponents based on tension value, which is intended to be between 0 and 1. With 0.5 being linear.
iAttackExponent expTen iAttackTension
iDecayExponent expTen iDecayTension
iReleaseExponent expTen iReleaseTension

; Generating each segment
;						A		>		B		>		C		>		D		>		E		>		F		>		G		>		H
aAttackCurve linseg		0,		iAttack,1,		0,		0
aHoldCurve linseg		0,		iAttack,0,		0,		1,		iHold,	1,		0,		0
aDecayCurve linseg		0,		iAttack,0,		0,		0,		iHold,	0,		0,		1,		iDecay,	iSustain,0,		0
aReleaseCurve linseg	0,		iAttack,0,		0,		0,		iHold,	0,		0,		0,		iDecay,	0,		0,		1,		iRelease,0

; Adding them together



xout aOut
endop
