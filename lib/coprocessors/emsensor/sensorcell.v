module cdff(
  input wire d,
  input wire clk,
  input wire rst,
  output reg q
  );
  always @(posedge clk) begin
	  if (~rst)
		  q <= 0;
	  else
		  q <= d;
  end
endmodule

module csff(
  input wire d,
  input wire clk,
  input wire rst,
  output reg q
  );
  always @(posedge clk) begin
	  if (~rst)
		  q <= 1;
	  else
		  q <= d;
  end
endmodule

module toggle_ff(
  //input wire d,
  input wire clk,
  input wire rst,
  output wire q
  );

  wire d /* synthesis keep */;

  cdff dff1(d, clk, rst, q);
  not u0(d, q);
endmodule

module sensor_cell(
  //input wire d, 
  input wire clk, 
  input wire rst,
  output wire q, 
  output wire qs, 
  output wire alarm);

  wire q_toggle /* synthesis keep */ ;
  wire qb /* synthesis keep */ ;

  not u1(qb, q_toggle);
  toggle_ff tff(clk, rst, q_toggle);
  cdff mff(q_toggle, clk, rst, q);
  csff sff(qb, clk, rst, qs);
  xnor u2(alarm, q, qs);
  
endmodule
