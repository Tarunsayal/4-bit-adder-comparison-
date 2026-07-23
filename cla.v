module cla (
    input  wire [3:0] a,
    input  wire [3:0] b,
    input  wire       cin,
    output wire       cout,
    output wire [3:0] sum
);

    wire [3:0] g, p;
    wire [4:0] carry;

    
    assign g = a & b;
    assign p = a ^ b;

    assign carry[0] = cin;
    assign carry[1] = g[0] | (p[0] & cin);
    assign carry[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & cin);
    assign carry[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & cin);
    assign carry[4] = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & cin);

    
    assign sum[0] = p[0] ^ carry[0];
    assign sum[1] = p[1] ^ carry[1];
    assign sum[2] = p[2] ^ carry[2];
    assign sum[3] = p[3] ^ carry[3];

    assign cout = carry[4];

endmodule