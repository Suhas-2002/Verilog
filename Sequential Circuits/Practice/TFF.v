module Combi_logic(Z,In);
input [3:0] In;
wire w1,w2;
output Z;

assign w1= (In[0] & In[1]);
assign w2=(In[2]|In[3]);
assign Z=(w1 | w2);

endmodule

module Tff(Q,T,Clk,Rst);
input T, Clk, Rst;
output Q;
reg Q;

always @(negedge Clk)

begin
    if (Rst)
        Q = 0;
    else begin
        if(T)
            Q = ~Q;
        else
            Q = Q;
    end
end
endmodule

module System(Q,In,Clk,Rst);
input [3:0] In;
input Clk,Rst;
output Q,Z,T;
Combi_logic c(Z,In);
assign T=Z;
Tff t(Q,T,Clk,Rst);
endmodule

module System_tb;
reg clk, reset;
reg [3:0] in;
wire Q;
System s(Q,in,clk,reset);
always #5 clk = ~clk;

initial
begin
in = 4'b0; clk = 1'b0; reset=1;
$monitor("Time:%f, clk=%b, Input i=%b, Output Q=%b, Reset=%b", $time, clk, in[3:0], Q, reset);
#5 in = 4'b1100;
reset=0;
#5 in = 4'b0001;
#5 in = 4'b1011;
#5 in = 4'b0010;
#5 in = 4'b1111;
$finish;
end
endmodule
