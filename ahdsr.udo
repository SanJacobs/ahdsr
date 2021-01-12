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

opcode ahdsr, a, iiiiiiii

xin iAttack, iAttackTension, iHold, iDecay, iDecayTension, iSustain, iRelease, iReleaseTension

xout aOut

endop
