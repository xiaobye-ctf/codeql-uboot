import cpp 
class NetBytesSwap extends Expr{
    NetBytesSwap(){
        exists( MacroInvocation m | m.getMacroName().matches("ntoh%") and m.getExpr() = this)
    }
}
from NetBytesSwap nbs
select nbs