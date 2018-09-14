add wave \
     {sim:/testbench/d3/u0/leon3x0/p0/iu/r } 
add wave \
{sim:/testbench/d3/u0/leon3x0/p0/iu/clk } \
{sim:/testbench/d3/u0/leon3x0/p0/iu/rstn }

 mem load -i ./prog0.mem -format hex /testbench/d3/ahbram0/aram/nosbw/rx__0/x0/xc2v/x0/a15/x/memarr
 mem load -i ./prog1.mem -format hex /testbench/d3/ahbram0/aram/nosbw/rx__1/x0/xc2v/x0/a15/x/memarr
 mem load -i ./prog2.mem -format hex /testbench/d3/ahbram0/aram/nosbw/rx__2/x0/xc2v/x0/a15/x/memarr
 mem load -i ./prog3.mem -format hex /testbench/d3/ahbram0/aram/nosbw/rx__3/x0/xc2v/x0/a15/x/memarr

 run -all
