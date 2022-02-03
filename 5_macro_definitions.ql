import cpp 
import semmle.code.cpp.Macro

from MacroAccess m
where m.getMacroName().matches("ntoh%")
select m