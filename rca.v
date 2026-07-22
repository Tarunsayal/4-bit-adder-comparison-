`default_nettype none
module rca
#(parameter N = 4)
(
    input wire [N-1:0] a,
    input wire [N-1:0] b,
    input wire cin,
    output wire cout ,
    output wire [N-1:0]sum
);
wire [N:0]t;

assign t[0] = cin;
assign cout = t[N];

genvar i;

generate
    for(i=0; i<N; i=i+1) begin:stage
    fullAdder fa 
    (
        .a(a[i]),
        .b(b[i]),
        .cin(t[i]),
        .cout(t[i+1]),
        .sum(sum[i])

    );
        
    end
endgenerate


endmodule