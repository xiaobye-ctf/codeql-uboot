import cpp 

from Function f, FunctionCall fc
where f.getName() = "memcpy" and f = fc.getTarget()
select fc
