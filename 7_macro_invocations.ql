import cpp 

from MacroInvocation m
where m.getMacroName().matches("ntoh%") 
select m.getExpr()