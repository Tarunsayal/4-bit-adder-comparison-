`default_nettype none
module rca
#(
    parameter N = 4;
)
(
input wire [N-1:0]a,
input wire [N-1:0]b,
input wire cin,

output wire cout,
output wire [N-1:0]sum
);

fullAdder add1(
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum)
);

endmodule