module rcaTB;
reg [3:0]a;
reg [3:0]b;
reg cin;
wire cout;
wire [3:0]sum;

rca r1
(
 .a(a),
 .b(b),
 .cin(cin),
 .cout(cout),
 .sum(sum)
);

initial begin
    $monitor("t=%0t | a=%b b=%b cin=%b | cout=%b sum=%b",$time , a,b,cin,cout,sum);
    a=4'b0000 ; b=4'b0000; cin=0;
    #5
    cin=1;
    #5
    a=4'b0001 ; cin=0;
    #5
    cin=1;
    #5
    b=4'b0001;
    #5
    a=4'b1111;b=4'b1111;
    $finish;
end
endmodule
