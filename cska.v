module cska 
(
    input wire [3:0]a,
    input wire [3:0]b,
    input wire cin,
    output wire cout,
    output wire [3:0]sum
);

wire [1:0]pBlock1;
wire [1:0]pBlock2;
wire calculatedCarry1;
wire calculatedCarry2;
wire coutBlock1;
assign pBlock1 = a[1:0]^b[1:0];
assign pBlock2 = a[3:2]^b[3:2];
rca #(.N(2)) r1
(
    .a(a[1:0]),
    .b(b[1:0]),
    .cin(cin),
    .cout(calculatedCarry1),
    .sum(sum[1:0])
);
assign coutBlock1= &pBlock1? cin : calculatedCarry1;
rca #(.N(2)) r2
(
    .a(a[3:2]),
    .b(b[3:2]),
    .cin(coutBlock1),
    .cout(calculatedCarry2),
    .sum(sum[3:2])
);

assign cout = &pBlock2 ? coutBlock1: calculatedCarry2;
endmodule