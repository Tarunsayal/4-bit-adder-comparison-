`default_nettype none
module csla
(
 input wire [3:0] a,
 input wire [3:0] b,
 input wire cin,
 output wire cout,
 output wire [3:0]sum 
);
wire c0cout;
wire c2cout;
wire c1cout;
wire [1:0]c1sum;
wire [1:0]c2sum;

rca #(.N(2))c0
(
    .a(a[1:0]),
    .b(b[1:0]),
    .cin(cin),
    .cout(c0cout),
    .sum(sum[1:0])
);
rca #(.N(2))c1
(
    .a(a[3:2]),
    .b(b[3:2]),
    .cin(1'b0),
    .cout(c1cout),
    .sum(c1sum)
);
rca#(.N(2)) c2

(
    .a(a[3:2]),
    .b(b[3:2]),
    .cin(1'b1),
    .cout(c2cout),
    .sum(c2sum)
);

assign sum[3:2]=c0cout ? c2sum : c1sum;
assign cout = c0cout ? c2cout : c1cout;

endmodule