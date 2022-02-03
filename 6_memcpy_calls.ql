import cpp 

from Function f, FunctionCall fc
where fc.getTarget().getName() = "memcpy"
// 以上等價於 where f.getName() = "memcpy" and f = fc.getTarget()
select fc
