import cpp
import semmle.code.cpp.dataflow.DataFlow
import DataFlow::PathGraph
import semmle.code.cpp.dataflow.TaintTracking

class NetBytesSwap extends Expr{
    NetBytesSwap(){
        exists( MacroInvocation m | m.getMacroName().matches("ntoh%") and m.getExpr() = this)
    }
    predicate  isNetBytesSwap(Expr e){
        e = this
    }
}
class MyTaintTrackingConfiguration extends TaintTracking::Configuration {
    MyTaintTrackingConfiguration() { this = "MyTaintTrackingConfiguration" }

    override predicate isSource(DataFlow::Node source) {
        exists(NetBytesSwap nbs | nbs.isNetBytesSwap(source.asExpr()))
    }

    override predicate isSink(DataFlow::Node sink) {
        exists(FunctionCall fc | fc.getTarget().getName().matches("memcpy") and fc.getArgument(2) = sink.asExpr())
    }
}

from MyTaintTrackingConfiguration MyConfig, DataFlow::Node source, DataFlow::Node sink
where MyConfig.hasFlow(source, sink)
select sink, source, sink, "Network byte swap flows to memcpy"