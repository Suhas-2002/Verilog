//Positive Edge Triggered D Flip Flop
module dff(D, clk, Q);//D Flip Flop Module
input D, clk;
output Q;
reg Q;

always @(posedge clk)
begin
Q = D;
end
endmodule

module dff_tb;//Test bench
reg D, clk;
wire Q;
dff i1(D, clk, Q);

initial
begin
D = 1'b0; clk=1'b0;
$monitor("Time:%f, D=%b, clk=%b, Q=%b", $time, D, clk, Q);
#5 D = 1'b1; clk = 1'b1;
#5 D = 1'b0; clk = 1'b0;
#5 D = 1'b0; clk = 1'b1;
#5 D = 1'b1; clk = 1'b1;
end
endmodule
