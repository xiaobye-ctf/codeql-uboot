import cpp 
import semmle.code.cpp.Macro

from Macro m
where m.getName().matches("ntoh%")
select m